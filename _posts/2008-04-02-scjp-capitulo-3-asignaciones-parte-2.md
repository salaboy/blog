---
title: "SCJP - Capitulo 3:  Asignaciones (Parte #2)"
date: 2008-04-02 15:36:21 +0000
permalink: /2008/04/02/scjp-capitulo-3-asignaciones-parte-2/
description: "Asignando numeros de punto flotante: La asignacion de punto flotante varia ligeramente de la de los enteros."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/04/02/scjp-capitulo-3-asignaciones-parte-2/
---

**Asignando numeros de punto flotante:**

La asignacion de punto flotante varia ligeramente de la de los enteros. Debemos recordar que un Punto flotante es implicitamente un double (64 bits), no un float. Por lo tanto 32,2 es un double  por default, entonces si lo queremos asignar a un float: float f=32,2F; o f=(float)32,2;

**Asignando un literal que es muy grande para una variable** :

Aca es donde el compilador nos da un error de Possible loss of presicion. byte a=128; //Error! byte a=(byte)128;

Como 128 por default es un int (32 bits) y byte solo tiene 8 bits

128 = 00000000000000000000000010000000

Se descartan los primeros 24 ceros y como son valores signed el 1 hace que sea un valor negativo. Recordemos que para hallar el valor de un numero negativo vamos vuelta todos los bits (01111111) y luego le sumamos 1 y nos da 10000000 que es 128 de vuelta! y ahora le aplicamos el signo y nos queda -128.

**Asignando una variable primitiva a otra primitiva:**

int a=6;  //asignamos el patron de bits 6 a la variable a int b=a; // copiamos el patron de bits de la variable a a la variable b

Si cambiamos el contenido de a o b la otra no resulta afectada. Lo que hay que recordar es que una vez realizada las asignaciones a y b no se ferieren al mismo lugar en la memoria. Entonces a y b no comparten el mismo valor, solo tiene 2 copias iguales.

**Asignacion de variables de referencia:**

Button b=new Button(); Esto hace 3 cosas:

- Crea la variable de referencia b
- Crea un nuevo objeto Btton en el Heap
- Asgina el nuevo objeto Button a la variable de referencia b

**Scope de las variables:**

Hay 4 scopes basicos:

- Las variables static tiene el scope mas largo, se crean cuando la clase es cargada, y viven hasta que la clase es descargada de la JVM.
- Las variables de instancia son las siguientes en la lista de duracion, son creada con una instancia nueva de un objeto y viven hasta que la instancia es removida.
- Siguen las variables locales, viven mientras el metodo se mantenga en el stack.
- Las variables de bloque viven solo mientras el codigo del bloque se ejecuta. (for, while, do, etc)

**Usando una variable o un array que no esta inicializado y no asignado:**

Cuando tratamos de usar una variable no inicializada, podemos tener distintos comportamientos dependiendo de si la variables es un array o una variable de tipo primitivo o un objeto.

- Variable de instancia de tipo objeto y primitivas:
  Estas se inicializan a un valor por defecto cada vez que una nueva instancia es creada.
  Valores por defecto: object reference= null; (byte,short,int,long)=0; (float,double)=0.0; boolean=false; char='\u0000'
  Recordemos que la asignacion por defecto null para los objetos nos tirara un Runtime Exception si tramotas de utilizar el operador punto (.) sin inicializar. (Null Pointer Exception). Para comprobar esto utilizamos la palabra reservada null.
- Variables de instancia que son Arrays:
  Un array es un objeto, por lo tanto si un array es declarado como una variable de instancia y no lo hemos inicializado explicitamente va a tener el valor null. Pero, si el array es inicializado, que paso con los elementos contenidos en el array? Siempre se le da los valores por defecto a los elementos de un array, sin importar donde el array es declarado o instanciado.
- Primitivas y objetos locales (stack, automatic)
  Una variable "automatica" debe ser asignada a un valor en el codigo, sino el compilador se va a quejar.
  - Primitivas locales:
    Las variables locales, incluyendo las primitivas, siempre deben ser inicializadas antes de tratar de ser usadas. Java no le da a las variables locales valores por defecto, explicatamente debemos inicializarlas. Hay que tener en cuenta dque el error puede saltar cuando inicializamos la variable dentro de un bloque que el compilador sabe que puede llegar a no correr.
  - Referencias a objetos locales:
    No se setea en null, ya que para el compilador null es un valor. Y como ni siquiera esta en null el compilador se queja.No se inicializa con ningun valor!
  - Arrays locales:
    A los elementos del array se le dan los valores por defecto, pero al objeto array no se lo inicializa cuando es declarado localmente, explicitamente debemos inicializar la referencia al array si esta declarada dentro de un metodo, pero en el momento que contruyamos el objeto array sus elementos se inicializan con el valor por defecto.

**Asignando una variable de referencia a otra:**

Las referencias a objetos (variables de referencia) funciaona de la misma manera. El contenido de una variable de referencia es un patron de bits. Entonces si asignamos  el valor de una variable de referencia a otra, el patron de bits es copiado. Si asignamos un objeto existente a una nueva variable de referencia, luego las dos tendran el mismo patron de bits que hace referencia a un objeto en el Heap. Entonces decimos, que hay un solo objeto pero 2 variables de referencia apuntando a el (a la misma instancia). Una excepcion es la clase String que es inmutable y no se puede cambiar el valor de un objeto String. Se tiene un pool de Strings.
