---
title: "Activiti: Last week Dev Logs #86"
date: 2019-03-11 08:35:01 +0000
permalink: /2019/03/11/activiti-last-week-dev-logs-86/
description: "Last week we released Activiti Cloud SR1 containing some major compatibility improvements. At the same time we triaged the issues for our 7.1.0.M1…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "BPMS"
  - "cloud native"
  - "containers"
  - "docker"
  - "k8s"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2019/03/11/activiti-last-week-dev-logs-86/
---

Last week we released Activiti Cloud SR1 containing some major compatibility improvements. At the same time we triaged the issues for our 7.1.0.M1 Milestone that you can follow here: (<https://github.com/activiti/activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3A7.1.0.M1>)

There are still issues being triaged, and the date has been set to April 10, 2019. We will prioritize adding support for more BPMN elements and polishing the modeling services.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) cleanup of unused imports and unused dependencies in modeling

[@igdianov](https://github.com/igdianov) worked on fixing [Events related to different process instances may be collected in one bunch](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/257) and minor Helm chart improvements to [enable RabbitMq persistentVolume](https://github.com/Activiti/activiti-cloud-charts/pull/58) in Activiti Cloud Charts

[@miguelruizdev](https://github.com/miguelruizdev) worked on the removal of the process instance description field on the cloud side (<https://github.com/Activiti/Activiti/issues/2510>), tested call activities at the starter level (<https://github.com/Activiti/Activiti/pull/2604>) and polished rough edges in the clean-up endpoints enablement based on properties (<https://github.com/Activiti/activiti-cloud-query-service/pull/196/files>)..

**[@ryandawsonuk](https://github.com/ryandawsonuk)** worked on several issues related to edge cases for the reliability of the Activiti Jenkins-X pipelines and on an activiti [presentation for london devops](https://www.meetup.com/London-DevOps/events/259388318/)

[@erdemedeiros](https://github.com/erdemedeiros) completed work to get new update task variable endpoint available for admin (<https://github.com/Activiti/Activiti/issues/2515>). Investigated problem related Java client generated from swagger specification (https://github.com/Activiti/Activiti/issues/2588).

[@salaboy](http://twitter.com/salaboy) worked on testing SR1 and improving docs while attending several meetings for planning and understanding the scope of 7.1.0.M1.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
