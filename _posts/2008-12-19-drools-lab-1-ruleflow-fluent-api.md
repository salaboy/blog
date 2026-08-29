---
title: "Drools Lab #1 - RuleFlow Fluent API"
date: 2008-12-19 12:00:33 +0000
permalink: /2008/12/19/drools-lab-1-ruleflow-fluent-api/
description: "Primer contribución para Drools 5, ya que hacia rato que venia estudiando y jugando con Drools decidi ponerme a ayudar un poco a la comunidad y tratar de…"
tags:
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "Drools"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/12/19/drools-lab-1-ruleflow-fluent-api/
---

Primer contribución para Drools 5, ya que hacia rato que venia estudiando y jugando con Drools decidi ponerme a ayudar un poco a la comunidad y tratar de ser parte de ella.

Para esto realice una API bastante básica que nos permite crear de manera programática un proceso de RuleFlow.

Esta API por lo general no debería ser usada, ya que por lo general la forma mas fácil e intuitiva de definir un proceso en RuleFlow es mediante XML o usando el graficador que nos provee la herramienta.

Sin embargo esta API nos seria bastante útil a la hora de realizar pruebas, donde necesitamos definir un proceso de forma rápida y nos es mas conveniente hacerlo de manera programática.

Como muestra en el siguiente post Kris Verlaenen, core developer de Drools a cargo de RuleFlow, podemos crear un proceso de manera bastante sencilla y luego podemos validar que el proceso creado tenga una estructura correcta.

<http://blog.athico.com/2008/12/fluent-process-api.html>

Si tengo en algún futuro cercano voy a tratar de crear algunos ejemplos de creación dinámica de procesos mediante el uso de esta API.

Para mas información pueden revisar la documentación oficial de Drools RuleFlow donde muestro algunos ejemplos, partiendo desde un proceso sencillo a algunos mas complejos.

Saludos.
