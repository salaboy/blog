---
title: "Activiti: Last week Dev Logs #85"
date: 2019-03-05 08:00:11 +0000
permalink: /2019/03/05/activiti-last-week-dev-logs-85/
description: "Last week we worked on stabilizing our 7.0.x and 7.1.x release trains while we updated the docs and prepare the final details of our SR1 release which…"
tags:
  - "activiti7"
  - "basic"
  - "bpmn2"
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
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "cloud native"
  - "containers"
  - "docker"
  - "microservices"
  - "weekly"
original_url: https://www.salaboy.com/2019/03/05/activiti-last-week-dev-logs-85/
---

Last week we worked on stabilizing our 7.0.x and 7.1.x release trains while we updated the docs and prepare the final details of our SR1 release which includes some fixes but major compatibility improvements allowing easier integrations with other frameworks and other versions of JDK and Spring Boot.

[@CTI777](https://github.com/cti777) Worked on issues  #2272 (signal events) and #2515 (task variables)

[@igdianov](https://github.com/igdianov) worked on updating Quickstarts, PoC Helm unit tests, Activiti Helm Charts improvements, Runtime Bundle events aggregation execution context issue, and Jenkins-X updatebot multi-branch single PR issue

[@almerico](https://github.com/almerico) run 7.0.x pipeline  
<https://github.com/Activiti/Activiti/issues/2547>  
<https://github.com/Activiti/Activiti/issues/2552>  
<https://github.com/jenkins-x/jenkins-x-platform/pull/4910>

[@miguelruizdev](https://github.com/miguelruizdev) worked on the clean-up data endpoints and their test coverage.

[@ryandawsonuk](https://github.com/ryandawsonuk) Identified updatebot issue running 7.0.x release train on jenkins-x and [submitted PR to address it](https://github.com/jenkins-x/updatebot/pull/73). Resolved [problem with building acc scenarios](https://github.com/Activiti/Activiti/issues/2577). Identified pipeline reliability problems related to [pod operations](https://github.com/Activiti/Activiti/issues/2582) and [race conditions](https://github.com/Activiti/Activiti/issues/2587) and took first steps to resolving. Built images from 7.0.x branches [using script](https://github.com/Activiti/activiti-scripts/tree/testerfor70xtrain) started testing on it.

[@erdemedeiros](https://github.com/erdemedeiros) completed work to get XML BPMN file published to query service alongside with process definition.

[@salaboy](http://twitter.com/salaboy) worked preparing the SR1 release on the 7.0.0 release train, plus updated documentation in our gitbook. I’ve also submitted a proposal for the JHipster conference in Paris.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
