---
title: "Drools Lab #2 - De OSWorkflow a Ruleflow"
date: 2009-01-27 17:44:21 +0000
permalink: /2009/01/27/drools-lab-2-de-osworkflow-a-ruleflow/
description: "Estas ultimas semanas he estado trabajando/contribuyendo en lo que se llama drools-osworkflow que tiene como objetivo transformar/migrar un workflow…"
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Drools"
  - "JBoss"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2009/01/27/drools-lab-2-de-osworkflow-a-ruleflow/
---

Estas ultimas semanas  he estado trabajando/contribuyendo  en lo que se llama drools-osworkflow que tiene como objetivo transformar/migrar un workflow definido en OSWorkflow en una definición de proceso que cumple con la forma de definir procesos en Drools Flow.

Esto es importante ya que Drools Flow nos da una solución mas robusta, completa e integrada ya que incluye el manejo de reglas empresariales,  de eventos complejos y mucha mas flexibilidad a la hora de definir y ejecutar procesos de negocio.

Este modulo de drools por lo tanto tiene como objetivo crear una especie de wrapper  de OSWorkflow para poder traducir los procesos que tenemos en OSWorkflow, extenderlos con nuevas funcionalidades y ejecutarlos como si fueran procesos nativos de Drools Flow.

Es importante notar que actualmente el modulo se encuentra bajo desarrollo pero ya tiene la capacidad traducir procesos complejos definidos en OSWorkflow y de ejecutarlos exitosamente.

En post siguientes pongo alguno ejemplos cuando ya esten los fuentes disponibles para probar, pero la funcionalidad ya existe y pódran ponerse a probar en las próximas semanas bajandose el código del trunk.

Para mas información aqui se encuentra el post completo en el blog oficial de Drools:

<http://blog.athico.com/2009/01/drools-flow-and-osworkflow-migration.html>

Espero sus comentarios!
