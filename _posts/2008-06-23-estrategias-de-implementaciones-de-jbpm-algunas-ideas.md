---
title: "Estrategias de implementaciones de jBPM? (Algunas ideas)"
date: 2008-06-23 02:20:55 +0000
permalink: /2008/06/23/estrategias-de-implementaciones-de-jbpm-algunas-ideas/
description: "Si logramos idear algunas mejoras sobre jBPM (muy orientadas al objetivo de acercar el producto a los clientes) facilmente podriamos crear un proceso que…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "Argentina"
  - "BPM"
  - "jBPM"
original_url: https://www.salaboy.com/2008/06/23/estrategias-de-implementaciones-de-jbpm-algunas-ideas/
---

Si logramos idear algunas mejoras sobre jBPM (muy orientadas al objetivo de acercar el producto a los clientes) facilmente podriamos crear un proceso que ayude a la preventa de implementaciones de BPM con el fin de demostrar los beneficios concretos de las mismas (Optimizacion extrema de procesos e Incremento de las ganancias).

Estas mejoras/extensiones/optimizaciones/herramientas no necesariamente tienen que estar pensadas para usuarios finales (como analistas de negocios, o clientes en general) ya que esto ocacionaria gastos altos en desarrollo, tiempo de madurez y demasiado QA. Mi idea principal es que inicialmente sean herramientas y extesiones sean pensadas y dirigidas para consultores que conozcan jBPM y esten involucrados en el proceso de preventa de implementaciones de BPM y SOA.

Sumado a estas herramientas debemos sumar un proceso que nos dicte los pasos a seguir para demostrarles a nuestros clientes de manera facil y no muy costosa para nuestra empresa como impactaria una implementacion de BPM sobre un proceso que este actualmente siendo usado en la empresa del mismo.

Sin meditar mucho sobre el tema se me vienen a la mente una serie de herramientas y extensiones puntuales para alcanzar los objetivos antes mensionados de una manera relativamente poco costosa:

- Crear una extension del lenguaje que nos permita agregar parametros para poder medir distintos parametros de la ejecucion de nuestros procesos. Dos parametros faciles de agregar y muy utiles son costos y tiempos asociados a las tareas que realizan las personas dentro del proceso. Estas tareas son bastantes sencillas por las caracteriticas que propone jBPM de extensibilidad de lenguaje y motor de ejecución.
- Scripts de simulación de ejecuciones procesos (si bien ya se esta gestando un proyecto en los repositorios de JBoss sobre este tema) podrian gestionarse scripts inicialmente para realizar estas tareas y obtener como resultado de los mismos reportes que nos indiquen los comportamientos de distintas instancias de nuestros procesos. Por ahi estos scripts pueden llevar un poco mas de tiempo en cuanto analisis y disenio de los mismos, pero las ventajas que agregan al producto son grandes.
- Scripts de importación de procesos ya definidos en otros medios. Como podria ser Visio o una simple planilla de excel. Con esto ganariamos tiempo cuando los procesos ya se encuentran formalizado dentro de las empresas.

Son 3 simples ideas que acompaniadas por un proceso bien analizado de preventa podrian llevar a atrapar clientes para futuras implementaciones de BPM y a su vez dar a conocer el producto entre la comunidad de desarrolladores y los clientes.

Sientanse a gusto de opinar y agregar ideas.. Espero sus comentarios y feedback sobre lo propuesto..
