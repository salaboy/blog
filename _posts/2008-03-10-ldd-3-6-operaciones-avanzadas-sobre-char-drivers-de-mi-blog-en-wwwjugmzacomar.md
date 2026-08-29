---
title: "LDD 3: #6 Operaciones avanzadas sobre char drivers (de mi blog en www.jugmza.com.ar)"
date: 2008-03-10 19:50:33 +0000
permalink: /2008/03/10/ldd-3-6-operaciones-avanzadas-sobre-char-drivers-de-mi-blog-en-wwwjugmzacomar/
description: "Los dispositivos reales ofrecen muchas mas funciones que read y write sincronos. Vamos a analizar algunos de los conceptos para entender como escribir un…"
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/03/10/ldd-3-6-operaciones-avanzadas-sobre-char-drivers-de-mi-blog-en-wwwjugmzacomar/
---

Los dispositivos reales ofrecen muchas mas funciones que read y write sincronos. Vamos a analizar algunos de los conceptos para entender como escribir un fully featured char device driver. Vamos a empezar con la syscall ioctl que es una interfaz comun para el control de dispositivos. Luego veremos varias formas de mantenernos sinconizados con el usuario (espacio de usuario). Y para finalizar veremos como poner a un proceso a dormir y luego despertarlo, tambien veremos como implementar I/O sin bloqueo.

IOCTL: La mayoria de los drivers necesita la habilidad de varios tipos de controles de hardware via el device driver.(cosas aparte de read y write). Muchas veces el usuario va a requerir por ejemplo, cerrar la puerta del dispositivo, expulsar el disco, reportar un error, cambiar el baud rate, etc. Estas operaciones por lo general son soportadas por el metodo IOCTL, que implementa la syscall del mismo nombre.

En espacio de usuario el prototipo de este metodo es: int ioctl(int fd, unsigned long cmd, ...) Los puntos suspensivos no son varargs, es solo para evitar el type check del compilador. Suele ser un char *argp. Y cmd es el comando que queremos ejecutar.

En el espacio de kernel el metodo ioctl difiere un poco del de espacio de usuario:

int (*ioctl) (struct inode *inode, struct file *filp, unsigned int cmd, unsigned long arg);

Los punteros inode y filp corresponde al file descriptor pasado en el metodo del usuario, el parametro cdm se pasa sin cambios y el parametro opcional se pasa en forma de unsigned long. Como era de esperarse la mayoria de las implementaciones de ioctl consiste en un gran switch que elige el comportamiente segun el cmd enviado. Cada comando tiene un numero distinto, que se relaciones a nombres mediante definiciones de preprocesador. Estos por lo general se declaran en un .h aparte.

ELIGIENDO LOS COMANDOS IOCTL:

Debemos escoger los numeros que se corresponderan con los comandos. Lo que uno normalmente haria seria escoger numeros empezando del 0,1,... pero no!!! ya que los ioctl deben ser unicos en todo el sistema. Entonces tenemos que seguir una convencion. Que indica que el numero se componera con los siguiente: â€¢ type(magic number): hay que elegir un numero que no este siendo usado. Para esto miramos en ioctl-numbers.txt â€¢ Number: numero en orden secuencial â€¢ Direction: la direccion de transferencia de datos (_IOC_NONE,_IOC_READ, _IOC_WRITE ...) â€¢ Size: el tamanio de los datos de usuario

Como es normal los desarrolladores del kernel hay desarrollado macros para la decodificacion de los numeros: _IOC_DIR(nro), _IOC_TYPE(nro), _IOC_NR(nro), _IOC_SIZE(nro) â€¢ *********COPIAR EJEMPLO DE SCULL******************

VALOR DE RETORNO:

Como la implementacion por lo general es un swtich surge la pregunta de cual es la accion del valor default del switch. Muchas implementaciones devuelven -EINVAL (Invalid Argument), que tiene sentido, pero el standard propone la devolucion de -ENOTTY (inappropiate ioctl for device)

