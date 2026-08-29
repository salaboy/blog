---
title: "Activiti 7: Last week Dev Logs #13"
date: 2017-10-02 10:02:06 +0000
permalink: /2017/10/02/activiti-7-last-week-dev-logs-13/
description: "Last week (25/9/17 - 1/10/17) we manage to ship our first Early Access release. We are getting quite close to get an initial version of the Activiti Cloud…"
tags:
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "devlogs"
  - "helm"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/10/02/activiti-7-last-week-dev-logs-13/
---

Last week (**25/9/17 - 1/10/17**) we manage to ship our first [Early Access release](/2017/09/29/activiti-activiti-cloud-7-ea201709-are-out/). We are getting quite close to get an initial version of the Activiti Cloud Connectors using Spring Cloud Service Connectors. Also our GraphQL Query endpoints are looking really good thanks to [@igdianov](https://github.com/igdianov).

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is doing great by adding the Mongo DB Audit Service alternative to our cloud examples.

This week, we had the pleasure of meeting some other community members that are looking forward to collaborate and use this new version of the project.

[@igdianov](https://github.com/igdianov) improved Query Endpoints and Models to support GraphQL endpoints.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) started the next issues that makes spring boot application for Audit Service with MongoDB and  activiti-cloud-examples for Audit Service with MongoDB.

[@erdemedeiros](https://github.com/erdemedeiros) currently investigating how to provide a message queue based service task implementation.

[@ryandawsonuk](https://github.com/ryandawsonuk) further hardened the release process, ensuring it is fully automated, and proved that we could do a hotfix release if we needed/wanted to. Ryan then worked on creating first versions of helm charts for kubernetes deployments.

[@salaboy](http://twitter.com/salaboy) worked on getting an example with Service Cloud Connectors, Docker and Spring Cloud Streams.

### **This week**

Today (2nd October 2017) we are going to do our [monthly retrospective to update our roadmap based on our progress](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap). Another blog post is coming about the update roadmap.

We will be working with our community members to finish GraphQL endpoints and Cloud Connectors so we can move forward and do some final repository refactorings to make sure that our next release handle the addition of new repositories correctly.
