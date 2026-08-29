---
title: "Activiti 7: Last week Dev Logs #8"
date: 2017-08-29 11:37:20 +0000
permalink: /2017/08/29/activiti-7-last-week-dev-logs-8/
description: "Welcome to a new edition of Last Week (22/8/17 - 29/8/17) @ Activiti 7 / Dev Logs. Last week we made a huge effort to stabilize our builds and…"
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "devlogs"
  - "microservices"
  - "spring"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/08/29/activiti-7-last-week-dev-logs-8/
---

Welcome to a new edition of Last Week (**22/8/17 - 29/8/17**) @ Activiti 7 / Dev Logs. Last week we made a huge effort to stabilize our builds and repositories configurations ([activiti-build](https://github.com/activiti/activiti-build)). A new repository was added to make sure that we control the project's dependencies and 3rd party dependencies in a single place. Another important milestone was our [JS client example, which can be found here](https://github.com/Activiti/activiti-cloud-examples/tree/master/demo-ui-client) that demonstrate how a simple Angular app can interact with our secure services going through the gateway service.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) he [improved sending event data to Audit Service](https://github.com/Activiti/Activiti/issues/1407) for performance issue and transaction consistency. Next, he is adding [MongoDB support to Audit Service](https://github.com/Activiti/Activiti/issues/1380).

[@erdemedeiros](https://github.com/erdemedeiros) made small improvements and added integration tests for query service; Add basic filtering for audit service; Updated Postman examples.

[@ryandawsonuk](https://github.com/ryandawsonuk) removed dbdriver dependency from runtime bundle and added spring boot config to load external jars and properties file to runtime bundle at docker build stage. Configured keycloak IDM and gateway for CORS and added basic javascript client to connect to services via gateway.

[@salaboy](http://twitter.com/salaboy) Added a new repository containing our BOMs (Bill of Materials / Dependencies) which is called: activiti-build. This repository contains a set of POM files which describes the projects (Activiti and Activiti Cloud) dependencies separated from 3rd Party ones. After this huge refactoring, started working on a simple Kubernetes deployment descriptor. A blog post will follow about how to set up Activiti Cloud in a kubernetes cluster. This week will be all about Kubernetes and how to simplify our application publishing/deploying mechanisms without re-inventing the wheel. Because it is a holiday season you will see less activity in the [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) channel, but I will be around answering questions and working as usual (no holidays for me :).
