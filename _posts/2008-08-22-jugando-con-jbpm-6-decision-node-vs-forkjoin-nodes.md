---
title: "Jugando con jBPM #6 - Decision Node vs Fork/Join Nodes"
date: 2008-08-22 18:52:56 +0000
permalink: /2008/08/22/jugando-con-jbpm-6-decision-node-vs-forkjoin-nodes/
description: "La idea de este post es remarcar la diferencia que poseen estos dos tipos de nodos que son bastantes distintos pero a simple vista ambos tienen mas de una…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "JBoss"
  - "jBPM"
  - "jPDL"
original_url: https://www.salaboy.com/2008/08/22/jugando-con-jbpm-6-decision-node-vs-forkjoin-nodes/
---

La idea de este post es remarcar la diferencia que poseen estos dos tipos de nodos que son bastantes distintos pero a simple vista ambos tienen mas de una transición de salida y pueden llegarnos a confundir a la hora de modelar.

Empezamos por el mas simple y el que tiene que quedar claro ya que no tiene muchos usos distintos.

**Decision Node:**

Este nodo tiene una tarea bastante sencilla, su funcionalidad principal es la de escoger entre 2 o mas ramas alternativas para continuar la ejecución del proceso. Esto significa que el token de ejecución que llega a este nodo (mas acerca del token en otros posts) se propaga por solo una transición de salida del nodo decisión.

La transición por la cual se continuara la ejecución del proceso puede ser elegida de varias formas, que se eligen en tiempo de modelado. Las dos grandes posibilidades que podemos especificar son:

- Expresiones del tipo JSF (Ej: #{objeto.propiedad < 5})
- DecisionHandler (clase delegada que implementa la interfaz DecisionHandler y que tiene la lógica en Java para decidir que transición tomar)

Por lo tanto en jPDL podemos ver a un decision Node de las dos siguientes formas:    &lt;decision name="Para donde voy?" expression="#{variable == true}"&gt; &lt;transition to="Nodo 1" name="true"&gt;&lt;/transition&gt; &lt;transition to="Nodo 2" name="false"&gt;&lt;/transition&gt; &lt;/decision&gt; o

```
&lt;decision name="Para donde voy?"&gt;
&lt;handler class="com.wordpress.salaboy.handlers.MyDelegationHandler"&gt;&lt;/handler&gt;
&lt;transition to="Nodo 1" name="Nodo 1"&gt;&lt;/transition&gt;
```

&lt;transition to="Nodo 2" name="Nodo 2"&gt;&lt;/transition&gt; &lt;/decision&gt;

Como podemos ver, o delegamos la decision a una clase o lo realizamos con una expresion JSF.

En caso de que optemos por la clase delegada, esta debera implementar la interfaz DelegationHandler que define el siguiente metodo a implementar:

String decide(ExecutionContext executionContext) throws Exception;

La implementación de este método debe retornar el nombre de la transición a tomar.

**Fork/Join Nodes:**

Estos nodos son un poco mas complicado en su implementación y en su conceptualización ya que para entenderlo por lo general se necesita ver un ejemplo claro de su funcionamiento. En este post voy a hablar un poco mas internamente de su funcionamiento para contrastarlo con el decision node y en el post siguiente voy a presentar un ejemplo concreto del mismo.

Estos nodos se utilizan por lo general en conjunción ya que uno crea varias ramas concurrentes de ejecucion del proceso (y para cada una de estas crea un sub token de ejecución que propaga por cada una de las transiciones salientes del nodo fork, al mismo tiempo) y el otro nodo juntara todas estas ramas para volver a unificar el camino de ejecución del proceso.

Con esta funcionalidad que brinda el nodo fork, podemos modelar casos donde hay tareas que pueden ocurrir al mismo tiempo, es decir, que no tienen que ejecutarse en un orden secuencia (primero una y después otra). Esto muchas veces nos permite optimizar los tiempos del proceso, ya que muchas veces el proceso fue pensado de manera secuencial y a la hora de modelarlo nos damos cuenta de que podemos ejecutar varias tareas en paralelo.

El ejemplo mas clásico de jBPM para mostrar esto, es el que se encuentra en la documentación oficial:

![Ejemplo de Proceso](http://docs.jboss.com/jbpm/v3.2/userguide/html/images/auction.process.graph.gif)

Donde claramente se ve que las actividades "send item" y "receive money" pueden ocurrir en paralelo sin depender una de otra.

Para aclarar un poco mas como es la ejecución de este proceso de ejemplo, podemos decir que cuando la ejecución del proceso llega al nodo fork, este se encarga de crear dos sub token (los tokens en general representan programaticamente los caminos de ejecución) los cuales va a propagar por las ramas shipping y billing al mismo tiempo. Estos dos subtoken llegaran a las actividades "send item" y "receive money" y estas dos actividades se podrán ejecutar en cualquier orden.

Cuando alguna de las dos se ejecuten, la rama actual propagara la ejecución a la siguiente tarea en la rama. Cuando alguna rama llegue a la ultima tarea y el token de esa rama se propague hasta el nodo Join, se dice que la ejecución de esa rama queda esperando a que las demas ramas finalicen su ejecución en el nodo Join. Este comportamiento esta especificado en la implementación del nodo Join, es decir, el nodo Join tiene la tarea de esperar a que la ejecución de todas las ramas finalice para poder propagar el token padre que estaba apuntando al nodo Fork correspondiente.

Sobre esto me gustaria que surgieran dudas y preguntas asi podemos dejar un post bien completo con este tema que no es menor y por ahi confunde mucho a los que recien empiezan.

Espero sus comentarios!
