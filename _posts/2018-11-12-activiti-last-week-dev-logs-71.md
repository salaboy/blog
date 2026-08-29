---
title: "Activiti: Last week Dev Logs #71"
date: 2018-11-12 10:50:03 +0000
permalink: /2018/11/12/activiti-last-week-dev-logs-71/
description: "Last week we worked quite hard to close some critical issues to be able to release Beta3, which is now work in progress."
tags:
  - "activiti7"
  - "BPM"
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
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "containers"
  - "distributed"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/11/12/activiti-last-week-dev-logs-71/
---

Last week we worked quite hard to close some critical issues to be able to release Beta3, which is now work in progress. You can find the issues that we manage to close here: <https://github.com/Activiti/Activiti/milestone/15?closed=1> . Most of the work that we are planning for Beta4 is about Conformance Tests, Acceptance Tests and automation to make sure that our release cycles can include more value after each iteration. We are currently looking into automate our examples layer to maintain a stable environment where we can promote new versions of the libraries as explained here: </2018/11/05/activiti-cloud-ci-cd-approach-for-java-libraries-and-beyond/>

[@igdianov](https://github.com/igdianov) worked on decorating events with BusinessKey for correlation

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked on modeling side to adapt the ModelService to json based model types

[@miguelruizdev](https://github.com/miguelruizdev) worked on the first iteration of the acceptance tests main refactoring

[@ryandawsonuk](https://github.com/ryandawsonuk) Aligned [query and runtime bundle task variables](https://github.com/Activiti/Activiti/issues/2104) by copying process variables into task as a precursor to providing variable mappings. Fixed [bug](https://github.com/Activiti/Activiti/issues/2057) affecting runtime task lists for users with no groups.

[@erdemedeiros](https://github.com/erdemedeiros) fix issue related to task updated event (<https://github.com/Activiti/Activiti/issues/2129>). Started thinking about the evolutions of admin APIs.

[@salaboy](http://twitter.com/salaboy) working on the first iteration of the conformance testing framework to check valid Core and Cloud scenarios. You can find the work in progress in this branch: <https://github.com/activiti/activiti/tree/2128-salaboy-conformance-tests> and issue <https://github.com/Activiti/Activiti/issues/2128>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
