---
title: "Jugando con jBPM #1- Ejemplo básico"
date: 2008-06-06 22:33:34 +0000
permalink: /2008/06/06/jugando-con-jbpm-1/
description: "<post> Hacia rato que no escribia nada por aca.. pero bueno.. aprovecho ahora para mostrar algunos ejemplos que tengo en mente con jBPM."
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "api"
  - "Argentina"
  - "JBoss"
  - "jBPM"
  - "jPDL"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/06/06/jugando-con-jbpm-1/
---

&lt;post&gt;

Hacia rato que no escribia nada por aca.. pero bueno.. aprovecho ahora para mostrar algunos ejemplos que tengo en mente con jBPM. La idea es mostrar procesos simples y a la vez ir viendo un poco las APIs de jBPM y los Handlers mas comunes..y otras cosas que vayan surgiendo...

En este ejemplo vamos a ver un proceso inventado por mi llamado Mails, que tiene como finalidad representar el proceso que muchos realizamos en el dia a dia de revisar nuestros e-mails.

La siguiente imagen representa el proceso modelado con GPD (Graphic Process Designer):

![Mails Process](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/06/mails.jpg)

Como podemos ver el proceso se explica por si solo, esta es una de las ventajas de utilizar un lenguaje Orientado a Grafos como jPDL.

A continuación vamos a ver algunos snippets de código en jPDL generados por la herramienta GPD. La idea es resaltar y empezar a ver un poco de como esta conformado jPDL y como lo vinculamos con comportamientos (o detalles técnicos) para que el proceso pueda ejecutarse en un entorno de ejecución.

Vamos a empezar con la definición clásica de todo proceso en jPDL:

&lt;process-definition xmlns="urn:jbpm.org:jpdl-3.2"  name="Mails"&gt; &lt;start-state name="Inicio"&gt; &lt;transition to="Login"&gt;&lt;/transition&gt; &lt;/start-state&gt; ...

Como podemos ver, nada raro.. solo se explicita que versión de jPDL que estamos usando, el nombre del proceso  y luego ya podemos empezar a describir los nodos que compondrán el proceso.

También vemos el nodo llamado **Inicio** del tipo **start-state** que nos indica por donde va a comenzar la ejecución del proceso cuando tengamos una ejecución/token/execution path del mismo. Como se puede observar el nodo start-state tiene solo una transición a un nodo llamado **Login**.

A continuación vemos el nodo llamado **Login** que es de tipo **task-node**, estos tipos de nodo tiene la características de contener una lista de nodos **task** que son los que realmente definen las tareas humanas que se van a crear para el o los usuarios asignados.

&lt;task-node name="Login"&gt; &lt;task name="Ingresar Datos"&gt; &lt;description&gt; El usuario Ingresa los datos Nombre de Usuario y Contraseña &lt;/description&gt; &lt;assignment expression="group(user)"&gt;&lt;/assignment&gt; &lt;controller&gt; &lt;variable access="read,write" name="username" mapped-name="username"&gt;&lt;/variable&gt; &lt;variable access="read,write" name="password" mapped-name="password"&gt;&lt;/variable&gt; &lt;/controller&gt; &lt;/task&gt; &lt;transition to="Autentificacion"&gt;&lt;/transition&gt; &lt;/task-node&gt;

Como podemos ver dentro de este **task-node** tenemos sola una tarea definida (tag **task**) llamada **Ingresar Datos**. Las cosas a destacar de esta tarea son:

- La asignación de un grupo de usuarios mediante una expresión, lo que quiere decir que todos los usuarios que estén dentro del grupo user podrán realizar esta tarea (en post siguientes entrare en detalle de este tema)
- La descripción es solo a nivel informativa
- Definimos variables que deberán ser llenadas en esta tarea (en este caso, username y password, también me explayare en este tema en post siguientes)

Siguiendo un poco con el proceso vemos un nodo de tipo **node**, el cual define una acción que delega el comportamiento en el la clase AutentificacionActionHandler.

&lt;node name="Autentificacion"&gt; &lt;action name="Autentificacion" class="com.sample.action.AutentificacionActionHandler"&gt;&lt;/action&gt; &lt;transition to="Autentificacion ok?"&gt;&lt;/transition&gt; &lt;/node&gt;

Esta clase AutentificacionActionHandler implementa la interfaz llamada ActionHandler que define y nos obliga a implementar el método execute:

import org.jbpm.graph.def.ActionHandler; import org.jbpm.graph.exe.ExecutionContext;

public class AutentificacionActionHandler implements ActionHandler {

public void execute(ExecutionContext context) throws Exception { // Llamada al método de autentificacion obteniendo los datos // que ingreso el usuario en el formulario a partir de las // variables del contexto String username=(String)context.getVariable("username"); String password=(String)context.getVariable("password"); boolean loggedIn=login(username,password); context.setVariable("loggedin",loggedIn); }

}

Esta podría ser una implementación correcta de esta accion, la cual utiliza un método **login** para revisar si el usuario se autentifica correctamente con el sistema o no. Y este resultado se guarda en una variable de contexto llamada **loggedin**. Como vamos a ver ahora esta variable se utiliza en el siguiente nodo para decidir que transición tomar:

&lt;decision name="Autentificacion ok?" expression="#{loggedin==true}"&gt; &lt;transition to="Cargar Mails Bandeja de Entrada" name="Si"&gt;&lt;/transition&gt; &lt;transition to="Login" name="No"&gt;&lt;/transition&gt; &lt;/decision&gt;

Acá solo tenemos que destacar que este nodo **decision** que la expresión que decide por que transición seguir se analiza en runtime para cada instancia del proceso. Esto significa que dependiendo del valor de la variable loggedin en la instancia del proceso (sacada del contexto del mismo) es porque transición seguirá la ejecución.

Espero que se haya entendido mas o menos el ejemplo, ya de a poco iré ganando un poco de habilidades de redacción y tratare de mejorar mi ortografia, pero la idea del post era empezar a ver un poco de jPDL, gráficamente y su sintaxis XML, seguido un poco de los **actions handlers**. En próximos post veremos temas como:

- Ejecución del proceso
- Fork Nodes
- Process State y Super State
- Decision Handlers
- Exceptions

Hasta la próxima.. dejen comentarios o criticas a gusto y placer!

&lt;/post&gt;
