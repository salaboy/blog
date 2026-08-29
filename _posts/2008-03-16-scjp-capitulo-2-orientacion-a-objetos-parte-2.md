---
title: "SCJP - Capitulo 2: Orientacion a Objetos (Parte #2)"
date: 2008-03-16 16:57:32 +0000
permalink: /2008/03/16/scjp-capitulo-2-orientacion-a-objetos-parte-2/
description: "Sobre escritura / Sobre carga: Metodos sobre escritos: Cada vez qeu una clase hereda de un metodo tenemos que la oportunidad de sobre escribirlo."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/16/scjp-capitulo-2-orientacion-a-objetos-parte-2/
---

**Sobre escritura / Sobre carga:**

**Metodos sobre escritos:**

Cada vez qeu una clase hereda de un metodo tenemos que la oportunidad de sobre escribirlo. Con esto logramos que su comportamiento sea especifico para esta clase.

Cuando sobre escribimos un metodo no podemos cambiarle el modificador de acceso por uno mas restrictivo.

Tambien como regla de oro, un metodo sobre escrito debe cumplir con el contrato (signature) de la super clase.

Las reglas generales de sobre escritura son las siguientes:

- La lista de argumentos tiene que ser exactamente igual.
- El return type debe ser igual o de un subtipo del declarado en la super clase.
- El modificador de acceso no debe ser mas restrictivo.
- Los metodos puede ser sobre escritos soslo si se heredaron de una super clase.
- Los mtodos sobre escritos pueden tirar cualquier excepcion unchecked (runtime ex) sin importar lo que el metodo de la super clase haya declarado.
- EL metodo no debe tirar nuevas exceptions checked que no hayan sido declaradas en el metodo de la super clase.
- No podemos sobre escribir metodos marcados con final, ni con static.

**Invocando la version de la super clase de un metodo sobre escrito:**

Probablemente en algunos casos, vamos a querer tomar prestado codigo del metodo de la super clase, para reutilizarlo en el actual metodo sobre escrito. Para esto usamos  la palabra clave **super,** Que nos da la posibilidad de invocar el metodo de la super clase en el metodo sobre escrito y nos permite continuar agregando codigo una vez terminada la ejecucion del metodo invocado con super.

**Metodos sobre cargados:**

Nos permite usar el mismo nombre de un metodo en la misma clase pero con diferentes argumentos (y opcionalmente diferente return type). Por lo general cuando sobre cargamos un metodo lo hacemos para simplificarle la vida a los que van a llamar a este metodo.

Reglas de sobre carga:

- Debe cambiar la lista de argumentos
- Puede cambiar el return type
- Puede cambier el modificador de acceso
- Puede declarar nuevas u otras exceptions
- Puede ser sobrecargado en la misma clase o en una subclase

Luego se decide que version del metodo ejecutar comparando la lista de argumentos.

En caso de haber metodos sobre cargados en una relacion de clase y super clase en los argumentos, lo que cuenta es la **variable de referencia** a la hora de decidir que metodo invocar.

(EJ!!)

**Polimorfismo en metodos sobrecargados y sobreescritos:**

El polimorfismo no importa cuando un metodo es sobre cargado, entonces se puede decir que el polimorfismo no determina que version sobrecargada del metodo es llamada, sino que el polimorfismo entra en juego cuando se tiene que tomar la desicion sobre que metodo sobre escrito debe llamarse.

!Ojo con confundir sobre carga con sobre escritura!!!

**Casteo de variables de referencia:**

Ya vimos como es posible usar ambas referencias, una referencia generica y una mas especifica para un tipo en particular:

Animal a=new Dog();

Pero que pasa si queremos llamar sobre la variable de referencia a un metodo que solo posee el subtipo? Para esto debemos castear la variable de referencia:

Dog d=(Dog)a; -> Downcasting (explicito)

El upcasting es implicito:

Dog d=new Dog();

Animal a=d; -> Upcasting implicito, es opcional poner el casteo (Animal)

Una cosa importante mas, si Dog implementa a Pet, luego Beagle extiende a Dog, pero Beagle no hace la declaracion que implementa Pet, igualmente Beagle es Pet!

No hay que dejarse enganiar por codigo donde vemos que se implementa una interfaz, pero los metodos de la interfaz no son implementados en la clase. Antes de poder saber si el codigo es legal o no, debemos ver las declaraciones de la super clase, para saber si ya se ha hecho cargo de implementar los metodos de dicha interfaz.

