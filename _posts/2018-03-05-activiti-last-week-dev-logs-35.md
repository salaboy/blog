---
title: "Activiti: Last week Dev Logs #35"
date: 2018-03-05 12:10:32 +0000
permalink: /2018/03/05/activiti-last-week-dev-logs-35/
description: "Last week we spend a lot of time working and reshaping our maven structure to improve how dependencies are managed across our repositories."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "cloud native"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/03/05/activiti-last-week-dev-logs-35/
---

Last week we spend a lot of time working and reshaping our maven structure to improve how dependencies are managed across our repositories. This is our third iteration around this topic and it is always painful but it is getting better. [@mteodori](https://github.com/mteodori) also introduced a new repository called [“activiti-scripts”](https://github.com/activiti/activiti-scripts) which includes some handy scripts to clone and build all our repositories at once.

[@diegonayalazo](https://github.com/diegonayalazo) working on acceptance tests for our Trending Topic Campaigns BluePrint.

[@igdianov](https://github.com/igdianov) exposing our notifications mechanisms right into our gateway component, which makes the architecture and security mechanisms much more simple.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on refactoring the pull requests about Signal Throw Event Cloud Behavior.<https://github.com/Activiti/Activiti/pull/1783> <https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/38>

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) added acceptance tests scenarios: “create a group”, “create a subgroup”, “create a project”, “create a process model in a project”, “create the second version of an existing version of a process model”

[@lucianoprea](https://github.com/lucianoprea) did some changes on the validation endpoint for Process Model Service to be available in Organization Service and looked over the issues that are currently blocking the development demo-ui app.

[@mteodori](https://github.com/mteodori) POM cleanup <https://github.com/Activiti/Activiti/issues/1675>, update to Spring Cloud M7  <https://github.com/Activiti/Activiti/issues/1790> and fixing demo UI client for ADF <https://github.com/Activiti/Activiti/issues/1805>

[@ffazzini](http://github.com/ffazzini) https://github.com/Activiti/Activiti/issues/1698

[@balsarori](https://github.com/balsarori) Created pull request to move MQServiceTaskBehvior dependency (via expression) outside engine (Acitiviti/Activiti) and another pull request to include it in runtime bundle.

[@ryandawsonuk](https://github.com/ryandawsonuk) created pull requests to send task candidate events to the query module (<https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/39>) and use them to add access-restrictions (<https://github.com/Activiti/activiti-cloud-query-service/pull/25>)

[@erdemedeiros](https://github.com/erdemedeiros) fixed pagination metadata Alfresco REST APIs guidelines PoC (<https://github.com/Activiti/Activiti/issues/1419>).

[@salaboy](http://twitter.com/salaboy) worked on the spring cloud kubernetes PR for Spring Boot 2: [https://github.com/spring-cloud-incubator/spring-cloud-kubernetes/pull/152](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes/pull/152#discussion_r171418601) still adding refining and adding examples. Also published a couple of videos about [Activiti Cloud Overview and the Trending Topic Campaigns BluePrint](/2018/02/27/activiti-cloud-overview-blueprint/)

This week we will be presenting at the [London Microservices Meetup](/2018/03/02/save-the-day-london-uservices-meetup-wednesday-march-7-2018/), if you are around try to join us. After the meetup we will start our Early Access release process for our February milestone.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
