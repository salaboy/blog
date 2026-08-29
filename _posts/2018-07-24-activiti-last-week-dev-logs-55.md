---
title: "Activiti: Last week Dev Logs #55"
date: 2018-07-24 08:10:14 +0000
permalink: /2018/07/24/activiti-last-week-dev-logs-55/
description: "Last week we merged the initial refactoring of the Java Runtime APIs into our develop branches of our projects."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "spring cloud"
  - "activiti cloud"
  - "api"
  - "bpmn"
  - "cloud native"
  - "docker"
original_url: https://www.salaboy.com/2018/07/24/activiti-last-week-dev-logs-55/
---

Last week we merged the initial refactoring of the Java Runtime APIs into our develop branches of our projects. We also merged updates on our example projects, quickstart and acceptance tests. The BluePrint TTC project is still due to be migrated to use the latest versions. Now, the Activiti Cloud HELM charts are consuming these images published in Docker Hub and we recommend people to try them out and get in touch via Gitter in case of issues. We will be working on stabilizing all surrounding projects for the Beta release and updating documentation accordingly.

[@igdianov](https://github.com/igdianov) worked on improving connectors and async tasks for internal PoC.

[@almerico](https://github.com/almerico) cluster infrastructure configuration and helm updates

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on internal issues and Audit Mongo DB API upgrade.

[@miguelruizdev](https://github.com/miguelruizdev) implemented awaitility features in the contexts within the acceptance test that need time orchestration; kept testing Activiti services, running the acceptance tests in a Jenkins X environment.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) finished and pushed the code in organization for repository abstraction and the api, updated the modeling acceptance tests to use only interfaces from api

[@ryandawsonuk](https://github.com/ryandawsonuk) Added tests to activiti-cloud-audit-service to cover different security policies scenarios and fixed a bug related to hyphens when setting security policies using environment variables. Worked with @miguelruizdev to run the acceptance tests and introduce awaitility to wait for test conditions to be met. Changed the charts in activiti-cloud-charts to provide a way to switch between h2 and postgres.

[@erdemedeiros](https://github.com/erdemedeiros) - holidays -

[@salaboy](http://twitter.com/salaboy) worked on upgrading the Acceptance Tests to support the new APIs and on deployments to Kubernetes using our new Activiti Cloud HELM Charts.

This week we will be working hard on stabilizing examples and doing final refactorings at the API level. A blog post about the new API is being created, but it will probably see the light next week.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
