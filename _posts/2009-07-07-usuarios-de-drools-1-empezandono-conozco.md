---
title: "Usuarios de Drools #1  - Empezando/No conozco"
date: 2009-07-07 15:40:38 +0000
permalink: /2009/07/07/usuarios-de-drools-1-empezandono-conozco/
description: "Continuando con la temática de mi post anterior y todavía sin haber tenido tiempo de formalizar los datos con una encuesta sobre el tema, voy a abordar lo…"
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Argentina"
  - "Drools"
  - "engine"
  - "expert"
original_url: https://www.salaboy.com/2009/07/07/usuarios-de-drools-1-empezandono-conozco/
---

Continuando con la temática de mi [post anterior](/2009/06/29/drools-5-x-sondeo-local/) y todavía sin haber tenido tiempo de formalizar los datos con una encuesta sobre el tema, voy a abordar lo que a mi manera de ver las cosas divide a los grupos/nubes antes mencionados.

De esta clasificación surge el titulo de este post, por eso #1 - Empezando, va a caracterizar a la primer gran nube mencionada anteriormente. Esta clasificación, esta hecha teniendo como base el hecho de que JBoss y todos sus proyectos, estan hechos por desarrolladores para desarrolladores. (Se puede relacionar esto con el termino Middleware, probablemente este muy relacionado, mucha gente no lo alcanza a ver). Con esto ya dejamos afuera todo aquel que no quiera o sepa desarrollar aplicaciones. Esto no quiere decir que el resultado de lo que implementemos con Drools, no pueda ser usado por estadistas, analistas, gerentes, humanos, etc. Todo lo contrario, estos van a ser nuestros usuarios, pero necesitamos ser desarrolladores y tener una formación de desarrollador para entender por completo el fin, la manera de uso y como esta construido Drools como proyecto.

Mas que nada este post esta orientado a estas personas, que ni siquiera conocían la plataforma Drools, o que si la conocían, solamente la conocían por el nombre. Es importante, para este grupo de personas, recibir algo de orientación inicial, debido a que la documentación oficial, toma como base que estamos muy interiorizados con varios temas que a muchas personas les resulta difícil.

Si te sentís desorientado, no sabes por donde empezar, leyendo la documentación te das cuenta de que no manejas conceptos como por ejemplo: de motor de inferencia, motor de reglas, BPM, Procesos, CEP, etc. Este post esta orientado a ir iterativamente agregando distintas fuentes de información para introducir y relacionar todos estos temas, cuyas bases teóricas son fundamentales para entender como funciona Drools.

Por lo tanto a esta altura, tu gran problema es el **Background teórico** faltante. Y entender como funciona y como esta hecho internamente un **motor de inferencia** (el core de Drools como proyecto desde que empezó) se hace fundamental para aclarar el panorama. No hace falta irse al otro extremo de saber como implementar un motor de inferencia (me gustaría llegar a esto en algún post) pero si es necesario entender los conceptos básicos de funcionamiento y por sobre todo entender conceptualmente que representa y que soluciona.

Para esto voy a usar este post, para ir actualizandolo con artículos que explican y abordan temas conceptuales y genéricos, no solamente sobre Drools. Abordando los conceptos de motor de inferencias, sistemas expertos, sistemas de producción, etc, la documentación de **Drools Expert** empieza a tomar otra forma.

## **Algunos conceptos importantes**

Esta sección va a listar algunas definiciones muy cortas, usadas para empezar a entrar en tema, junto con un listado de lecturas de referencia para ampliar cada tema en particular. Por mi parte voy a ir tratando de extraer las secciones de máximo interés para armar una mini guia conceptual que nos introduzca las herramientas necesarias para empezar con el pie derecho.

## ****Sistemas Expertos (Expert Systems)****

Se conoce como un sistema experto, un programa o pieza de software, que intenta imitar las decisiones o acciones tomadas por un experto humano en un dominio(rubro) especifico.

Estos sistemas, hacen uso de motores de inferencia, o motores de razonamiento, para ser mas genéricos, los cuales permiten basándonos en el conocimiento de un dominio, llegar a conclusiones a las que un experto humano llegaría.

### **Referencias:**

<http://es.wikipedia.org/wiki/Sistemas_Expertos>

## **Motor de inferencias (Inference Engine)**

Básicamente es un programa, o pieza de software, que trata de derivar una respuesta basándose en una base de conocimientos. Donde por base de conocimientos, entendemos que es algo similar a una base de datos, pero especializada para guardar conocimiento, ordenarlo y poder obtenerlo fácilmente. Teniendo como foco principal el hecho de poder llegar a nuevas conclusiones, basadas en el conocimiento almacenado.

Estos motores de inferencia, esta fuertemente relacionados con el ámbito de los sistemas expertos, ya que se considera que un motor de inferencia es el cerebro de un sistema experto.

### **Referencias:**

<http://en.wikipedia.org/wiki/Inference_engine>

<http://es.wikipedia.org/wiki/Inferencia>

## **Sistemas de Producción (Production Systems)**

Son sistemas muy relacionados con la inteligencia artificial, construidos con bases en reglas (producción/production) y comportamientos asociados. A grandes rasgos, y con mi visión muy superficial sobre estos temas tan teóricos, relaciono la palabra producción no con el hecho de producir algo, sino al revés con que algo se produce y debemos saber que comportamiento tenemos que tomar en ese momento.

Para ser mas claros, estas producciones/reglas están formadas por dos partes. La primera parte es conocida como sensor, pre condición, guarda o solamente condición y es la encargada de describir un estado particular de nuestro mundo.

Cuando nuestro mundo coincide con algún estado expresado por alguna de las N condiciones que podemos tener, se dice que la producción/regla es activada. Aquí es donde entra en juego la segunda parte de la producción, que es llamada acción. La cual se ejecuta cuando la regla es disparada.

La manera mas simple de ver una producción/regla es la siguiente:

RULE "nombre" IF/WHEN CONDITION THEN ACTION

Cuando la acción es ejecutada, podemos decir que la regla ha sido disparada.

Otro concepto importante aquí, es lo que se conoce como memoria de trabajo (working memory), que es la encargada de tener el estado del mundo y sobre cual se ejecutan las acciones. Estas acciones muchas veces tienen la función de modificar el estado del mundo, pudiendo así causar la activación de otras reglas de manera recursiva.

Como últimos detalles, podemos decir que los sistemas de producción deben incluir dos cosas claves:

1. Un algoritmo para comparar las condiciones y el estado actual del mundo eficiente. (Voy a dedicarle un post aparte a este tema, ya que aca entran los conceptos de forward y backward chainning junto con el algoritmo RETE, LEAPS,TREAT, etc)
2. Un algoritmo para priorizar activaciones en caso de que dos o mas condiciones se activen al mismo tiempo.

### **Referencias:**

<http://en.wikipedia.org/wiki/Production_system>

<http://www.cse.unsw.edu.au/~billw/cs9414/notes/kr/rules/rules.html>

## **Conclusión**

Si bien las referencias son pobres, la idea es ir agregando y refinando los conceptos sobre este mismo post, a medida que las preguntas surjan.

Espero poder avanzar con cada uno de estos temas en particular, para que el background teórico vaya solidificándose hasta que el uso de la herramienta sea solamente comprender como fue implementada cada parte y cada concepto.

Cualquier comentario/corrección sobre los términos y conceptos discutidos aquí es totalmente bienvenida.

Saludos

 <http://www.losandes.com.ar/notas/2009/7/6/un-433782.asp>
