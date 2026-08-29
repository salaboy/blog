---
title: "Activiti: Last week Dev Logs #77"
date: 2019-01-07 11:02:36 +0000
permalink: /2019/01/07/activiti-last-week-dev-logs-77/
description: "Last week, after a week of festive holidays, we worked hard in closing as many issues that we could to get Beta5 out of the door."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "microservices"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2019/01/07/activiti-last-week-dev-logs-77/
---

Last week, after a week of festive holidays, we worked hard in closing as many issues that we could to get Beta5 out of the door. New conformance sets were added to Activiti/Activiti and serves as the basis for our Acceptance and Conformance tests for our distributed services. We are now running automated tests against our chart releases and we are happy to see the velocity of the entire cycle increasing week by week. Now for [RC1](https://github.com/Activiti/Activiti/milestone/11) the GraphQL modules are almost ready to be included and we will be reviewing and merging [@igdianov](https://github.com/igdianov) Pull requests soon.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on the issue [#2324](https://github.com/Activiti/Activiti/issues/2324) about integrating Modeling Service's backend and frontend into one Docker container.

[@CTI777](https://github.com/cti777) Worked on following issues: #[1893](https://github.com/Activiti/Activiti/issues/1893), #[2318](https://github.com/Activiti/Activiti/issues/2318),#[2244](https://github.com/Activiti/Activiti/issues/2244)Commits in:

- [Activiti/activiti-cloud-query-service](https://github.com/Activiti/activiti-cloud-query-service)
- [Activiti/activiti-cloud-runtime-bundle-service](https://github.com/Activiti/activiti-cloud-runtime-bundle-service)
- [Activiti/Activiti](https://github.com/Activiti/Activiti)
- [Activiti/activiti-cloud-api](https://github.com/Activiti/activiti-cloud-api)

[@almerico](https://github.com/almerico) Automate Docker Image & Helm Charts release #2312,#2325,#2327

[@igdianov](https://github.com/igdianov) Worked on Notifications GraphQL Service PRs:

- [Push Activiti-cloud-query-dependencies version to Activiti-cloud-notifications-service-graphql repo](https://github.com/Activiti/activiti-cloud-query-service/pull/156) [ready-for-review](https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3Aigdianov+archived%3Afalse+label%3Aready-for-review)
- [New Shiny Activiti Cloud Notifications Graphql Service](https://github.com/Activiti/activiti-cloud-notifications-service-graphql/pull/1)  [ready-for-review](https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3Aigdianov+archived%3Afalse+label%3Aready-for-review)
- [(updatebot) push to activiti-cloud-notifications-service-graphql repo](https://github.com/Activiti/activiti-cloud-build/pull/80)  [Ready-for-review](https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3Aigdianov+archived%3Afalse+label%3Aready-for-review)
- [Add enforce Cloud Dependencies check for Notifications GraphQL](https://github.com/Activiti/activiti-cloud-application-chart/pull/51)  [ready-for-review](https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3Aigdianov+archived%3Afalse+label%3Aready-for-review)
- [Add Activiti Cloud Notifications GraphQL Application](https://github.com/Activiti/activiti-cloud-notifications-graphql/pull/1)  [ready-for-review](https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3Aigdianov+archived%3Afalse+label%3Aready-for-review)

[@miguelruizdev](https://github.com/miguelruizdev) worked on the acceptance test coverage of the editable fields of tasks and the process definition retrieval from query.

[@ryandawsonuk](https://github.com/ryandawsonuk) worked on getting the acceptance tests in the pipeline passing and ensuring all the versions were set read for 7.0.0.Beta5 release.

[@erdemedeiros](https://github.com/erdemedeiros) - holidays -

[@salaboy](http://twitter.com/salaboy) worked on Beta5 release and added the new set 3 and set 4 conformance tests. I did some initial tests on JHipster UAA integration and we hope to include that in RC1.  

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
