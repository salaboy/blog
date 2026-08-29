---
title: "Activiti: Last week Dev Logs #49"
date: 2018-06-11 13:13:17 +0000
permalink: /2018/06/11/activiti-last-week-dev-logs-49/
description: "Last week we made some huge progress on the new Java Runtime APIs and refinements in our building blocks to make sure that applications can be built…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "cloud native"
  - "community"
  - "docker"
  - "open source"
  - "progress"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/06/11/activiti-last-week-dev-logs-49/
---

Last week we made some huge progress on the new Java Runtime APIs and refinements in our building blocks to make sure that applications can be built without the need of heavy customization and tuning. The Trending Topics Blueprint is being simplified and cleaned up to make sure we reduce the clutter required by developers when domain specific extensions.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) started to work with Docker, connecting the Task Manager Service to a Postgresql database running in a Docker container.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on creating examples and acceptance tests about BPMN Cloud Signals.

<https://github.com/Activiti/activiti-cloud-examples/tree/feature/daisuke-1687-signal-cloud>

<https://github.com/Activiti/example-runtime-bundle/tree/feature/daisuke-1687-signal-cloud>

Also, he is working on Investigating about the issue [#1902](https://github.com/Activiti/Activiti/issues/1902).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for import application from zip files to support application distribution and release

[@ryandawsonuk](https://github.com/ryandawsonuk) Started work on finding the best configuration for a runtime bundle to work with rabbit and keycloak in Jenkins-X. Then paused that to prepare the presentation for next week’s [JDK.IO](https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation) conference.

[@erdemedeiros](https://github.com/erdemedeiros) Worked on events that are send by the runtime bundle to audit and query services so that they use the new Java API(work in progress). Same for the reception of events at the query side (work in progress). Prepared the presentation for next week’s [JDK.IO](https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation) conference.

[@salaboy](http://twitter.com/salaboy) worked on the TTC BluePrint to optimize the usage of building blocks. Now the blueprint is using Spring Cloud Kubernetes Config and the new Spring Cloud Gateway with Spring Cloud Kubernetes Discovery.

This week, we will be presenting at [JDK.IO](https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation) and [JBCNconf](http://www.jbcnconf.com/2018/infoTalk.html?id=24). But feel free to ping us in Gitter, we should be around finishing up the pending topics for our Beta1 release.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
