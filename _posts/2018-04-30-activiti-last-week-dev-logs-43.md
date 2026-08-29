---
title: "Activiti: Last week Dev Logs #43"
date: 2018-04-30 09:52:33 +0000
permalink: /2018/04/30/activiti-last-week-dev-logs-43/
description: "Last week we worked to make further refinements in our core services. Events emitted by our services now include the Activiti Cloud Application Name…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "transparency"
  - "weekly"
original_url: https://www.salaboy.com/2018/04/30/activiti-last-week-dev-logs-43/
---

Last week we worked to make further refinements in our core services. Events emitted by our services now include the Activiti Cloud Application Name, Service Type and version. Our new Runtime APIs are now covering Event Listeners and Connectors and we are getting close to start moving these initiatives from the incubator to their own repositories.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) started tweaking with Angular in order to build a basic UI to try TaskManagerService out

[@igdianov](https://github.com/igdianov) finishing acceptance tests for GraphQL and subscriptions mechanism

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on making acceptance-tests for Signal Throw Event Cloud Behavior.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) creating new controllers for Modelling Service to support different backends for storage

[@lucianoprea](https://github.com/lucianoprea) worked on some tickets related to Tasks ([#1831](https://github.com/Activiti/Activiti/issues/1813) [#1814](https://github.com/Activiti/Activiti/issues/1814))

[@pancudaniel7](https://github.com/pancudaniel7) start looking into Activiti7 by checking out the activiti-cloud-examples

[@balsarori](https://github.com/balsarori) reviewing PRs and discussions around Service Task Binding behavior in the engine

[@ryandawsonuk](https://github.com/ryandawsonuk) created PRs to add application metadata (service name, version, type, parent application) to the events emitted by the runtime bundle and have these consumed by the other components. Included in the PRs changes to the security policies for these services so that service name can be specified in long or short format

[@erdemedeiros](https://github.com/erdemedeiros) worked on the new Process Runtime Java APIs. Polished events listeners; added the first iteration for Java connectors (work in progress).

[@salaboy](http://twitter.com/salaboy) worked in splitting the Activiti Cloud Blueprint into separate repositories to leverage cloud deployments and automated pipelines for continuous delivery.

This week we will start reviewing pending PRs from [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) and [@igdianov](https://github.com/igdianov).

Also we will start merging code from the incubator to our infrastructure components to make sure that our Demos and Blueprints use the new services and features. We will also be having more news about our Modelling project soon, so keep an eye on this blog for more news soon.

We keep getting community users messages that wants to try out our new infrastructure and services. We totally recommend to check out our Activiti Cloud Examples Github repository: <https://github.com/activiti/activiti-cloud-examples>  and our Gitbook’s Quickstart & Overview section: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/quickstart.html>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
