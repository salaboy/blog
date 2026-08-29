---
title: "Jugando con Drools 5.0 – #3 Drools Expert"
date: 2009-05-29 13:35:15 +0000
permalink: /2009/05/29/jugando-con-drools-5-0--e2-80-93-3-drools-expert/
description: "Continuando con los dos post anteriores (post1 y post2), vamos a analizar el comportamiento de la aplicación cuando la misma se ejecuta."
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Argentina"
  - "Drools"
  - "example"
  - "expert"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2009/05/29/jugando-con-drools-5-0--e2-80-93-3-drools-expert/
---

Continuando con los dos post anteriores ([post1](/2009/05/19/jugando-con-drools-5-0-1-drools-expert/) y [post2](/2009/05/27/jugando-con-drools-5-0-2-drools-expert/)), vamos a analizar el comportamiento de la aplicación cuando la misma se ejecuta. La idea es explicar y aclarar el comportamiento del framework para esta situación en particular y además dejar planteado los comportamientos que por lo general se intentan modelar con estos motores de inferencias.

Primero que nada recordemos el código que armaba la sesión de Drools con la que vamos a interactuar:

```
KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
 kbuilder.add(ResourceFactory.newInputStreamResource(new App().getClass().getResourceAsStream("/rules/juego.drl")),ResourceType.DRL);
if (kbuilder.hasErrors()) {
System.out.println(kbuilder.getErrors());
return;
}
Collection kpkgs = kbuilder.getKnowledgePackages();
KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
kbase.addKnowledgePackages( kpkgs );
StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
KnowledgeRuntimeLogger logger = KnowledgeRuntimeLoggerFactory.newConsoleLogger(ksession);
ksession.insert(new Juego("Poker",2));
ksession.insert(new Jugador("Jugador 1"));
ksession.insert(new Jugador("Jugador 2"));
ksession.fireAllRules();
```

Como podemos ver, una vez que creamos la sesión podemos interactuar con ella mediante el método insert(), que va a insertar nuevos Facts/Hechos a la memoria de trabajo que posee Drools para realizar las inferencias. Una vez ejecutado el método insert(), el objeto ya se encontrara dentro de la memoria de trabajo y automáticamente Drools analizara que deducciones puede realizar sobre el.

### Análisis de la ejecución

A continuación vamos a ir viendo como se relaciona la salida que obtenemos por consola con la ejecución del código y las evaluaciones que se realizan las reglas sobre los facts.

Cuando realizamos el primer ksession.insert(new Juego("Poker",2)); la siguiente linea aparece por consola:

OBJECT ASSERTED value:Juego =Poker factId: 1

Lo mismo sucede cuando insertamos el primero Jugador:

OBJECT ASSERTED value:Jugador 1 - cartas: [] puntos =0 factId: 3

Ahora cuando vamos a realizar el siguiente insert, es decir cuando llamamos al método insert e insertamos un nuevo Jugador, debido a que hay una regla que esta esperando 2 jugadores para activarse, una Activación es creada. Esto significa que ya hay una regla lista para ejecutarse para un set de Facts determinados.

ACTIVATION CREATED rule:Comienza una ronda de Poker cuando hay n jugadores activationId:Comienza una ronda de Poker cuando hay n jugadores [2, 1] declarations: $jugadores=[Jugador 1 - cartas: [] puntos =0, Jugador 2 - cartas: [] puntos =0](2); $juego=Juego =Poker(1) OBJECT ASSERTED value:Jugador 2 - cartas: [] puntos =0 factId: 4

Si analizamos la linea que comienza con "**ACTIVATION CREATED**" veremos que nos indica el nombre de la regla que esta cumpliendo con la condición (y sus restricciones) junto con los datos de los Facts que las satisfacen.

Ahora bien, en nuestra aplicación, no llamamos mas al método insert, ahora es el turno de llamar al famoso y querido método fireAllRules(). Este método, se encargara de ejecutar las Activaciones creadas, que se hayan generado con los inserts anteriores. Por esto, las siguientes lineas se mostraran en la consola cuando el metodo fireAllRules se ejecute:

