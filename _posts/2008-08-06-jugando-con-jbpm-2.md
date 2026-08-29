---
title: "Jugando con jBPM #2 - jBPM API"
date: 2008-08-06 20:48:38 +0000
permalink: /2008/08/06/jugando-con-jbpm-2/
description: "Cambiando un poco el enfoque del post anterior voy a dedicarme a escribir recomendaciones y algunas sugerencias sobre como podemos utilizar las APIs de…"
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
original_url: https://www.salaboy.com/2008/08/06/jugando-con-jbpm-2/
---

Cambiando un poco el enfoque del post anterior voy a dedicarme a escribir recomendaciones y algunas sugerencias sobre como podemos utilizar las APIs de jBPM para realizar las funcionalidades mas comunes a la hora de utiliza este framework.

Para empezar con algo sencillo pero muy útil, recomiendo el uso de dos métodos muy cómodos cuando estamos trabajando en la etapa de desarrollo y necesitamos tener en claro que registros se crean dentro del schema de jBPM.

Con los siguientes métodos podemos realizar programaticamente la destrucción de todas las tablas del schema de jBPM y luego podemos crearlas de vuelta:

JbpmConfiguration conf=JbpmConfiguration.parseResource("/jbpm.cfg.xml"); //Destruimos el schema programaticamente conf.dropSchema(); //Creamos nuevamente el schema programaticamente conf.createSchema();

Con esto obtenemos como resultado el schema limpio para poder instanciar nuestros procesos.

Vale la pena aclarar que estos métodos (dropSchema y createSchema) actúan sobre el datasource configurado dentro del archivo hibernate.cfg.xml, el cual se levanta cuando creamos la configuración a partir del recurso jbpm.cfg.xml.

Otra aclaracion importante es que no podemos usar estos metodos si estamos trabajando con la distribucion Enterprise de jBPM, ya que cuando querramos ejecutar alguno de estos metodos dentro de una transaccion empresarial, el contenedor nos reclamara sobre que no podemos forzar un commit (el commit que se genera por crear o destruir las tablas de base de datos) dentro de una transaccion administrada por el contenedor.
