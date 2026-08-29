---
title: "Jugando con jBPM #16 - Task Controllers"
date: 2008-12-18 19:27:52 +0000
permalink: /2008/12/18/jugando-con-jbpm-16-task-controllers/
description: "El propósito de este post es mostrar el uso de task controllers, los beneficios que nos presentan y el comportamiento por defecto que podemos obtener al…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
original_url: https://www.salaboy.com/2008/12/18/jugando-con-jbpm-16-task-controllers/
---

El propósito de este post es mostrar el uso de task controllers, los beneficios que nos presentan y el comportamiento por defecto que podemos obtener al utilizarlos.

Para mostrar esta funcionalidad utilizo el siguiente ejemplo muy simple de proceso:

![Proceso Simple - 1 Task Node - 1 Task](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/12/tarea.jpg "tarea")

Donde podemos observar que es un proceso que tiene un solo nodo (aparte del nodo start y end) el cual contiene una tarea definida dentro de el.

La funcionalidad principal de los task controllers es facilitarnos la tarea de la administración de las variables que vamos a utilizar dentro de las tareas que van a realizar personas en nuestro proceso.

Esto quiere decir que tenemos la posibilidad de acotar el espacio de variables que vamos llevando en el proceso a un set mucho mas reducido y especifico de la funcionalidad de una cierta tarea. Y al mismo tiempo copiar el valor, para no modificar la variable del proceso, sino una copia de la misma que puede ser plasmada nuevamente en el proceso cuando la tarea ya este finalizada.

Para hablar un poco mas de la implementación en jBPM, esto que estamos hablando seria realizar una copia de algunas de las variables que se encuentran en ProcessInstance.contextInstance (scope del proceso) a TaskInstance.variables (scope de la tarea).

Mediante esta copia, las tareas pueden realizarse y modificar las variables que estan en su scope, sin molestar a las variables del proceso. También mediante este esquema, se nos permite guardar el estado de estas variables de las tareas mientras se va realizando el trabajo y luego plasmarla cuando la tarea se de por finalizada (que es donde los valores se consideran correctos).

Otra de las utilidades de los task controllers, es la de especificar que variables vera el usuario en el formulario que representara la tarea. Esto quiere decir, que el task controller sirve como puente entre las variables de proceso y el formulario que el usuario vera en la presentación con las variables especificadas en el task controller.

![Task Controllers](http://docs.jboss.com/jbpm/v3.2/userguide/html_single/images/task.controllers.jpg "Task Controllers")

Como ultimo detalle para cerrar el comportamiento básico de los task controllers, hace falta aclarar que a cada una de las variables que pasemos del proceso a la tarea se le pueden especificar distintas políticas a tener en cuenta.

Estas políticas son 3:

- read: realiza una copia de la variable, que puede ser modificada dentro de la tarea, pero cuando se finalice la tarea, no se copiara el nuevo valor a la variable del proceso.
- write: cuando termine la tarea, el valor modificado dentro de la tarea sera plasmado en la variable del proceso
- required: obliga al que realiza la tarea a cargar este dato, sino genera una exception

Para demostrar este funcionamiento cree un ejemplo muy básico que consiste en un test de JUnit dentro de un proyecto jBPM creado con GPD en eclipse.

Este ejemplo consiste en el proceso mostrado al comienzo del post y un test que tiene la siguiente funcionalidad:

- Crea una instancia del proceso
- Agrega 3 variables al contexto del proceso
- En el task controller definido dentro de la tarea del task-node se especifica la copia de dos de esas 3 variables con distintas políticas (variable1: con política read,write y variable2: con política solo de read)
- Se recupera la tarea y se modifican ambas variables
- Se termina la tarea
- Se comprueba que una de las dos variables fue plasmada en el proceso y la otra no

Aca les dejo el link al proyecto para que puedan jugar con el:

<http://rapidshare.com/files/416151266/TaskControllers.rar>

(Por favor comenten si el link esta roto asi lo vuelvo a subir y lo actualizo)

**Notas sobre el ejemplo:**

- Revisar la definición de la tarea y como se define el task controller
- Leer los comentarios en el test: com.sample.SimpleProcessTest
- Debuggear y analizar los objetos dentro del ProcessInstance.contextInstance y taskInstance
- Genere un formulario dinámicamente para que la tarea se vea en la jbpm-console, pueden analizar los archivos forms.xml y tarea 1.xhtml, pero les recomiendo no utilizar estos formularios
- Comentar aqui si no quedo algo claro

Saludos! Espero sus comentarios y sus dudas!
