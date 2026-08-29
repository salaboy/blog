---
title: "Activiti: Last week Dev Logs #32"
date: 2018-02-12 08:24:29 +0000
permalink: /2018/02/12/activiti-last-week-dev-logs-32/
description: "Last week we focused on planning and making sure that we polish our getting started experience."
tags:
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
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/02/12/activiti-last-week-dev-logs-32/
---

Last week we focused on planning and making sure that we polish our getting started experience. You will notice that we are refactoring our [GitBook](https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/getting-started.html) and our [activiti-cloud-examples](https://github.com/activiti/activiti-cloud-examples/tree/develop) repository to reduce the learning curve and the number of steps required to get our infrastructure up and running. We will continue this refinement process with our [Trending Topic BluePrint which was moved to a separate GitHub](https://github.com/Activiti/blueprint-trending-topic-campaigns) repository now (we will also publish ready to be used Docker Images for this example to simply testing in different cloud providers). There is some important work around APIs, Deployments to different cloud providers, Application Service and Modelling Services all good places for getting started as a community contributor.

[@igdianov](https://github.com/igdianov) worked on WS security PoC for graphql subscriptions.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) interrupted investigating about Message Throw Event Behavior and experimentally started to [implementing Signal Throw Event Cloud Behavior](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/tree/feature/daisuke-1687-signal-cloud).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) investigated usage of spring-cloud-kubernetes-discovery with spring-cloud Finchley.M5 and spring-boot 2.0.0.M7 in activiti, added deployment descriptors for modeling service, updated postman collections, working for fixing swagger in modeling service

[@mteodori](https://github.com/mteodori) adding the [Meterian](https://www.meterian.com/) badge to repos [#1734](https://github.com/Activiti/Activiti/issues/1734)

[@lucianoprea](https://github.com/lucianoprea) worked on support for validate BPMN models [#1720](https://github.com/Activiti/Activiti/issues/1720) in process-model-services

[@ffazzini](http://github.com/ffazzini) deployed activiti to PKS and reported to Pivotal few problems with elasticsearch and kubectl command outputs <https://github.com/Activiti/Activiti/issues/1722> , fixed the last swagger issues in activiti <https://github.com/Activiti/Activiti/issues/1555>

[@balsarori](https://github.com/balsarori) fixed 6.x UI startup issue,reviewed & merged 5.x PRs regarding historic persistence [#1612](https://github.com/Activiti/Activiti/pull/1612)

[@ryandawsonuk](https://github.com/ryandawsonuk) Set up a rabbitmq docker image with stomp plugin enabled so that it is deployed with and used by the rest of the Activiti components and disabled websockets for deployments where the stomp plugin isn’t currently available (and trying to find out how to make it available). Documented how to run notifications for GraphQL in a separate container from query. Produced an RFC document for access control on the REST part of the query module.

[@erdemedeiros](https://github.com/erdemedeiros) worked on a PoC to support an additional media type that provides response contents in conformance with Alfresco Guidelines for REST APIs (<https://github.com/Activiti/Activiti/issues/1419#issuecomment-364043760>). Good progress in the response content itself, but there are some challenges regarding pagination.

[@salaboy](http://twitter.com/salaboy) worked on the trending topic blueprint (<https://github.com/Activiti/blueprint-trending-topic-campaigns>), moved it to a new repo and added more endpoints to each microservice to have more control over the scenario. I also attended the Makers Faire Lille, France where we printed the brand new Activiti & Activiti Cloud logo using a Portrait Painter Robot: [tweet https://twitter.com/salaboy/status/962631998857674752]

Check the [February milestone](https://github.com/Activiti/Activiti/milestone/8) to find the issues that we are currently working on this month and get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;) If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
