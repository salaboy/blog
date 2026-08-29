---
title: "Activiti: Last week Dev Logs #34"
date: 2018-02-26 08:21:14 +0000
permalink: /2018/02/26/activiti-last-week-dev-logs-34/
description: "Last week was all about adding support for more scenarios into our building blocks. @ryandawsonuk, @daisuke-yoshimoto and @igdianov work is helping us to…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "business"
  - "cloud native"
  - "docker"
  - "microservices"
  - "process"
original_url: https://www.salaboy.com/2018/02/26/activiti-last-week-dev-logs-34/
---

Last week was all about adding support for more scenarios into our building blocks. [@ryandawsonuk](https://github.com/ryandawsonuk), [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) and [@igdianov](https://github.com/igdianov) work is helping us to have a coherent set of services that supports a wide range of business use cases using a Cloud Native Approach. While [@lucianoprea](https://github.com/lucianoprea) and [@constantin-ciobotaru](https://github.com/constantin-ciobotaru) are polishing our modelling backend services to support the new generation set of tools for building Activiti Cloud Applications.

[@diegonayalazo](https://github.com/diegonayalazo) is working on the acceptance tests for our BluePrint scenario.

[@igdianov](https://github.com/igdianov) got the initial version of GraphQL and Keycloak integration to secure our Subscription (push notification) mechanism.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto)  is working on implementing Signal Throw Event Cloud Behavior that broadcasts signals to all Runtime Bundles by using Spring Cloud Stream. <https://github.com/Activiti/Activiti/pull/1783> <https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/38>

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) acceptance tests for modeling service using jbehave, feign, spring

[@lucianoprea](https://github.com/lucianoprea) some extra work on the endpoint to validate BPMN models and support for variables controllers in runtime-bundle

[@mteodori](https://github.com/mteodori) moved from Log4J to Logback to fix <https://github.com/Activiti/Activiti/issues/1749> and implemented update to Spring Boot RC1 and pom changes to be reviewed, Spring Cloud update postponed due to issues in Spring Cloud Sleuth

[@ffazzini](http://github.com/ffazzini) created new env and partial deployment for admin up supporting new DBP deployment structure <https://github.com/Activiti/Activiti/issues/1780> , verified that activiti7 deployment on PKS includes also elastic now so all building blocks work now.

[@balsarori](https://github.com/balsarori) Worked on simplifying extendability of ServiceTaskParseHandler on 6.x. Fixed Activiti extensions 5.18 XML schema (xsd) on 6.x branch and created another PR for develop

[@ryandawsonuk](https://github.com/ryandawsonuk) Added restrictions to REST part of query to control access to process instances by process definition. Started work on restrictions for tasks so that tasks in query module’s REST endpoints can be restricted to candidates and assignees.

[@erdemedeiros](https://github.com/erdemedeiros) - out last week -

[@salaboy](http://twitter.com/salaboy) was working on improving the Trending Topic Campaigns BluePrint and adding support for new events to be emitted and consumed by our building blocks.

This week will be all about closing and triaging as many issues as possible to go over the monthly release process. We are aiming to finish some big chunks of work before doing the February Early Access Release, and for that reason we might push the release to early next week.

Check the [February milestone](https://github.com/Activiti/Activiti/milestone/8) to find the issues that we are currently working on this month and get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;) If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
