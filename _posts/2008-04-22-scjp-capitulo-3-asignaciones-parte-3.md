---
title: "SCJP - Capitulo 3:  Asignaciones (Parte #3)"
date: 2008-04-22 22:06:49 +0000
permalink: /2008/04/22/scjp-capitulo-3-asignaciones-parte-3/
description: "Pasando variables a métodos: Los métodos pueden ser declarados para tomar primitivas y/o referencias a objetos."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/04/22/scjp-capitulo-3-asignaciones-parte-3/
---

{% raw %}
**Pasando variables a métodos:**

Los métodos pueden ser declarados para tomar primitivas y/o referencias a objetos. Necesitamos saber como (o si) la variable del que llama al método va a ser afectada por el método. La diferencia entre una referencia a un objeto y  una variable primitiva cuando es pasada a un método es grande e importante.

- **Pasando variables de referencia a objetos:** Cuando pasamos una variable de tipo objeto a un método, debemos saber que estamos pasando la referencia al objeto y no el objeto en si mismo. Recordemos que las variables de referencias contienen un patrón de bits que representa una manera de encontrar a un objeto en memoria (en el Heap mas precisamente). Mas importante aun es que no pasamos la variable de referencia actual, sino una copia de la variable de referencia. En otras palabras, el que invoca y el método ahora tienen idénticas copias de la referencia, y los dos se refieren exactamente al mismo (no una copia) objeto en el Heap.
- **Java usa la semántica de pasaje por valor?**Si java pasa objetos pasando la referencia, esto significa que java usa pasaje por referencia? No exactamente, a pesar de esto, seguido van a escuchar que lo hace. Java realmente realiza pasaje por valor para todas las variable corriendo sobre la misma Virtual Machine. Pasaje por valor significa pasaje por el valor de la variable. Y esto se traduce a pasaje por copia de la variable. No hay diferencia si estamos pasando variables primitivas o de referencia, siempre estamos pasando una copia de los bits de la variable. Y para la referencia a objetos pasamos una copia de los bits que representan la forma de encontrar a un objeto. Pero estas referencias iguales apuntan al mismo objeto, y si el método modifica al objeto, el que invoco al método vera el objeto cambiado. **Recordar:** El método no puede cambiar la variable del que realizo la invocación. Es decir, que el método no puede re-asignar la variable de referencia que pertenece al que invoco al método para que se refiera a otro objeto o a null.
- **Pasando variables de tipo primitivas:** Se pasa copiando los bits que representan al valor que contiene la variable.

**Declaración, construcción e inicialización de Arrays:**

Los arrays en java son objetos que guardan múltiples variables del mismo tipo. Pueden contener tanto primitivas como referencias a objetos, pero el array en si siempre va a ser un objeto en el Heap, aunque haya sido declarado para contener primitivas.

- **Declarando Arrays**
  - De primitivas: int[] keys;
  - De referencias a objetos: Thread[] threads;
    Es ilegal si ponemos el tamaño en la declaración: int[5] scores; //No compila
- **Construyendo Arrays**Significa crear objetos de tipo Array en el Heap. Para crear este objeto Java debe saber cuanto espacio reservar en el Heap, eso debemos especificar el tamaño del array a la hora de crearlo. El tamaño es la cantidad de elementos que el array podría contener.

- **Construyendo arrays de una dimension:** int[] testscores; testscores = new int[4]; El codigo anterior pone un nuevo objeto en el heap (un objeto tipo array conteniendo 4 elementos) donde cada elemento contiene un int con el valor por defecto (cero en este caso).

(Copiar figura pag 211)

Ej: un array de referencia a objeto: Thread[] t=new Thread[5]; Hay que tener en cuenta que a pesar de que pueda parecer que se esta llamando al constructor de la clase Thread, esto no pasa. hasta aca no se ha creado ninguna instancia de Thread.

- **Construyendo arrays multidimensionales:** Son solo arrays de arrays. int [][] myArray= new int[3][]; Hay que notar que el codigo anterior es legal ya que la JVM necesita saber solo el tamaño del objeto asignado a la variable myArray.

(Copiar figura pag 213)

- **Inicializando un array:** Significa poner cosas dentro del array. Animal[] pets= new Animal[3]; pets[0]=new Animal(); pets[1]=new Animal(); pets[2]=new Animal();
- **Declarando, construyendo e inicializando en una solo linea:** Ej: int[] dots={2,4,8}; donde el tamaño del array se obtiene por la cantidad de elementos separados por coma. Ej: Dog[] myDogs={new Dog("1"),new Dog("2")}; Ej: int[][] scores= {{1,2},{3,4},{5,6,7,8}};
{% endraw %}
