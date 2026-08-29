---
title: "Activiti: Last week Dev Logs #82"
date: 2019-02-12 09:14:44 +0000
permalink: /2019/02/12/activiti-last-week-dev-logs-82/
description: "Last week we work hard on improving acceptance tests coverage and rest endpoint refiningments. As you can see there was a quite active week all over the…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "case management"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "BPM"
  - "cloud native"
  - "containers"
  - "docker"
  - "microservices"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2019/02/12/activiti-last-week-dev-logs-82/
---

Last week we work hard on improving acceptance tests coverage and rest endpoint refiningments. As you can see there was a quite active week all over the place. We got great contributions from [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) refining warning and runtime behaviour for our services. Our pipelines are improving every week and we are fine tuning our services to boot up even faster. This week is going to be all about wrapping the first GA release, there is still a lot of work to do, but we are confident that we can release the first cut of the Activiti Cloud Cloud Native approach. We are confident that we can use this release as base layer to keep improving and adding functionalities.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on [adding warning if process has the async=true property](https://github.com/Activiti/Activiti/issues/2440)

[@CTI777](https://github.com/cti777) Worked on following API issues mostly in runtime bundle and query service: #2390, #2439, #1953, #2381, #1954, #2464

[@Cristian Florescu](https://github.com/cristianflorescu) worked on update instance variables (<https://github.com/Activiti/Activiti/issues/2445>): done; worked on acc tests for updating instance variables [(https://github.com/Activiti/Activiti/issues/2465](https://github.com/Activiti/Activiti/issues/2465)): wip

[@almerico](https://github.com/almerico)

Working on reliability of pipelines  #2430,#2454,#2472,#247,#2327,#2269,#2446

[@igdianov](https://github.com/igdianov)   
Completed PRs:

- [Activiti/activiti-cloud-connector-quickstart](https://github.com/Activiti/activiti-cloud-connector-quickstart) [Upgrade Activiti Cloud Connector Quickstart to 7.0.0.RC1 and Java 11](https://github.com/Activiti/activiti-cloud-connector-quickstart/pull/3)
- [Activiti/activiti-cloud-runtime-bundle-quickstart](https://github.com/Activiti/activiti-cloud-runtime-bundle-quickstart) [Upgrade Activiti Rb Quickstart to 7.0.0.RC1 and Java](https://github.com/Activiti/activiti-cloud-runtime-bundle-quickstart/pull/3)
- [Activiti/activiti-cloud-notifications-service-graphql](https://github.com/Activiti/activiti-cloud-notifications-service-graphql) [fix: (GraphiQL) move to /graphiql](https://github.com/Activiti/activiti-cloud-notifications-service-graphql/pull/12)
- [Activiti/activiti-cloud-notifications-service-graphql](https://github.com/Activiti/activiti-cloud-notifications-service-graphql) [Fix Cloud Build Dependency Management Priority](https://github.com/Activiti/activiti-cloud-notifications-service-graphql/pull/11)
- [Activiti/activiti-cloud-runtime-bundle-quickstart](https://github.com/Activiti/activiti-cloud-runtime-bundle-quickstart) [Disable Jenkins-X Draft Maven pack application](https://github.com/Activiti/activiti-cloud-runtime-bundle-quickstart/pull/2)
- [Activiti/activiti-cloud-connector-quickstart](https://github.com/Activiti/activiti-cloud-connector-quickstart) [Disable Jenkins-X Maven Draft pack generation](https://github.com/Activiti/activiti-cloud-connector-quickstart/pull/2)

WIP:

- [Activiti/Activiti](https://github.com/Activiti/Activiti) [Let's create Activiti Cloud Application Helm Chart Quickstarts](https://github.com/Activiti/Activiti/issues/2448)

[@miguelruizdev](https://github.com/miguelruizdev) worked on the addition of admin endpoints across our services to delete standalone tasks.

[@ryandawsonuk](https://github.com/ryandawsonuk) upgraded app versions of spring cloud, boot and spring cloud kubernetes. Worked through the projects resolving the problems. Merged various PRs in activiti-cloud-charts and tested the resulting charts on different clusters.

[@erdemedeiros](https://github.com/erdemedeiros) worked on connector variable mapping (<https://github.com/Activiti/Activiti/issues/2213>): almost done for activiti core; some work still remaining for runtime bundle.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) Added connector model types, connectors validation, testing modeler app FE + BE

[@salaboy](http://twitter.com/salaboy) worked on defining Variables Mapping backend work and tagged interfaces for Deprecation and Internal usage. Also reviewed around 40+ PRs.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
