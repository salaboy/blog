---
title: "Activiti: Last week Dev Logs #53"
date: 2018-07-09 07:42:47 +0000
permalink: /2018/07/09/activiti-last-week-dev-logs-53/
description: "Last week we started a new testing round for our Kubernetes Deployments after the initial refactoring to use the new APIs."
tags:
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
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "community"
  - "microservices"
  - "open source"
  - "process"
  - "weekly"
original_url: https://www.salaboy.com/2018/07/09/activiti-last-week-dev-logs-53/
---

Last week we started a new testing round for our Kubernetes Deployments after the initial refactoring to use the new APIs. We are getting better and better into testing large refactorings for distributed deployments and we are looking forward to release Beta1 after this round of testing is finished. We will start by releasing only the Java artifacts to maven central, then we will continue with updating documentation and releasing our example docker images so they can be consumed from our HELM charts. Acceptance tests will be also part of our released artifacts, so you can run or modify them to test different scenarios. A warm welcome to our community to [@almerico](https://github.com/almerico) who is working hard to reduce the configuration points for our deployments.

[@igdianov](https://github.com/igdianov) - on holidays -

[@almerico](https://github.com/almerico) Working on configuration of helm charts and possibility to run everything on one ingresses with exposecontroller to reduce manual configuration.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on updating the MongoDB implementation to support new APIs

[@MiguelRuizDev](https://github.com/MiguelRuizDev) testing new API refactoring in Jenkins X

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked on organization: removed group concept and refactored projects to applications concept, updated acceptance tests for modeling accordingly, added acceptance tests for updating application name, deleting application.

[@ryandawsonuk](https://github.com/ryandawsonuk) Produced helm charts published at [activiti chart repo](https://github.com/Activiti/activiti-cloud-charts) and configured JX example to use the charts for application and infrastructure components so that the user doesn’t need to build them. We’re refining this setup for a new quickstart.

[@erdemedeiros](https://github.com/erdemedeiros) moved integration related interfaces to the API level. Cleaned up unused classes from the runtime-bundle after the introduction of the new API.

[@salaboy](http://twitter.com/salaboy) worked on updating new example services to consume the new APIs and troubleshoot new issues and missing bits.

This week we will merge the API refactoring to our Develop branch and finalize the testing round to proceed to release early next week. Right after the release, we will update our roadmap and provide more insights about what it is coming before the end of the year.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
