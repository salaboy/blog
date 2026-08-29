---
title: "Activiti 7: Last week Dev Logs #22"
date: 2017-12-04 15:34:40 +0000
permalink: /2017/12/04/activiti-7-last-week-dev-logs-22/
description: "Last week we upgraded to Spring Boot M6 and Spring Cloud M4 to make sure that our November Early Access Release was aligned with SB/SC release train."
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "spring cloud"
  - "workflow"
  - "community"
  - "distributed"
  - "docker"
  - "microservices"
  - "open source"
  - "progress"
  - "weekly"
original_url: https://www.salaboy.com/2017/12/04/activiti-7-last-week-dev-logs-22/
---

Last week we upgraded to Spring Boot M6 and Spring Cloud M4 to make sure that our [November Early Access Release](/2017/12/04/activiti-activiti-cloud-7-201711-ea-are-out/) was aligned with SB/SC release train. We are making progress into using more Cloud components such as distributed tracing, logging and monitoring.

[@willkzhou](https://github.com/willkzhou) Pushed **Elasticsearch** implementation to separate repo created by Salaboy. Need to test Elasticsearch implementation locally first then test using a Docker image before sending for review to Mauricio et al. Updated Elastic POM files to match current release.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on [adding ability](https://github.com/Activiti/Activiti/issues/1534) to activiti-cloud-runtime-bundle-service to start a process instance by process definition key. Also, he is writing Japanese blog posts about Activiti through the project called [Activiti Advent Calendar 2017](https://qiita.com/advent-calendar/2017/activiti). He will write about Activiti 7 in the last week.

[@igdianov](https://github.com/igdianov) - Implementing GraphQL Websocket subprotocol in Spring Websocket Message Broker. Fixed signal events throw/catch race conditions in process instance scope (PR #1590) in Activiti engine 5.x

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) more work on adding versions to process models

[@lucianoprea](https://github.com/lucianoprea) more work on the [Activiti Cloud Service Organization](https://github.com/Activiti/activiti-cloud-org-service/pull/1)

[@ffazzini](http://github.com/ffazzini) logging based on ELK and kubernetes investigation

[@ryandawsonuk](https://github.com/ryandawsonuk) completed changes to runtime bundle to support security restrictions by process definition and added remote debugging options to all the docker images.

[@erdemedeiros](https://github.com/erdemedeiros) upgraded to Spring Boot 2.0.0.M6 and worked on the release 7-201711-EA.

[@salaboy](http://twitter.com/salaboy) worked on enabling the Activiti Cloud Twitter example to work on Kubernetes and checked the released artifacts for correctness. This helped me to improve our Activiti Cloud Connectors started and a second iteration was included in our November Early Access Release. I’ve also checked the Runtime Bundle Security Policies initial implementation Pull Request.

[We updated the Activiti & Activiti Cloud Project roadmap where we added more milestones covering the first 3 months of next year into our plans.](/2017/12/04/activiti-activiti-cloud-roadmap-update-4-12-17/)

This week we will upgrade to **Spring Boot M7** and **Spring Cloud M5** followed by a set of refinements to our services. We are planning to make a short XMas release before the end of the year, and we want to make sure that this release includes a set of improvements in our services such as Logging using the ELK stack or something similar, some fixes in our REST APIs and the Activiti Cloud Twitter example up and running.

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>

If you want to get started with [[Activiti Cloud visit our Gitbook]](https://activiti.gitbooks.io/activiti-7-developers-guide/content/)
