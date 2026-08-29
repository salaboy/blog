---
title: "Activiti 7: Last week Dev Logs #24"
date: 2017-12-18 08:41:00 +0000
permalink: /2017/12/18/activiti-7-last-week-dev-logs-24/
description: "(11/12/17 - 17/12/17) We are getting close to the end of the year and we are focusing on improving our tests and building blocks."
tags:
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "docker"
  - "example"
  - "microservices"
  - "open source"
  - "process"
original_url: https://www.salaboy.com/2017/12/18/activiti-7-last-week-dev-logs-24/
---

(**11/12/17 - 17/12/17**) We are getting close to the end of the year and we are focusing on improving our tests and building blocks. We want to start 2018 with a continuous deployment approach for our services and tools that we build. For that reason, we are spending some time in setting up our Trending Topic Campaigns example (which uses Docker & Kubernetes) in an environment that we can run, test and validate our releases.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) added ability to activiti-cloud-runtime-bundle-service to start a process instance by process definition key and business key. Also, he is reviewing the following pull requests.

[Fix signal events throw/catch race conditions in transaction scope](https://github.com/Activiti/Activiti/pull/1618)

[Update the persisted historic task instances that are open](https://github.com/Activiti/Activiti/pull/1612)

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for connectivity between organization service and model services (like process model), added modeling backend starter and improved versioning on process models service

[@lucianoprea](https://github.com/lucianoprea) worked on the  [Activiti Cloud Service Organization](https://github.com/Activiti/activiti-cloud-org-service/pull/1) having the first iteration [merged](https://github.com/Activiti/Activiti/issues/1559) and almost done the [Spring Rest Docs](https://projects.spring.io/spring-restdocs/) integrated for the [Audit JPA](https://github.com/Activiti/Activiti/issues/1551)

[@ffazzini](http://github.com/ffazzini) spring profiles for logging, Boot M7 breaking changes fixes, investigation around terraform/rancher deployment for having an environment up and running

[@ryandawsonuk](https://github.com/ryandawsonuk) has been reviewing contributions and checking the latest builds and updating after a recent spring boot milestone upgrade

[@erdemedeiros](https://github.com/erdemedeiros) did some bug fixes and worked in the trending topic campaigns example.

[@salaboy](http://twitter.com/salaboy) working on updating our gitbook (<https://activiti.gitbooks.io/activiti-7-developers-guide/content/> ) and looking into our modelling backend services. I helped also with reviewing and refactoring some of the bits inside of the Trending Topic Campaign Cloud Examples.

This week, we will start preparing for our December release, which is full of fixes and most importantly our demo scenario that demonstrate how to build, deploy and scale domain specific Activiti Cloud Applications. I (@salaboy) will be off for 3 weeks so I hope to see you all at [DevCon ‘18](http://devcon.alfresco.com).

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>

If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
