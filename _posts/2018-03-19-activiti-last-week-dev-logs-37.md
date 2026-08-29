---
title: "Activiti: Last week Dev Logs #37"
date: 2018-03-19 10:07:20 +0000
permalink: /2018/03/19/activiti-last-week-dev-logs-37/
description: "Last week we manage to merge two important PRs related to Query Service Security and our unification following the Alfresco API Guidelines."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "cloud native"
  - "community"
  - "microservices"
  - "open source"
  - "release"
  - "weekly"
original_url: https://www.salaboy.com/2018/03/19/activiti-last-week-dev-logs-37/
---

Last week we manage to merge two important PRs related to Query Service Security and our unification following the Alfresco API Guidelines. These two PRs are making sure that our services are unified across the whole Alfresco Digital Business Platform initiative, while we provide HAL endpoints for users that want to leverage default Spring REST endpoints. Now that we have these PRs merged in develop we are moving forward with the release process and you should hear about that soon.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) started to set the basic components of a  “pet Project” based on a the idea of creating a simple task service, dealing with Spring Data REST annotations and H2 database. Repo: <https://github.com/MiguelRuizDev/task-service>

[@igdianov](https://github.com/igdianov) working on a prototype for GraphQL subscriptions mechanism integrated with the gateway component.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on streams for BPMN messages and signals.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) added “delete process instance” endpoint [#1809](https://github.com/Activiti/Activiti/issues/1809), added fix for missing fonts in alpine image [#1808](https://github.com/Activiti/Activiti/issues/1808), started implementation for “delete task” endpoint [#1812](https://github.com/Activiti/Activiti/issues/1812), small fixes in acceptance tests and audit for release

[@lucianoprea](https://github.com/lucianoprea) added in the runtime-bundle api for *create standalone task* [#1803](https://github.com/Activiti/Activiti/issues/1803), started working on APIs to create a subtasks in runtime-bundle [#1813](https://github.com/Activiti/Activiti/issues/1813)

[@mteodori](https://github.com/mteodori) fixed vulnerability related issues [#1718](https://github.com/Activiti/Activiti/issues/1718) [#1823](https://github.com/Activiti/Activiti/issues/1823) [#1815](https://github.com/Activiti/Activiti/issues/1815) [#1820](https://github.com/Activiti/Activiti/issues/1820) [#1817](https://github.com/Activiti/Activiti/issues/1817), completed upgrade to Spring Boot 2.0 and Spring Cloud M8 [#1810](https://github.com/Activiti/Activiti/issues/1810) and worked on release support scripts in <https://github.com/Activiti/activiti-scripts>

[@ryandawsonuk](https://github.com/ryandawsonuk) Finalised the property-based access-control to tasks, process instances and variables on the runtime bundle and query services and reviewed some other pull requests before focusing on the release

[@erdemedeiros](https://github.com/erdemedeiros) reviewed pull requests; prepare the next release with [@ryandawsonuk](https://github.com/ryandawsonuk) and [@mteodori](https://github.com/mteodori).

[@salaboy](http://twitter.com/salaboy) worked on finishing the Spring Cloud Kubernetes PR which was merged Friday afternoon. Now testing the published artifacts in our examples. Helped with some pom refactorings and reviewed pull requests that were needed for our Feb Release.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
