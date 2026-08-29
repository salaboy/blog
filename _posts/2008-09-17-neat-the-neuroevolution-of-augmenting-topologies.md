---
title: "NEAT (The NeuroEvolution of Augmenting Topologies) - Introducción"
date: 2008-09-17 19:22:52 +0000
permalink: /2008/09/17/neat-the-neuroevolution-of-augmenting-topologies/
description: "Introducción NeuroEvolución (NE), es la forma de evolucionar redes neuronales usando algoritmos genéticos, esto ha demostrado ser muy eficiente en el…"
tags:
  - "JBoss Drools"
  - "red"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/09/17/neat-the-neuroevolution-of-augmenting-topologies/
---

**Introducción**

NeuroEvolución (NE), es la forma de evolucionar redes neuronales usando algoritmos genéticos, esto ha  demostrado ser muy eficiente en el refuerzo de tareas de aprendizaje.

NE busca en el espacio de los comportamientos de una red que funciona bien para una tarea en particular.

Por lo general, la topología de la red esta compuesta de una sola capa oculta de neuronas, donde cada neurona de esta capa tiene conectada cada una de las entradas y cada una de las salidas.

NE busca en el espacio de los pesos de las conexiones de toda la red permitiendo así que las redes altamente performantes se reproduzcan. Esto se logra con el apareamiento (crossover) de los vectores de pesos de las conexiones de toda la red, sumándole a este  apareamiento una mutación arbitraria.

De esta manera funcionan los NE de topología fija, ya que optimizan los pesos de las conexiones que determinan la funcionalidad de la red.

A pesar de esto, los pesos de las conexiones no son el unico aspecto de las redes neuronales que contribuyen en su comportamiento. La topologia, o estructura, de una red neuronal tambien afecta a su funcionalidad.

La modificacion de la estructura de la red ha demostrado ser eficiente como parte del entrenamiento supervisados.

La pregunta que se nos plantea es:

La evolución de la topologías y los pesos de las conexiones nos van a dar alguna ventaja sobre las topologías fijas?

Si una función continua puede ser aproximada por una Red, para que vamos a esforzarnos permutando diferentes topologías?

Las respuesta hasta ahora a estas preguntas son bastantes inconclusas.

NEAT fue diseniado para tomar ventaja de la estructura como forma de minimizar la dimensionalidad de la búsqueda sobre el espacio de conexiones. Si la estructura esta evolucionada, esta topología esta minimizada y crece incrementalmente, lo cual resulta en ganancias en la velocidad de aprendizaje de la red.

Esta evolución y ganancia se va notando a lo largo del proceso de evolución y no solamente al final de todo el ciclo evolutivo.

Evolucionar una estructura incrementalmente presenta varios desafíos técnicos:

1. Hay alguna representación genética que permita que distintas topologías se apareen (crossover) de manera que el resultado signifique algo?
2. Como podemos proteger a las innovaciones de la topología (que necesitan algunas generaciones para ser óptimas) para que no desaparezcan de la población prematuramente?
3. Como las topologías pueden ser minimizadas durante la evolución sin la necesidad de una función de "encaje" (fitness) que mida la complejidad de la misma?

NEAT se encarga de responder estas preguntas y dar una solución elegante, la cual iremos viendo en los siguientes posts.

Fuente: <http://www.cs.ucf.edu/~kstanley/neat.html#papers>
