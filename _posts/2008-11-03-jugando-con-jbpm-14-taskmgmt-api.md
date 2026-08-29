---
title: "Jugando con jBPM #14 - TaskMGMT API"
date: 2008-11-03 15:18:38 +0000
permalink: /2008/11/03/jugando-con-jbpm-14-taskmgmt-api/
description: "En este post vamos a ver un poco de la API para la administración de tareas en jBPM, la cual es muy útil a la hora consultar las tareas que se van creando…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "hat"
  - "JBoss"
  - "jBPM"
  - "jbug"
  - "red"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/11/03/jugando-con-jbpm-14-taskmgmt-api/
---

En este post vamos a ver un poco de la API para la administración de tareas en jBPM, la cual es muy útil a la hora consultar las tareas que se van creando a medida que nuestra ejecución del proceso va pasando por los diferentes Task Nodes que tengamos definidos.

En este caso, y para este ejemplo, cree el siguiente proceso básicamente compuesto por Task Nodes:

![Proceso Ejemplo](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/11/process2.jpg "process2")

Como vemos en la imagen, una vez que el proceso comience se creara una tarea contenida dentro del task node "Elegir Tarea del Dia". Como por defecto las tareas que van a ser realizadas por personas se comportan como Wait States (Estados de espera), nos bloquean la ejecución del proceso. Por lo tanto el comportamiento del proceso sera el siguiente:

Se comienza la ejecución del mismo desde el nodo Start (mediante la llamada al método signal)

La ejecución del proceso llega hasta el task node llamado "Elegir Tarea del Dia", crea las instancias de las tareas que estan especificadas dentro del task node (crea objetos TaskInstance).

Se persisten los cambios y las instancias de las tareas que se crearon en el schema de jBPM, para esperar la interacción del usuario.

Cuando el usuario quiere interactuar con la tarea que fue creada para el debe ir a buscar en su lista de tareas, donde encontrara todas las TaskInstances que fueron creadas por procesos para el.

Una vez que encontramos la tarea que queremos comenzar en la lista de tareas, deberíamos seleccionarla, completar los datos y luego finalizarla para que el proceso continúe su ejecución.

En esta caso, para el ejemplo decidi que la tarea dentro del task node "Elegir Tarea del Dia", tuviera como requerida una variable que se llama "tarea" que le va a indicar al proceso porque rama continuar su ejecucion usando el valor de esta variable para decidir en el nodo decisión.

Vamos a ver un poco el código asi se van aclarando las cosas, para esto les cuento un poco el contexto donde estoy ejecutando el siguiente bloque de código:

```java
context=conf.createJbpmContext();
// Obtenemos a partir del contexto una sesion del administrador de tareas, esta nos dara acceso a todas las tareas
// creadas en todos los procesos y asignadas al usuario salaboy.
// Tambien podriamos haber utilizado la instancia del proceso para acceder a una API mas enfocada a la instancia
// del proceso.
List<TaskInstance> tasksForSalaboy=context.getTaskMgmtSession().findTaskInstances("salaboy");
// Itereamos sobre la lista de tareas para el usuario Salaboy
// de esta manera deberiamos armar la UI
for(TaskInstance ti : tasksForSalaboy){
System.out.println("TaskInstance ID: "+ti.getId()+" - Name: "+ti.getName()+ " - Creada: " +ti.getCreate());
}
if(tasksForSalaboy.size() > 0){
TaskInstance elegirTarea=tasksForSalaboy.get(0);
System.out.println("Encontre una tarea = "+elegirTarea.getName());
// Deberiamos comprobar que es la tarea de elegir tarea
// Lo podemos hacer revisando el nombre de la tarea con elegirTarea.getName()
elegirTarea.start();
//Comprobamos que no tenga seteada nada la variable
assertNull(elegirTarea.getVariable("tarea"));
System.out.println("la variable TAREA tiene el valor = "+elegirTarea.getVariable("tarea"));
// Le asignamos el valor lavar a la variable tarea, cocinar nunca antes morir!
elegirTarea.setVariable("tarea", "lavar");
System.out.println("la variable TAREA tiene el valor = "+elegirTarea.getVariable("tarea"));
assertEquals("lavar",elegirTarea.getVariable("tarea"));
//Terminamos la tarea
elegirTarea.end();
}
context.close();
```

Hay que tener en cuenta que para ejecutar este bloque de código tenemos que tener una instancia de JbpmConfiguration (la variable conf) que debe estar correctamente configurada para comunicarse con nuestra fuente de datos que contiene el schema de jBPM (esta configuración se realiza en el archivo hibernate.cfg.xml).

Creo que el codigo se explica por si solo y los comentarios ayudan en caso de que no se entienda alguna linea en particular. Como se que si no ven el proyecto entero se complica terminar de entender el ejemplo, subi el proyecto entero (pesa 45k) a rapidshare para que pueda verlo. Aca les dejo el link:

(Actualizado)

<http://rapidshare.com/files/416067568/jBPMTaskMGMTExample.zip>

Algunas Notas sobre el Ejemplo:

Uso postgreSQL como base de datos, por lo tanto necesitaran el driver JDBC de postgreSQL (el cual pueden descargar de aca: <http://jdbc.postgresql.org/download.html>, revisar bien la version que necesiten)

En este ejemplo la configuración realizada en hibernate.cfg.xml es para un cliente standalone y no para el framework deployado en un Servidor de Aplicaciones como JBoss. En el caso de estar dentro de una aplicación que esta corriendo sobre JBoss habría que configurar un DataSource y no la conexión directa por JDBC.

El ejemplo esta creado con eclipse y el plug in de jBPM, no es como acostumbro a trabajar pero para las personas que estan comenzando me parece un buen punto de partida. (Ver post anteriores para ver como configurar el plug in de jBPM en eclipse/ También llamado designer )

Toda la funcionalidad del proyecto se encuentra en una clase que utiliza JUnit para realizar las pruebas de funcionalidad. Buscar en la sección de Tests (scr/test/java/com/sample/SimpleProcessTest.java). Estas pruebas no estan muy prolijas por cuestiones de tiempo.

Si el link de rapidshare se cae, por favor avisar asi lo vuelvo a subir.

Les dejo el link de la documentacion oficial donde se habla bastante sobre las tareas:

<http://docs.jboss.org/jbpm/v3/userguide/taskmanagement.html>

Es importantísima!!!!!!! la sección que se llama: "11.2.2. Task instances and graph execution"

Saludos, espero que sirva de ayuda para entender el uso muy basico de la API, en un post futuro prometo escribir un post sobre la API mas en profundidad.

Cualquier duda sobre la documentacion oficial o sobre este post, no duden en comentar!!!
