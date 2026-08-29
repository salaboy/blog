---
title: "SCJP - Capitulo 2: Orientacion a Objetos (Parte #1)"
date: 2008-03-13 11:46:36 +0000
permalink: /2008/03/13/scjp-capitulo-2-orientacion-a-objetos-parte-1/
description: "2 grandes beneficios que obtenemos de la Orientacion a Objetos son flexibilidad y mantenimiento."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/13/scjp-capitulo-2-orientacion-a-objetos-parte-1/
---

2 grandes beneficios que obtenemos de la Orientacion a Objetos son **flexibilidad** y **mantenimiento.**

**Encapsulacion:**

La mayor ventaja de la encapsulacion es que podemos hacer comabio en la implementacion sin romper el codigo de otros, ya que escondemos la implementacion detras de interfaces publicas de programacion.

Si queremos mantenibilidad, flexibilidad y extensibilidad nuestro disenio debe incluir encapsulacion Como logramos esto?

- Mantenemos las variables de instancia protegidas (private)
- Creamos accesors publicos para las variables de instancia
- Usamos la convencion de getters y setters

**Herencia: (IS-A y HAS-A)**

Todas las clases en Java heredan de la clase Object por eso en todas tenemos los metodos equals, clone, notify, wait, etc.

Para el examen tenemos que saber crear relaciones de herencia y entender los usos comunes de la herencia:

- Promover la reutilizacion de codigo(mediante codigo generico)
- Usar polimorfismo

**Relacion IS-A:**

El concepto esta basado en la herencia de una clase o la implementacion de una interfaz. Esto quiere decir que en Java indicamos una relacion IS-A con las palabras claves **extends** e **implements.**

**Relacion HAS-A:**

El concetp esta basado en el **uso**. En otras palabras la clase **A** HAS-A B si en el codigo de la clase **A** se hace referencia a una instancia de **B.**

**Polimorfismo:**

Cualquier objeto que pase mas de un test IS-A (con el operador instanceof) es considerado polimorfico. Hay que recordar que la unica manera de acceder a un objeto es mediante una variable de referencia y por esto vamos a recordar algunas cosas de ellas:

- Una variable puede ser de un solo tipo, y una vez declarado este tipo no puede cambiar.
- Una variable de referencia puede ser reasignada a otro objeto (a menos que haya sido declarada final)
- Una variable de referencia determina que metodos pueden ser invocados en el objeto que la variable referencia.
- **Una variable de referencia puede referirse a cualquier objeto del mismo tipo o subtipo del tipo que se declaro la variable!!!**
- **Una variable de referencia se puede declarar del tipo de una interfaz y hacer referencia a cualquier objeto que implemente esa interfaz!!!**

La JVM en runtime sabe de que tipo es exactamente el objeto (aunque lo estemos referenciando con una variable de tipo interfaz o una super clase) y por lo tanto si hay un metodo sobre escrito, se ejecuta el codigo del metodo del objeto realmente y no el de la super clase.
