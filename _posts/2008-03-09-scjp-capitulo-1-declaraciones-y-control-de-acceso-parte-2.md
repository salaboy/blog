---
title: "SCJP - Capitulo 1: Declaraciones y Control de Acceso (Parte #2)"
date: 2008-03-09 21:25:37 +0000
permalink: /2008/03/09/scjp-capitulo-1-declaraciones-y-control-de-acceso-parte-2/
description: "Otros modificadores (no de acceso): Clases Final: cuando marcamos una clase con el modificador final, la clase no puede ser heredada."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/09/scjp-capitulo-1-declaraciones-y-control-de-acceso-parte-2/
---

**Otros modificadores (no de acceso):**

- **Clases Final:** cuando marcamos una clase con el modificador final, la clase no puede ser heredada. Solo utilizariamos final para garantizar un comportamiento en una clase y por razones de seguridad.
- **Clases Abstractas:** Una clase abstracta nunca puede ser instanciada, su unica razon en la vida es ser extendida. Solo estan para aprovechar las abstracciones del pensamiento y reutilizar logica comun entre clases. Los metodos abstractos terminan con **;** y no con **{}**. Si hay un solo metodo abstracto en la clas, la clase entera debe marcarse como abstracta. Codificar clases de tipo abstracta nos permite tomar ventaja del polimorfismo y nos da gran flexibilidad y extensibilidad. Si usamos abstract y final no compila, ya que los modificadores tienen sentidos opuestos.

**Declaracion de Interfaces:**

Cuando creamos una interfaz, estamos definiendo un contrato de lo que una clase puede hacer, sin decir como lo hara la clase.

Las interfaces puede ser implementadas por cualquier clase en cualquier nivel del arbol de herencia, lo que nos tener clases muy distintas con algunas caracteristicas iguales.

Tenemos que pensar en una interfaz como una clase 100% abstracta. Donde solo puede haber metodos abstractos.

Las interfaces tienen menos flexibilidad en las declaracionesÑ

- Todos los metodos son public y abstract y terminan con **;**
- Todas las variables definidas deben ser publi, static y final, en otras palabras constantes.
- Los metodos no pueden ser static.
- Como los metodos son abstractos no se pueden marcar con fina, strictfp o native.
- Una interfaz puede extender una o mas interfaces.
- Una interfaz solo puede extender interfaces.
- Una interfaz no puede implementar otra interfaz o clase.
- Una interfaz debe ser marcada con la palabra clave **interface**.

**Declarando constantes en las interfaces:**

Tienen que ser public, static y final, pero no hace falta que lo aclaremos. Y aunque no lo alcaremos debemos recordar que son constantes y no se les puede modificar el valor.

**Declarando miembros de clase: (miembro = metodos y variables de instancia)** :

- **Modificadores de acceso:(se usan los 4)**Que significa que una clase tenga acceso a un miembro de otra clase? visibilidad como antes.
  Pero hay que entender 2 tipos de acceso:
  - Cuando un miembro de una clase trata de acceder a un miembro de otra clase
  - Cuando una subclase hereda un miembro de una super clase.El primer tipo es cuando desde una clase con el operador (**.**) accedemos a una variable o a un metodo de otra clase. Y el segundo tipo es cuando una subclase puede acceder a sus miembros heredados.
- **Miembros publicos:**
  Si es publico, cualquier clase sin importar el paquete puede acceder al miembro
- **Miembros privados:**
  Si es privado, no puede ser accedido por ningun codigo fuera de la clase donde se declaro. Tampoco se herada en el caso de ser extendida la clase.
