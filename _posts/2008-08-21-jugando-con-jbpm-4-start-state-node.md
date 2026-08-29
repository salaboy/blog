---
title: "Jugando con jBPM #4 - start-state Node"
date: 2008-08-21 18:47:24 +0000
permalink: /2008/08/21/jugando-con-jbpm-4-start-state-node/
description: "La idea de este post y los siguientes a ser repasar brevemente la funcionalidad de los distintos tipos de nodos, tanto en su funcionalidad como en su…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "Argentina"
  - "JBoss"
  - "jBPM"
  - "jPDL"
original_url: https://www.salaboy.com/2008/08/21/jugando-con-jbpm-4-start-state-node/
---

La idea de este post y los siguientes a ser repasar brevemente la funcionalidad de los distintos tipos de nodos, tanto en su funcionalidad como en su sintaxis XML, con la idea de poseer una fuente de conocimiento sobre cada tipo de nodo. Este post especialmente esta dedicado al nodo de tipo &lt;start-state&gt; como indica el titulo.

**&lt;start-state&gt;**

Este nodo se caracteriza por ser el nodo inicial de nuestros procesos. Al ser el primer nodo tiene algunas características especiales para cumplir cumplir con su funcionalidad.

Las características mas obvias, pero que no hay que dejar de lado y siempre tener en cuenta son:

- No posee transiciones que llegan a el
- Solo puede haber un solo &lt;start-state&gt; por proceso

Con respecto a la primer característica podemos ver la implementación exacta de la clase StartState.java que extiende su funcionalidad de la clase Node (como absolutamente todos los nodos) y sobre escribe los siguientes dos métodos para cumplir esta funcionalidad: public Transition addArrivingTransition(Transition t) { throw new UnsupportedOperationException( "illegal operation : its not possible to add a transition that is arriving in a start state" ); }

public void setArrivingTransitions(Map arrivingTransitions) { if ( (arrivingTransitions!=null) && (arrivingTransitions.size()>0)) { throw new UnsupportedOperationException( "illegal operation : its not possible to set a non-empty map in the arriving transitions of a start state" ); } }

Otra característica que sale a la luz cuando vemos la implementación de la clase StartState, es que esta clase sobre escribe el método execute que contiene la logica a realizar por el nodo de la siguiente manera:public void execute(ExecutionContext executionContext) {}

En otras palabras el nodo start-state no se ejecuta. Solo sirve para indicar que el proceso acaba de ser creado y todavía no comienza su ejecución. Esto quiere decir que cuando con la API nosotros creamos un nuevo Objeto ProcessInstance, se crea un RootToken que apunta al start-state del proceso.

A nivel jPDL podemos ver una definición simple de un nodo &lt;start-state&gt;

&lt;start-state name="start"&gt; &lt;transition to="next node"&gt;&lt;/transition&gt; &lt;/start-state&gt;

o también una mas compleja que incluye la definición de una tarea dentro del nodo &lt;start-state&gt;

&lt;start-state name="start"&gt; &lt;task name="Start Task" priority="high"&gt; &lt;assignment actor-id="salaboy"&gt;&lt;/assignment&gt; &lt;controller&gt; &lt;variable access="read,write" name="variable1" mapped-name="variable1"&gt;&lt;/variable&gt; &lt;/controller&gt; &lt;/task&gt; &lt;transition to="next node"&gt;&lt;/transition&gt; &lt;/start-state&gt;

Con respecto a la tarea, ya voy a describir un poco mas en un post dedicado solo a eso. Pero lo importante aca, es el significado que puede tener esta tarea dentro del proceso. Por lo general se suele poner una tarea en el &lt;start-state&gt; con el fin de poder capturar quien fue el actor que inicio el proceso. Tambien probablemente lo mejor seria que posteara un ejemplo de implementacion de esto mas adelante.

Como ultimo detalle y no menor, esta bueno tener bien en claro que eventos soporta este nodo tan particular. Ya que el nodo &lt;start-state&gt; no tiene transiciones que llegan a el, los eventos como por ejemplo, node-enter en este caso no estan soportados. Por esto viendo en la implementacion, vemos que los unicos soportados son los siguientes:

public static final String[] supportedEventTypes = new String[]{ Event.EVENTTYPE_NODE_LEAVE, Event.EVENTTYPE_AFTER_SIGNAL };

Espero que se entienda y si alguien tiene algun comentario para agregar, bienvenido sea.