BEFORE ACTIVATION FIRED rule:Comienza una ronda de Poker cuando hay n jugadores activationId:Comienza una ronda de Poker cuando hay n jugadores [2, 1] declarations: $jugadores=[Jugador 1 - cartas: [] puntos =0, Jugador 2 - cartas: [] puntos =0](2); $juego=Juego =Poker(1) ACTIVATION CREATED rule:Iniciar Ronda Poker activationId:Iniciar Ronda Poker [5, 1] declarations: $dealer=Poker Dealer - cartas: [] puntos =0(5); $juego=Juego =Poker(1) OBJECT ASSERTED value:Poker Dealer - cartas: [] puntos =0 factId: 5 AFTER ACTIVATION FIRED rule:Comienza una ronda de Poker cuando hay n jugadores activationId:Comienza una ronda de Poker cuando hay n jugadores [2, 1] declarations: $jugadores=[Jugador 1 - cartas: [] puntos =0, Jugador 2 - cartas: [] puntos =0, Poker Dealer - cartas: [] puntos =0](2); $juego=Juego =Poker(1) BEFORE ACTIVATION FIRED rule:Iniciar Ronda Poker activationId:Iniciar Ronda Poker [5, 1] declarations: $dealer=Poker Dealer - cartas: [] puntos =0(5); $juego=Juego =Poker(1) ACTIVATION CREATED rule:Nueva Ronda activationId:Nueva Ronda [18, 4, 1, 6] declarations: $juego=Juego =Poker(1); $jugador=Jugador 2 - cartas: [] puntos =0(4) ACTIVATION CREATED rule:Nueva Ronda activationId:Nueva Ronda [19, 3, 1, 6] declarations: $juego=Juego =Poker(1); $jugador=Jugador 1 - cartas: [] puntos =0(3) OBJECT ASSERTED value:Nueva Ronda factId: 6 AFTER ACTIVATION FIRED rule:Iniciar Ronda Poker activationId:Iniciar Ronda Poker [5, 1] declarations: $dealer=Poker Dealer - cartas: [13 de Pica, 13 de Diamante, 7 de Trebol, 8 de Corazon, 6 de Corazon, ] puntos =0(5); $juego=Juego =Poker(1) BEFORE ACTIVATION FIRED rule:Nueva Ronda activationId:Nueva Ronda [18, 4, 1, 6] declarations: $juego=Juego =Poker(1); $jugador=Jugador 2 - cartas: [] puntos =0(4) AFTER ACTIVATION FIRED rule:Nueva Ronda activationId:Nueva Ronda [18, 4, 1, 6] declarations: $juego=Juego =Poker(1); $jugador=Jugador 2 - cartas: [2 de Trebol, 4 de Corazon, ] puntos =0(4) BEFORE ACTIVATION FIRED rule:Nueva Ronda activationId:Nueva Ronda [19, 3, 1, 6] declarations: $juego=Juego =Poker(1); $jugador=Jugador 1 - cartas: [] puntos =0(3) AFTER ACTIVATION FIRED rule:Nueva Ronda activationId:Nueva Ronda [19, 3, 1, 6] declarations: $juego=Juego =Poker(1); $jugador=Jugador 1 - cartas: [9 de Pica, 13 de Trebol, ] puntos =0(3)

Todo esto sucede cuando el método fireAllRules() se ejecuta, pero, que exactamente hace este método? Como vemos en la consola, lo primero que este método va a realizar es la ejecución de la activación que se habia generado cuando estábamos insertando facts en la sesión. La ejecución de estas activaciones van a ser loggeadas en consolas antes y después de ejecutarse. Esto es para que nosotros podamos ver, si la consecuencia de la regla que se ejecuta nos modifica el estado actual de la memoria de trabajo.

Como vemos en el log anterior, en las primeras 4 lineas, sucede exactamente esto que estábamos describiendo.

BEFORE ACTIVATION FIRED rule:Comienza una ronda de Poker cuando hay n jugadores activationId:Comienza una ronda de Poker cuando hay n jugadores [2, 1] declarations: $jugadores=[Jugador 1 - cartas: [] puntos =0, Jugador 2 - cartas: [] puntos =0](2); $juego=Juego =Poker(1) ACTIVATION CREATED rule:Iniciar Ronda Poker activationId:Iniciar Ronda Poker [5, 1] declarations: $dealer=Poker Dealer - cartas: [] puntos =0(5); $juego=Juego =Poker(1) OBJECT ASSERTED value:Poker Dealer - cartas: [] puntos =0 factId: 5 AFTER ACTIVATION FIRED rule:Comienza una ronda de Poker cuando hay n jugadores activationId:Comienza una ronda de Poker cuando hay n jugadores [2, 1] declarations: $jugadores=[Jugador 1 - cartas: [] puntos =0, Jugador 2 - cartas: [] puntos =0, Poker Dealer - cartas: [] puntos =0](2); $juego=Juego =Poker(1)

