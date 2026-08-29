---
title: "Jugando con jBPM #3 - Proceso Ejemplo + Algunos Conceptos"
date: 2008-08-21 17:50:24 +0000
permalink: /2008/08/21/jugando-con-jbpm-4-proceso-ejemplo-algunos-conceptos/
description: "La idea de este post es presentar un ejemplo de proceso de negocio que nos clarifique la idea del modelado y de las situaciones que comunmente se modelan…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "Argentina"
  - "example"
  - "JBoss"
  - "jBPM"
  - "jPDL"
original_url: https://www.salaboy.com/2008/08/21/jugando-con-jbpm-4-proceso-ejemplo-algunos-conceptos/
---

La idea de este post es presentar un ejemplo de proceso de negocio que nos clarifique la idea del modelado y de las situaciones que comunmente se modelan con jBPM. Para esto se presenta el siguiente proceso de negocio simplificado para el cual se tratara de explicar el comportamiento y la lógica relacionada con cada uno de sus nodos.

**Extracción ATM**: (traducido seria, retirar dinero de un cajero automático)

![Extracción ATM](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/extraccionatm.jpg)

Como vemos en la imagen, en el proceso se describen varios nodos, de distintos tipos que nos permiten especificar un comportamiento particular para cada uno de ellos.

La primer gran diferencia, debido a la cantidad de nodos de tipo tarea y nodos de tipo node, es entre las actividades (o tareas) que son realizadas por personas, y las actividades que realizan sistemas automaticos o procedimientos programados (programas, software, etc).

Por lo tanto es fundamental identificar que actividades las realizan personas y que actividades las realizan sistemas. En este caso de dominio es bastante fácil identificar esta división, pero hay casos donde los dominios son complejos y el lenguaje de dominio también, donde un analista o el encargado de modelado puede llegar a confundirse. En estos casos, es importantísimo profundizar el relevamiento y obtener estos datos, para poder modelar correctamente el proceso.

Esta diferencia entre Tareas y Nodos es importante a nivel jBPM debido a que su comportamiento interno es muy distinto, y por lo tanto nuestro proceso a nivel global se comportara distinto si modelamos un nodo como Tarea o como Nodo (de tipo Node).

Para poder demarcar bien las diferencias de comportamiento veamos las siguientes definiciones simplificadas:

**Nodos de Tipo Tarea**: van a representar a un actor (persona, ser humano) interactuando con el proceso. Al tratarse de una persona y su interacción con el proceso, fácilmente salta a la vista que el comportamiento del nodo va a ser diferente debido a que una persona no se comporta como una llamada a un método (WebService, función, etc). Sino que el comportamiento y la interacción de la persona con el proceso se caracteriza por ser mucho mas asíncrona. Esto quiere decir, que el "proceso" deberá quedarse esperando (estado conocido como wait state) a que el actor interactúe con el proceso hasta el momento en que el mismo o algún procedimiento que el active cierre (termine formalmente) la tarea.

**Nodos de Tipo Nodo**: son los nodos mas genéricos, que nos permiten especificar cualquier tipo de lógica y comportamiento dentro de ellos. Nosotros podríamos crear dentro de estos nodos lógica asíncrona o síncrona, pero lo mas normal es que estos nodos sean utilizados para interactuar con lógica de carácter síncrono, como seria la ejecución de un método o la llamada a un Web Service.

Estos dos tipos de nodos, al ser tan distintos utilizan distintas "porciones" de las API que nos provee jBPM. El **nodo tipo Tarea** hace uso de una sección particular de las API que esta totalmente dedicada a la interacción y administración de todo lo relacionado con las tareas humanas. Muy probablemente escriba un post sobre esto en los siguientes días.

Por el lado del nodo del tipo Nodo, tenemos que tener en cuenta que nos deja especificarle una acción (action handler) que contiene código Java a ejecutar. Dentro de este Action Handler podemos hacer cualquier tipo de llamada a cualquier sistema externo, lo que causara que el proceso se mantenga en el nodo mientras este "código" se ejecuta.

Con respecto al **nodo Tipo Decisión** no creo que haga falta aclarar mucho, solamente que hay que recordar que esta decisión se puede tomar automáticamente mediante el uso de un Decisión Handler (codigo Java) o a partir de expresiones que evaluen los datos particulares del proceso y en base a eso se decida por donde continuar la ejecucion.

Entonces para ejemplificar un poco vamos a ver el proceso que veiamos en la imagen anterior.

Veamos particularmente el primer nodo (luego del nodo start - al cual le dedicare otro post), el nodo "Ingresar Tarjeta", este nodo es de tipo Task (tarea) ya que es una actividad que va a realizar una persona cuando se encuentre frente al cajero. Cuando pasara esto? no sabemos. Lo que si sabemos es que en algún momento esto va a ocurrir y por eso el "motor" de procesos se encargo de crear una tarea, que tiene que ser llevada a cabo para que el proceso pueda continuar. Simplemente la lógica de esta tarea seria mostrarle una pantalla al usuario de que debe ingresar la tarjeta en la ranura correspondiente y cuando el usuario ingrese la tarjeta y el lector de la tarjeta recupere el numero y los datos correspondientes de la misma, la tarea finalice y continúe el flujo de ejecución del proceso al siguiente nodo.

En el siguiente nodo, llamado "Reconocer Tarjeta", es de tipo Node y acá deberíamos tener escrito en Java (dentro de un Action Handler) la lógica para ir a una fuente de datos y recuperar todos los datos asociados a esa tarjeta. Esto seria ir a una base de datos directamente y buscar los datos del duenio de la tarjeta mediante el numero recuperado en la tarea anterior, o consumir un Web Service externo al proceso que realice esta funcionalidad.

Espero haber sido claro y haber dejado un poco marcada la diferencia entre estos dos grandes tipos de nodos. Estaría bueno que si alguien tiene alguna duda sobre algun otro nodo, o sobre que logica deberia llevar asociada algun nodo e particular, lo comente y discutamos sobre eso.

Saludos y espero que sirva de algo...
