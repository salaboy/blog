---
title: "Activiti: Last week Dev Logs #46"
date: 2018-05-21 12:58:47 +0000
permalink: /2018/05/21/activiti-last-week-dev-logs-46/
description: "Last week we worked hard into moving forward our services and making sure that they can be deployed into an AWS Kubernetes Cluster and also a GCE…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "bpmn"
  - "cloud native"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/05/21/activiti-last-week-dev-logs-46/
---

Last week we worked hard into moving forward our services and making sure that they can be deployed into an [AWS Kubernetes Cluster and also a GCE Kubernetes Cluster](/2018/05/15/activiti-cloud-jenkins-x-blueprint-in-aws-and-gce/). This will enable us to validate our examples and blueprints in a more consistent way release after release.

We are looking into plugging in our Acceptance Tests in our pipelines to start covering more complex scenarios.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) worked on improving the Task Service Incubator project and added a UI using Angular 6.

[@mteodori](https://github.com/mteodori) [#1894](https://github.com/Activiti/Activiti/issues/1894) update to Spring Boot 2.0.2 and [#1895](https://github.com/Activiti/Activiti/issues/1895) Update to Spring Cloud RC1 and fixed related false positives for vulnerabilities

[@igdianov](https://github.com/igdianov) defined the next steps for the graphql integration and modules dependencies to make it more generic.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on the Cloud BPMN signal mechanisms examples and acceptance tests.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for organization controllers

[@pancudaniel7](https://github.com/pancudaniel7) looked more into the concepts behind Activiti Cloud Infrastructure and reviewed the [Activiti Cloud  GitBook](https://activiti.gitbooks.io/activiti-7-developers-guide/content/)

[@lucianoprea](https://github.com/lucianoprea) used the Activiti Cloud Infrastructure inside a template project along with the logging and tracing

[@ryandawsonuk](https://github.com/ryandawsonuk) Made it possible to run the apps service is Kubernetes by putting it on a new example app - in the docker-compose example its embedded in the registry but both register on the gateway with the same route so that the external API is the same. Switched Activiti keycloak integration module to using autoconfiguration. Reviewed and merged changes from @igdianov to make graphql notifications with websockets available through the gateway.

[@erdemedeiros](https://github.com/erdemedeiros) made sure that the runtime bundle relies on the new Java API: covered part of  the process instance and process definition REST APIs.

[@salaboy](http://twitter.com/salaboy) worked on getting the new Spring Cloud Gateway up and running with the Spring Cloud Kubernetes Discovery Client for dynamic routes discovery.

This week we look forward to migrate our quickstart to follow our new BluePrint structure and also Daisuke ([@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto)) and myself ([@salaboy](http://twitter.com/salaboy)) will be presenting at [JJUG CCC Spring 2018 Conference in Tokyo, Japan](http://www.java-users.jp/ccc2018spring/#/sessions). If you are around Tokyo, feel free to drop me a message via Twitter and we can catch up while I’m around.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
