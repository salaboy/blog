---
title: "Jugando con jBPM #11 - Crear Task Dinámicas!"
date: 2008-08-29 23:59:39 +0000
permalink: /2008/08/29/jugando-con-jbpm-12-crear-task-dinamicas/
description: "La idea de este post es mostrar que detalles hay que tener en cuenta a la hora de crear tareas dinámicas, algo muy útil cuando se presenta un caso donde…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "Argentina"
  - "hat"
  - "JBoss"
  - "jBPM"
  - "jPDL"
  - "red"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/08/29/jugando-con-jbpm-12-crear-task-dinamicas/
---

La idea de este post es mostrar que detalles hay que tener en cuenta a la hora de crear tareas dinámicas, algo muy útil cuando se presenta un caso donde no podemos saber de antemano cuantas tareas se deberán instanciar, o cuando esta cantidad de tareas nos la dicta algún variable del proceso. (También tenemos que optar por esta opción cuando necesitamos tener mas de una tarea de la cual tenemos una sola definición)

![Task Process Example](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/taskexample.png)

En este simple proceso, que carece de significado real (debido a que el modelado, raramente debería ser de la manera planteada), pero útil para demostrar la practica, vamos a ver como podemos crear en el nodo **Tomar Curso** una cantidad X de tareas "Tomar Curso" dependiendo de cuantos alumnos atiendan al dictado.

Para realizar esto tendríamos que a la hora de iniciar el proceso, en cualquier paso antes de llegar al nodo **Tomar Curso** asignar una nueva variable en el contexto que indique la cantidad de alumnos que van a asistir al curso. Esto lo hacemos de la siguiente manera.

executionContext.getContextInstance().setVariable("cantStudent", 4);

Donde la cantidad **4**, podría ser calculada mediante la llamada a un servicio de reservas, o algo similar.

Luego a nivel jPDL vemos como seria la definición del Task-Node para que no nos cree la tarea definida dentro de el automáticamente cuando la ejecución del proceso llegue a este nodo:

&lt;task-node name="Tomar Curso" create-tasks="false"&gt; &lt;task name="Tomar Curso" swimlane="student"&gt;&lt;/task&gt; &lt;event type="node-enter"&gt; &lt;action name="Create Dinamic Tasks" class="com.sample.action.CreateDinamicTasksActionHandler"&gt;&lt;/action&gt; &lt;/event&gt; &lt;transition to="end"&gt;&lt;/transition&gt; &lt;/task-node&gt;

Dos cosas importantes tenemos que notar en jPDL:

- create-tasks="false": se encarga de que la tarea (task name="Tomar Curso") no sea instanciada cuando el flujo de ejecución llegue al task-node
- La acción en el evento node-enter: esta acción sera la encargada de crear automáticamente las tareas especificadas dentro del nodo task-node.

Sin duda  el comportamiento  del proceso que definimos sera el siguiente:

- El proceso comienza su ejecución mediante un signal sobre el nodo de arranque
- La ejecución continua hasta el nodo Tomar Curso. Ya que la ejecución no se detiene en el nodo Dictar Curso, porque he decidido que el nodo Dictar Curso solo debe crear la tarea para el instructor y debe dar la posibilidad de que los alumnos puedan ver sus tareas creadas antes de que se termine de dictar el curso. Para esto utilice la siguiente propiedad del nodo task-node: &lt;task-node name="Dictar Curso" signal="unsynchronized"&gt; &lt;task name="Dictar Curso" swimlane="instructor"&gt;&lt;/task&gt; &lt;transition to="Tomar Curso"&gt;&lt;/transition&gt; &lt;/task-node&gt;
- Cuando la ejecución llega al nodo Tomar Curso, este por definición no crea las tareas (TaskInstances) que tiene definidas dentro, sino que delega esta acción al evento que especifico en el evento node-enter. Esta clase delegada contiene lo siguiente: public void execute(ExecutionContext context) throws Exception { TaskMgmtInstance tmi=context.getTaskMgmtInstance(); TaskNode tomarCurso=(TaskNode)context.getNode(); Task tomarCursoTask=tomarCurso.getTask("Tomar Curso"); int cantStudent = Integer.parseInt(context.getContextInstance().getVariable("cantStudent").toString()); for(int i=0; i < cantStudent;i++){ tmi.createTaskInstance(tomarCursoTask, context.getToken()); } }Lo que podemos ver a simple vista es que obtenemos el nodo donde estamos parados, a este le pedimos las tareas (por nombre) que tiene y a esta tareas la instanciamos haciendo uso del método createTaskInstance de la clase TaskMgmtInstance. Como el nodo task-node que contiene a estas tareas no le he cambiado la opción por defecto para hacer signal, va a esperar que se completen las tareas instanciadas dinámicamente (en este caso 4 iguales).
- Cuando las cuatro tareas se finalizan el proceso llega con su ejecución al nodo end.

Espero que haya servido de ayuda para introducir un poco la API de Task MGMT. Cualquier duda comenten!