**Implementando una interfaz:**

Cuando implementamos una interfaz estamos aceptando cumplir con un contrato, es decir, que proveemos implementaciones legales para cada uno de los metodos definidos en esta interfaz.

Pero el contrato que aceptamos solo garantiza que la clase va a tener los metodos de la interfaz, pero no se garantiza que esten correctamente implementados.

La clase que realiza una implementacion de una interfaz debe seguir las siguientes reglas:

- Proveer una implementacion concreta (no abstracta) de todos los metodos declarados en la interfaz.
- Seguir las reglas legales de sobre escritura
- Declarar las exceptions no checked en la implementacion de los metodos que esten definidas en la signature de la interfaz, o pueden ser subclases de las exceptions definidas.
- Mantener el mismo signature de los metodos de la interfaz y el mismo tipo o un subtipo del return type

**2 Reglas mas generales:**

1. Una clase puede implementar mas de una interfaz
2. Una interfaz puede extend otra interfaz (tambien puede extender mas de una interfaz!! re loco!)

**Return types Legales:**

Vamos a ver que podemos declarar como un return type y que realmente podemos devolver como valor de return type.

- Declaraciones de return type:
  - Return types en metodos sobre cargados:
    La sobre carga de un metodo es solamente la reutilizacion del nombre. Por lo tanto podemos declarar cualquier tipo de return type que querramos. Pero debemos acordarnos de que a un metodo sobre cargado si o si le tenemos que cambiar la lista de argumentos
  - Sobre escribiendo un return type y returns covariantes:
    Cuando queremos sobre escribir un metodo, la sub clase debe definir un metodo que concuerde exactamente con la version heredada del metodo. O en Java 5, tenemos permitido cambiar el return type siempre y cuando el nuevo sea subtipo del anterior.
- Devolucion de un valor:
  6 Reglas:
  - Podemos devolver null en un metodo con return type que hace referencia a un objeto
  - Un array es legar como return type
  - En un metodo que devuelve un return type de tipo primitivo, podemo sdevolver cualquier valor o variable que pueda ser implicitamente convertida al tipo declarado de return type. (Ej: se declaro int y se devuelve char)
  - En un metodo con un tipo de return type primitivo, podemos devolver cualquier valor o variable que pueda ser explicitamente catesado al tipo declarado. Ej: se declaro int y se devuelve un float, (int)f;
  - No debemos devolver nada en un metodo que declara void en el return type.
  - En un metodo con un return type que hace referencia a un objeto podemos devolver cualquier tipo de objeto que puede ser implicitamente convertido al tipo declarado. Ej: se declaro Animal y se devuelve Horse.



**Constructores e Instanciacion:**

Los objetos son construidos, por lo tanto no podemos crear a un objeto sin llamar a su constructor. Pero en realidad, no podemos hacer un objeto sin invocar no solo a su constructor, sino tambien a cada uno de los constructores de sus super clases. Cabe aclarar que para correr un constructor es necesaria la palabra clave new.

- Conceptos basicos de constructores:
  Cada clase, incluyendo las clases abstractas, deben tener un constructor. En todos los constructores no hay return type. Y los nombres de los constructores deben coincidir con el nombre de la clase. Entonces es muy comun y deseable que la clase tenga un constructor que no reciba ningun argumento, sin importar cuantos constructores sobrecargados tenga la clase.
- Encadenamiento de constructores:
  Copiar ejemplo de Horse