COMANDOS PREDEFINIDOS:

A pesar de que las sys calls ioctl por lo general se usa para actuar sobre dispositivos, hay un set de comandos que son reconocidos por el kernel. Hay que notar que estos comandos tienen prioridad sobre los que nosotros definimos, por eso si elegimos un mismo ioctl number el nuestro nunca se llamara.

Estos comandos predefinidos se dividen en 3 grupos: â€¢ Aquellos que pueden ser tratados en cualquier archivo (regular device, fifo, o socket) â€¢ Aquellos que pueden ser tratados solo en archivos regulares â€¢ Aquellos especificos al tipo de fs Los escritores de driver solo se interesan en el primer grupo que tiene el magic number T. Los siguientes comando ioctl estan predefinidos para cualquier archivo:

â€¢ ***********LISTA

USANDO LOS ARGUMENTOS de IOCTL

Otra cosa importante a ver es como usamos el argumento extra del metodo ioctl. Que si es un entero lo podemos usar facilmente, pero si es un puntero tenemos que tener cuidado. Cuando un puntero se refiere al espacio de usuario, debemos asegurar que la direccion es valida. Para esto usamos la funcion llamada access_ok: (<asm/uaccess.h>):

int access_ok(int type, const void *addr, unsigned long size)

Donde el primer argumento debe ser VERIFY_READ o VERIFY_WRITE. *addr contiene la direccion de espacio de usuario y size es un byte count.

Esta funcion no realiza un trabajo completo de verificar el accesso a memoria, solo chequea si la memoria referenciada en esa region es razonablemente accesible. Access_ok asegura que la direccion no apunta a memoria del espacio de kernel.

CAPACIDADES Y OPERACIONES RESTRINGIDAS:

El acceso a un dispisitivo esta controlado por los permisos de los device files, y los drivers no estan normalmente involuctrados en el checkeo de permisos. Hay casos donde los usuarios tienen permisos de escritura/lectura pero algunas otras operaciones las tienen restrigidas. En estos casos el driver debe realizar algunos chequeos adicionales en pos de saber si el usuario puede  realizar la operacion requerida.

BLOCKING I/O

Hasta ahora hemos visto como implementar read y write, pero hemos salteado una cuestion importante: como responde el driver si no puede satisfacer inmediatamente el request??? Por ejemplo: si viene una llamda a read y no hay datos para leer, pero se esperan en el futuro. En un caso asi el driver debe bloquear al proceso y ponerlo a dormir hasta que el request pueda continuar.

INTRODUCCION A SLEEPING:

Que significa que un proceso duerma? cuando un proceso es puesto a dormir, es marcado con un estado especial y removido de la cola del scheduller. Hasta que el estado no sea cambiado por alguien, el proceso no va a ser schedulado y por lo tanto no correra.

Hay que tener una reglas claras para hacer que el codigo duerma de una manera segura.

Primera regla: "Nunca dormir si estamos en un contexto atomico" Lo que se traduce en no podemos dormir cuando:

- Tenemos un spinlock, un seqlock, o un RCU lock.
- Tenemos las interrupciones desactivadas
- Podemos dormir cuando tenemos un semaforo pero hay que tener cuidado ya que podemos bloquear al mismo proceso que nos despierta.

Otra cosa que debemos recordar es que cuando nos despertamos, nunca vamos a saber cuanto tiempo estuvimos fuera del cpu o que ha cambiado en este tiempo. Puede que otro porceso que haya estado durmiendo por el mismo evento se haya despertado y nos haya robado los recursos que nosotros necesitamos y debemos volver a dormir. Por lo tanto cuando nos despertamos debemos que chequear el estado del contexto y de los recursos que nos interesan.

Otra cosa relevante es que el proceso no puede dormir a menos que este seguro de que alguien lo va a despertar. El codigo encargado de la despertacion tiene que ser capaz de encontrar al proceso a despertar.

