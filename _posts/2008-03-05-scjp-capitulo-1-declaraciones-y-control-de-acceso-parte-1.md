---
title: "SCJP -  Capitulo 1: Declaraciones y Control de Acceso (Parte #1)"
date: 2008-03-05 10:32:21 +0000
permalink: /2008/03/05/scjp-capitulo-1-declaraciones-y-control-de-acceso-parte-1/
description: "(SCJP)Sun Certified Java Programmer Para comenzar algunas definiciones: Clase: una plantilla que describe que tipos de estados y comportamientos pueden…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/05/scjp-capitulo-1-declaraciones-y-control-de-acceso-parte-1/
---

[(SCJP)Sun Certified Java  Programmer](http://www.sun.com/training/certification/java/scjp.xml)

**Para comenzar algunas definiciones:**

- Clase: una plantilla que describe que tipos de estados y comportamientos pueden tener los objetos de un tipo determinado.
- Objeto: en runtime, cuando la JVM encuentra la palabra clave "**new**" usa la clase indicada para crear un objeto que es instancia de esa clase.
- Estado: son los valores de las variables de instancia
- Comportamiento: es el codigo escrito dentro de los metodos, o los metodos en si mismo.. como lo quieran ver.

**Identificadores y Palabras claves:**

Todos los nombres (de clases, variables y metodos) son llamados identificadores. Sun tiene sus convenciones. Trambien java tiene un set de palabras claves que no pueden ser identificadores.

**Herencia:**

Este concepto permite que el codigo definido en una clase pueda ser rehusado en otra clase. Es uno de los conceptos principales en la OO y el lenguaje Java.

**Interfaces:**

Son como clases 100% abstractas que definien metodos que las subclases deben soportar, pero no definin comportamiento.

**Identificadores y JavaBeans:**

- **Identificadores legales****:** son las reglas del compilador que se usan para saber si un identificador esta bien escrito.
  Tecnicamente los identificadores deben estar compuestos solo por caracteres unicode, numeros, el simbolo $ y _ (underscore).
- **Reglas importantes:** 
  - Los identificadores deben empezar con una letra, $ o _, nunca con un numero
  - Luego del primer caracter puede seguir cualquier combinacion de los otros
  - No hay limite en la cantidad de caracteres de un identificador
  - Son case sensitive
  - No se pueden usar las palabras claves como identificadores

Reglas para la declaracion de archivos fuente:

- Puede haber solo una clase publica por archivo
- SI hay una clase publica en el archivo, el nombre del archivo debe coinsidir con el nombre de la clase publica
- Si la clase es parte de un paquete, la sentencia package debe ser la primer linea del archivo
- Los imports se declaran entre el package y la definicion de la clase
- Un archivo puede tener mas de una clase no publica
- Si no hay clase publica el nombre del archivo puede no coincidir con nada

**Declaraciones de clases y modificadores:**

MyClass.java:

class MyClass{ }

A esto se le puede agregar modificadores, los cuales se dividen en 2 categorias:

- Modificadores de Acceso: public, protected, private, (default)
- Otros modificadores: strictfp, final, abstract...

Vamos a empezar con los de acceso:

A una clase se le aplican public o default, los otros no tienen sentido. (y el private?)

**Acceso a una clase:**

Cuando decimos que una clase **A** tiene acceso a una clase **B** significa que **A** puede hacer 3 cosas:

- Crear una instancia de **B**
- Extender a la clase **B**
- Acceder a ciertos metodos o variables de **B.** Segun el acceso que estos metodos y variables tengan.

Entonces podemos decir que acceso = visibilidad

**Acceso Default:**

Es cuando no especificamos ningun modificador. Podemos pensar a Default como Acceso a nivel de paquete. Ej: si dos clases estan en distintos paquetes y un de ella tiene acceso default, la otra no la va a poder ni ver. (es decir, usarla o hacer referencia a ella en ningun sentido)

**Acceso Publico:**

Con del modificador de acceso public hacemos una clase visible en todo el Universo Java (JU). Recordemos que si tratamos de usar una clase fuera del paquete igual tenemos que utilizar la sentencia import.
