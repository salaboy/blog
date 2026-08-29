---
title: "LDD 3 #1: INTRODUCCION (de mi blog en www.jugmza.com.ar - 11/12/07)"
date: 2008-02-28 15:33:47 +0000
permalink: /2008/02/28/ldd-3-1-introduccion-de-mi-blog-en-wwwjugmzacomar-111207/
description: "El rol de un device driver...es proveer un mecanismo y no una politica.. Con esto empieza el libro Linux Device Driver 3."
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/02/28/ldd-3-1-introduccion-de-mi-blog-en-wwwjugmzacomar-111207/
---

El rol de un device driver...es proveer un mecanismo y no una politica.. Con esto empieza el libro Linux Device Driver 3. Ya que diferencia importante entre mecanismo y politica es una de las gandes ideas dentro del disenio de unix.  **Mecanismo**: que facilities(funcionalidades) son provistas para el usuario  **Politica**: como estas funcionalidades pueden ser usadas. Si estos dos temas estan bien entendidos y abordados por diferentes secciones seccioes del programa o por programas diferentes obtenemos un paquete de soft mucho mas facil de adaptar a las necesidades de cada usuario.

Cuando escribimos drivers debemos prestar atencion a lo siguiente: tenemos que escribir codigo de kernel que acceda al hardware, pero no forzar ninguna politica de acceso en particular, ya que distintos usuarios pueden llegar a tener distintas necesidades. El driver tiene el solo objetivo de permitir el acceso de un usuario (o varios al mismo tiempo) al dispositivo y dejar a las aplicaciones que se encarguen de como usar el hardware. Entonces el driver es flexible ofreciendo acceso al hardware sin poner restricciones.

Los drivers sin politicas tienen las siguientes caracteristicas comunes: Proveen operaciones asincronas y sincronas. Tiene la habilidad de poderse abrir multiples veces concurrentemente Posee la habilidad de explotar todas las funcionalidades provistas por el hardware y por lo general la falta de capas de software que simplifican las cosas (son siempre las que proveen operaciones relacionadas con politicas)

**Separando el kernel**: En todos los sitemas unix tenemos muchos procesos concurrentes que realizan diferentes tareas. Estas se dividen en: • **Process Management**: El kernel esta a cargo de crear y destruir procesos y administrar su conexion con el mundo exterior. La comunicacion entre diferentes procesos (through signals, pipes, or interprocess communication primitives) es la funcionalidad basica que debe brindar el kernel. • Memory Management • FileSystems • Device controls -> Device Drivers • Networking

![Vista del Kernel](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/02/split_view_of_kernel.jpg)

**Modulos pluggeables**: Linux posee la habilidad de extender sus funcionalidades en tiempo de ejecucion. Cada set de funcionalidades se llama modulo.

**Clases de dispositivos y Modulos**: Para linux hay 3 tipos de dispositivos (que tienen asociados sus respectivos tipos de modulos): • **Char Module**: stream de bytes (Ej: File) donde tenemos que implementar las operaciones comunes(syscalls) como read, write, open, close, etc. La unica diferencia entre un char device y un archivo es que en un archivo podemos movernos hacia adelante y hacia atras, y en los char devices debemos  tratarlos como canales de datos donde solo podemos acceder secuencialmente. • **Block Module**: son dispositivos (como un disco duro) que pueden contener (hostear) un filesystem. En los sistemas unix un dispositivo de bloque solo puede manejar operaciones de I/O que transfieren uno o mas bloques (que usualmente son 512 bytes). Linux por su parte permite que tratemos a los block devices como char devices(nos permite hacer  lecturas y escrituras). Por lo tanto en linux un dispositivo de bloque difiere de un dispositivo de tipo char en la manera en la que los datos son manejados a nivel de kernel. • **Networking Module**: encargados de transmicion y recepcion de paquetes. Aca tenemos funciones como send y recieve. No se conoce el concepto de conexion.. sino solo de envio y recepcion de paquetes. Al no ser stream oriented, no esta mapeado a un nodo en el filesystem. En unix la manera de acceder a estos dispositivos es mediante un nombre unico (eth0). Y la manera en la que se comunica el kernel con estos dispositivos es muy distinta que en los char y block devices.
