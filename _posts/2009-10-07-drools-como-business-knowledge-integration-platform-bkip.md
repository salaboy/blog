---
title: "Drools como Business Knowledge integration Platform (BKiP)"
date: 2009-10-07 14:41:16 +0000
permalink: /2009/10/07/drools-como-business-knowledge-integration-platform-bkip/
description: "Ya directamente sobre Drools 5.x las charlas están totalmente dirigidas a los módulos principales (Expert, Fusion, Flow y Guvnor) de esta versión."
tags:
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "jbug"
  - "Drools"
  - "expert"
  - "Salaboy"
original_url: https://www.salaboy.com/2009/10/07/drools-como-business-knowledge-integration-platform-bkip/
---

Ya directamente sobre Drools 5.x las charlas están totalmente dirigidas a los módulos principales (Expert, Fusion, Flow y Guvnor) de esta versión. Por lo tanto el publico debe estar al tanto de que la versión actual esta dividida en distintos módulos y lo que se trata de mostrar son las características principales de los mismos. En estas charlas, como es obvio, se suele empezar por Drools Expert que es el corazón de la plataforma.

*Con respecto al titulo del post: JBoss o el mismo equipo de Drools en esta versión 5.x paso a ver al framework como una plataforma que nos permite integrar la manera en la que expresamos el conocimiento de nuestro negocio dentro de nuestras aplicaciones. Aquí es donde aparece la sigla BLiP (**Business Logic integration Platform** -> <http://www.cafepress.com/jbossorg.387860288>). Esta sigla deja de lado el termino Knowledge, el cual toma un rol importantisimo a partir de la versión 5.x. Por esto, el nombre del post **BKiP**, que aunque suena feo, refleja el 100% de la intensión de la plataforma.

## **Drools Expert**

Es el punto de comienzo si estamos empezando a conocer Drools. Si viéramos como esta compuesto/estructurado el código del proyecto, veríamos que básicamente Expert esta conceptualmente compuesto por los módulos: **drools-core**, **drools-compiler** y **drools-api**. Por lo tanto si nosotros queremos empezar a trabajar con Drools, las siguientes dependencias serian requeridas dentro de nuestro proyecto (obviamente usando Maven):

```xml
<dependency>
  <groupId>org.drools</groupId>
  <artifactId>drools-core</artifactId>
  <version>5.1.0.SNAPSHOT</version>
</dependency>
<dependency>
  <groupId>org.drools</groupId>
  <artifactId>drools-api</artifactId>
  <version>5.1.0.SNAPSHOT</version>
</dependency>
<dependency>
  <groupId>org.drools</groupId>
  <artifactId>drools-compiler</artifactId>
  <version>5.1.0.SNAPSHOT</version>
</dependency>
```

Nuestro siguiente paso, en la creación de aplicaciones, seria definir el modelo de negocio que vamos a utilizar, o que estamos utilizando en nuestra aplicación actual. Este modelo, en el mundo Java se suele expresar en POJOs ([Plain Old Java Objects](http://es.wikipedia.org/wiki/Plain_Old_Java_Object)). Este modelo de dominio va a ser nuestro punto de partida para poder expresar nuestras reglas de negocio.

Como podrán imaginar, este tipo de charlas no cubre temas básicos como :

- Que es una regla de negocio
- Como se expresan las reglas de negocio
- Gramática DRL
- etc

Por lo tanto, la audiencia, debe tener un nivel bastante elevado, sino la charla se puede llegar a hacer inentendible y confundir mas que ayudar.

El segundo paso dentro de la plataforma suele ser Drools Flow; que desde mi punto de vista, la disciplina BPM (Business Process Management) es mucho mas amigable que Complex Event Processing.

## **Drools Flow**

Este modulo esta centrado en la representación del conocimiento como Procesos de Negocio. Permitiéndonos definir, administrar y ejecutar nuestros procesos de negocio de manera integrada con nuestro motor de inferencia. Tanto Drools Flow como Drools Fusion fueron grandes pasos en la version 5.x. Ya que ambos diferencian a Drools de sus competidores propietarios.

Por lo general, en las charlas de Drools Flow se hace mucho énfasis en la inversión de control propuesta a los enfoques clásicos de desarrollo. Donde clasicamente teníamos nuestros procesos de negocio que hacían uso de un motor de reglas para tomar decisiones de manera bastante desacoplada.

![interaccionClasicaEntreProcessosYMotorDeInferencia](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2009/10/interaccionclasicaentreprocessosymotordeinferencia.png "interaccionClasicaEntreProcessosYMotorDeInferencia")

Ahora el concepto se invierte, y deja de lado la visión "Centrada en el proceso y desacoplada" para empezar a jugar con una integración mas fina que nos agranda el abanico de posibilidades a la hora de modelar nuestro conocimiento.

![Inversion de Control](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2009/10/interacionconinversionderoles.png "InteracionConInversionDeRoles")

Hasta aca podemos modelar nuestro conocimiento como:

- Reglas de negocio: usando la gramática DRL para representar la estructura basica (When/Then) de nuestras reglas de negocio.
- Procesos de negocio: usando el plugin de Eclipse para modelar nuestros procesos de negocio, los cuales estarán representados en XML.

Utilizando nuestro conocimiento de una manera integrada, sin diferencias en las APIs y sin tener que aprender dos herramientas distintas. Aprovechado las increibles ventajas que nos da esta integración.

Para los que conocen Drools 4.x donde Drools Flow daba los primeros pasos, y era contemplado como la evolución de los agenda-groups, que nos permitían organizar las ejecuciones de nuestras reglas en distintos grupos.

Por ultimo tenemos a Drools Fusion, que agrega otra gran disciplina a este conjunto.

## **Drools Fusion**

La otra gran pata de Drools en la version 5.x es Drools Fusion. Fusion, se encargo de agregarle al motor de inferencia la posibilidad de realizar evaluaciones temporales. Algo que por lo general, no suele ser contemplado por este tipo de productos. La puerta que nos abre esta adición es la posibilidad de inferir sobre flujos de eventos que ocurren durante un segmento de tiempo determinado. Esto no es menor, ya que el campo de [**Complex Event Processing**](http://en.wikipedia.org/wiki/Complex_Event_Processing) esta basado en este tipo de análisis e inferencias. En pocas palabras **[Complex Event Processing](http://en.wikipedia.org/wiki/Complex_Event_Processing)**, es una disciplina encargada de analizar distintos patrones que ocurren en flujos de eventos, donde un factor importantisimo, es el momento en el cual los eventos ocurren. Como podrán ver en la definición propuesta en wikipedia, Fusion se centra en análisis de patrones y correlación entre eventos. Brindándonos la posibilidad de expresar restricciones temporales en nuestras reglas. Otro punto importante en Fusion, es la posibilidad de enchufar, cualquier stream(flujo) de eventos que se generen por una fuente externa, de forma facil e intuitiva en nuestras reglas.

Este tipo de charlas, por lo general incluyen las funcionalidades básicas, la sintaxis para poder inferir sobre flujos o nubes de eventos y por sobre todo, se habla de los 13 operadores provistos por la versión 5.x. Estos 13 operadores, nos permitirán analizar una amplia gama de posibilidades entre la ocurrencia de nuestros eventos.

Como ya es obvio, todas estas características se incluyen en Drools de manera sencilla y extensible.

## **Drools Guvnor**

Para ir terminando, Guvnor nos ofrece una manera de centralizar todo el conocimiento de nuestra organización en un repositorio central, especialmente preparado para almacenar todo el conocimiento empresarial. Si bien nació como puramente un repositorio, muchas herramientas se le fueron agregando, con el fin de permitir ser una herramienta de creación guiada de conocimiento. Las charlas sobre Guvnor, suelen ser orientadas a usuarios finales, que necesitan tener una forma rápida y sencilla para crear y administrar las reglas de negocio. Estas charlas suelen tratar las nuevas incorporaciones de características que posibilitan administrar todo el ciclo de vida de nuestro conocimiento. Cosas que se han ido agregando son: casos de pruebas para nuestras reglas, tablas de decisión guiadas, y próximamente podremos editar nuestros procesos de negocio por medio de esta herramienta web utilizando la notación BPMN2 que esta volviéndose un estándar de-facto, antes de estar totalmente definida.

## **Conclusión**

Si ya entendemos que queremos hacer con Drools y conocemos los fundamentos con los cuales fue construido, usarlo nos llevara hacia una nueva manera de pensar nuestras aplicaciones. Aprovechando la integración de estas tres ramas: Reglas de Negocio, Procesos de Negocio y Análisis de Eventos Complejos encontraremos nuevas y mejores formas de expresar de manera desacoplada(con respecto al código de infraestructura de nuestras aplicaciones) el conocimiento de nuestro negocio. Resultando en proyectos mas claros, mucho mas mantenibles, donde el conocimiento de negocio puede ser evaluado, cambiado y validado por analistas de negocio.

Sobre estos módulos podría estar escribiendo por un largo rato, pero voy a enfocarme en ejemplos con un estilo mas de tutorial, para que los conceptos puedan irse fijando.
