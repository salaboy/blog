---
title: "Activiti: Last week Dev Logs #52"
date: 2018-07-02 07:54:46 +0000
permalink: /2018/07/02/activiti-last-week-dev-logs-52/
description: "Last week we spend some time closing the final details of the Java Runtime API and improved our support for Events and Base Data Types to make sure that…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "microservices"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "community"
  - "helm"
  - "kubernetes"
  - "open source"
  - "transparency"
original_url: https://www.salaboy.com/2018/07/02/activiti-last-week-dev-logs-52/
---

Last week we spend some time closing the final details of the Java Runtime API and improved our support for Events and Base Data Types to make sure that our services can be completely decoupled. We are looking forward to close this release to continue our journey to continuous deployment of each of our component in an independent way.

[@ryandawsonuk](https://github.com/ryandawsonuk), [@igdianov](https://github.com/igdianov) and [@almerico](https://github.com/almerico) worked on improving our deployment mechanisms by creating new HELM charts for Applications and Infrastructure. This should enable us to deploy our components to different Cloud Providers such as: Google Cloud Engine, Openshift, EKS (Amazon), AKS (Microsoft) and PKS (Pivotal).

[@igdianov](https://github.com/igdianov) and [@almerico](https://github.com/almerico) worked on improving HELM charts and deployments of community bits as well as adding more flexibility to the GraphQL extension for the Query Service

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto)  is working on updating Audit Service implementation for MongoDB to fit the new interface of Audit Service API.

<https://github.com/Activiti/activiti-cloud-audit-service/tree/elias-engine-wrapper-update/activiti-cloud-services-audit/activiti-cloud-services-audit-mongo>

[@MiguelRuizDev](https://github.com/MiguelRuizDev) followed the Cloud Native in Kubernetes Workshop, getting a high-level understanding of the technologies taking part in it, especially the structure that holds a cloud native application together.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) discussions and plans for refactoring organization service in modeling

[@ryandawsonuk](https://github.com/ryandawsonuk) Added demo-ui to the quickstart based on Jenkins-X and got this working with gateway and keycloak, including CORS configuration. Identified an issue with the graphql part of query. Did a POC on publishing docker images to dockerhub from Jenkins-X.

[@erdemedeiros](https://github.com/erdemedeiros) refactored Java API event listeners: use generics to specify the event type instead of having methods for all the events in the same interface (no empty methods anymore when implementing a event listener). Covered all the missing events currently supported by the runtime bundle (except integration requests) using the new Java API model.

[@salaboy](http://twitter.com/salaboy) updated the Audit & Query Service to use the new Java Runtime API types for Rest Controllers and Event Handlers.

This week, we will move the new Java Runtime APIs to the main <http://github.com/Activiti/Activiti> and we will start preparing all Java Modules to be released to Maven Central.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
