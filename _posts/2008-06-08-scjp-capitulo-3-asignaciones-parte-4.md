---
title: "SCJP - Capitulo 3: Asignaciones (Parte #4)"
date: 2008-06-08 17:02:03 +0000
permalink: /2008/06/08/scjp-capitulo-3-asignaciones-parte-4/
description: "Contruyendo e instanciando arrays anonimos: Es un shortcut como el anterior y se usa de la siguiente manera: int[] testscores; // se llama anonimo porque…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/06/08/scjp-capitulo-3-asignaciones-parte-4/
---

- **Contruyendo e instanciando arrays anonimos:**Es un shortcut como el anterior y se usa de la siguiente manera:
  int[] testscores; // se llama anonimo porque aca no lo igualamos a nada
  testsocres= new int[]{2,4,5};

  RECORDAR: new Object[3]{null,new Object(),null} //no compila por el 3!!!
- **Asignacion legal de elementos a un array:**Que podemos poner en un array en particular:
  - Array de primitivas: acepta cualquier tipo de primitivas que se pueda implicitamente convertir al tipo declarado del array:
    EJ:
    int[] x= new int[5];
    byte b=4;
    char c='c';
    short s=7;
    x[0]=b;
    x[1]=c;
    x[2]=s;
    //TODO OK!
  - Array de referencia a objetos:
    Podemos poner cualquier subclase del tipo declarado del array. Y si declaramos al array de tipo de una interfaz podemos poner cualquier objeto que implemente dicha interfaz (si cumple IS-A puede asignarse)
  - Asignacion de referencias de array (1 dimension):
    Si declaramos un array de tipo int, solo podemos reasgnar a otro array de tipo int (no importa el tamaño)
    En mas dimiensiones ojo con la cantidad de dimensiones.
- **Bloques de inicializacion:**
  Los bloques de inicializacion corren la primera vez que la clase es cargada en memoria, si es un bloque static, y cuando una nueva instancia es creada si es un bloque de instancia.
  Ej:
  class SmallInit{
  static int x;
  int y;
  static{ x=7;}
  {y=8;}
  }

  Los bloques de instancia corren justo despues de que se llama a super(), en el constructor (es decir, despues de que todos los super constructors hayan corrido). Si tenemos mas de un bloque de inicializacion el orden importa!.
  Los bloques de inicializacion por lo general se usan para no duplicar codigo cuando tenemos muchos constructores similares. Finalmente si cometemos un error en el bloque de inicializacion
  obtenemos una exception ExceptionInicializationError.

**Usando clases wapper y boxing:**

Las clases wappers en las API de java sirven para 2 propositos primarios:

- Proveen un mecanismo para envolver el valor de las primitivas en objetos y asi incluir a las primitivas en actividades reservadas para objetos (ser agregados a collection o ser devueltos en algun metodo que devuelve un object)
- Porveen funciones de utilidades para los tipos primitivos. La moyoria relacionada con conversiones.

**Intro a las clases Wrapper:** Hay clases wrapper para todos los tipos de primitivas:

(TABLA!!!)

**Creando Objetos Wrapper:**

Los objetos wrapper son inmutables!! Recordar!!

- **Consturctores de los objetos wrappers:**
  Todas las clases wrapper menos Character proveen 2 constructores:
  Uno que toma la primitiva de la clase y otro que toma la representacion en string del tipo construido.
  Ej:
  Integer i1 = new Integer(11);
  Integer i2 = new Integer("11");
  Y Character solo tiene:  Character c1 = new Character('a');
  Y Boolean puede tomar true, false, "true", "false"
- **El metodo valueOf():**
  Los metodos static valueOf() nos proveen otra forma de crear objetos Wrapper. Por ejemplo tenemos:
  valueOf(String value, int radix);
  valueOf(String value);
  Integer i2 = Integer.valueOf("0101010",2); -> nos convierte de binario a decimal y lo asigna a i2
- **Usando las utilidades de conversion de las clases Wrappers:**
  - **xxxValue():** cuando necesitamos convertir un valor wrapeado a una primitiva usamos uno de los tanto xxxValue(); Todos estos metodos no reciben argumentos:
    Integer i2 = new Integer(42);
    byte b = i2.byteValue();
  - **parseXX y valueOf():**
    Ambos toman un string como argumento y lanzan un NumberFormatException si el string no esta correctamente formado. La diferencia entre los dos metodos es:
    - parseXXX() devuelve la primitiva en el nombre del metodo (XXX)
    - valueOf() devuelve una instancia nueva del objeto wrapper del tipo que invoco al metodo
    Ej:
    double d = Double.parseDouble("3.14");
    Double d2 = Double.valueOf("3.14");
  - **toString():**
    La clase Objet tiene el metodo toString() y por lo tanto todas las demas en Java tambien. La idea del metodo es poder obtener una repsentacion del objeto en forma de String.
    Todas las clases Wrapper tiene este metodo que no recibe argumentos, no es static, y devuelve un String con el valor de la primitiva.
    Todas las clases numericas poseen un metodo static sobrecargado con toString. Ej:
    String d = Double.toString("3.14");
    Integer y Long poseen un tercer metodo static que recibe un segundo argumento llamado radix.
  - **toXXXString() (Binary, Hex, Octal):**
    Las clases Integer y Long los poseen, y nos permite pasar de base 10 a otras bases. Ej:
    String s3 = Integer.toHexString(254); // s3 = fe
    (TABLA DE LA PAG 233)
