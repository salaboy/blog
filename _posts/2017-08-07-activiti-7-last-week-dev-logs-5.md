---
title: "Activiti 7: Last week Dev Logs #5"
date: 2017-08-07 08:07:09 +0000
permalink: /2017/08/07/activiti-7-last-week-dev-logs-5/
description: "Last week (31/7/17 - 6/8/17) on the Activiti 7 project we spend a lot of time working on clean ups and infrastructure as well as refining and adding new…"
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "process"
  - "spring cloud"
  - "workflow"
  - "open source"
  - "progress"
  - "spring"
  - "weekly"
original_url: https://www.salaboy.com/2017/08/07/activiti-7-last-week-dev-logs-5/
---

Last week (**31/7/17 - 6/8/17**) on the [Activiti 7 project](https://github.com/Activiti/Activiti/projects/1) we spend a lot of time working on clean ups and infrastructure as well as refining and adding new Activiti Services (Gateway and Registry). We are enabling all our services to work with Docker so they can be scaled independently. We hope to start publishing these Docker images soon for those eager to try them.

[@igdianov](https://github.com/igdianov) started researching tracing with Zipkin and reviewing our CQRS implementation.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) added new REST API that provides JSON/XML/SVG for Process Definitions and Process Instances.Next, he is creating new REST API for handling task variables.

[@gmalanga](https://github.com/gmalanga) was working on the ElasticSearch implementaiton of the query module.

[@abdotalaat](https://github.com/abdotalaat) was working on a migration application for User, Groups and Memberships from Activiti 5.x/6.x to Keycloak json configuration.

[@fcorti](https://github.com/fcorti/) this week worked on the second iteration of the [Emergency Call Center Activti example](https://github.com/Activiti/activiti-examples/tree/master/emergency-call-center). The enhancement this time is that a real microservices architecture has been developed using a Spring HATEOAS project to run three different services in three different Apache Tomcat instances. You can check the project [here](https://github.com/Activiti/activiti-examples/tree/master/emergency-call-center/emergency-department) for further details.

[@erdemedeiros](https://github.com/erdemedeiros) worked on audit module: improve tests coverage; launch docker used for tests directly from Maven. The initial implementation is now merged on the master branch. Moving to query module.

[@ryandawsonuk](https://github.com/ryandawsonuk) set up the build to create docker images of core Activiti services and put together a start script to run the build and start containers from the images using a docker-compose.

[@salaboy](http://twitter.com/salaboy) worked on finishing the initial version of the command based endpoints as well as how to test these interactions. I’ve also moved the spring boot starter sample app to a new repository under Activiti/activiti-examples/. We are refining our services to make sure that they all play nice together, as part of this month roadmap we have included two new services, the Gateway and the Registry that will enable us to scale and communicate our services in an unified way.

## This week plan

This week we need to review our SSO security integration with Keycloak now that our services are behind a Gateway, we need to make sure that the Gateway itself is secure and each service behind the Gateway can consume the signed tokens. We also need to finish the initial Docker configuration of the following services: Gateway, Registry, Runtime Bundles (Process Engine), Audit Service, Query Service, Rabbit MQ and all the  DataSources so we can start building examples.

Stay tuned!

[See you all in Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
