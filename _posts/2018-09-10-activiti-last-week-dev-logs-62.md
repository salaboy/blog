---
title: "Activiti: Last week Dev Logs #62"
date: 2018-09-10 08:44:16 +0000
permalink: /2018/09/10/activiti-last-week-dev-logs-62/
description: "Last week we made some progress on Cloud Connectors Definitions initial implementation (we are also working in RFC document for this topic) and also we…"
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/09/10/activiti-last-week-dev-logs-62/
---

Last week we made some progress on Cloud Connectors Definitions initial implementation (we are also working in RFC document for this topic) and also we moved forward the TTC acceptance tests projects. There were further refinements on the Spring Cloud Kubernetes Discovery implementation that are being tested to be used with the Spring Cloud Gateway project to filter other, non related Kubernetes Services that we are not interested in registering as Routes.

[@cristina-sirbu](https://github.com/cristina-sirbu) Working on the custom Spring Boot Starter for Activiti Could Events Adapter

[@ffazzini](http://github.com/ffazzini) cloud connector definition and runtime <https://github.com/Activiti/Activiti/issues/1972> https://github.com/Activiti/Activiti/issues/1982

[@lucianoprea](https://github.com/https://github.com/lucianoprea) helped [@constantin-ciobotaru](https://github.com/constantin-ciobotaru) with the helm chart for activiti-cloud-modeling and logged a bug about task update [#1991](https://github.com/Activiti/Activiti/issues/1991)

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked to deploy modeling application in GCP using jenkins-x

[@danielpancu](https://github.com/pancudaniel7) Added keycloak get users and roles names functionality on activiti identity-keycloak module

[@miguelruizdev](https://github.com/miguelruizdev) worked on the creation of new scenarios for the TTC acceptance tests

[@ryandawsonuk](https://github.com/ryandawsonuk) - holidays -

[@erdemedeiros](https://github.com/erdemedeiros) - paternity leave -

[@salaboy](http://twitter.com/salaboy) working on Gateway filters and Spring Cloud Kubernetes enhancements for reloading configs.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
