---
title: "LDD 3: #10 Manejando Interrupciones:"
date: 2008-03-10 20:05:09 +0000
permalink: /2008/03/10/ldd-3-10-manejando-interrupciones/
description: "A pesar de que algunos dispositivos puede ser controlados usando solo sus regiones de I/O, la mayoria de los dispositivos son un poco mas complicados que…"
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/03/10/ldd-3-10-manejando-interrupciones/
---

A pesar de que algunos dispositivos puede ser controlados usando solo sus regiones de I/O, la mayoria de los dispositivos son un poco mas complicados que eso. Los dispositivos tienen que lidiar con el mundo exterior, que seguido incluye cosas como spinning disks, moving tapes, cables a lugares distantes, y mucho mas.

Ya que la mayoria de las veces el procesador queda a la espera de eventos externos, tiene que haber una manera de que el dispositivo le haga saber al procesador que algo ha sucedido. Esta forma por supuesto son las interrupciones. Una interrupcion es una senial que el hardware puede mandar para captar la atencion del procesador. Por lo general un dirver registra su manejador de interrupciones para las interrupciones de su dispositivo y sabe como manejarlas bien cuando estas llegan.

Hay que notar que las interrupueciones por naturaleza corren concurrentemente con otro codigo.

INSTALANDO EL MENJADOR DE INTERRUPCIONES Tenemos que configurar un manejador de interrupciones en el sistema, ya que si al kernel no se le ha dicho que estamos esperando interrupciones, el simplemente las ackea y las ignora.

Las lineas de interrupciones son un mecanismo presiado y limitado (ya que solo hay 15 o 16 lineas). Por lo cual se espera que el modulo pida un canal de interrupciones (o IRQ, interrupt request) antes de usarlo y luego cuando termine lo suelte. Y en muchas ocasiones se espera que los modulos compartan las lineas de interrupciones con otros drivers. Las siguientes funciones, declaradas en implementan la registracion de interrupciones

int request_irq(unsigned int irq, irqreturn_t (*handler)(int, void*, struct pt_regs*) unsigned long flags, const char *dev_name, void *dev_id);

FLAGS: • SA_INTERRUPT: fast interrupts -> son ejecutadas con todas las interrupciones deshabilitadas • SA_SHIRQ: seniala que las interrupciones puede ser compartidas • SA_SAMPLE_RANDOM: indica que las interrupciones contribuyen al pool de entropia del sistema.

El lugar correcto para llamar a request_irq es cuando el dispositivo es abierto por primera vez, antes de que el hardware sea instruido a generar interrupciones. Y el lugar para llamar a free_irq es la ultima vez que el dispositivo es cerrado, luego de que al hardware se le ha dicho que no interrumpa al procesador. La desventaja de esta tecnica es que necesitamos llevar la cuenta de cuantas veces abrimos el device asi podemos saber cuando las interrupciones pueden ser desactivadas. (llamar a request_irq cuando inicializamos el modulo es en vano, y mas si no compartimos el canal de interrupciones, ya que el numero de interrupciones es limitada y estariamos limitando a otros dispositivos a usarlas)

Tambien tenemos( en la familia i386 y x86_64) una funcion para consultar la disponibilidad de lineas de interrupciones es: int can_request_irq(unsigned int irq, unsigned long flags);

LA INTERFACE /proc: cada vez que una interrupcion de hardware llega al procesador, un contador interno es incrementado, proveyendo una manera de revisar si el dispositivo esta funcionando como se espera (/proc/interrupts)

COPIAR EJEMPLO!!!!!!!!!!!!!!!!!!!!!!!!!!

AUTO DETECTANDO EL NUMERO DE IRQ Uno de los problemas mas complicados a la hora de inicializacion de un driver es determinar que linea de IRQ va a ser usada por el dispositivo. El driver necesita esta informacion en orden de instalar el manejador, aunque el programador puede pedirle al usuario el numero de IRQ en tiempo de load del modulo, esto no deberia ser asi ya que el usuario no deberia saber este numero, por lo tanto la auto deteccion del numero de interrupcion es un requerimiento basico para la ubicacion del driver.

Hay algunos dispositivos avanzados que anuncian que IRQ van a usar. En estos casos debemos leer un byte de status en los puertos de I/O o en el espacio de configuracion PCI.

Desafortunadamente, no todos los dispositivos anuncian que IRQ van a usuar, por lo tanto, vamos a tener que probar que IRQ usa. Esta tecnica es bastante sencilla, el driver le dice al dispositivo que genere interrupciones y ve que pasa. Si todo va bien solo una linea de IRQ se activa.

