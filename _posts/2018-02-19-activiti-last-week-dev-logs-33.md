---
title: "Activiti: Last week Dev Logs #33"
date: 2018-02-19 09:37:38 +0000
permalink: /2018/02/19/activiti-last-week-dev-logs-33/
description: "Last week we made some progress on refining our services to support more scenarios and we included a new Angular 5 application to start building our Demo…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "workshop"
  - "activiti"
  - "BPM"
  - "cloud native"
  - "community"
  - "docker"
  - "open source"
original_url: https://www.salaboy.com/2018/02/19/activiti-last-week-dev-logs-33/
---

Last week we made some progress on refining our services to support more scenarios and we included a new Angular 5 application to start building our Demo UI against Activiti Cloud Services. [@igdianov](https://github.com/igdianov) provided support for GraphQL which is now being migrated to the new Angular 5 app. The new App is a great place to get involved with the project and to test the advantage of the new endpoints, APIs and feature. We keep our testing against PKS (Pivotal Container Services) and improving our [Trending Topics Campaign BluePrint](https://activiti.gitbooks.io/activiti-7-developers-guide/content/blueprints/trending-topic-campaigns/TrendingTopicCampaigns.html) to support more use cases.

[@diegonayalazo](https://github.com/diegonayalazo) worked on refining the Quickstarts in our GitBook and started working with our acceptance test project to improve our coverage during automation.

[@igdianov](https://github.com/igdianov) Integrated GraphQL Query support into Activiti-Cloud-Demo-Ui example using Apollo Client JS libraries: <https://github.com/Activiti/activiti-cloud-demo-ui/pull/3>

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on implementing Signal Throw Event Cloud Behavior that broadcasts signals to all Runtime Bundles by using Spring Cloud Stream.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for springfox-data-rest-patch and to enable swagger for process-model and organization services, worked for the fix on springfox side, started acceptance tests for modeling service

[@mteodori](https://github.com/mteodori) fixed latest Spring and Jackson security vulnerabilities <https://github.com/Activiti/Activiti/issues/1749> created a ticket for newly discovered Log4J one <https://github.com/Activiti/Activiti/issues/1767> and moved dependency-check to a profile to make build faster <https://github.com/Activiti/Activiti/issues/1762>

[@lucianoprea](https://github.com/lucianoprea) created an endpoint to validate BPMN models correctness that should be triggered before saving a new Process Model

[@ffazzini](http://github.com/ffazzini) automated deployment <https://github.com/Activiti/Activiti/issues/1730> and investigation around performance test solutions

[@balsarori](https://github.com/balsarori) Helped with investigating how suspend/activate events work. Started to work on simplifying extendability of ServiceTaskParseHandler on 5.x.

[@ryandawsonuk](https://github.com/ryandawsonuk) has been adding access control on the REST part of the query module. This has required some refactoring of the access control implementation on the runtime bundle and ensuring that further data is fed through into query.

[@erdemedeiros](https://github.com/erdemedeiros) kept working on the PoC to support Alfresco REST APIs guidelines (<https://github.com/Activiti/Activiti/issues/1419>). Some work still need to be done concerning pagination.

[@salaboy](http://twitter.com/salaboy) worked on improving the Trending Topic Campaings BluePrint (<https://github.com/Activiti/blueprint-trending-topic-campaigns/pull/2> ) and started a deeper research on how to use [Spring Cloud Kubernetes](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes) Config and Registry modules. Also did some research on Kubernetes Service Catalog and how this will related to [Spring Cloud Kubernetes](https://github.com/kubernetes-incubator/service-catalog).

Check the [February milestone](https://github.com/Activiti/Activiti/milestone/8) to find the issues that we are currently working on this month and get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;) If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
