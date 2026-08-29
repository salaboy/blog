---
title: "Activiti: Last week Dev Logs #75"
date: 2018-12-10 10:49:20 +0000
permalink: /2018/12/10/activiti-last-week-dev-logs-75/
description: "Last week we worked hard to close Beta4, which will be released later today. The full team is focused on making the release process smooth so we can…"
tags:
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "Java"
  - "knative"
  - "microservices"
  - "spring"
  - "spring boot"
original_url: https://www.salaboy.com/2018/12/10/activiti-last-week-dev-logs-75/
---

Last week we worked hard to close Beta4, which will be released later today. The full team is focused on making the release process smooth so we can include more fixes and features in every milestone. In Beta4 we managed to close **41** issues and you can check our next milestones here: <https://github.com/activiti/activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3ABeta4>

[@CTI777](https://github.com/cti777) worked on finalizing update process event and task/process variablesCommits in:

- [Activiti/activiti-cloud-query-service](https://github.com/Activiti/activiti-cloud-query-service)
- [Activiti/activiti-cloud-runtime-bundle-service](https://github.com/Activiti/activiti-cloud-runtime-bundle-service)
- [Activiti/Activiti](https://github.com/Activiti/Activiti)

[@almerico](https://github.com/almerico) Working on JX pipelines Issues #2224 and DIND maven install #2201 PR’s:

- <https://github.com/Activiti/activiti-cloud-audit/pull/50>
- <https://github.com/Activiti/activiti-cloud-query/pull/54>
- <https://github.com/Activiti/example-runtime-bundle/pull/55>
- <https://github.com/Activiti/activiti-cloud-example-chart/pull/1>
- <https://github.com/Activiti/activiti-cloud-infrastructure-chart/pull/1>
- <https://github.com/Activiti/activiti-cloud-application-chart/pull/1>
- <https://github.com/Activiti/example-cloud-connector/pull/32>

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on the issue #[2075](https://github.com/Activiti/Activiti/issues/2075). PR’s:

https://github.com/Activiti/Activiti/pull/2229

https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/171

[@igdianov](https://github.com/igdianov) worked on the following PRs and Issues

- [feat: Inject process run-time message headers for aggregated events](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/143) (ready for review)
- [fix: (IntegrationContextBuilder) add process instance business key #2240](https://github.com/Activiti/Activiti/pull/2240) (ready for review)
- [fix: (updatebot) push versions to activiti-examples master #85](https://github.com/Activiti/activiti-dependencies/pull/85) (merged)
- [Business key in list of tasks #1970](https://github.com/Activiti/Activiti/issues/1970) (scope investigation)
- [Customize Activiti Cloud Jenkins-X pipelines to build Docker images with DinD #2224](https://github.com/Activiti/Activiti/issues/2224)

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked in modeling for:

- send to model repository both modelToBeUpdated and newModel during update

- add full json process metadata when export applications

- export the content only (without metadata) for json based models

[@miguelruizdev](https://github.com/miguelruizdev) worked on acceptance test coverage and bug fix on task updated and process updated events

[@ryandawsonuk](https://github.com/ryandawsonuk) Created a cluster for running example-level projects, updated [the developer guide to explain how to make changes across repositories in the current structure](https://github.com/Activiti/activiti-7-developers-guide/pull/31), updated [modeler repos to use master](https://github.com/Activiti/Activiti/issues/2225) as well as [ttc repos](https://github.com/Activiti/Activiti/issues/2226), committed [a chart for the trending topics example](https://github.com/Activiti/ttc-charts), ran a test release.

[@erdemedeiros](https://github.com/erdemedeiros) Reviewed and merged pending pull requests. Fixed set process instance name on query-service (<https://github.com/Activiti/Activiti/issues/1952>). Fixed missing info on cloud events (<https://github.com/Activiti/Activiti/issues/2248>). Fixed audit handler for process updated and Process Suspended events.

[@salaboy](http://twitter.com/salaboy) worked on refining services for Beta4 release, improving acceptance tests and we merged the initial version of our new APIs conformance tests ( <https://github.com/Activiti/Activiti/tree/develop/activiti-spring-conformance-tests> ) that will help us to test our cloud modules.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
