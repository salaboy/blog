---
title: "Activiti: Last week Dev Logs #60"
date: 2018-08-29 04:38:45 +0000
permalink: /2018/08/29/activiti-last-week-dev-logs-60/
description: "Last week we worked hard into out Continuous Delivery approach. We did work with Spring Cloud Kubernetes and Jenkins X projects to improve their support…"
tags:
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "community"
  - "microservices"
  - "open source"
  - "process"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/08/29/activiti-last-week-dev-logs-60/
---

Last week we worked hard into out Continuous Delivery approach. We did work with Spring Cloud Kubernetes and Jenkins X projects to improve their support for chained pipelines and Service Discovery. At the same time we started migrating our Blueprint TTC (Trending Topics Campaign) to Beta1, this included the addition of SSO which impacts how the Front End Application communicate with the backend services. This last part is still work on progress. But we already updated the workshop instructions to work against the backend that consume [Beta1 artifacts](https://github.com/Activiti/ttc-docs/blob/develop/workshop.md).

This week we will finish the migration and we will move forward our CD changes in our repositories.

[@ffazzini](http://github.com/ffazzini) worked on connectors and cloud connectors definitions internal parser libraries

[@lucianoprea](https://github.com/https://github.com/lucianoprea) - holidays -

[@balsarori](https://github.com/balsarori) Reviewing and testing PR [#1912](https://github.com/Activiti/Activiti/pull/1912)

[@igdianov](https://github.com/igdianov) - Worked on solving problem with running integration tests with Docker containers in Jenkins X. Worked on testing and setting automated project dependencies updates in Jenkins X using updatebot. :) Fixed updatebot to allow pushing changes to downstream repos with custom branches.

[@cristina-sirbu](https://github.com/cristina-sirbu) Worked on the helm chart for Activiti Cloud Event Adapter.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) - holidays -

[@almerico](https://github.com/almerico) Worked on process services helm configurations.

[@miguelruizdev](https://github.com/miguelruizdev) worked on the ttc workshop, spotting  and reporting some misbehaviours in the query campaign service and implementing keycloak to the ttc-dashboard ui.

[@ryandawsonuk](https://github.com/ryandawsonuk) Refactored activiti-build, Activiti and activiti-api repos in forks to fit with a PoC for continuous delivery. Set these repos up to push versions in Jenkins-X pipelines with updatebot and identified issues with pushing to parent section (for which salaboy submitted an PR) and non-master branches (for which igdianov submitted a PR).

[@erdemedeiros](https://github.com/erdemedeiros) - paternity leave -

[@salaboy](http://twitter.com/salaboy) working on Spring Cloud Kubernetes Discovery filtering to be used in our Gateway and Application Service. Worked on the Jenkins X updatebot to support parent child updates.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