- **Miembros protected y default:**Estos dos modificadores son muy parecidos, salvo por una gran diferencia. Un miembro declarado como default solo puede ser accedido si la clase que esta tratando de accederlo esta en el mismo paquete.
  Cuando si es marcado como protected puede ser accedido (mediante la herencia) por una subclase aunque este en una clase en otro paquete.
  **Entonces podemos concluir que el modificador protected es solo visible para una subclase.**Cuando pensamos en default, pensamos en restriccion de paquete y cuando pensamos en protected pensamos en paquete + hijos.
  Esto no significa que la subclase va a poder usar el operador (**.**) sobre el miembro en la super clase, sino que lo va a poder acceder porque lo heredo.
  Cuando un miembro protected se hereda en una clase fuera del paquete, el miembro se vuelve privado en la subclase. Por lo tanto la sub clases de la subclase no lo heredan.
  En cambio si un miembro es puesto como default la herencia del mismo se realiza si la subclase esta en el mismo paquete que la super clase.

**Variables locales y modificadores de acceso:**

Nunca se aplican modificadores a variables locales!!! El unico modificador que se aplica es final.

**Tabla de comparacion de modificadores:**

(Insertar grafico)

**Modificadores de miembros no de acceso:**

- **Metodos final:**Final previene a un metodo ser sobre escrito en una subclase, y por lo general se usa para asegurar la funcionalidad de una API.
- **Argumentos final:**Los argumentos son las variables que se declaran entre los parentesis de la definicion de un metodo. Y cuando le agregamos el modificador final los valores no puede ser modificado dentro del metodo.
- **Metodos abstractos:**Son metodos que son declarados pero no son implementados. Por eso terminan con (**;**) y no con (**{}**) y no tienen cuerpo.
  Cabe aclarar que podemos tener una clase abstracta que no tenga ningun metodo abstracto.
  La primer subclase concreta (es decir, que no sea abstracta) debera implementar todos los metodos abstractos de la super clase.
  Un metodo nunca puede ser declarado como abstract final, ni como abstract private.
  Y nunca podemos usar abstract static.
- **Metodos synchronized:**Indica que el metodo puede ser accedido por un solo hilo a la vez. Synchronized solo se aplica a metodos y se puede combinar con cualquiera de los 4 modificadores de acceso.
- **Metodos native:**Indica que el metodo es implementado en codigo dependiente de la plataforma, por lo general en C. Y el modificador native solo se aplica a metodos, los cuales no tiene cuerpo y por esto temirnan con (**;**).
- **Metodos strictfp:**Strictfp fuerza a que los puntos flotantes cumplan con el estandar IEEE 754.
- **Metodos con argumento variable(var-args):**Desde java 5.0 podemos tomar un numero variable de argumentos.
  Diferencia entre argumento y parametros:
  - Argumento: lo que especificamos entre los parentesis cuando invocamos a un metodo.
  - Parametros: lo que definimos en la firma (o signature) de un metodo.Algunas reglas importantes:
  - El argumento var-args puede ser de cualquier tipo
  - La sintaxis es la siguientes: void doStuff(int... x)

**Declaracion de constructores:**

En Java los objetos son contruidos. Por lo tanto cuando creamos un objeto(con la palabra clave new), al menos un constructor es llamado.

**Reglas:**

- Nunca debe especificar un return type
- Puede tener cualquier modificador
- Puede recibir var-args
- Tienen que tener el mismo nombre que la clase
- No puede ser marcado como static, final o abstract.

**Declaracion de variables:**

Hay 2 tipos de variables en Java:

- **Primitivas:**Alguno de los 8 tipos: char, boolean, byte, short, int, long, double, float. Una vez que se declararon su tipo no puede cambiar. Su valor si.
- **Variables de referencia:** Son usadas para acceder o referirse a un objeto. Una variable puede hacer referencia a cualquier objeto del tipo que se declaro o a cualquier subclase del tipo que se declaro.

**Declarando primitivas y rangos de primitivas:**

Todas las primitivas numericas son signed.

- byte - 8 bits
- short - 16 bits
- int - 32 bits
- long - 64 bits
- float - 32 bits
- double 64 bits

Los rangos se calculan con:

