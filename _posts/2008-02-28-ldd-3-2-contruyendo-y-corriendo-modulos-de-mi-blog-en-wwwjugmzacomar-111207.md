---
title: "LDD 3: #2: Contruyendo y corriendo Modulos (de mi blog en www.jugmza.com.ar - 11/12/07)"
date: 2008-02-28 15:56:42 +0000
permalink: /2008/02/28/ldd-3-2-contruyendo-y-corriendo-modulos-de-mi-blog-en-wwwjugmzacomar-111207/
description: "Bienvenidos a Hello World Module: Importante: 2 funciones: module_init(fc*) module_exit(fc*) Hay que incluir <linux/init.h> y <linux/module.h> • Modulo de…"
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/02/28/ldd-3-2-contruyendo-y-corriendo-modulos-de-mi-blog-en-wwwjugmzacomar-111207/
---

**Bienvenidos a Hello World Module:**

![Hello World! Un clasico!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/02/hello_world_module.jpg)

Importante: 2 funciones: module_init(fc*) module_exit(fc*)

Hay que incluir <linux/init.h> y <linux/module.h>

**• Modulo de kernel vs Apps**Diferencias:

- En las aplicaciones: por lo general programamos aplicaciones que son una tarea de principio a fin.
- Modulo: por lo general se registran con el fin de servir a futuras peticiones. Los modulos son event_driven. En los modulos solo podemos usar las propias funciones del kernel. Y no podemos linkear librerias a los modulos. Solo tenemos las funciones en las interfaces del kernel (kernel headers).

**Otra diferencia es como se manejan las fallas.**• En las aplicaciones tenemos seg faults, y para solucionar problemas  podemos usar un debugger     convencional • En los modules de kernel tenemos kernel fault o kernel panic. Y se nos complica usar un debugger.

**Espacio de kernel y espacio de usuario:**Aplicacion -> espacio de usuario Modulo -> espacio de kernel Se especifican diferentes modalidades o niveles de operaciones en el CPU. Cada nivel tiene asociado un Rol. Y algunas operaciones se ven restringidas en ciertos niveles. El codigo de los programas puede pasar de un nivel a otro(cambio de contexto) por un numero limitado de puertas.

En unix el kernel se ejecuta en el nivel mas alto (supervisor-mode) donde todo esta permitido. Las aplicaciones se corren en un nivel mas bajo (user-mode). Donde el procesador regual el acceso directo al hardware y el acceso sin autorizacion a la memoria.

Unix transfiere la ejecucion de un espacio a otro cuando una aplicacion ejecuta una syscall o cuando una aplicacion es suspendida por una interrupcion. **Concurrencia en el kernel:**Todas las cosas que hagamos tiene que estar concebida con la idea de que muchas cosas ocurren en paralelo al mismo tiempo que la nuestra.

Todo el codigo de un driver tiene que ser reentrante (poseer la capacidad de poder correr en mas de un contexto a la vez). Las estructuras de datos deben ser cuidadosamente diseniadas para mantener multiples hilos de ejecucion separados. Y se debe cuidar mucho el acceso a datos compartidos.

**Proceso Actual:**

Incluimos: <asm/current.h> y <linux/sched.h> y podemos acceder a una variable llamada current que es del tipo task_struct y contiene toda la informacion del proceso que se esta ejecutando: current->comm (nombre del programa) y current->pid

**Compilando modulos:**??????

![Ejemplo Make File](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/02/make_file_pro.jpg)

**Linkeando modulos al kernel:**

![Vinculando modulos al kernel](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/02/linking_module_to_kernel.jpg)

**Cargando un modulo:**Insmod, modprobe, rmmod y lsmod (que lee de /proc/modules) Algunas cosas: • vermagic.o: esta para chequear si el kernel donde queremos plugguear un modulo es compatible con el modulo compilado • Se pueden usar macros y #ifdef para hacer el modulo compatible para varias versiones de kernels • Tambien hay dependencias de plataformas

**Tabla de simbolos del kernel:**Insmod resuelve todos los simbolos no definidos contra esta tabla publica de simbolos del kernel. Esta tabla contiene direcciones de items globales(como funciones y variables) que son necesarias para implementar drivers modulares. Cuando un modulo es cargado, cada simbolo exportado por el modulo se vuelve parte de esta tabla global de simbolos. export_symbol(name); export_symbol_gpl(name); Lo usamos normalmente cuando hacemos un stack de modulos que necesitan conocer algunas variables de otros modulos. Estas variables se situan en una seccion llamada ELF section que es revisada por el kernel cuando el modulo es cargado.

