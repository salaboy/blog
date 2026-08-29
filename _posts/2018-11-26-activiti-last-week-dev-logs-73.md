---
title: "Activiti: Last week Dev Logs #73"
date: 2018-11-26 22:15:25 +0000
permalink: /2018/11/26/activiti-last-week-dev-logs-73/
description: "Last week we did a huge amount of work on improving our CI/CD process over our Core and Cloud repositories."
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "kubernetes"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "bpmn"
  - "cloud native"
  - "community"
  - "distributed"
  - "microservices"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/11/26/activiti-last-week-dev-logs-73/
---

Last week we did a huge amount of work on improving our CI/CD process over our Core and Cloud repositories. We are trying to automate as much as we can our build processes to keep adding fixes that can be consumed by our community and enterprise adopters. We are trying to expand our Acceptance and Conformance testing and getting ready to do a Beta4 release by the end of the week/early next week.

[@CTI777](https://github.com/cti777) Missing id for BPMNElement: <https://github.com/Activiti/Activiti/issues/2175>, Update process instance properties via API: <https://github.com/Activiti/Activiti/issues/2147>

[@almerico](https://github.com/almerico) automation with new JenkinsX Prow version of the example repositories towards automated testing with acceptance tests. https://github.com/Activiti/Activiti/issues/2100 (WIP)

[@igdianov](https://github.com/igdianov) Worked on the following issues and associated PRs:

- [Activiti/Activiti build fails intermittently in Jenkins-X pipelines](https://github.com/Activiti/Activiti/issues/2171) Nov 18 (wip)
- [Review Maven Deploy plugin configuration for multi-module projects](https://github.com/Activiti/Activiti/issues/2172) Nov 18 (wip)
- [Let's configure updatebot single PR for Activiti Cloud with Mergify.io](https://github.com/Activiti/Activiti/issues/2196) Nov 22 (wip)
- [Let's tests dependencies convergence in Activiti core](https://github.com/Activiti/Activiti/issues/2198) Nov 22 (wip)
- [Troubleshooting Jenkins-X Prow CI/CD automation](https://github.com/Activiti/Activiti/issues/2100) with @almerico
- [Missing id for BPMNElement](https://github.com/Activiti/Activiti/issues/2175) with @CTI77

[@balsarori](https://github.com/balsarori) working on process variable mappings for UserTasks and ServiceTasks (connectors)

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) finished modeling changed regarding json based model types + adding validation on export application + acceptance tests for exporting applications

[@miguelruizdev](https://github.com/miguelruizdev) fixed <https://github.com/Activiti/Activiti/issues/2139> and <https://github.com/Activiti/Activiti/issues/2153> issues. Also started to code bpmn-scenarios-set1 in the conformance scenarios.

[@ryandawsonuk](https://github.com/ryandawsonuk) - holidays -

[@erdemedeiros](https://github.com/erdemedeiros) worked to make process definitions available inside the query service (<https://github.com/Activiti/Activiti/issues/2149>): completed the work to send the events from runtime bundle and handle the event at the query-service side (missing handle the events in audit).

[@salaboy](http://twitter.com/salaboy) worked on upgrading Spring Boot 2.1 and Spring Cloud Greenwich M3 and working on pipelines improvements with [@igdianov](https://github.com/igdianov)

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
