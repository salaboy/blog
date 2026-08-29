---
title: "Activiti: Last week Dev Logs #31"
date: 2018-02-05 08:32:05 +0000
permalink: /2018/02/05/activiti-last-week-dev-logs-31/
description: "Last week we closed several issues that we wanted to include in our January release. @ryandawsonuk did an amazing job at releasing and documenting the…"
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
  - "open source"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/02/05/activiti-last-week-dev-logs-31/
---

Last week we closed several issues that we wanted to include in our January release.  [@ryandawsonuk](https://github.com/ryandawsonuk) did an amazing job at releasing and documenting the procedure for our monthly releases which we will follow from now on, making sure that each member of the team can release when necessary. [@erdemedeiros](https://github.com/erdemedeiros) manage to finish some major improvements on connectors and [@ffazzini](http://github.com/ffazzini) introduced our microservices acceptance tests which will help us to improve the overall quality of all our modules. You can check out the release notes here:

[@igdianov](https://github.com/igdianov) was looking into security/authentication for websockets and gateway support for websockets.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) continued to the Investigation for [#1687](https://github.com/Activiti/Activiti/issues/1687) that signals are exchanged cross multiple Runtime Bundles(each database).Together he are also considering about Intermediate Throwing Message Event for #[1691](https://github.com/Activiti/Activiti/issues/1691).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) tested the spring-cloud-kubernetes-config functionality in activiti services inside kubernetes in the context of spring-cloud Finchley.M5 and spring-boot 2.0.0.M7

[@mteodori](https://github.com/mteodori) adding the snyk badge to repos [#1615](https://github.com/Activiti/Activiti/issues/1615)

[@lucianoprea](https://github.com/lucianoprea) did some improvement investigations about sleuth and logging [#1688](https://github.com/Activiti/Activiti/issues/1688) and start looking into add validation endpoint for Process Model Service [#1720](https://github.com/Activiti/Activiti/issues/1720)

[@ffazzini](http://github.com/ffazzini) finished the poc on acceptance tests (<https://github.com/activiti/activiti-cloud-acceptance-tests>). Also tried out activiti cloud deployment spike on pivotal PKS

[@balsarori](https://github.com/balsarori) closed some community issues around throw/catch signals which was merged to 5.x branch

[@ryandawsonuk](https://github.com/ryandawsonuk) Enabled turning off of graphQL and notifications via a property and carried out the monthly release.

[@erdemedeiros](https://github.com/erdemedeiros) finished work to get connectors using dedicated channels (<https://github.com/Activiti/Activiti/issues/1680>,  <https://github.com/Activiti/Activiti/issues/1681>) and updated related documentation (<https://github.com/Activiti/activiti-7-developers-guide/pull/12>); Created a reproducer for a trace id issue at Spring Cloud Sleuth (https://github.com/spring-cloud/spring-cloud-sleuth/issues/838).

[@salaboy](http://twitter.com/salaboy) worked on the Application Service first draft a RFC blog post is coming right after the release post.

This week we will be planning the [February milestone](https://github.com/Activiti/Activiti/milestone/8), so if you want to help us to shape the future of the project get in touch.

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>

If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
