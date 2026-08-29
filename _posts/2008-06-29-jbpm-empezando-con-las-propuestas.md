---
title: "jBPM empezando con las propuestas?"
date: 2008-06-29 16:16:53 +0000
permalink: /2008/06/29/jbpm-empezando-con-las-propuestas/
description: "Por un lado voy a empezar a proponer un simple proceso que podria llevarnos a establecer ese acercamiento y un poco las ideas que he plasmado en post…"
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
original_url: https://www.salaboy.com/2008/06/29/jbpm-empezando-con-las-propuestas/
---

Por un lado voy a empezar a proponer un simple proceso que podria llevarnos a establecer ese acercamiento y un poco las ideas que he plasmado en post anteriores (Post mas filosóficos: [Post 1](/2008/06/23/estrategias-de-implementaciones-de-jbpm-algunas-ideas/) , [Post 2](/2008/06/21/como-encaja-jbpm-en-el-mercado/)), por otro lado voy a empezar a compartir por este medio ejemplos de modelado típicos como para ir viendo como se comporta el motor y como podemos modelar algunas cosas que surgen en implementaciones reales. (Ver posts mas practicos: [Post 1,](/2008/06/06/jugando-con-jbpm-1jugando-con-jbpm-1/) [Post 2](/2008/03/04/jbpm-designer-install-howtojbpm-designer-install-howto/))

Luego de esta un poco confusa introducción del post voy a ir directamente al grano con este proceso que he denominado MPI (Mejora de Procesos Interactiva) con el fin de acercar jBPM y todo el Stack SOA que propone JBoss a los clientes finales (en siguientes post futuros tratare de aboradar una forma sistematizada de llegar a la comunidad de desarrolladores locales, tema que creo fundamental para la aceptación del producto)

A continuación vemos a gran escala como se veria el proceso que propongo ya modelado con GPD de jBPM.

MPI:

![jBPM empezando con las propuestas?](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/06/mpi.jpg)

Como podemos ver en el modelo la primer tarea que progongo es el acercamiento a la gerencia de nuestro cliente (o al contacto que tengamos dentro de la empresa) con el fin de ofrecer educación (lease charlas descriptivas sobre los productos del Stack SOA y todas las ventajas que ofrecen a nivel empresarial estas herramientas y frameworks de programación).

Acto seguido deberiamos buscar un proceso representativo en el cual podamos enfocarnos con el fin de demostrar las ventajas que presentaria formalizar dicho proceso y luego mejorarlo. Una vez que nos hemos desidido por un proceso en particular la idea seria obtener la mayor cantidad de información sobre el posible con el fin de poder organizar reuniones de trabajo InSite con las personas que realmente llevan el proceso acabo en la realidad. (LOB = Line of Business). Estas reuniones tiene como fin que las mismas personas vean su proceso en el estado actual y mediante brainstorming y con el conocimiento de los consultores sobre la herramienta mejoren el proceso elegido, optimizando tiempos e incrementando costos.

Una vez realizada estas mejoras sobre el proceso elegido es fundamental comunicarle a la gerencia los resultados de estas reuniones, ya que ellos podran ver como se encuentra el proceso actual y veran como optimizarian costos con las mejoras futuras que sus propios expertos (mas la ayuda de los consultores jBPM) han aconsejado.

Espero que se haya entendido el punto de proponer un proceso con el fin de acercar y realizar implementaciones con jBPM. Espero sus comentarios y en los siguientes post vamos a ver en detalle que sub tareas lleva cada tarea de este proceso planteado. Espero feedback a ver si el proceso se puede ir refinando con el fin de que en la practica pueda ser utilizado.
