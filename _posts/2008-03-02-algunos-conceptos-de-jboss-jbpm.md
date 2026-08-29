---
title: "Algunos conceptos de JBoss jBPM"
date: 2008-03-02 22:50:27 +0000
permalink: /2008/03/02/algunos-conceptos-de-jboss-jbpm/
description: "JBoss jBPM fue contruido sobre el concepto de espera. Esto suena extranio ya que por lo general el software que estamos acostumbrados a construir siempre…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "Argentina"
  - "JBoss"
  - "jBPM"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/03/02/algunos-conceptos-de-jboss-jbpm/
---

JBoss jBPM fue contruido sobre el concepto de espera. Esto suena extranio ya que por lo general el software que estamos acostumbrados a construir siempre lleva a cabo tareas que deben ser realizadas lo mas rapido posible, pero en este caso hay una muy buena razon para esperar.

Ya que los procesos de negocio de la vida real atraviezan toda la organizacion, incluyendo a seres humanos y a otros sistemas que interactuan entre si con el correr del tiempo. Esto causa que nuestro proceso de negocio tenga la caracteristica de que no podamos o no querramos hacer una tarea en un momento preciso.

Por lo tanto nuestro software necesita una manera de esperar, hasta que el actor del proceso este listo para hacer su actividad. Una vez que hizo su activadad el software necesita saber cual es la siguiente actividad en la cadena y luego esperar a que el actor de la siguiente actividad haga su trabajo.

La orquestacion de esta secuencia de "esperar, trabajar, esperar, trabajar..." es administrada por el motor de JBoss jBPM.

**jPDL- JBoss jBPM Process Definition Language**

JBoss jBPM se basa en programacion orientada a Graficos. Y estos graficos se representan en lenguaje XML reducido llamado jPDL.

Por lo tanto un proceso definido en **jPDL** esta compuesto por **Nodos**, **Transiciones** y **Acciones**, que describen como una instancia del proceso debe atravezar el grafico dirigido.

Durante la ejecucion del proceso, mientras una instancia se mueve a travez del grafico dirigido, lleva un token que es un puntero a un nodo del grafico donde la instancia esta actualmente esperando.

Mediante una senial se le avisa al token que transicion debe hacer desde el nodo. Las seniales especifican que camino debe tomarse a travez del grafico.

- **Nodos:**Un nodo en jPDL es modelado visualmente como una caja. Cabe destacar en esta seccion que se ha separado la idea de esperar el resultado de una accion de la idea de hacer una accion. Y se cree que el termino "actividad" es un termino borroso que mezcla estas dos ideas, lo cual causa problemas cuando tratamos de implementar la logica detras del sistema de administracion de procesos de negocio.
  Por ejemplo, "Buscar Personas" y "Guardar Personas" cuando modelamos el proceso (en el diagrama de flujos de actividades, luego veremos mas en detalle el proceso para armar este diagrama, que es anterior al modelado en la herramienta visual) se ven los dos como actividades, en jPDL se veran como un "Estado" seguido por una "Accion".
  Un elemento de "Estado" representa el concepto de esperar a que pase una accion, moviendonos en el grafico al siguiente estado.
  Por esto en jPDL "Nodo" es sinonimo de "Estado" y las "Acciones" son pedazos de codigo que pueden ser agregados por el desarrollador para decirle al sistema que realice tareas automatizadas, como por ejemplo, guardar registros en una base de datos.
  Las acciones no se mapean visualmente pero son guardadas en el XML.
  Hay distintos tipos de nodos para lograr distintos objetivos:
  - **Tareas:** un nodo tarea representa una tarea realizada por un ser humano. Por lo tanto el proceso espera a que una persona complete la tarea e ingrese el valor de salida de la misma. Cada tarea se agrega a la lista de tareas de un rol particular en el sistema.
  - **Estados:** un nodo de estado simplemente le dice a la instancia del proceso que espere, en contraste con un nodo tarea, no se crea una tarea para ningun rol. Un nodo estado por lo general va a ser usado para modelar el comportamiento de espera a que un sistema externo provea alguna respuesta.
  - **Forks  y Joins:** con estos nodos podemos modelar caminos concurrentes de ejecucion. Con Forks y Joins representamos actividades corriendo en parelelo. Usamos Fork para dividir el camino de ejecucion y luego Join para volver a unirlo. La instancia del proceso esperara en el join hasta que las tareas ejecutadas paralelamente sean completadas. jBPM crea multiples tokens hijos relacionados al token padre para cada camino de ejecucion.
  - Desiciones: hay 2 tipos distintos de desicion:
    - El caso donde la misma definicion del proceso debe tomar una desicion basada en un dato del que ella dispone.
    - Es una desicion tomada por un ser humano o por un sistema externo y representa una variable de entrada en nuestra definicion del proceso.En el primero caso utilizamos el nodo de desicion, en cambio cuando la salida de la desicion es simplemente una variable de entrada en la definicion del proceso en tiempo de ejecucion debemos representarlo con un estado con multiples transiciones de salida, representando cada una de las desiciones tomadas.
  - **Nodo Custom:** como su nombre lo indica, es un nodo con comportamiento custom diseniado por desarrolladore y definido por el analista de negocio.
- **Transiciones:** Especifican las rutas entre los nodos. Podemos ponerles nombre si se necesita distinguir entre dos rutas en el grafico.

- **Acciones:** Las acciones estan apuntadas a los desarrolladores. Permiten agregar codigo Java al modelo que va a ser ejecutado como eventos disparados en la ejecucion del proceso. (por ejemplo, cuando se entra o se sale de un nodo). Esto significa que podemos incluir logica sin representarla visualmente.

- **Calles (Swimlanes):** Representan roles del proceso, y son usadas para asignar tareas a roles especificos. Estos pueden ser un actor o un pool de actores. En contraste con el diagrama de flujo de actividades, aca no se mapean visualmente, pero son agregados a los detalles tecnicos detras del mapa visual.

- **Variables de proceso:** Son la informacion contextual que se crea con cada instancia de un proceso. No se modelan visualment, pero nos pueden servir para identifica en que instancia de un proceso debemos efectuar una tarea.

Espero que se entiendan los concepto. En posts futuros estare agregando algunos ejemplos de modelado, como instalar la suite para el desarrollo visual de estos modelos y algunos conceptos y configuraciones mas avanzadas sobre este tema. Tambien seria interesante explicar brevemente el proceso que se plantea para seguir un proyecto de jBPM.
