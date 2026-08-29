---
title: "Activiti: Last week Dev Logs #65"
date: 2018-10-01 08:35:56 +0000
permalink: /2018/10/01/activiti-last-week-dev-logs-65/
description: "Last week we manage to move forward our CI/CD pipelines. We are currently working with fixed versions of our libraries and we can see light at the end of…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "cloud native"
  - "community"
  - "distributed"
  - "knative"
  - "microservices"
  - "spring"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/10/01/activiti-last-week-dev-logs-65/
---

Last week we manage to move forward our CI/CD pipelines. We are currently working with fixed versions of our libraries and we can see light at the end of the tunnel. We hope that by the end of this week we will get our core frameworks ready to be released, then we will work on the service layer (examples) and TTC blueprint upgrade.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on applying new audit service API interface to

<https://github.com/Activiti/activiti-cloud-audit-service-mongo>.

<https://github.com/Activiti/activiti-cloud-audit-service-mongo/pull/1>

[@igdianov](https://github.com/igdianov) working on Kubernetes websockets PoC microservices.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for dynamic model validators

[@miguelruizdev](https://github.com/miguelruizdev) deployed environment for testing the new UI modelling app.

[@ryandawsonuk](https://github.com/ryandawsonuk) Continued importing projects into build cluster for running in Jenkins-X. Started configuring projects to use updatebot for propagating build versions. Added features to updatebot to give us options on [how to merge and whether to delete branches after merge](https://github.com/jenkins-x/updatebot/pull/46). Started mapping out build graph so the team can decide how to propagate version through the graph.

[@erdemedeiros](https://github.com/erdemedeiros) worked with @ryandawsonuk to get the Jenkins-X pipeline working. Fixed release commit message; updated ignore files.

[@salaboy](http://twitter.com/salaboy) presented at [SpringOnePlatform.io](https://springoneplatform.io/) about our journey to [Cloud Native applications and the Roadmap about the Spring Cloud Kubernetes project](/2018/09/27/the-s1p-experience/). While doing this, I started a PoC on how to adapt Activiti Cloud Connectors to work on top of KNative.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
