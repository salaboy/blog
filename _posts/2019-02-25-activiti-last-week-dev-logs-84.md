---
title: "Activiti: Last week Dev Logs #84"
date: 2019-02-25 06:56:42 +0000
permalink: /2019/02/25/activiti-last-week-dev-logs-84/
description: "Last week we started a round of refinements and platform upgrades. We defined the path for the 7.0.x Release train (7.0.x branch in our repositories) and…"
tags:
  - "activiti7"
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
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "k8s"
  - "microservices"
original_url: https://www.salaboy.com/2019/02/25/activiti-last-week-dev-logs-84/
---

Last week we started a round of refinements and platform upgrades. We defined the path for the 7.0.x Release train (7.0.x branch in our repositories) and 7.1.x Release train (develop branch in our repositories). We started to look into 7.1.0.M1 release and we are trying to set the scope right to provide refinements that will enable easy integration for other projects.  

[@CTI777](https://github.com/cti777) Worked on issue  #2272 (Missing audit event api's for signals)

[@igdianov](https://github.com/igdianov) worked on quickstarts improvements and HELM charts refinements  
[@almerico](https://github.com/almerico) Working on docker images changes. Jdk 8 backward compatibility. Working 7.0.x pipeline creation.

[@miguelruizdev](https://github.com/miguelruizdev) worked on clean up/data extraction mechanism for RB.

[@ryandawsonuk](https://github.com/ryandawsonuk) Resolved a [timing problem with a non-deterministic test](https://github.com/Activiti/activiti-cloud-acceptance-scenarios/pull/197). Reviewed and merged several key changes to cloud charts and [submitted new version of PR to port to alfresco identity service](https://github.com/Activiti/activiti-cloud-charts/pull/51). Worked with almerico to upgrade the jenkins-x version on the clusters.

[@erdemedeiros](https://github.com/erdemedeiros) updated pom configuration to get code coverage for cloud projects published again (<https://github.com/Activiti/activiti-cloud-build/pull/82>); worked to get XML BPMN file published to query service alongside with process definition (work in progress).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) Fixed [2532](https://github.com/Activiti/Activiti/issues/2532) (The exported project with a previous imported process model has wrong process id in extensions json file) and [2533](https://github.com/Activiti/Activiti/issues/2533) (Reimporting a previously exported process can end up in having two processes with different names but the same bpmn id)

[@salaboy](http://twitter.com/salaboy) worked on testing JDK 8 and triaging for SR1. Also updated docs and improved diagrams and broken sections in our gitbook.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
