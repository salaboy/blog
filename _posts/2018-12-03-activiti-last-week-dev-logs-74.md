---
title: "Activiti: Last week Dev Logs #74"
date: 2018-12-03 13:35:56 +0000
permalink: /2018/12/03/activiti-last-week-dev-logs-74/
description: "Last week we worked hard into stabilizing all projects for Beta4. While working on new features and bug fixes we also improve our pipelines and release…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "ci/cd"
  - "cloud native"
  - "containers"
  - "docker"
  - "process"
  - "spring"
  - "spring boot"
original_url: https://www.salaboy.com/2018/12/03/activiti-last-week-dev-logs-74/
---

Last week we worked hard into stabilizing all projects for Beta4. While working on new features and bug fixes we also improve our pipelines and release scripts making sure that as soon as we are doing with merging all the involved PRs we can do Beta4. We are hoping to be able to release by the end of the week and including the remaining set of issues listed in our Beta4 milestone: <https://github.com/Activiti/Activiti/issues/2119>

[@CTI777](https://github.com/cti777) Implemented support for update process properties API with tests

https://github.com/Activiti/activiti-api/pull/57

https://github.com/Activiti/activiti-cloud-api/pull/37

https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/161

https://github.com/Activiti/activiti-cloud-audit-service/pull/92

https://github.com/Activiti/activiti-cloud-query-service/pull/131

[@almerico](https://github.com/almerico) Moving JX example repositories pipelines with updatebot to mergify and Master Jenkins Cluster

[@igdianov](https://github.com/igdianov) worked on the stability of pipelines for core and cloud repositories.

[@balsarori](https://github.com/balsarori) worked on tasks variable mappings

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked on model verifications for community

[@miguelruizdev](https://github.com/miguelruizdev) kept working on the conformance test sets 0, 1 and 2.

[@ryandawsonuk](https://github.com/ryandawsonuk) resolved [issue](https://github.com/Activiti/Activiti/issues/2201) so that we can use spring boot 2.1 without having to enable bean overriding. Updated [release scripts](https://github.com/Activiti/activiti-scripts/pull/12) to look for a master branch when develop isn’t present.

[@erdemedeiros](https://github.com/erdemedeiros) added acceptance test covering process definitions on query service. Investigated issue related to messages not being delivered in some cases (problem solved by setting the property "requiredGroups" in the producer, see https://docs.spring.io/spring-cloud-stream/docs/current/reference/htmlsingle/#_producer_properties).

[@salaboy](http://twitter.com/salaboy) attended AWS reInvent and worked with [@igdianov](https://github.com/igdianov) to improve our release pipelines which are now integrated with mergify.io

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
