---
title: "LDD 3: #7 Time, delay and derrefered work (de mi blog en www.jugmza.com.ar)"
date: 2008-03-10 19:57:38 +0000
permalink: /2008/03/10/ldd-3-7-time-delay-and-derrefered-work-de-mi-blog-en-wwwjugmzacomar/
description: "Los drivers del mundo real por lo general tienen que lidiar con muchas cosas como timing, administracion de memoria, acceso a hardware, y demases."
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/03/10/ldd-3-7-time-delay-and-derrefered-work-de-mi-blog-en-wwwjugmzacomar/
---

Los drivers del mundo real por lo general tienen que lidiar con muchas cosas como timing, administracion de memoria, acceso a hardware, y demases. En este capitulo se vera coom lidiar con problemas de timing. Tratar con cuestiones de tiempo involucra las siguientes tareas, listanes en orden creciente de complejidad: • Medir laspos de tiempo y comprara tiempos • Conocer el tiempo actual (wall clock) • Restrasar operaciones por un cierto periodo de tiempo • Planificar funciones asincronas ocurran en otro momento

MIDIENDO LAPSOS DE TIEMPO: EL kernel conoce el paso del tiempo por medio de los timers interrupts. Las interrupciones de timer son generadas por el sistema (hardware de timming) en intervalos regulares. Estos intervalos son programados en tiempo de booteo por el kernel dependiendo del valor de la variable HZ, que es dependiente de la arquitectura. La mayoria de las plataformas corren a 100 o a 1000 interrupciones por segundo. Como regla general, a pesar de conocer el valor de HZ, nunca debemos usar este valor cuando programamos y diseniamos un driver.

Cada vez que una interrupcion de timer ocurre, el kernel aumenta un contador interno. Este contador es inicializado a cero cuando el sistema bootea. entonces este numero representa el numero de tick de nuestro reloj desde que se booteo por ultima vez. Este contador es una variable de 64 bits y es llamada jiffies_64. Sin embargo por lo general accedemos desde nuestro driver a una variable llamada jiffies que es un unsigned long.

USANDO EL CONTADOR JIFFIES: cuando necesitamos calcular un timestamp futuro tenemos que leer el contador como se muestra en el siguiente ejemplo:

#include <linux/jiffies.h> j=jiffies; stamp_1=j+HZ -> 1 segundo en el futuro stamp_half=j+HZ/2 -> medio segundo en el futuro stamp_n=j+n*HZ/1000 -> n milisegundos en el futuro

Para comprar valores guardados de jiffies tenemos que usar alguna de las siguientes macros:

#include <linux/jiffies.h> int time_after(unsigned long a, unsigned long b) int time_before(unsigned long a, unsigned long b) int time_after_eq(unsigned long a, unsigned long b) int time_before_eq(unsigned long a, unsigned long b)

Estos macros funcionan convirtiendo los valores a signed longs y luego restandolos y comparando los resultados:

diff=(long)t2 - (long)t1;

Y podemos convertir los jiffies a milisegundos con: msec=diff *1000/HZ

Pero aveces necesitamos intercambiar representaciones de tiempo al espacio de usuario. Y lo hacemos con la estructura Timeval y TimeSpec. Entonces el kernel provee 4 macros de conversion: time_spec_to_jiffies, jiffies_to_time_spec, time_val_to_jiffies y jiffies_to_timeval

Acceder a la variable de 64 bits no es tan facil como acceder a jiffies (neceistamos usar => u64 get_jiffies_64(void))

Finalmente notemos que la frecuencia del clock por lo general se encuentra oculta del espacio de usuario, el unico lugar visible de HZ para los usuarios es en /proc/interrupts

REGISTROS ESPECIFICOS DE PROCESADOR Cuando necesitamos medir intervalos de tiempo muy cortos o necesitamos mucha presicion, podemos recurrir a recursos dependientes de la plataforma, donde estariamos eligiendo presicion sobre portabilidad del codigo.

La mayoria de los procesadores modernos incluyen un registro de contador que es incrementado una vez por cada ciclo de CPU.

El registro de contador mas conocido es TSC (TimeStamp Counter) que se puede leer desde el espacio de kernel y desde el espacio de usuario.

Luego de inlcuir <asm/msr.h> (Machine specific registers) podemos usar las siguientes macros:

rdtsc(low32, high32) -> lee el valor de los 64 bits en 2 variables rdtscl(low32) -> lee la parte menos significativa rdtscll(var64) -> lee todo y lo pone en un long

Leyendo la parte menos significativa de tsc nos alcanza para los usos mas comunes de TSC. a que una CPU de 1GHz overflowea la variable cada 4.2 segundos, y si estamos necesitando presicion es raro que lleguemos a los 4.2 segundos.

Otras plataformas ofrecen otras funcionalidades y el kernel ofrece una que es independiente de la plataforma.

#include <linux/timex.h> cycles_t get_cycles(void);