- Negativo: -2^(bits-1)
- Positivo: 2^(bits-1)-1, ya que el cero se guarda como binario positivo.

**Variables de instancia:**

Son definidas dentro de la clase y fuera de todos los metodos. Son campos que pertenecen a cada objeto que se instancia.

**Variables locales(Automatic/Stack/Method):**

Las variables locales son declaradas dentro de los metodos. La variable se declara y se destruye cuando el metodo finaliza. Las variables locales se almacenan en el Stack no en el Heap. Aunque la variable este en el Stack si es una variable de referencia a un objeto, el objeto igual esta en el Heap, por lo tanto no existen los Stack Objects, solo las Stack variables. Por lo tanto cuando hablemos de Local Object es sinonimo de variable declarada localmente de referencia.

Una cosa que hay que recordar es que, las variables locales deben ser inicializadas antes de ser usadas. Ya que a diferencia de las variables de instancia a las variables locales no se le asignan valores por defecto.

Es legal declarar una variable local con el mismo nombre que una variable de instancia, se conoce como shadowing.

**Declaracion de Arrays:**

En Java los Arrays son objetos que contienen multiples variables del mismo tipo. o variables que son de subclases del mismo tipo. Los arrays pueden tener tipos primitivos o referencias a objetos, pero el array en si siempre va a ser un objeto en el Heap, hasta si el array es declarado que contiene tipos primitivos. Necesitamos saber tres cosas:

- Como hacer una variable de referencia a un array (declaracion)
- Como hacer un objeto array (construccion)
- Como popular un array con elementos (inicializacion)

**Final Variables:**

Declarar una variable con el modificador final hace imposible reinicializar la variable una vez que fue inicializara con un valor explicito. Se entiende bien el concepto con variables primitivas, pero que pasa con una referencia a un objeto que es marcada con final? Lo que sucede es que la referencia nunca puede cambiar a otro objeto una vez que se inicializo. La informacion dentro del objeto puede cambiar pero no su referencia.

**Variables Transient:**

Cuando marcamos una variable con el modificador transient, le estamos diciendo a la JVM que ignore a esta variable que se intente serializar la clase. Solo se aplica a variables de instancia.

**Variables Volatiles:**

El modificador volatile le indica a la JVM que un hilo accediendo a la variable debe siempre conseguir su propia copia privada de la variable en memoria. Solo se aplica a variables de instancia. **Variables y Metodos Static:**

El modificador static es usado para crear variables y metodos que existiran independientemente de que alguna intancia  de la clase exista. Cosas que se pueden marcar como estaticas:

- Metodos
- Variables
- Una clase incluida en otra
- Bloques de inicializacion

**Declarando Enums:**

Desde Java 5.0 podemos restringir el valor de una variable a unos pocos valores predefinido, es decir, un valor de una lsta enumerada. Los items dentro de la lista se llaman enums.

Con una simple declaracion, garantizamos que el compilador se va a quejar si tratamos de asignar algun otro valor que no este en la lista.

Ej:  enum CoffeeSize { BIG, HUGE, OVERWHELMING } ; con el punto y coma final opcional en este caso.

Luego hacemos CoffeeSize cs= CoffeeSize.BIG;

Los enums pueden ser declarados como una clase separada o como un miembro de una clase, pero no pueden ser declarados dentro de un metodo.

**Declarando constructores y variables en un enum:**

A los enums podemos agregarles constructores, variables de instancia, metodos y algo muy extranio llamado **constant specefic class body**.

EJ:

(IMAGEN)

**Punto a recordar sobre los constructores en los enums:**

- Nunca se puede invocar el constructor de un enum directamente
- Se puede definir mas de un argumento en el constructor

Finalmente lo mas loco de los enums, es que podemos definir como una inner class anonima dentro del enum. Se conoce como constant specific class body, y es usada cuando necesitamos que una constante particular sobre escriba un metodo en en enum.

EJ:

(IMAGEN)