- Reglas para constructores: (si o si hay que saberlas)
  - Los constructores pueden usar cualquier modificador de acceso, incluyendo private. ( si usamos private, solo podemos crear objetos dentro de la misma clase, por lo tanto la clase va a tener que proveer alguna metodo static o una variable que permita acceder a los objetos creados dentro de la clase.
  - El nombre del constructor debe ser igual al de la clase. Si otra vez...
  - No deben tener return type. Si tambien otra vez..
  - Si no escribimos un constructor por defecto, lo genera automaticamente el compilador
  - El constructor por defecto no debe recibir ningun argumento.
  - Si escribimos otros constructores sobre cargados y queremos el constructor por defecto, debemos escrirlo nosotros, ya que si hay constructores, el compilador no genera nada.
  - Todo constructor tiene como primer linea de su cuerpo o una llamada a su propio constructor (this()) o una llamada al constructor de su super clase. Esta llamada es insertada automaticamente por el compilador.
  - No podemos llamar a un metodo de instancia, o acceder a una variable de instancia hasta despues de que el super() haya finalizado.
  - Solamente podemo susar variables o metodos statics en la llamada del supe(). Ej: super(Animal.NAME);
  - Las clases abstractas tienen constructores y son llamados siempre que una subclase concreta es instanciada.
  - Las interfaces no tienen constructores.
  - La unica manera de llamar a un constructo, es desde otro constructor. Por lo tanto no podemo sinvocar a un constructor desde un metodo, como si fuera otro metodo.
- Determinando cuando un constructor por defecto es creado:
  - Cuando estamos seguros de que un constructor por defecto es creado?
    Solamente cuando no hemos escrito ningun constructor dentro de la clase.
  - Como va a lucir el constructor por defecto generado?
    - Tiene el mismo modificador de acceso que la clase.
    - No recibe argumentos
    - Incluye una llamada al constructor por defecto de la super clase sin argumentos
  - Que pasa si el constructor de la super clase recibe argumentos?
    Nos vemos obligados a escribir la llamada a super aplicando los argumentos necesarios.
- Para recordar:
  - Los constructores nunca se heredan!
  - Los constructores no son metodos!
  - Por lo tanto no pueden ser sobre escritos!!
- Sobre carga de constructores:
  Es cuando cambiamos la lista de argumentos de un constructor, generalmente para facilitar la tarea de los que invoquen a ese constructor.

**Statics:**

- **Metodos y variables Static:**El modificador static tiene un profundo impacto en como se comportan las variables  y los metodos marcados con static, por eso es tratado aparte de los otros modificadores. Hacemos un metodo static, cuando la funcionalidad del metodo siempre va a ser la misma, y esta es independiente de la instancia (valores de las variables de instancia). Tambien podemos hacer mension al tipo ejemplo de contar la cantidad de instancias de un tipo de objeto en particular. Donde guardamos el contador? Las variables y los metodos marcados con static pertenecen a la clase y no a ninguna de sus intancias particulares. Por esto si hay muchas intancias de una clase que tiene variables static, esta variable se comparte para todas las intancias, existiendo en realidad una sola copia para todas las intancias. Hay que recordar que un metodo static no puede acceder a una variable no static (de instancia) ya que no hay instancia asociada al metodo!
- **Accediendo a metodos y variables Static:** La manera de acceder a una variable o metodo static, es usando el operador punto (**.**)  sobre el nombre de la clase directamente, lo opuesto seria sobre una variable de referencia a un objeto instanciado de la clase. Pero para hacerlo realmente confuso, el lenguaje Java tambien nos permite usar una referencia a un objeto para llamar a los metodos y variables static. Y esto es solamente un truco de sintaxis ya que el miembro static sigue sin conocer a la instancia en particular del objeto que uso para llamar a los metodos o variables. Finalmente hay que recordar que los miembros static no puede ser sobre escritos. Esto no significa que no se puedan redefinir en la subclase. Hay que recordar tambien que a la hora de llamar a un metodo static con una variable de referencia, se resuelve que metodo ejecutar en el arbol de herencia basandose en el tipo de la variable de referencia y no de la instancia creada.

**Acoplamiento y Cohesion:**

Estos dos temas tiene que ver con la calidad del disenio orientado a objetos. En general se dice que es un buen disenio Orientado a Objetos cuando posee bajo acoplamiento y alta cohesion. Y esto nos brinda las siguientes ventajas:

- Facil creacion
- Facil mantenimiento
- Facil mejoramiento y adecuacion

- **Acoplamiento:** Es el grado en que una clase sabe de otra clase. Si el conocimiento de una clase A sobre una clase B, es lo que la clase B expuso a travez de su interfaz, entonces se dice que A y B estan bajamente acopladas, y esto es bueno.
- **Cohesion:** Mientras que el acomplamiento habla sobre como interactuan unas clses con otras, la cohesion habla de como una sola clase es diseniada. El termino cohesion idica el grado en que una sola clase esta bien enfocada en un proposito. El mayor beneficion de una alta cohesion son las clsaes mucho mas faciles de mantener.
