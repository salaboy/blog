---
title: "Jugando con Drools 5.0 - #2 Drools Expert"
date: 2009-05-27 18:41:58 +0000
permalink: /2009/05/27/jugando-con-drools-5-0-2-drools-expert/
description: "Continuando con el ejemplo propuesto en el post anterior, vamos a analizar las reglas propuestas, junto con el modelo de dominio (objetos) propuestos para…"
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Argentina"
  - "Salaboy"
  - "tutorial"
original_url: https://www.salaboy.com/2009/05/27/jugando-con-drools-5-0-2-drools-expert/
---

Continuando con el ejemplo propuesto en el [post anterior](/2009/05/19/jugando-con-drools-5-0-1-drools-expert/), vamos a analizar las reglas propuestas, junto con el modelo de dominio (objetos) propuestos para el ejemplo.

Hay que tener en cuenta que este modelo, fue creado a modo de ejemplo, y puede no contemplar algunas situaciones. Asi que acepto sugerencias, si el ejemplo no les parece el mas adecuado, o se les ocurre algún otro modelo de dominio con el cual ejemplificar.

Les recomiendo que si no leyeron el [post anterior](/2009/05/19/jugando-con-drools-5-0-1-drools-expert/), lo lean, ya que explica la estructura del proyecto propuesto y aclara un poco las APIs básicas que vamos a utilizar cuando definimos conocimiento en forma de reglas de negocio dentro de Drools 5.0.

### **Modelo de dominio**

En este ejemplo, vamos a utilizar un modelo de dominio bastante simple para crear algunas reglas de negocio simples. La idea de este dominio es simular un escenario donde podemos definir distintos juegos de cartas y dependiendo de la cantidad de jugadores que el juego necesite, crear una ronda cuando se pueda empezar con algún juego. En este caso, vamos a ver como se podría escribir algunas reglas para que cuando se cumplan las condiciones, el juego definido comience.

![Dominio en el Ejemplo](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2009/05/model-class-diagram.png "Model Class Diagram")

Como podemos ver en la imagen, la clase Juego nos permitiría definir el nombre del juego y algunos datos genéricos que el mismo debería almacenar. Por ejemplo, todo juego tiene una relación con un Mazo de cartas y cuantas cartas por mano se deberán repartir a los jugadores de dicho juego.

Asi también estan definidas las clases Carta y Jugador, que mantienen información genérica sobre estas entidades que se utilizaran en todos los juegos.

Como podran apreciar, estas clases son simples POJOS (Plain Old Java Objects), por lo tanto, técnicamente no hay mucho que aclarar. Estas clases representaran las entidades que nuestro dominio necesita poder representar las interacciones de la realidad. En otras palabras, estas clases representan la información que se manejara en un escenario real donde tengamos Juegos de cartas.

### **Especificando reglas de negocio**

Una vez que conocemos nuestro modelo de dominio, ya estamos listos para empezar a escribir reglas que van a actuar sobre el. Para esto, vamos  a crear un archivo de texto plano en el directorio **/src/main/resources/rules** llamado **juego.drl**.

Para los que no conocen DRL es la extensión que se suele utilizar para los archivos que van a contener reglas de negocios expresados en el lenguaje que propone Drools. A continuación vemos este archivo que pueden encontrar dentro del directorio antes mencionado.

```
package com.wordpress.salaboy.playing.with.drools
import com.wordpress.salaboy.playing.with.drools.model.Juego;
import com.wordpress.salaboy.playing.with.drools.model.Jugador;
import com.wordpress.salaboy.playing.with.drools.model.Dealer;
import com.wordpress.salaboy.playing.with.drools.model.MazoPoker;
import com.wordpress.salaboy.playing.with.drools.model.Mazo;
import com.wordpress.salaboy.playing.with.drools.model.Ronda;
import com.wordpress.salaboy.playing.with.drools.model.Carta;
import java.util.ArrayList;
query "Jugador por nombre" (String qnombre)
jugador : Jugador( nombre ==  qnombre)
end
rule "Comienza una ronda de Poker cuando hay n jugadores"
when
$juego: Juego(nombre == "Poker")
$jugadores: ArrayList( size == 2 ) from collect (Jugador())
then
$juego.setMazo(new MazoPoker());
Dealer dealer = new Dealer("Poker Dealer");
insert(dealer);
end
rule "Iniciar Ronda Poker"
when
$juego: Juego(nombre == "Poker")
$dealer: Dealer()
then
$dealer.addCartas($juego.getMazo().getMano(5));
insert(new Ronda());
end
rule "Nueva Ronda"
when
Ronda()
$juego: Juego(nombre == "Poker")
$jugador: Jugador()
ArrayList(size == 0)  from collect ( Carta() from $jugador.cartas)
//eval($jugador.getCartas().size() == 0)
then
$jugador.addCartas($juego.getMazo().getMano($juego.getCantidadCartasPorMano()));
end
```

Como podemos ver, en el archivo **juego.drl**, se definen actualmente 3 reglas y una consulta (query). Cada regla delimitada por las palabras reservadas del lenguaje "**rule**" y "**end**".

### Una Regla

Cada una de estas reglas tiene un nombre asociado y dos secciones internas que definen la condición de la regla y la consecuencia que se ejecutara cuando la condición sea cierta. Como podemos apreciar las palabras reservadas "**when**" y "**then**" son utilizadas para demarcar estas secciones dentro de cada regla.

