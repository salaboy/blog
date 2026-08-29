---
title: "Activiti 7: Last week Dev Logs #6"
date: 2017-08-14 08:07:32 +0000
permalink: /2017/08/14/activiti-7-last-week-dev-logs-6/
description: "Big changes are coming into the Activiti 7 project. Last week (7/8/17 - 13/8/17) we started making some big organizational changes in how we structure our…"
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "Drools"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "process"
  - "spring cloud"
  - "workflow"
  - "community"
  - "devlogs"
  - "docker"
  - "open source"
original_url: https://www.salaboy.com/2017/08/14/activiti-7-last-week-dev-logs-6/
---

Big changes are coming into the Activiti 7 project. Last week (**7/8/17 - 13/8/17**) we started making some big organizational changes in how we structure our projects and our repositories. We have created 3 new repositories: activiti-examples, activiti-compatibility and activiti-spring-boot-starters. Due the amount of changes we are trying to minimize the negative impact that we have in our builds and in people working on different branches. All these changes are necessary and we hope to stabilize the build by the end of next week.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) added new REST API for handling task variables. Next, he is adding MongoDB support to Audit Service.

[@gmalanga](https://github.com/gmalanga) is working on using ElasticSearch to provide an alternative implementation of the Query Service.

[@abdotalaat](https://github.com/abdotalaat) createda new spring JPA project that expose data (users-IdentityInfo-groups-membership) using Rest Endpoints. The previously created user/group/membership migrator from activiti 6 to keycloak was [moved here](https://github.com/Activiti/activiti-compatibility/tree/master/activiti-db-users-to-keycloak-migrator).

[@fcorti](https://github.com/fcorti/) developed iteration n.3 of the Emergency Call Center project as an example of microservices based solution. This time the project is composed by an Activiti process (with some Java delegates) and three external REST services running as three independent Spring Boot applications.

[@erdemedeiros](https://github.com/erdemedeiros) worked on query module improvements; added support to variable related events. Now the Query Service module is quite close to be merged on the master branch.

[@ryandawsonuk](https://github.com/ryandawsonuk) integrated zuul and eureka into the docker setup, moved the main docker example app to using postgres, reduced the size of the docker images and refactored the audit service to split out a starter dependency.

[@salaboy](http://twitter.com/salaboy) was working on refactoring the API modules inside the new Activiti Services modules. Now we have the activiti-services-api module that contains all the contracts (interfaces) that can be shared with other external modules. I also added an initial version of the @ActitiviRuntimeBundle annotation that will serve as main entry point to configure your process enabled Spring Boot applications.

## This week in Activiti 7

This week we will finish the repository changes and we will stabilize all the builds. We are getting closer to start our journey with kubernetes and for that reason we will spend some more time in making sure that our docker images are correctly built and published to docker hub. As usual you can track our progress and check our outstanding issues and planning here: <https://github.com/Activiti/Activiti/projects/1>. Feel free to get in touch if you see something in our boards that you might want to contribute to the project. We are looking forward to mentor people interested in joining the project as community members.

Join us in [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) if you know or want to learn about Activiti, Spring Cloud, Docker and Kubernetes.