Para esto existen las wait queues! que son como listas de procesos todos esperando por un mismo evento.

En linux las wait queues son manejadas en el termino de wait_queue_head_t  (<linux/wait.h>)

estaticamente: declare_wait_queue_head(name)

dinamicamente: wait_queue_head_t my_queue; init_waitqueue_head(&my_queue);

SLEEPING SIMPLE:

La manera mas simple de domir en el kernel de linus es la macro llamada wait_event, que combina el manjo de los detalles de sleeping con el chequeo de la condicion por la que el proceso esta esperando. Hay 4 formas de wait_event:

- wait_event(queue, condition)
- wait_event_interuptible(queue,condition)
- wait_event_timeout(queue,condition,timeout)
- wait_event_interruptible_timeout(queue,condition,timeout)

donde queue es la wait_queue_head_t y condition es una expresion booleana que se evalua antes y despues de dormir. En las timeout se espera un tiempo medido en jiffies y si no ha ocurrido el evento se devuelve el valor resultado de la expresion booleana.

Por otra parte tenemos la funcion de wake_up:

void wake_up(wait_queue_head_t *queue) void wake_up_interruptible(wait_queue_head_t *queue)

Hay que notar que estas dos funciones despiertan a todos los procesos que estan en la cola.

â€¢ **********COPIAR EJEMPLO!!!!

OPERACIONES BLOQUEANTES Y NO BLOQUEANTES:

Un ultimpo punto a ver es cuando ponemos a un proceso a dormir. Hay veces cuando implementamos las coas de manera correcta se requiere que las operaciones no bloqueen, a pesar de que esto signifique que no se termine la tarea. Tambien tenemos la situacion donde el proceso llamante nos informa que no quiere que ocurra un bloqueo, sin importar si su I/O puede progresar o no. Para explicitar esto usamos O_NONBLOCK (open non block) en filp->f_flags y se especifica en tiempo de OPEN. EN caso de operaciones bloqueantes (son por defecto bloqueantes) el siguiente comportamiento debe implementarse en orden de seguir los stadares semanticos: â€¢ Si un proceso llama a read pero no hay datos (todavia), el proceso debe bloquear. El preceo debe despertar tan pronto como lleguen los datos, y los datos son devueltos al llamante, a pesar de que los datos sean menos de los expresados con el argumento count. â€¢ Si un proceso llama a write y no hay espacio en el buffer el proceso debe bloquear, y debe ponerse en otra cola que la usada por read. Cuado algunos datos sean escritos al dispositivo, y hay espacio en el buffer, el proceso se despierta y write se comleta con exito. a pesar de que puede no haber escrito todos los datos especificados en count.

EL comportamiendo de read y write es distinto si se especifica O_NONBLOCK. En este caso se devuelve -EAGAIN (TRY AGAIN). Las operaciones no bloqueantes devuelven un valor inmediatamente. Solo read y write son afectados por O_NONBLOCK

EJEMPLO DE BLOQUEO I/O

!!!!!!!!PONER IMAGENES

CONCEPTOS AVANZADOS DE SLEEPING

Hay situaciones donde se necesita tener un conocimiento profundo de como funcionan las colas de espera en linux.

COMO DUERME UN PROCESO:

Si miramos dentro de <linux/wait.h> podemos ver que la estructura de datos wait_queue_head es muy simple. Consiste en un spinlock y una lista linkeada. Lo que va en esa lista son las wait queue entries. Que estan declaradas con el tipo wait_queue_t. Esta estructura contiene informacion acerca de los procesos que estan durmiendo y exactamente como hay que despertarlos.

El primer paso para poner a un proceso a dormir es la allocacion y la inicializacion de una wait_queue_t structure, seguido por la adicion a la wait_queue correspondiente. Cuando esta todo en su lugar , cualquiera que sea el encargado de despertar al proceso podra encontrarlo y realizar su tarea.

