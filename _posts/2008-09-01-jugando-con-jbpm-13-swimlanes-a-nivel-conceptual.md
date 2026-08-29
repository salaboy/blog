---
title: "Jugando con jBPM #13 - Swimlanes a nivel conceptual"
date: 2008-09-01 16:57:52 +0000
permalink: /2008/09/01/jugando-con-jbpm-13-swimlanes-a-nivel-conceptual/
description: "Es algo sobre lo que se pregunta bastante, ya que es un concepto que esta asociado con el modelado de procesos en general."
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
original_url: https://www.salaboy.com/2008/09/01/jugando-con-jbpm-13-swimlanes-a-nivel-conceptual/
---

Es algo sobre lo que se pregunta bastante, ya que es un concepto que esta asociado con el modelado de procesos en general. Para no confundir, podemos definir a una swimlane como un rol del proceso, para ser mas especificos, podriamos decir que vamos a usar una swimlane cuando en un proceso que estemos modelando necesitemos especificar que un set de tareas deben ser realizadas por la misma persona, ya que esta es la que conoce el contexto de esas tareas para una instancia del proceso en particular.

Por lo tanto el comportamiento que vamos a obtener en jBPM es el siguiente:

- Definimos (modelamos) varias tareas asignadas a una swimlane
- Cuando la primer tarea de la swimlane se instancia, se llama al AssignmentHandler correspondiente y se asigna un actor a la swimlane
- Cuando la segunda tarea de la swimlane se instancie, se recupera el actor ya asignado por el AssignmentHandler y se asigna este a la tarea.
- Así para el resto de las tareas que estén asignadas a la swimlane.

Por lo tanto debemos tener cuidad de no aplicar un assignment handler a las tareas que se encuentran con una swimlane especificada.

**Notas o aclaraciones nuevas:**

Voy a tratar de en un par de puntos aclarar algunos conceptos que puede ayudar:

- En la definicion del proceso definimos task-node y task.
- Las task-nodes contienen 0 o mas task, las cuales se instancian dinámicamente (por defecto) cuando el flujo del proceso llega al task-node que las contiene
- En el momento de instanciación de cada una de las tareas (tasks dentro del task-node) se llama al correspondiente AssignmentHandler que esta definido en cada tarea.
- En un caso normal este AssignmentHandler resuelve a que actor del proceso le corresponde realizar la tarea y asigna al campo ActorId el nombre del actor obtenido. (También esta el caso de pooled actors pero no viene al tema)
- En el caso de que haya varias tareas a lo largo de varios task-nodes asociadas a un swimlane, genera otro comportamiento, que describo a continuación:
  - Cuando el flujo de ejecución del proceso llega al primer task-node que contiene una tarea la cual esta asociada a una swimlane, esta tarea se instancia y se llama al assignment que tenga asociado la swimlane. Este AssignmentHandler tiene la particularidad que solo va a ser invocado por la primer tarea que se instancie y que este asociada con la swimlane. Lo que significa que cuando se instancie la segunda tarea asociada a la swimlane, el actor ya estará resuelto y deberá llamarse al AssignmentHandler correspondiente. Todo esto se logra manteniendo una " instancia"  de la clase SwimlaneInstance con el actor ya resuelto y recordándola (o sea persistiendo la) para que las nuevas tareas no tengan que realizar la logica de asignación nuevamente.

Espero que haya quedado un poco mas claro, prometo subir un ejemplo para discutir mas adelante.

Saludos!
