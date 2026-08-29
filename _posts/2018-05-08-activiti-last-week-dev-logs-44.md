---
title: "Activiti: Last week Dev Logs #44"
date: 2018-05-08 07:45:39 +0000
permalink: /2018/05/08/activiti-last-week-dev-logs-44/
description: "Last week we focused in closing Pull Request that were waiting for review and pushed the next iteration of the Process & Task Runtime APIs plus the…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "open source"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "jenkinsx"
  - "k8s"
  - "microservices"
original_url: https://www.salaboy.com/2018/05/08/activiti-last-week-dev-logs-44/
---

Last week we focused in closing Pull Request that were waiting for review and pushed the next iteration of the Process & Task Runtime APIs plus the Application Service integration with other components in the infrastructure. We also did a spike to build our Blueprint using JenkinsX in AWS, which helped us to split our project into more maintainable units to enable our users to have continuous deployment pipelines.

[@igdianov](https://github.com/igdianov) - Polished configurations, added unit tests and refactoring.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on making [acceptance-tests](https://github.com/Activiti/activiti-cloud-acceptance-tests) for Signal Throw Event Cloud Behavior.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked to fix empty collection deserialization on HAL output for AlfrescoPagedResourceAssembler, worked for Modeling Service to support different backend storage

[@lucianoprea](https://github.com/lucianoprea) - off on vacations -

[@pancudaniel7](https://github.com/pancudaniel7) Added configuration setup on microservice template project.

[@ryandawsonuk](https://github.com/ryandawsonuk) Updated the activiti app service incubator project to report on app status based on eureka metadata. Added autoconfiguration for the app service and created PRs to embed it in the registry example component.

[@erdemedeiros](https://github.com/erdemedeiros) worked on the new Process Runtime Java APIs; split process and task related objects in different Maven modules. Create a auto-configuration to load the default service task behavior.

[@salaboy](http://twitter.com/salaboy) worked on splitting the Trending Topic Campaigns BluePrint into separate repositories which are now built by JenkinsX. This demonstrate the flexibility of Activiti Cloud configuration and the usage of standard tools such as helm and kubernetes for continuous deployment pipelines.

There are still two PRs under review: [@igdianov](https://github.com/igdianov) and [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) which will probably merge next week.

We keep getting community users messages that wants to try out our new infrastructure and services. We totally recommend to check out our Activiti Cloud Examples Github repository: <https://github.com/activiti/activiti-cloud-examples>  and our Gitbook’s Quickstart & Overview section: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/quickstart.html>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
