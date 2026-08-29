---
title: "Activiti 7: Last week Dev Logs #7"
date: 2017-08-21 07:47:31 +0000
permalink: /2017/08/21/activiti-7-last-week-dev-logs-7/
description: "Last week, the whole team spent a lot of time making sure that the code and projects are well organized under a whole new set of repositories."
tags:
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "community"
  - "devlogs"
  - "open source"
  - "progress"
  - "update"
original_url: https://www.salaboy.com/2017/08/21/activiti-7-last-week-dev-logs-7/
---

Last week, the whole team spent a lot of time making sure that the code and projects are well organized under a whole new set of repositories. You can find all the new repositories under the [github.com/Activiti](http://github.com/Activiti) organization. A blog post will follow next explaining the changes and additions to our projects. I recommend to our community members to check the [Activiti/activiti-cloud-examples](http://github.com/Activiti/activiti-cloud-examples) repositories, where you can find a Docker based example of starting the whole infrastructure plus your domain specific runtime bundles (Spring Boot Process Enabled applications).

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) he is trying to [improve sending event data to Audit Service](https://github.com/Activiti/Activiti/issues/1407) for performance issue and transaction consistency.Next, he is [adding MongoDB support to Audit Service](https://github.com/Activiti/Activiti/issues/1380).

[@gmalanga](https://github.com/gmalanga) still working on the elastic repository, for replacing the existing Spring-Data JPA repository for the query service with Elasticsearch.

[@abdotalaat](https://github.com/abdotalaat) working on getting a simple local identity service to support simple scenarios where SSO is not required.

[@fcorti](https://github.com/fcorti/) continued to work on the activiti example. This time integrating the 'activiti-cloud-keycloak' container for authentication, ‘activiti-cloud-registry’’ implementing the registry using Spring Eureka and 'activiti-cloud-starter' to define a real microservice architecture for the departments (in the example). Next week is planned to complete the iteration.

[@erdemedeiros](https://github.com/erdemedeiros) merged first iteration of query module into the master branch; created related starter in the activiti-cloud-starters repository. Currently adding more integration tests to the query starter.

[@ryandawsonuk](https://github.com/ryandawsonuk) modified some of the key services to separate out a starter and an implementation based on the starter with the implementations now published to dockerhub and the main cloud example able to use the published images

[@salaboy](http://twitter.com/salaboy) mostly worked on creating the builds in our internal servers to make sure that we can publish docker images to docker hub and reviewed multiple times the example that we are building in activiti-cloud-examples.

## This week

This week is all about refining our process to produce and publish docker images to Docker Hub and creating End User examples against our new services. We will be also looking at creating a initial version of our Kubernetes services descriptors.

**Notice: as part of our work to keep the project healthy we are closing all the issues in Github that are inactive. We take reported issues very seriously and for that reason we want to make sure that all open issues are being worked on. If you are involved in one of these closed issues and you still think that there is some work to be done there, please get in touch, re-open the issue and write a comment. All new opened issues will be worked on and have a person assigned to it that will report back progress.**

Join us in [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) if you know or want to learn about Activiti, Spring Cloud, Docker and Kubernetes.