Luego de la palabra reservada "**when**", expresaremos la condición que debera cumplirse para que esta regla se ejecute. Esta condición se expresa en un lenguaje especial donde las restricciones de la condición se expresan utilizando tipos de objetos y filtrando por propiedades. Este lenguaje es llamado DRL (Drools Rule Language) y es muy sencillo de aprender.

Analicemos juntos una de estas reglas:

```
rule "Comienza una ronda de Poker cuando hay n jugadores"
  when
    $juego: Juego(nombre == "Poker")
    $jugadores: ArrayList( size == 2 ) from collect (Jugador())
  then
    $juego.setMazo(new MazoPoker());
    Dealer dealer = new Dealer("Poker Dealer");
    insert(dealer);
end
```

### La Condición

Como podemos ver, la condición de esta regla especifica dos restricciones que deben cumplirse para que la consecuencia se ejecute. Analizaremos estas dos restricciones y vamos a aprovechar para hacer algunos comentarios de la sintaxis y la semántica con la que se escriben estas restricciones.

```
when
    $juego: Juego(nombre == "Poker")
    $jugadores: ArrayList( size == 2 ) from collect (Jugador())
```

Es importante notar, que hay dos restricciones expresadas aqui, ambas unidas por un operador AND implícito. La dos restricciones que tenemos en esta condición pueden ser expresadas de la siguiente manera en lenguaje natural:

SI...

- Hay un Juego que se llama Poker
- Y hay 2 jugadores

Entonces... Consecuencia

Por lo tanto si estas restricciones se cumplen, la consecuencia de la regla se ejecutara. La primer restricción "Hay un Juego que se llama Poker" es expresada con la siguiente linea en Drools:

```
Juego(nombre == "Poker")
```

Donde lo unico que estamos expresando aqui es que en la memoria de trabajo que Drools utiliza, tendra que haber una instancia del objecto Juego, por eso se utiliza el tipo de la clase (con la J mayúscula) y luego se hace una restriccion de valor de propiedad, en este caso, que el valor de la propiedad nombre sea igual a Poker. En Drools cada instancia de objeto que es insertada en la memoria de trabajo es tratada con el nombre de Hecho. Esto hace referencia a que cada objecto que insertemos, va a generar en Drools un hecho cierto del mundo real sobre el cual queremos hacer inferencias y deducciones.

La siguiente restricción un poco mas compleja, sin embargo, lo unico que hace es contar que hayan dos jugadores para comenzar el juego. Basicamente para esto, realiza una búsqueda en la memoria de trabajo sobre todas las instancias del objeto Jugador que hayamos insertado y cuando sean dos evalúa como verdadera.

Esta bueno notar, que como con Drools escribimos código declarativo y no imperativo, no podríamos escribir esta segunda parte de la restricción de la siguiente manera:

```
when
    $juego: Juego(nombre == "Poker")
    Jugador()
    Jugador()
```

Debido a que aquí estaríamos expresando que por cada par de Jugadores se debería empezar un Juego. Esto causaría que si en la memoria de trabajo tuviéramos 2 instancias de objetos Jugador, la consecuencia se ejecutaría dos veces, ya que el par [Jugador 1, Jugador 2] es distinto al par [Jugador 2, Jugador 1].

Como ultima aclaración sobre las restricciones en las condiciones, vale la pena mencionar los bindeos/enlaces a variables que se estan realizando en ambas restricciones con: $juego y $jugadores. Estas variables, luego pueden ser usadas dentro de restricciones siguientes o en la consecuencia de la regla, como veremos a continuación.

### La consecuencia

Pasando a la consecuencia, solamente hay que aclarar que podemos expresar cualquier código Java que queramos que se ejecute cuando las restricciones de la condición son satisfechas.

```
then
    $juego.setMazo(new MazoPoker());
    Dealer dealer = new Dealer("Poker Dealer");
    insert(dealer);
```

Como podemos ver, hacemos uso de dos facilidades que son agregadas a la condición. La primer facilidad usada aquí es la la variable que relacionamos en la condición ($juego) y luego la función/método insert que nos deja insertar un nuevo hecho dentro de la memoria de trabajo desde la consecuencia de una regla.

### Interacción y conclusión

Para ir terminando con el post, ya que se hizo muy extenso, lo falta aclarar como interactuamos con la sesión que habíamos creado en el post anterior. Si descargan el proyecto y revisan la clase App.java, veran que luego de configurar y obtener la session interactuamos con ella llamando los métodos insert y fireAllRules.

```
StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
 KnowledgeRuntimeLogger logger = KnowledgeRuntimeLoggerFactory.newConsoleLogger(ksession);
ksession.insert(new Juego("Poker",2));
 ksession.insert(new Jugador("Jugador 1"));
 ksession.insert(new Jugador("Jugador 2"));
 ksession.fireAllRules();
```

Espero que a grandes rasgos se entienda el post, y como podemos crear reglas que representen nuestro conocimiento para poder interactuar con el. Aparte de querer compartir los lineamientos básicos para utilizar Drools, la idea del post también es generar dudas, para poder establecer un canal de discusión. Asi que espero sus comentarios, criticas y preguntas si las dudas comienzan a surgir.

Saludos

PD: les dejo de vuelta el link del ejemplo para que puedan descargarlo sin tener que ir al post anterior: [www.jbug.com.ar/external/playingWithDrools-ExpertIntroduction.zip](http://jbug.com.ar/external/playingWithDrools-ExpertIntroduction.zip)
