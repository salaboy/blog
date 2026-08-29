---
title: "Jugando con jBPM #8 - Algunas afirmaciones sobre jBPM"
date: 2008-08-24 16:11:09 +0000
permalink: /2008/08/24/jugando-con-jbpm-8-algnuas-afirmaciones-sobre-jbpm/
description: "La idea de este post es tener una seria de afirmaciones basicas sobre jBPM que ayuden a aclarar ciertas dudas a la hora de implementar o modelar procesos…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "BPMS"
  - "business"
  - "JBoss"
  - "jBPM"
  - "management"
  - "process"
original_url: https://www.salaboy.com/2008/08/24/jugando-con-jbpm-8-algnuas-afirmaciones-sobre-jbpm/
---

La idea de este post es tener una seria de afirmaciones basicas sobre jBPM que ayuden a aclarar ciertas dudas a la hora de implementar o modelar procesos con jBPM. La siguiente no es una lista estatica, ni pretende tener la verdad absoluta, sino que se ira modificando con la experiencia. Espero que sirva de algo, aca les va:

- jBPM es un framework de desarrollo (recordemos que termina siendo un jar que contiene clases para conformar un BPMS  - Business Process Management System) y no un producto para usuarios finales. Por esto mismo no hay que caer en la mentira de que jBPM es una herramienta solo para analistas que dibujan procesos y estos ya funcionan.
- Cuando usamos el framework jBPM no hay ninguna instancia de servidor de jBPM corriendo. Pensar de esta manera lleva a conceptos erroneos sobre el framework. En el caso de que estemos usando jBPM con persistencia, en este caso si tenemos una instancia de Base de Datos con un schema propio de jBPM corriendo, con la cual el framework jBPM va a mantener conversaciones stateless.
- WebConsole es una aplicacion web que funciona out-of-the-box para probar los procesos que modelamos y ver si se comportan correctamente. Lamentablemente WebConsole no es una aplicacion que puede ser puesta en produccion debido a sus comportamientos erroneos, su falta de QA y su falta de seguridad (opinion personal y respaldada por lo que dicen los foros oficiales de jBPM)
- GPD (Graphic Process Designer, plugin para eclipse) ayuda pero esconde varias cosas y deja afuera a muchos usuarios de otros IDEs que no sean eclipse. Mejor aprendamos a escribir XML.
- Entre jbpm-jpdl.jar y jbpm-enterprise.ear, la diferencia es el empaquetado, las configuraciones (jbpm.cfg.xml, hibernate.cfg.xml) y algunas clases que van a ser fundamentales en entornos Java EE