Entre un BEFORE ACTIVATION FIRED y un AFTER ACTIVATION FIRED, de la misma regla podemos ver si la consecuencia de la misma, cambio el estado de algún hecho/fact, se inserto un nuevo hecho/fact o por alguna otra razón se genero una nueva activación. En este caso en particular vemos que se creo una nueva Activación de de una regla llamada "**Iniciar Ronda Poker**" al haber sido insertado un objeto de tipo Dealer en la consecuencia de la regla "**Comienza una ronda de Poker cuando hay n jugadores**".

Si recordamos la consecuencia de la regla "**Comienza una ronda de Poker cuando hay n jugadores**", podemos ver que efectivamente esta regla esta insertando un nuevo hecho de tipo Dealer, con lo cual causa una nueva activación para la regla llamada "**Iniciar Ronda Poker**".

```
then
    $juego.setMazo(MazoPoker());
    Dealer dealer =new Dealer("Poker Dealer");
    insert(dealer);
```

Cuando este hecho/fact de tipo Dealer sea insertado en la memoria de trabajo de Drools, la regla llamada "**Iniciar Ronda Poker**", que tiene la siguiente condición, genera una activación:

```
$juego: Juego(nombre == "Poker")
  $dealer: Dealer()
```

Esto se debe a que ya teniamos un Juego, el que nosotros habiamos insertado y ahora la regla anterior inserto un nuevo Dealer, entonces la consecuencia de la regla tiene que ser ejecutada.

Siguiendo esta misma lógica, pueden analizar el resto de las activaciones que se generan, asi modificar el ejemplo para que se generen nuevas o diferentes activaciones según el estado de la memoria de trabajo de Drools.

### Consultas sobre la memoria de trabajo

Para ir terminando con este post, solo resta ver la ejecución de cada uno de los queries que se realiza al finalizar todas las inferencias. Es bueno aclarar también que cuando ya no quedan activaciones que ejecutar, el método fireAllRules devuelve el control a nuestra aplicación para que pueda continuar su ejecución.

Cuando el control retorna a la aplicación luego del método fireAllRules(), podemos consultar como quedaron nuestros hechos en la memoria de trabajo. Para esto podemos definir consultas/queries en nuestros archivos DRL que incluimos a la hora de armar nuestra sesión.

En este caso, se agrego la siguiente consulta:

```
query "Jugador por nombre" (String qnombre)
  jugador : Jugador( nombre ==  qnombre)
end
```

Es bueno notar que la sintaxis para definir consultas es la misma que para expresar restricciones en las condiciones de nuestras reglas.

La salida a consola de la ejecución de esta consulta con diferentes parámetros es la siguiente:

El Dealer tiene las cartas: OBJECT ASSERTED value:org.drools.base.DroolsQuery@f7a53d93 factId: 20 [Carta -> 13dePica, Carta -> 13deDiamante, Carta -> 7deTrebol, Carta -> 8deCorazon, Carta -> 6deCorazon] El Jugador 1 tiene las cartas: OBJECT ASSERTED value:org.drools.base.DroolsQuery@f7a53d93 factId: 21 [Carta -> 9dePica, Carta -> 13deTrebol] El Jugador 2 tiene las cartas: OBJECT ASSERTED value:org.drools.base.DroolsQuery@f7a53d93 factId: 22 [Carta -> 2deTrebol, Carta -> 4deCorazon]

Donde el código para ejecutar cada una de estas consultas es el siguiente:

```
QueryResults results = ksession.getQueryResults("Jugador por nombre", new Object[]{"Poker Dealer"});
 for ( QueryResultsRow row : results ) {
   Jugador jugador = ( Jugador ) row.get( "jugador" );
   System.out.println( jugador.getCartas() + "\n" );
 }
```

Donde se puede apreciar que estas consultas se ejecutan obteniendolas por nombre y pasando los parámetros como un array de objetos. Luego para recuperar los resultados obtenemos los objetos mediante el nombre de su variable vinculada, en este caso llamada "**jugador**". Vale la aclaración de que debería llamarse **$jugador** para seguir con las reglas de legibilidad.

### Conclusión

Vimos un poco como es el flujo de ejecución de este ejemplo propuesto en particular. Espero que esta explicación, también genere dudas e inquietudes sobre como funciona el framework internamente. La idea principal de estos posts, es dejar precedencia para poder escribir artículos mas profundos sobre temas mas avanzados. Espero sus comentarios, criticas y dudas si es que las hay.

Saludos.

PD: nuevamente les dejo el link del ejemplo, para que no tenga que andar buscandolo por todos lados: [www.jbug.com.ar/external/playingWithDrools-ExpertIntroduction.zip](http://jbug.com.ar/external/playingWithDrools-ExpertIntroduction.zip)
