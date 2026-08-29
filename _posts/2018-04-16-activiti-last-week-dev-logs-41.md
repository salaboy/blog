---
title: "Activiti: Last week Dev Logs #41"
date: 2018-04-16 07:56:19 +0000
permalink: /2018/04/16/activiti-last-week-dev-logs-41/
description: "Last week we worked hard into getting the Activiti Cloud Application Service abstraction layer and our Proposal for a new set of Process & Task Runtime…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "docker"
  - "k8s"
original_url: https://www.salaboy.com/2018/04/16/activiti-last-week-dev-logs-41/
---

Last week we worked hard into getting the Activiti Cloud Application Service abstraction layer and our Proposal for a new set of Process & Task Runtime APIs into our Incubator Github Repository: <https://github.com/activiti/incubator> . This week we will push forward to get the Application Service up and running into our Kubernetes cluster and a set of examples for the new Process & Task Runtime APIs. We are still refining the RFC document for the Process & Task Runtime APIs, but feel free to jump in our Gitter channel if you want to have a chat about this.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) polished Service layer between Repository and Controller, crafting more specific methods. Implemented right verbs for requests along with UUID. Changed the RepositoryRestConfigurerAdapter to expose resource Id.

[@igdianov](https://github.com/igdianov) WebSockets Subscriptions and GraphQL notification mechanismo integrated with the gateway.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on BPMN Signals and Messages

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) finished default diagram when no graphic info present in model” [#1808](https://github.com/Activiti/Activiti/issues/1808), “delete task” [#1812](https://github.com/Activiti/Activiti/issues/1812)

[@lucianoprea](https://github.com/lucianoprea) worked on creating Ad-Hoc Tasks to Runtime Bundles.

[@mteodori](https://github.com/mteodori) fix IllegalArgumentException with illegal-transitive-dependency-check [#1866](https://github.com/Activiti/Activiti/issues/1866)

[@ffazzini](http://github.com/ffazzini) trying out new deployment approaches in different namespaces inside Kubernetes.

[@ryandawsonuk](https://github.com/ryandawsonuk) Added support for variable types to the variable-related REST endpoints on runtime bundles. Updated documentation on security restrictions. Started work on adding application name into services so as to support fully qualified names.

[@balsarori](https://github.com/balsarori) Working on correcting task events order [#1854](https://github.com/Activiti/Activiti/issues/1854)

[@erdemedeiros](https://github.com/erdemedeiros) worked on the new Process Runtime Java APIs. Added support for variables retrieval at process instance and task level.

[@salaboy](http://twitter.com/salaboy) worked on the Application Service RFC and PoC in the incubator. I’ve also worked with [@erdemedeiros](https://github.com/erdemedeiros) into defining the new Process & Task Runtime APIs.

We keep getting community users messages that wants to try out our new infrastructure and services. We totally recommend to check out our Activiti Cloud Examples Github repository: <https://github.com/activiti/activiti-cloud-examples>  and our Gitbook’s Quickstart & Overview section: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/quickstart.html>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
