---
title: "Jugando con Drools 5.0 - #1 Drools Expert"
date: 2009-05-19 20:04:10 +0000
permalink: /2009/05/19/jugando-con-drools-5-0-1-drools-expert/
description: "Introducción a Drools Expert Básicamente vamos a ver un ejemplo sencillo de como Drools Expert nos permite expresar reglas de negocios, para dejar…"
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Drools"
  - "expert"
  - "JBoss"
original_url: https://www.salaboy.com/2009/05/19/jugando-con-drools-5-0-1-drools-expert/
---

![drools_logo](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2009/05/drools_logo.png "drools_logo")

****Introducción a Drools Expert****Básicamente vamos a ver un ejemplo sencillo de como Drools Expert nos permite expresar reglas de negocios, para dejar ejemplos simples de como se expresan las reglas y de las interacciones que podemos tener entre ellas.

En este post veremos solamente la estructura del proyecto, las dependencias y las lineas básicas que necesitamos para poder hacer uso del framework. En el siguiente post veremos como esta compuesto el conocimiento, nuestro modelo de objetos y que podemos hacer con el.

Por esto mismo, la idea principal de estos dos primeros posts sobre Drools Expert, es documentar y dejar un ejemplo sencillo para que la gente que no conoce el framework, pueda ir de a poco introduciendoce en cada uno de los submódulos de Drools.

En estos posts voy a utilizar la versión 5.0 del framework cuyas APIs estan orientadas al conocimiento en general. Asi es, es tan genérica como para permitirnos definir el conocimiento que tenemos en una situación de negocio en particular. Por lo tanto veran que toda la terminología que antes se usaba, como por ejemplo RuleBase o WorkingMemory (cuando estaba solamente orientado a reglas de negocio, en la version 4.0.7 o anterior), ahora estas son mucho mas genéricas y no estan tan atadas solamente a reglas, sino al concepto de conocimiento en general (Knowledge).

### **El Proyecto**

Este ejemplo, mediante un proyecto sencillo construido con Maven, se mostraran los primeros pasos para utilizar el framework. Es importante ver el proyecto completo para comprender como interactúan las partes. Y tratar de jugar un poco con el cambiando las reglas y los hechos que se insertan para ver el comportamiento.

Sin mas vamos a ver el proyecto que utiliza Drools. Como en todo proyecto de Drools vamos a tener que incluir las dependencias a los módulos base que vamos a utilizar del proyecto. Esto, como estamos utilizando Maven, estara descripto en el archivo pom.xml file que describe al proyecto:

```

 4.0.0
 com.wordpress.salaboy.playing.with.drools
 playingWithDrools-ExpertIntroduction
jar
 1.0-SNAPSHOT
 playingWithDrools-ExpertIntroduction
 http://maven.apache.org
 
 repository.jboss.org
 http://repository.jboss.org/maven2
 
 false
 
 
 true
 
 
 
 
 
 junit
 junit
 3.8.1
 test
 
 
 org.drools
 drools-core
 5.0.0.CR1
 
 
 org.drools
 drools-api
 5.0.0.CR1
 jar
 
 
 org.drools
 drools-compiler
 5.0.0.CR1
 jar
```

### **Algunos conceptos de Maven**

Para aquellos que no estan acostumbrados a Maven es importante notar que:

- **groupId:** nos va a decir el grupo donde podremos encontrar nuestro proyecto construido dentro del repositorio de Maven.
- **artifactId:** nombre de nuestro proyecto construido.
- **packaging:** tipo de empaquetado, en este caso estamos generando un Jar, pero podríamos querer hacer un war, algún otro tipo de proyecto.
- **version:** la versión de nuestro proyecto.
- **sección repositories:** en esta sección se incluye el repositorio maven2 de JBoss donde estan las ultimas versiones empaquetadas de Drools. Necesitamos tener este repositorio para poder buscar las dependencias y el framework en si.
- **dependencies con groupId org.drools:** incluimos las dependencias a las bibliotecas core, api y compiler, ya que son necesarias para la compilación y ejecución de nuestro proyecto que hace uso del framework.

Una vez dicho esto, solo queda bajar el proyecto, descomprimirlo y recorrer su estructura (la estructura refleja un típico proyecto Maven, para un empaquetado de tipo Jar).

### **Conociendo las APIs básicas**

Vamos a analizar el uso mas común de las APIs básicas de Drools, para esto podemos abrir la clase App.java dentro del paquete **com.wordpress.salaboy.playing.with.drools**, donde encontraremos las siguientes lineas dentro del método main de la clase:

```
KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
kbuilder.add(ResourceFactory.newInputStreamResource(new App().getClass().getResourceAsStream("/rules/juego.drl")),ResourceType.DRL);
```

Con estas dos grandes lineas de codigo, lo que estamos haciendo es mediante un KnowledgeBuilder recaudar todo el conocimiento que vamos a utilizar en nuestra aplicación para luego obtener paquetes de conocimiento ya compilado. Estos paquetes de conocimiento ya compilados se llaman KnowledgeBase, en versiones anteriores llamados RuleBase.

```
Collection kpkgs = kbuilder.getKnowledgePackages();
KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
kbase.addKnowledgePackages( kpkgs );
```

Como podemos ver, ya tenemos nuestro conocimiento compilado, ahora contra este conocimiento compilado, que llamamos KnowledgeBase podemos crear sesiones para hacer uso de este conocimiento.

```
StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
KnowledgeRuntimeLogger logger = KnowledgeRuntimeLoggerFactory.newConsoleLogger(ksession);
```

Como vemos, a partir de nuestra base de conocimiento se obtiene una sesion de tipo StatefulKnowledgeSession con la cual vamos a poder interactuar para obtener las deducciones que se generen a partir de nuestro conocimiento.

A continuación solamente creo un logger que nos va a ir indicando los eventos que se van generando dentro de nuestra sesión mientras interactuamos con ella. Este tipo de logger, ConsoleLogger, como su nombre lo aclara, nos mostrara por consola todos los eventos que se vayan generando.

### **Conclusión**

Hasta aquí vimos algunos conceptos básicos de como construir un proyecto que utilice Drools y un preview con una breve explicación de como se ven las APIs que utilizaremos en el día a día si nuestra aplicación utiliza Drools.

En el siguiente post discutiremos el modelo del ejemplo y como se realizaran las ejecuciones de las reglas. Para los ansiosos, el siguiente link tiene el proyecto completo con las reglas y un Main, para probar la ejecucion.

[www.jbug.com.ar/external/playingWithDrools-ExpertIntroduction.zip](http://jbug.com.ar/external/playingWithDrools-ExpertIntroduction.zip)

Pueden bajarlo, jugar y romper tranquilos.
