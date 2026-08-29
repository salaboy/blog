---
title: "Usuarios de Drools #2 – Si conozco Drools 4.x o algun motor de inferencia"
date: 2009-07-16 15:27:12 +0000
permalink: /2009/07/16/usuarios-de-drools-2--e2-80-93-si-conozco-drools-4-x-o-algun-motor-de-inferencia/
description: "Estando frente al segundo grupo/nube discutida en el primer post de la serie, se nota que este grupo/nube se caracteriza por tener una experiencia y un…"
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Argentina"
  - "Drools"
  - "events"
  - "expert"
  - "knowledge"
  - "Salaboy"
original_url: https://www.salaboy.com/2009/07/16/usuarios-de-drools-2--e2-80-93-si-conozco-drools-4-x-o-algun-motor-de-inferencia/
---

Estando frente al segundo grupo/nube discutida en el primer [post de la serie](/2009/06/29/drools-5-x-sondeo-local/), se nota que este grupo/nube se caracteriza por tener una experiencia y un background teórico bastante altos. Ya que al haber utilizado Drools 4.x los conceptos básicos ya estan cubiertos. Temas como la sintaxis de escritura de reglas de negocio (DRL), los lenguajes específicos para cada dominio (DSL), las secciones de una regla (RHS y LHS) son ampliamente entendidas y términos como WorkingMemory y RuleBase ya no nos asustan.

Si todo esto esta cubierto y tenemos unas cuantas implementaciones de reglas y soluciones de negocio con el el framework, el salto a la versión 5.x es mas que nada conceptual que a nivel tecnológico. Este cambio encima se ve reducido ya que tranquilamente podemos utilizar Drools Expert como venimos usando Drools 4.x, teniendo en cuenta algunas actualizaciones del lenguaje, APIs y algunos features extras.

Si tomamos como foco Drools 4.x y Drools 5.x Expert, podemos estar horas hablando de cosas interesantes. Aquellas personas que tengan varias implementaciones con Drools 4.x probablemente quieran leer o escuchar charlas sobre los siguientes temas, sin ningún orden en particular:

- Optimizaciones sobre el algoritmo RETE, que optimizaciones se han agregado últimamente, etc
- Optimizaciones sobre la escritura de reglas y las distintas alternativas que tenemos para expresar nuestras reglas de negocio.
- Configuraciones sobre performance
- Benchmarks
- etc

Viendo la versión 5.x de Drools Expert podemos ver que el foco que se puso sobre el proyecto y las metas obvias fueron:

- Ser estable y performante, meta lograda por la versión 4.x, por supuesto la versión 5.x agrega madurez y experiencia demostrada en el continuo crecimiento.
- Sigue siendo una plataforma pensada y desarrollada por desarrolladores para desarrolladores. La inclusión de Guvnor como herramienta de governance atrae mucho la atención para la autoria y el governance de nuestras reglas de negocio.
- La facilidad de uso es una clara y gran meta dentro del proyecto. La unificación de la API y la extensibilidad provista por la plataforma demuestran un gran crecimiento sobre la ruta futura del proyecto.

Mas allá de estos puntos que tienen como centro a Drools Expert, el cambio importante en la versión 5.x de Drools es el hecho de expandir el concepto de Regla a Conocimiento (Knowledge). Este cambio que al principio solamente parece solo un cambio de terminología, pero en realidad abre infinitas barreras de crecimiento horizontal de la plataforma.

Para correctamente pasar a usar la versión 5.x de Drools, necesitamos lograr entender la magnitud de esta abstracción realizada mediante el uso el termino **conocimiento**. Tenemos que subir un nivel y aceptar que la definición de reglas de negocio solo es una dimensión de un amplio espectro de representaciones del conocimiento empresarial.

Drools propone una manera, si se quiere decir, genérica, amplia, integrada y extensible para expresar **conocimiento** empresarial, en el amplio sentido de la palabra. Por supuesto, toda esta abstracción y flexibilidad se ven expresadas en las APIs. Ahora toda la terminología esta basada en conocimiento (Knowledge). Ahora, por ejemplo, términos como RuleBase van a pasar a verse como KnowledgeBase. Ahora no solo pudiendo contener Reglas, sino que conocimiento en general, representado de distintas maneras.

## Formas de representar el conocimiento

Actualmente podemos representar el conocimiento utilizando los siguientes conceptos:

- Reglas de negocio
- Procesos de negocio
- Evaluaciones temporales sobre eventos

Lista que es totalmente extensible para que a medida que se necesiten nuevas maneras de representar el conocimiento se puedan agregar módulos para cubrir estas necesidades.

Muchas veces vamos a escuchar decir, que en esta nueva versión de Drools se le enseño al motor de inferencias a trabajar con procesos de negocios y a entender sobre relaciones temporales. En posteriores versiones seguramente que vamos a escuchar que el motor de inferencias esta capacitado para hacer evaluaciones difusas y vaya a saber que nuevos módulos aparecerán en este próximo año.

En el proximo post voy a tratar de resumir que se ve y de que se habla en las charlas de Drools 5.x, ya no con la vision de pasaje de una version a otra, sino que va a ser el primer paso, un paso global para comenzar una serie de post tecnicos para ir guiando el aprendizaje del conjunto de modulos actuales en la version 5.
