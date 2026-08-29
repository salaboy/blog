---
title: "Activiti: Last week Dev Logs #56"
date: 2018-07-31 13:41:06 +0000
permalink: /2018/07/31/activiti-last-week-dev-logs-56/
description: "Last week we manage to finish and polish the second round on the APIs refactoring and we attended an AWS 2 days training for cloud deployments."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "bpmn"
  - "cloud native"
  - "spring boot"
original_url: https://www.salaboy.com/2018/07/31/activiti-last-week-dev-logs-56/
---

Last week we manage to finish and polish the second round on the APIs refactoring and we attended an AWS 2 days training for cloud deployments. We already started a third iteration around the Java Runtime APIs related to security, security policies and further refinements on usability. This week we will be moving forward this work to close Beta1 release. We are also doing some testing on Pivotal PKS to validate that our HELM charts are supported across different cloud providers.

[@igdianov](https://github.com/igdianov) worked on a PoC for Activiti Cloud

[@almerico](https://github.com/almerico) Working on running latest runtime-bundle and Activiti cloud infrastructure with latest JenkinsX release.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on

[@miguelruizdev](https://github.com/miguelruizdev) worked on activiti-cloud-acceptance-tests, adding a new security policies module and refactoring default process definitions and users to specific ones. Attended AWS training.

[@balsarori](https://github.com/balsarori) helped with some extensions to the engine APIs to support Owner queries for tasks.

[@mteodori](https://github.com/mteodori) fixed Batik vulnerability

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) - holidays -

[@ryandawsonuk](https://github.com/ryandawsonuk) Added a connector process to the example-runtime-bundle and a connector chart to activiti-cloud-charts then tested the example connector image. Started working with [@miguelruizdev](https://github.com/miguelruizdev) to improve the acceptance-tests with some refactoring to support adding tests for security-policies and for the example connector scenario. Attended AWS + EKS training.

[@erdemedeiros](https://github.com/erdemedeiros) worked with @salaboy on the next iteration for the Java API. Added Activiti Spring Boot starter to Activiti/Activiti. Attended AWS + EKS training.

[@salaboy](http://twitter.com/salaboy) worked on the 3rd round of refactorings for the API, now focused on security and security policies. Attended AWS + EKS training.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
