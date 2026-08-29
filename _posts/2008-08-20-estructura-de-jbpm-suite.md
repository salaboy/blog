---
title: "Jugando con jBPM #7 - Estructura de jBPM Suite"
date: 2008-08-20 19:52:32 +0000
permalink: /2008/08/20/estructura-de-jbpm-suite/
description: "En este post vamos a hablar un poco sobre la estructura del empaquetado que nos provee JBoss de su framework jBPM."
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "Argentina"
  - "JBoss"
  - "jBPM"
  - "jPDL"
original_url: https://www.salaboy.com/2008/08/20/estructura-de-jbpm-suite/
---

En este post vamos a hablar un poco sobre la estructura del empaquetado que nos provee JBoss de su framework jBPM. La idea principal es tener en claro lo que contiene esta suite, la cual tiene como objetivo tener todas las cosas necesarias para armar un entorno de desarrollo rápido para proyectos que usen jBPM.

Para encontrar las instrucciones de como instalar esta suite dirigirse al siguiente [POST](/2008/03/04/jbpm-designer-install-howto/).

Empezamos por el directorio **config** dentro de nuestra instalación de la suite de jBPM:

![Config](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/config.png)

Dentro de este directorio vamos a encontrar dos archivos claves:

- **hibernate.cfg.xml**: es el archivo que nos permite configurar la fuente de datos con la que va a hablar el framework para realizar todas las tareas de persistencia. Este archivo incluye también todos los mapeos de hibernate necesarios para que los objetos que manejara el framework puedan persistirse.
- **jbpm.cfg.xml:** este archivo por lo general viene sin contenido ya que el contenido se saca de las configuraciones por defecto que se encuentran en: org/jbpm/default.jbpm.cfg.xml. Por lo tanto este archivo nos permite sobre escribir las configuraciones por defecto, dejandonos configurar que tipo y quien nos va a administrar las transacciones, quien va a ser responsable de la persistencia, quien va a ser responsable del logging, de la autenticacion, etc.

En el directorio **db** encontramos los siguiente:

![Jugando con jBPM #7 - Estructura de jBPM Suite ](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/db.png)

En este directorio como vemos, encontramos todos los scripts de generación de esquemas de base de datos, que nos permitirán generar el esquema en cualquier base de datos soportada por el framework de persistencia Hibernate.

En el directorio **deploy** encontramos los siguientes archivos:

![Deploy](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/deploy.png)

En este directorio encontramos distintas distribuciones de jbpm previamente compiladas y listas para su distribución. Seguramente en posts futuros voy a estar hablando del empaquetado jbpm-enterprise.ear y sobre el empaquetado jbpm-console.war. Ambos empaquetados cumplen con la tarea de empaquetar al framework juntos con configuraciones y características especiales, para correr en distintos entornos y con distintas aplicaciones.

En el directorio **designer** encontramos:

![Designer](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/designer.png)

En este directorio básicamente lo que encontramos es un directorio eclipse, que posee internamente la estructura de un plugin para el IDE eclipse, y la idea principal es que descomprimamos una distribución de eclipse sobre este directorio con el fin de tener un eclipse con los plugins de jBPM instalados. Si ustedes ya poseen un eclipse instalado y desean agregarle los plugins de jBPM deberán copiar el contenido de los directorios: **plugins y features** a su instalación de eclipse.

En el directorio **server** encontramos:

![Server](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/server.png)

Este directorio es uno de los mas importantes ya que contiene un servidor JBoss 4.0.3 ya configurado con todo lo necesario para correr jbpm y además con jbpm-console.war ya deployado. Este servidor consta de una sola configuración llamada jbpm. Por lo tanto si queremos arrancarlo como a cualquier otra instalación de JBoss tendremos que desde el directorio bin/ ejecutar la siguiente linea:

./run.sh -c jbpm

En el directorio **src** encontramos:

![Jugando con jBPM #7 - Estructura de jBPM Suite ](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/src.png)

Es importante tener en claro la estructura de este directorio ya que contiene tres directorios importantes a nivel de fuentes de componentes:

- **enterprise:** este directorio contiene todas las clases extras que se empaquetan en jbpm-enterprise.ear. Por lo tanto si optamos por este empaquetado tenemos que tener en claro que clases extra contiene.
- **identity:** este directorio contiene los fuentes del modulo de identidades propuesto. Este modulo de identidades, es un modulo simple que se propone con el fin de contar con una implementación simple de un esquema de usuarios y roles. Este modulo puede ser extendido modificando los fuentes en este directorio o directamente remplazado con otro esquema y otra implementación de identidades.
- **jpdl:** este directorio contiene el core del framework, es decir todas las clases que implementan las funcionalidades de jBPM. Dentro de este directorio se encuentran las clases que implementan y exponen todas las APIs con las que nosotros vamos a interactuar.

En el **directorio raiz** encontramos los siguientes archivos sueltos:

![Jars](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/jars.png)

Los archivos importantes acá son los dos jars:

- **jbpm-identity.jar:** este jar contiene la implementación básica de identidades compilada y lista para ser usada como biblioteca en cualquier proyecto standalone o enterprise.
- **jbpm-jpdl.jar:** de la misma manera este jar contiene toda la API compilada para que cualquier aplicación utilice jBPM.
