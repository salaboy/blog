---
title: "Activiti: Last week Dev Logs #39"
date: 2018-04-03 10:12:37 +0000
permalink: /2018/04/03/activiti-last-week-dev-logs-39/
description: "Last week I had the pleasure to attend Alfresco Day in New York City. It was a great chance to meet customers and partners creating all sorts of…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "cloud native"
  - "microservices"
  - "open source"
  - "progress"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/04/03/activiti-last-week-dev-logs-39/
---

Last week I had the pleasure to attend [Alfresco Day in New York City](https://www.alfresco.com/events/alfresco-day-new-york-city-2018). It was a great chance to meet customers and partners creating all sorts of implementations with Activiti. We are quite excited to see their enthusiasm around our new Cloud Native approach in Activiti Cloud. The team is making significant process on the issues triaged for our [Beta1 release that should see the light at the end of April](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap).

[@MiguelRuizDev](https://github.com/MiguelRuizDev) Establishing the “Request of Comments” of task manager pet-project, reading documentation on Spring Data and Spring Rest annotations, tweaking with testing using Junit and AssertJ. Repo: <https://github.com/MiguelRuizDev/task-service>

[@igdianov](https://github.com/igdianov) Completed GraphQL security module. Writing unit and integration tests for GraphQL WebSockets Broker. Getting ready to submit PR with the changes.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on streams for BPMN signals. Also, he is working on fixing the bug issue( [ACT-4246](https://github.com/Activiti/Activiti/issues/1086) ) <https://github.com/Activiti/Activiti/pull/1849>

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) fixed default diagram when no graphic info present in model ([#1808](https://github.com/Activiti/Activiti/issues/1808)), added 'try activate a cancelled process instance' scenario with error handler support ([#1809](https://github.com/Activiti/Activiti/issues/1809)), worked for acceptance tests for ‘delete task’ functionality ([#1812](https://github.com/Activiti/Activiti/issues/1812))

[@lucianoprea](https://github.com/lucianoprea) worked on the query-services ([PR#35](https://github.com/Activiti/activiti-cloud-query-service/pull/35/files)) and runtime-bundle ([PR#48](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/48/commits/92bc592f658a39f90af81a172d08e58aac351891)) to fix some issue related to the events triggered by engine when a new standalone task is created and add an acceptance test ([PR#9](https://github.com/Activiti/activiti-cloud-acceptance-tests/pull/9)) for this scenario. Also did some work on the [create a subtask API](https://github.com/Activiti/Activiti/issues/1813)

[@mteodori](https://github.com/mteodori) Update Jackson for vulnerability CVE-2018-7489 [#1851](https://github.com/Activiti/Activiti/issues/1851) and Update to Spring Cloud Finchley M9 [#1848](https://github.com/Activiti/Activiti/issues/1848)

[@ffazzini](http://github.com/ffazzini) joined discussions around application service responsibilities

[@ryandawsonuk](https://github.com/ryandawsonuk) added new admin users to the provided keycloak configuration and defaulted admin access to only the admin role. Created PRs to add support for wildcards on process definitions in security policies and to extend security policies to audit

[@erdemedeiros](https://github.com/erdemedeiros) started drafting and creating a PoC for the new Process Runtime Java API.

[@salaboy](http://twitter.com/salaboy) work on the RFC for the Activiti Cloud Application Service document plus a PoC on the data model and REST endpoints. We also started drafting our new Process Runtime Java API with [@erdemedeiros](https://github.com/erdemedeiros)

This week we will be focused on pushing these efforts forward so keep an eye on the upcoming Request for Comments(RFCs) posts and please provide feedback. These documents are open for all the community members that want to get involved and have an influence on the roadmap of the project.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
