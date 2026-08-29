---
title: "RETE + NEAT = REAT??"
date: 2008-09-17 15:36:15 +0000
permalink: /2008/09/17/rete-neat-reat/
description: "En Este post bastante descolgado de los temas que actualmente toco en este blog, me va a servir como centro de investigación sobre la mezcla de estos…"
tags:
  - "Java"
  - "JBoss Drools"
  - "Drools"
  - "red"
original_url: https://www.salaboy.com/2008/09/17/rete-neat-reat/
---

En Este post bastante descolgado de los temas que actualmente toco en este blog, me va a servir como centro de investigación sobre la mezcla de estos temas con el fin de ver si pueden convivir y lograr algún resultado interesante.

Para empezar voy a tratar de describir cada uno de los temas muy por arriba y luego tratare de empezar a relacionarlos y profundizar en cada uno de ellos y en sus vínculos.

Empecemos por **RETE**:

RETE (red en latín) es un algoritmo muy utilizado en sistemas de reglas de producción ya que su funcionalidad principal es la de encontrar coincidencias entre patrones de manera muy eficiente. En estos sistemas por lo general necesitamos realizar comparaciones entre hechos y reglas de negocio con el fin de realizar inferencias sobre los mismos. Esto debe hacerse de una manera eficiente para que el sistema sea escalable y performante.

Por supuesto aparece el termino regla de producción que hace referencia a una regla compuesta por condición y acción. Donde en la condición especificamos un set de restricciones que van a condicionar la ejecución de la acción.

RETE funciona armando una red de nodos, donde cada uno de estos nodos se corresponde con una condición en la LHS (Left hand side / representa las restricciones en la parte condicional de una regla de producción), por lo tanto un camino desde el nodo raíz hasta un nodo hoja representaría toda una regla de producción.

Mas adelante, tratare de aclarar los distintos tipos de nodos que utiliza una red RETE, ya que esto ayudara bastante a comprender como funciona el algoritmo.

Seguimos con **NEAT**:

NEAT (NeuroEvolution of Augmenting Topologies / NeuroEvolución para el crecimiento de las topologías) se caracteriza por ser una técnica de NeuroEvolución, es decir, una técnica que utiliza algoritmos genéticos para evolucionar redes neuronales.

NEAT en particular se caracteriza por codificar de alguna manera la topología de la red neuronal y hacerla evolucionar generación tras generación, logrando así optimizar su funcionamiento.

Por lo general los algoritmos de NeuroEvolución se separan en dos ramas:

- Aquellos que se encargan de evolucionar los pesos en las conexiones en una red neuronal.
- Aquellos que se encargan de evolucionar tanto la topología de la red como los pesos en las conexiones de una red neuronal.

En este caso NEAT opta por la segunda opción, por lo cual vamos a ver como cuando aplicamos NEAT los pesos de las conexiones dentro de la red van evolucionando y a su vez se crean nuevos nodos y nuevas conexiones dentro de nuestra red como parte de esta evolución.

Como podran notar tanto RETE, como NEAT son temas bastantes complejos que incluyen mucho otros temas que hay que investigar para poder dominarlos y utilizarlos en la vida cotidiana. Para esto voy a listar los temas a investigar y las fuentes que pienso utilizar en dicha investigación:

**RETE:**

- Algoritmo, funcionamiento, características principales, lugares comunes de uso, extensiones de RETE.
  - [http://herzberg.ca.sandia.gov/docs/52/rete.html](http://herzberg.ca.sandia.gov/docs/52/rete.html "RETE en JESS")
  - [http://en.wikipedia.org/wiki/Rete_algorithm](http://en.wikipedia.org/wiki/Rete_algorithm "RETE en general")
  - [http://legacy.drools.codehaus.org/Rete](http://legacy.drools.codehaus.org/Rete "Rete en Drools")
  - [http://www.jbug.jp/trans/jboss-rules3.0.2/ja/html/ch01s04.html](http://www.jbug.jp/trans/jboss-rules3.0.2/ja/html/ch01s04.html "Rete en Drools")

**NEAT**:

- Algoritmo, funcionamiento, soporte teórico, pruebas y teorías
  - [http://www.cs.ucf.edu/~kstanley/](http://www.cs.ucf.edu/%7Ekstanley/)
  - [http://nn.cs.utexas.edu/pub-view.php?PubID=97100](http://nn.cs.utexas.edu/pub-view.php?PubID=97100 "NEAT paper")
  - [http://www.cs.ucf.edu/~kstanley/neat.html#papers](http://www.cs.ucf.edu/%7Ekstanley/neat.html#papers)
  - <http://tech.groups.yahoo.com/group/neat/>
- Algoritmos geneticos + Redes neuronales + Programacion evolutiva
  - <http://www.amazon.co.uk/AI-Techniques-Game-Programming-Development/dp/193184108X>

**NEAT + RETE = REAT:**

- Meta final de la investigación: <http://www.evolvablerules.org/> (Greg Barton)

Como podemos ver en <http://www.evolvablerules.org/> Greg Barton propone adaptar NEAT a RETE, lo cual causaría que la topología de la red RETE evolucione tanto como las reglas de producción que se definan.

Para lograr esto, sin duda alguna, hay que analizar muy bien NEAT y la topología especifica de RETE, así tanto como la codificación de los genes para los distintos tipos de nodos en RETE.

Esto no suena tarea facil para nada, por lo cual como primeros pasos voy a empezar enfocandome en NEAT y ver como se comporta con implementaciones reales, al menos simples.
