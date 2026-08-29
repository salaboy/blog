---
title: "Activiti: Last week Dev Logs #80"
date: 2019-01-31 11:00:41 +0000
permalink: /2019/01/31/activiti-last-week-dev-logs-80/
description: "Last week we worked hard on getting RC1 out of the door with support for JDK 11 and a new Notification Service providing GraphQL queries and…"
tags:
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
  - "process"
original_url: https://www.salaboy.com/2019/01/31/activiti-last-week-dev-logs-80/
---

Last week we worked hard on getting RC1 out of the door with support for JDK 11 and a new Notification Service providing GraphQL queries and subscriptions. You can see the [release notes here](/2019/01/30/activiti-cloud-rc1-released/). We are quickly moving to a GA release so we are polishing our APIs, Docker Images and HELM charts to provide a good experience for our first GA release.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked for [the issue about history table configuration](https://github.com/Activiti/Activiti/issues/2228).

[@mteodori](https://github.com/mteodori) [#2406](https://github.com/Activiti/Activiti/issues/2406) Allow using https in acceptance tests

[@CTI777](https://github.com/cti777) Worked on following issues: #2371 Add admin complete task endpoint #2372 Add-admin update task endpoint #2373 Add admin delete task endpoint #2336 Activiti Cloud Notifications GraphQL Service and Microservice Example #2393 Start Process inconsistency of parameter name in request response for process name

[@almerico](https://github.com/almerico) Worked on Java11 issues and pipelines updates.

[@igdianov](https://github.com/igdianov) worked on graphQL HELM charts and the RC1 release

[@miguelruizdev](https://github.com/miguelruizdev) worked on the [addition of sequence number and message id](https://github.com/Activiti/Activiti/issues/2142) for events in Audit service

[@ryandawsonuk](https://github.com/ryandawsonuk) did first version of presentation for devcon before focusing on porting TTC to java11, getting the pipelines passing and running the release of RC1.

[@erdemedeiros](https://github.com/erdemedeiros) worked with [@CTI777](https://github.com/cti777) to release new admin REST endpoints. Worked with [@salaboy](http://twitter.com/salaboy) on DevCon presentation for the next week.

[@salaboy](http://twitter.com/salaboy) worked on RC1 and DevCon presentation, did a PoC on a custom [Activiti Cloud Kubernetes Operator](https://github.com/salaboy/activiti-cloud-apps-operator)

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
