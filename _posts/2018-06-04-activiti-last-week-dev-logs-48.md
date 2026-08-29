---
title: "Activiti: Last week Dev Logs #48"
date: 2018-06-04 08:46:53 +0000
permalink: /2018/06/04/activiti-last-week-dev-logs-48/
description: "Last week we merged into our Incubator repository the first and initial version of our standalone Task Service created by @MiguelRuizDev."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "bpmn"
  - "business"
  - "cloud native"
  - "docker"
  - "microservices"
  - "open source"
  - "process"
original_url: https://www.salaboy.com/2018/06/04/activiti-last-week-dev-logs-48/
---

Last week we merged into our [Incubator repository](https://github.com/activiti/incubator) the first and initial version of our standalone Task Service created by [@MiguelRuizDev](https://github.com/MiguelRuizDev). Miguel is working on in this service while he is doing his internship here [@Alfresco](http://twitter.com/alfresco). We will iterate this service until we can merge it back and make it one of our core components. He is also working on an Angular Application to serve as the front end for this service, and it is a great opportunity for other community members to join us to improve this, still simple, service. The rest of the team is focused on shaping up the final bits of the Beta1 Release, where the two main areas of work are around: BPMN Cloud Signals and our new Runtime Java APIs.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) worked in the Task Manager UI, crafting a custom DataSource to populate the DataTable Angular Component, and improving the domain model in order for it to handle a richer server response, including links and pagination provided by the HAL format.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) made a lot of progress on <https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/38> BPMN Cloud Signals

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for import/export applications/models endpoints

[@pancudaniel7](https://github.com/pancudaniel7) Raised an issue regarding the action to delete application.properties from starter projects

[@lucianoprea](https://github.com/lucianoprea) worked on some helm charts

[@ryandawsonuk](https://github.com/ryandawsonuk) Was on holiday then set up an AWS cluster for Jenkins-X that uses dns.

[@erdemedeiros](https://github.com/erdemedeiros) Worked on events that are send by the runtime bundle to audit and query services so that they use the new Java API (work in progress).

[@salaboy](http://twitter.com/salaboy) working on improving the TTC BluePrint to work with Spring Cloud Kubernetes and the new Spring Cloud Gateway.

Next week, the Activiti Team will be presenting at two different conferences:

- JDK.io - Denmark, Copenhagen: [https://jdk.io](https://jdk.io/)
- JBCN Conf - Spain, Barcelona: <http://www.jbcnconf.com/2018/>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