Hay 2 formas de probar: • Kernel assisted probing: el kernel ofrece formas low-level de probing para los numeros de interrupciones. Esta funcion solo funciona para interrupciones no compartidas, pero la mayoria del hardware es capaz de trabajar en modo de interrupciones compartidas, y esta funcion nos ayuda aunque sea a encontrar el numero de interrupcion actualmente configurada. Esta funcionalidad consta de 2 funciones: ? unsigned long probe_irq_on(void); ->devuelve una mask de las interrupciones desasingnadas. Luego de esta llamada tenemos que hacer que el dispositivo genere al menos una interrupciones ? int probe_irq_off(unsigned long): -> luego de que el dispositivo genra una interrupcion, el driver llama a esta funcion pasandosel la bit mask devuelta por probe_irq_on. Esta funcion devuelve el numero de interrupciones que ocurrieron entre probe_irq_on y el probe_irq_off. Si devuelve 0 es que no ocurrio ninguna, Si mas de una interrupcion ocurrio devuelve un nro negativo ya que la deteccion es ambigua. ? EJEMPLO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! • PROBING A MANOPLA: Nosotros podemos hacerlo a mano sin mucho lio. Es raro tener que hacerlo asi pero vamos a ver la filosofia. El mecanismo es el mismo que el descripto antes: habilitamos todas las interrupciones no usadas, luegos vemos que pasa. Nosotros podemos hacer uso de nuestro conocimiento sobre el dispositivo. Por lo general podemos configurar que un dispositivo elija de un set de 3 o 4, con esto reducimos el numero de pruebas. Para esto tenemos que conocer por adelantado estos posibles numeros. ? EJEMPLO!!!!!!!!!!!!!!!!!!!!!!!

MANEJADORES RAPIDOS Y LENTOS: Viejas versiones de linux distinguian entre fast y slow interrupts. Una eran las que se atendian realmente rapidas y las otras eran las que demoraban en atenderse. En kernel modernos, esta diferencia desaparecio. Solo queda una: fast interrupt (SA_INTERRUPT flag set) se ejecutan con todas las otras interrupciones deshabilitadas en el procesador actual. Hay que notar que los otros procesadores pueden seguir manejando IRQ, pero nunca veremos a 2 procesadores manejando la misma IRQ al mismo tiempo.

IMPLEMENTANDO UN HANDLER: Hasta ahora hemos visto como registrar un manejador de interrupciones pero no como escribir uno. Pero la verdad es que no hay nada raro en escribir uno, es codigo C normal. Lo unico peculiar es que el handler corre en tiempo de interrupciones y por eso tiene algunas restricciones de lo que puede hacer y lo que no. • Un handler no puede transferir datos desde o hacia el espacio de usuario, porno no se ejecuta en contexto de un proceso. • Los handlers tampoco pueden hacer nada que duerma, algo como llamar a wait_event. Allocar memoria con otra que no sea GFP_ATOMIC, o bloquear un semaforo. • Finalmente los handlers no puede llamar a schedulle.

El rol de un handler de interrupciones es dar feedback al dispositivo acerca de la interrupciones que se recibio y leer o escribir datos segun el significado de la IRQ.

Una tarea tipica es despertar procesos que estan durmiendo esperando una senial que los desperara, por ejemplo el arribo de datos.

El programador debe ser cuidadoso al escribir rutinas que se ejecuten en una minima cantidad de tiempo. Ya que si se requiere realizar muchos computos, el mejor approach es el uso de tasklets o workqueues.

EJEMPLO!!!!!!!!!!!!!!!!!!!!!!!

ARGUMENTOS Y VALOR DE RETORNO DEL HANDLER: 3 argumentos son pasados: IRQ, dev_id, y regs. • IRQ -> numero de irq, util para el log • *dev_id -> algun dato del cliente, es el void * que se le pasa a request_irq • struct pt_regs *regs -> es raramente usada. COntiene un snapshot del contexto del procesador antes de entrar aen el codigo de la interrupcion

EL handler debe devolver un valor indicando si habia una interrupciones para manejar. Si el handler encuentra el device, entonces, se necesita atencion y se devuelve IRQ_HANDLED. Sino IRQ_NONE.

HABILITANDO Y DESHABILITANDO INTERRUPCIONES: Hay veces donde el device driver debe bloquear la interrupcion por un (esperemos que corto) periodo de tiempo. Pasa seguido que las interrupciones deben ser bloqueadas cuando tenemos un spinlock para evitar deadlocks. Hay formas de deshabilitar las interrupciones sin involucramos con los spinlocks. Pero hay que notar que deshabilitar las interrupciones es algo muy fuera de lo comun, y no deberia usarse nunca como mecanismo de mutex.

DESHABILITANDO UNA SOLA INTERRUPCION: Hay veces (muy pocas) donde necesitamos deshabilitar una linea especifica de interrrupciones. Para esto el kernel ofrece un set de funciones. (). Hay que notar que no podemos deshabilitar lineas compartidas (y en los sistemas modenos son las mas normales). void disable_irq(int irq)

DESHABILITANDO TODAS LAS IRQ En el k 2.6 podemos deshabilitar todas las irq del procesador actual: void local_irq_save(unsigned long flags); -> deshabilita y guarda el estado anterior de las flags void local_irq_disable(void); -> no guarda el estado

Para volver a habilitar: void local_irq_restore(flags) void local_irq_enable();

TOP y BOTOM HALVES: Uno de los mayores problemas en el manejo de IRQ es cuando tenemos que llevar a cabo tareas muy largas en el handler, ya que cuando el manejador se ejecuta se bloquea las entrantes. Hay 2 necesidades (trabajo y velocidad) y etan en conflicto. Y queda como tarea del programador dar prioridades. En linux este problema se resuleve dividiendo al handler en dos partes: • Top -> request_irq -> es la que recibe la irq y la schedullea para ejecutar la tarea en un tiempo no atomico y seguro. (se ejecuta con todas las irq desactivadas) • Bottom -> es schedullado para ejecutarse luego cuando sea seguro(se ejecuta con todas las irq activadas)

TASKLETS !!!!!!!!!

WORKQUEUES!!!!!!!!!!