El siguiente paso es cambiar el estado del proceso a "Durmiendo", hay varios estados definidos en <linux/sched.h>. TASK_RUNNING es que el proceso puede correr, lo cual no significa que este corriendo en ningun tiempo especifico. Y hay dos para indicar que se esta durmiendo TASK_INTERRUPTIBLE y TASK_UNINTERRUPTIBLE.

Para cambiar el estado usamos: void set_current_state(int new_state) -> no se donde llamamos esto?

Con este codigo solo cambiamos el estado del proceso, y esto solo no pone el proceso a dormir directamente. Con esto logramos que el scheduler cambie la forma de tratar al proceso, pero todavia no cedemos el procesador.

Ceder el procesador es el ultimo paso, pero una una cosa que hacer antes, y esto es chequear que la condicion para dormir sea todavia cierta. Esto nos ahorra generar una condicion de corrida, ya que si la condicion se cuelve cierta (o sea no se debe dormir) justo cuando  estamos por ceder el procesador vamos a perder el wake up y podemos dormir para siempre. Entonces : if(!condition) schedule(); -> cedemos el procesador ya que el proceso tiene el estado de durmiendo.

Si el if no es cierto y no se llama a schedule tenemos que realizar una limpieza, cambiar el estado del proceso a TASK_RUNNING y borrarlo de la cola. Si entra a schedule esta limpieza no es necesaria, ya que para salir del schedule necesita que alguien le cambie el estado.

MANUAL SLEEP: no va no????

EXCLUSIVE WAITS: Como hemos visto cuando un proceso llama a wake up en una wait_queue_head, todos los procesos que estan esperando se ponen en TASK_RUNNING. En muchos casos este es el comportamiento correcto. En otros casos, en cambio, es posible saber de ante mano que un solo proceso de los que seran despertados va a ser el que va a obtener un recurso deseado, y el resto van a dormir de vuelta. Cada uno de estos procesos peleara por el recurso en cuestion y explicitamente volveran a dormir. Entonces si el numero de porcesos en una wait queue es grande, va a haber una rafaga de procesos peleando por el recurso y esto degrada significativamente la performance del sistema. En respuesta a esto, los desarrolladores del kernel han desarrollado exclusive waits. Una exclusive wait actua como un sleep normal, con dos diferencias importantes: • Cuando una wait queue entry tiene la WQ_FLAG_EXCLUSIVE seteada, es agregada al final de la wait_queue. Y las que no la tienen seteada al principio. • Cuando un wake_up es llamado en una wait_queue, para luego de despertar al primer proceso que tenga WQ_FLAG_EXCLUSIVE seteada.

El resultado final es que los procesos marcados con exclusive wait son despertados de a uno a la vez, en una manera ordenada, y el kernel sigue despertando a todos los procesos que no estan marcados. Para emplear exclusive waits en un driver hay que considerar dos condiciones: • Esperamos que haya mucha pelea por recursos. • Despertar un solo procesos es suficiente para completar el consumo de un recursos cuando se pone disponible.

Poner a un proceso en un wait interruptible es tan facil como:

void prepare_to_wait_exclusive(wait_queue_head_t *queue, wait_queue *wait, int state);

Esto lo llamamos en vez de prepare_to_wait, y setea el flag de exclusive y lo agrega al final de la lista. Hay que no tar que no se puede hacer un exclusive wait con wait_event y sus variantes.

DETALLES DE WAKING UP: El comportamiento resultante cuando un proceso es despertado es controlado por una funcion en la wait_queue entry. y es mucho mas complejo de lo que se vio antes. El comportamiento default de wake up setea el estado del proceso en TASK_RUNNABLE y posiblemente realiza un cambio de contexto si el proceso tiene prioridad alta. Hay una lista de otros wait que probablemente nunca necesitemos.