La ultima cosas a tener en cuenta sobre los timestamps counter es que no estan sincronizados a travez de los procesadores en un sistema SMP. Para estar seguro de obtener un valor coherente, debemos deshabilitar el preemption en el codigo que esta consultando al contador.

CONOCIENDO EL TIEMPO ACTUAL: Es raro que un driver necesite saber la hora del dia, expresada en meses, dias, minutos, ... ya que esta informacion por lo general se maneja a nivel de usuario. A pasar de esto el kernel nos da una funcion que tranforma una fecha/hora a jiffies:

long mktime(unsigned int year, mon, day, hour, min, seg);

Hay veces que necesitamos lidiar con timestamps absolutos y para esto usamos la funcion gettimeofday. Que cuando es llamada nos llena un puntero a una struct timeval.

void do_gettimeofday(struct timeval *tv);

DEMORANDO EJECUCIONES:

Los device drivers por lo general necesitan demorar la ejecucion de un pedazo de codigo en particular por un periodo de tiempo, usualmente para permitir que el hardware realice alguna tarea. En esta seccion cubriremos diferentes tecnicas para lograr demoras (delays)

LONG DELAYS: Periodos largos -> mas de un clock tick

Empezamos con las tecnicas mas simples y vamos hacia las mas avanzadas

BUSY WAITING (espera ocupada): (trabaja mirando el contador de jiffies)

Si queremos demorar la ejecucion multiples clock ticks, la manera mas simple , pero no recomendada, de hacerlo es un loop que monitore el contado de jiffies. Por lo general se ve de la siguiente manera: while(time_before(jiffies, j1)) -> j1 es hasta donde queremos hacer el delay cpu_relax(); -> le decimos al sistema que no estamos haciendo mucho uso del procesador

Este codigo es tecnicamente correcto (y funciona bien para lo que se disenio), pero este loop degrada la performance del sistema. Sino configuramos a nuestro kernel para operaciones preemptives, este loop bloquea al procedor por la duracion del delay. (o sea hasta que lleguemos a j1)

CEDIENDO EL PROCESADOR: (tambien trabaja mirando el contado de jiffies)

Como vimos recien busy waiting realiza una gran carga para el sistema, vamos a tratar de buscar una mejor tecnica. Y el primer cambio que se viene a la mente es explicitamente ceder el CPU cuando no estamos interesados en el. Esto lo logramos llamando a la funcion schedule(); while(time_before(jiffies,j1)) schedule(); Esto tampoco sigue siendo optimo. Ya que el proceso actual no hace nada mas que soltar el CPU, y seguir estando en la cola de procesos a ejecutar. Por lo tanto si es el unico proceso con estado running, el scheduler lo llama y el vuelve a la cola y asi sucesivamente.

Este problema se pone peor en un sistema ocupado, ya que el driver puede terminar esperando mas de lo esperado. Ya que una vez que el proceso suelta el CPU con la llamada scheduller, no hay garantias de que el proceso vuelva al cpu en un tiempo calculable. Por lo tanto vemos que llamar a schedulle no es una manera segura para dar solucion a este problema.

TIMEOUTS: (trabaja pidiendole al kernel) La mejor manera de implementar un delay es pidiendole al kernel que lo haga por nosotros. hay 2 formas de setear timeouts basados en jiffies, dependiendo si el driver espera por otros eventos o no. Si nuestro driver usa una wait_queue_head para epserar algun otro evento, pero queremos estar seguros de que el proceso correra dentro de un cierto periodo de tiempo, podemos usar las ya vistas wait_event_taimeout y wait_event_interruptible_timeout. Estas dos funciones duermen en la cola de espera, pero vuelve a ejecucion cuando el timeout espresado en jiffies expira. Estas 2 funciones fueron diseniadas con los drivers de hardware en mente, ya que la ejecucion puede ser resumida en 2 formas: • Alguien llama a wake up en la cola • el tiempo expira Para acomodarnos a la situacion donde no se espera ningun otro evento el kernel nos ofrece schedule_timeout(), con esto nos ahorramos la declaracion y el uso de una wait_queue_head. #include <linux/sched.h> signed long schedule_timeout(signed long timeout) -> nro de jiffies a demorar. La unica restriccion de schedule timeout es que tenemos que setear el proceso antes de llamarlo:

set_current_state(TASK_INTERRUPTIBLE); schedulle_timeout(delay);

DELAYS CORTOS: Cuando un driver de dispositivo necesita lidiar con latencias de hardware, los delays involucrados son por lo general unas cuantas docenas de milisigundos como mucho. En este caso, basarnos en los ticks de reloj no es la manera de afrontar las cosas.

PAra esto el kernel nos provee de las siguientes funciones:

#include <linux/delay.h) void ndelay(unsigned long nsecs); ->nano segs void udelay(unsigned long usecs); ->micro segs void mdelay(unsigned long msecs); -> mili segs Estas 3 funciones anteriores son busy waiting Y se proponen 3 que no lo son:

void msleep(unsigned int millisecs); unsigned long msleep_interruptible(unsigned int millesecs); void ssleep(unsigned int seconds);