**Algunos Conceptos preliminares:**En todos los cmodulos si o si:  <linux/init.h> y <linux/module.h>

**Funcion de inicializacion:**

static int __init xxx(void){ ... } module_init(xxx);

el __init es un hint para el kernel que dice que esta funcion es solamente en tiempo de inicializacion. esto quiere decir que no podemos usarla una vez terminada la fase de inicializacion porque es descartada.

module_init nos dice cual es la funcion que va a ser llamada en tiempo de inicializacion. Agrega a la funcion xxx en una seccion especial del modulo para que apenas se cargue el modulo sea lo primero en ejecutarse.

En este metodo registramos dispositivos y recursos que vayamos a usar en nuestro modulo.

**Funcion de limipieza:**static void __exit xxx(void){ ... } module_exit(xxx); sino tenemos esta funcion el kernel no nos permite remover el modulo una vez que esta cargado.

**Manejo de errores en la inicializacion:**Si algun error ocurre cuando estamos registrando cosas tenemos que desidir si continuar o no. Seguido, pasa que si algo falla igual continuamos y luego nuestro modulo brinda funcionalidades limitadas. Si llegamos a un error donde el modulo no va a poder ser cargado, tenemos que deshacer todas las registraciones hehchas antes de la falla. (el modulo debe encargarse de esto, sino el kernel queda en un estado inestable)

Por lo general afrontamos este tema con GOTO:

**copiar el ejemplo que estaba mas que interesante;;;;**

![Inicializacion Limpia](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/02/init_clean_up_good.jpg)

**Condiciones de corrida a la hora de cargar los modulos**Hay que tener cuidado con lo que registramos y cuando lo registramos. Tenemos que recordar que en alguna otra parte del kernel puede estar haciendo uso de alguna de las capacidades(facilities) que nosotros registramos justo despues de que la registracion haya terminado. Entonces: no hay que registrar ninguna funcionalidad hasta que nuestra inicializacion interna para soportar esta funcionalidad se haya completado. Tambien debemos considerar que pasa si la inicializacion falla pero parte del kernel ya usa esta funcionalidad que hemos registrado. Si esta situacion es posible, debemos considerar en no hacer falla la inicializacion, ya que algo util para alguien ha sido registrado.

**Parametros de un modulo:**Muchos parametros que un driver necesita puede cambiar de un sistema a otro. Los parametros pueden obtener sus valores en tiempo de carga con insmod o modprobe. Y estos parametros pueden ser de varios tipos. Ej: insmod hellop howmany=10 whom='mom'

static char *whom="world" static int howmany=1 module_param(howmany,int,S_IRUGO); module_param(whom,charp,S_IRUGO);

Si hay algun tipo de dato que no sea soportado por module_param, hay un hook que nos permite definirlos. (module_param.h) S_IRUGO es un permission value(<linux/stat.h>) y controla quien puede acceder a la representacion del parametro en el sysfs. Si es 0 no hay entrada en sysfs, sino aparece en /sys/module S_IRUGO -> solo lectura S_IRUGO | S_IWUSR -> escritura  por el root si lo hacemos de escritura y cambiamos el valor, el modulo no se entera automaticamente de que el valor cambio. Por lo tanto hay que estar preparados para detectar el cambio en el parametro.

**Driver en espacio de usuarioVentajas:**• Podemos linkear contra la libreria de C completa. Y esto nos permite que nuestro driver haga cosas locas y complicadas si tener que implementar mucho. • Podemos usar un debugger convensional • Si se cuelga lo matamos y ya • La memoria de usuario es swappeable (tenemos mas y puede ser bajada a disco para tener mas aun) • Un driver bien diseniado puede permitir acceso concurrente a un dispositivo • Ej: USB driver (libusb) y el x server (ambos conoces exactamente que es lo que hace y no hace el hardware)

**Tiene sus desventajas:**• No hay interrupciones en el espacio de usuario • Acceso directo a memoria es posible solamente con mmaping /dev/mem, y solo root puede. • Para acceder a puertos I/O solo tenemos ioperm o iopl. (no todos los sistemas lo soporta) Acceder a /dev/port puede ser muy lento. • Tiempo de respuesta meno, porque tiene qu ehabe run cambio de contexto cuando pasamos informacion entre el cliente y el hardware. • !!! El driver puede ser bajado a disco (por swapping) !!! y ahi si que se pone lento todo. *se puede usar mlock, pero igual es inaceptable) • Los dispositivos mas importantes no se pueden manejar en espacio de usuario (network interfaces y block devices)
