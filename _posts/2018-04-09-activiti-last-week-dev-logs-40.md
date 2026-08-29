---
title: "Activiti: Last week Dev Logs #40"
date: 2018-04-09 08:37:15 +0000
permalink: /2018/04/09/activiti-last-week-dev-logs-40/
description: "Last week we had some very good progress on our main topics that we want to cover before doing Beta1."
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "bpmn"
  - "community"
  - "devlogs"
  - "docker"
  - "microservices"
  - "open source"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/04/09/activiti-last-week-dev-logs-40/
---

Last week we had some very good progress on our main topics that we want to cover before doing Beta1. Application Service and the new Process Runtime Java APIs are moving forward at very nice pace. There is a lot of work to do around these two areas, so we want to be focused in getting the first iteration out of the door soon. At the same time we keep iterating our core building blocks to make sure that they are consistent.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) Changed layout of the Task Manager Incubator Project, from Assembler to Service between Controller and Repository, managing all endpoints from Controller instead of Repository. Implemented architectural changes to tests using Junit and AssertJ.

[@igdianov](https://github.com/igdianov) finishing WebSocket and Gateway integrations for notifications and subscriptions.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on the BPMN Signal and Messages types for cloud native deployments.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked to add test for “delete task” [#1812](https://github.com/Activiti/Activiti/issues/1812), more changes for default diagram when no graphic info present in model” [#1808](https://github.com/Activiti/Activiti/issues/1808)

[@lucianoprea](https://github.com/lucianoprea) worked on standalone tasks and subtasks in Runtime Bundles.

[@mteodori](https://github.com/mteodori) visiting Iasi, Romania and meet remote team there, fixed build issues [#1858](https://github.com/Activiti/Activiti/issues/1858) and [#1857](https://github.com/Activiti/Activiti/issues/1857)

[@ffazzini](http://github.com/ffazzini) discussions and review around application service

[@ryandawsonuk](https://github.com/ryandawsonuk) Improved the security policies on the runtime bundle service by adding filtering by RB name (therefore making it possible to work from a single access control config across multiple services). Created PR to add support for json media type according to alfresco guidelines for audit service.

[@erdemedeiros](https://github.com/erdemedeiros) worked on the new Process Runtime Java APIs. Added the basic operations around process definitions and process instances.

[@salaboy](http://twitter.com/salaboy) worked on the Activiti Cloud Application Service PoC to finish the RFC document.

This week we will push harder into the Application Service and APIs definitions and make sure that our Cloud Native Building Blocks are aligned (from a dependencies and APIs point of views).

We keep getting community users messages that wants to try out our new infrastructure and services. We totally recommend to check out our Activiti Cloud Examples Github repository: <https://github.com/activiti/activiti-cloud-examples>  and our Gitbook’s Quickstart & Overview section: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/quickstart.html>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
