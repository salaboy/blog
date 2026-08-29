---
title: "Activiti: Last week Dev Logs #36"
date: 2018-03-12 08:24:11 +0000
permalink: /2018/03/12/activiti-last-week-dev-logs-36/
description: "Last week we spend most our energies in finalizing pending issues from February milestone. We are quite close to finish these issues and to proceed with…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/03/12/activiti-last-week-dev-logs-36/
---

Last week we spend most our energies in finalizing pending issues from February milestone. We are quite close to finish these issues and to proceed with the release almost 12 days after the deadline. We prioritized heavy changes in our POM structures which as usual introduced delays and impact how the release gets done. We were also focused on the [London Microservices Meetup](/2018/03/12/activiti-london-uservices-meetup-7-3-18/) presentations, which was a complete success, due the amount of attendees and the quality of feedback that we received.

This week will be all about getting the release out and planning for the most important bits that we want to include in our soon to come first Beta release. If there is something that you want to see in there get in touch, create an issue or jump in our Gitter channel so we can have a chat.

[@igdianov](https://github.com/igdianov) was working on security at the Gateway level to support websocket and graphql subscriptions at that layer instead of services behind the Gateway.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) was working on signalling and messaging between processes in cloud architectures.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) added query service layer to acceptance tests, closed <https://github.com/Activiti/Activiti/issues/1747>, implemented delete process instance rest endpoint (<https://github.com/Activiti/Activiti/issues/1809> )

[@lucianoprea](https://github.com/lucianoprea) fixed some issues between process-model-service and organization-service regarding the validation of a process-model, created a PR for [#1770](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/44) and start working on [#1803](https://github.com/Activiti/Activiti/issues/1803)

[@mteodori](https://github.com/mteodori) pom refactorings and spring boot/spring cloud version upgrade

[@ffazzini](http://github.com/ffazzini) performance tests based on gatling created <https://github.com/Activiti/Activiti/issues/1735>

[@ryandawsonuk](https://github.com/ryandawsonuk) refined the PRs for access-restrictions functionality for the query-service module, added endpoints to query and runtime bundle with wider data visibility. The new endpoints can be made admin-only using a flag and the GraphQL endpoint can also be made admin-only in the same way (since it also has wide data visibility).

[@erdemedeiros](https://github.com/erdemedeiros) refined Alfresco REST APIs guidelines PoC (<https://github.com/Activiti/Activiti/issues/1419>); Reviewed pull requests.

[@salaboy](http://twitter.com/salaboy) was working on </2018/03/12/activiti-london-uservices-meetup-7-3-18/> and <https://github.com/spring-cloud-incubator/spring-cloud-kubernetes/pull/152>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
