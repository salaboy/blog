---
title: "Jugando con jBPM #5 - Node"
date: 2008-08-21 20:32:36 +0000
permalink: /2008/08/21/jugando-con-jbpm-5-node/
description: "En este post vamos a analizar el Nodo tipo Node, que es el mas genérico de los nodos en jPDL. Vamos a analizar el código de la clase node para encontrar…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "JBoss"
  - "jBPM"
  - "jPDL"
original_url: https://www.salaboy.com/2008/08/21/jugando-con-jbpm-5-node/
---

En este post vamos a analizar el Nodo tipo Node, que es el mas genérico de los nodos en jPDL. Vamos a analizar el código de la clase node para encontrar las características mas importantes, con el fin de empezar a conocer el comportamiento del mismo y el comportamiento base para todos los demas tipos de nodos ya que todos extienden de el.

Vamos a empezar por lo primero. La definicion de la clase Node

public class Node extends GraphElement implements Parsable

Esto es importante ya que todas las subclases de Node estaran regidas por esta herencia. Si vemos la interfaz Parsable propone lo siguiente:

public interface Parsable { void read(Element element, JpdlXmlReader jpdlReader); void write(Element element); }

Como podemos ver se definen dos metodos que Node va a tener que implementar read y write, estos metodos seran los encargados de saber leer jPDL y escribir jPDL en caso de ser necesario. Esto sirve para que el framework pueda leer jPDL(que es un xml) y pueda levantarlo a objetos y por otro lado que nosotros podamos dibujar con GPD (Graphic Process Designer) y de objetos pueda escribir el jPDL correspondiente

Y la clase de la cual extiende Node llamada GraphElement es la encargada de definir en si el comportamiento de los nodos en cuanto a Eventos, Excepciones, todos los metodos para poder navegar en la jerarquia de GraphElement (y asi obtener sus hijos y sus padres), y ultimo pero no menos importante nos da la implementacion del metodo executeAction, que es el metodo que se encarga de ejecutar la siguiente linea:

action.execute(executionContext);

Continuamos viendo la estructura principal de su metodo execute:

public void execute(ExecutionContext executionContext) { if (action!=null) { try { executeAction(action, executionContext); } catch ... } else { leave(executionContext); } }

Como podemos ver, esta implementación base de el método execute nos lleva a la conclusión de que los nodos de tipos Node, no se comportan como wait states y continúan el flujo de ejecución si no especificamos ninguna acción dentro de la definición del nodo. En caso de que especifiquemos una acción, esta pasa a ser la responsable de continuar con la ejecucion del flujo del proceso. Por esta razón en la acción debemos decidir si el comportamiento de la acción es síncrono, el ActionHandler va a tener que llamar al metodo context.leaveNode() para continuar la ejecución del proceso. En el caso de que tengamos un comportamiento asíncrono, el ActionHandler ejecutara la lógica asignada y se quedara en un wait state esperando que alguien externo continué la ejecución del proceso.

Como veiamos en el metodo execute, si hemos asignado una accion, cuando se ejecute el metodo execute esta accion se ejecutara por consecuencia. Esta accion es de tipo Action, la cual implementa ActionHandler. Por lo tanto la clase delegada que nosotros tenemos que implementar y especificar explicitamente en jPDL debe implementar la interfaz ActionHandler.

Un ejemplo de jPDL del nodo tipo Node:

&lt;node name="Node"&gt; &lt;action name="Node Action " class="com.wordpress.salaboy.handlers.NodeActionHandler.java"&gt;&lt;/action&gt; &lt;transition to="next node"&gt;&lt;/transition&gt; &lt;/node&gt;

Espero que esto haya servido como pantallaso del nodo Node, seguramente seguire agregando informacion sobre este nodo a medida que vaya considerando necesario.
