---
title: "Activiti: Last week Dev Logs #76"
date: 2018-12-17 11:12:39 +0000
permalink: /2018/12/17/activiti-last-week-dev-logs-76/
description: "Last week we released Activiti Cloud Beta4 and moved straight away to the Beta5 planning. We are aiming to release Beta5 during the first week of January…"
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "ci/cd"
  - "cloud native"
  - "containers"
  - "microservices"
  - "open source"
  - "spring cloud"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/12/17/activiti-last-week-dev-logs-76/
---

Last week we released [Activiti Cloud Beta4](/2018/12/12/activiti-core-activiti-cloud-beta4-released/) and moved straight away to the Beta5 planning. We are aiming to release Beta5 during the first week of January and currently we have 35 open issues: <https://github.com/Activiti/Activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3ABeta5>

There has been also huge progress on automating our Docker Images and HELM charts generation for our example projects. This means that now you can find the examples being released and tested as part of our Java libraries lifecycle. There are a lot of improvements and refinements to cover, but the basics are already in place. You can find now our Docker Images being tagged with fixed versions at release time of the example repositories.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on improving autodeployment strategy issue. <https://github.com/Activiti/Activiti/issues/2138>

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) Add more acceptance tests for the exporting applications.

[@CTI777](https://github.com/cti777)  
worked on providing method for subprocess and changes for Audit EventConverters.  
Commits in:

- [Activiti/activiti-cloud-query-service](https://github.com/Activiti/activiti-cloud-query-service)
- [Activiti/activiti-cloud-runtime-bundle-service](https://github.com/Activiti/activiti-cloud-runtime-bundle-service)
- [Activiti/Activiti](https://github.com/Activiti/Activiti)
- [Activiti/Activiti-api](https://github.com/Activiti/Activiti-api)

[@almerico](https://github.com/almerico)

Worked on new examples pipeline. PR’s:

- <https://github.com/Activiti/activiti-cloud-example-chart/pull/5>(ready for review)
- [https://github.com/Activiti/activiti-cloud-audit/pull/50 (merged)](https://github.com/Activiti/activiti-cloud-audit/pull/50)
- <https://github.com/Activiti/activiti-cloud-query/pull/54>[(merged)](https://github.com/Activiti/activiti-cloud-audit/pull/50)
- <https://github.com/Activiti/example-runtime-bundle/pull/55>[(merged)](https://github.com/Activiti/activiti-cloud-audit/pull/50)
- <https://github.com/Activiti/activiti-cloud-example-chart/pull/1>[(merged)](https://github.com/Activiti/activiti-cloud-audit/pull/50)
- <https://github.com/Activiti/activiti-cloud-infrastructure-chart/pull/1>[(WIP)](https://github.com/Activiti/activiti-cloud-audit/pull/50)
- <https://github.com/Activiti/activiti-cloud-application-chart/pull/1>[(merged)](https://github.com/Activiti/activiti-cloud-audit/pull/50)
- <https://github.com/Activiti/example-cloud-connector/pull/32> [(merged)](https://github.com/Activiti/activiti-cloud-audit/pull/50)

Issues:

- [Let's review and optimize activiti-cloud-acceptance-scenarios release pipeline#2273](https://github.com/Activiti/Activiti/issues/2273)(ready for review)
- [Let's disable concurrent builds in activiti-cloud-application-chart#2266](https://github.com/Activiti/Activiti/issues/2266)(wip)
- [Let's customize Activiti Cloud Jenkins-X pipelines to build Docker images with DinD(merged)](https://github.com/Activiti/Activiti/issues/2224)
- [Let's enable dependency tests on activiti-cloud-application-chart #2264](https://github.com/Activiti/Activiti/issues/2264)(merged)

[@igdianov](https://github.com/igdianov) Worked on the following PRs and Issues:

- [Inject process run-time message headers for aggregated events #143](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/143) (ready-for-review)
- [Make updatebot push cloud dependencies version for validation](https://github.com/Activiti/activiti-cloud-query/pull/62) (merged)
- [Cloud event message header keys names constants](https://github.com/Activiti/activiti-cloud-api/pull/44) (merged)
- [Let's disable concurrent builds in activiti-cloud-application-chart](https://github.com/Activiti/Activiti/issues/2266) (wip)
- [Missing audit event api's for signals](https://github.com/Activiti/Activiti/issues/2272) (created)
- [Let's review and optimize activiti-cloud-acceptance-scenarios release pipeline](https://github.com/Activiti/Activiti/issues/2273) (wip)
- [Let's configure preemptive node pool to run activiti-cloud-acceptance-scenarios](https://github.com/Activiti/Activiti/issues/2276) (wip)
- [Implementation of a method subprocesses](https://github.com/Activiti/Activiti/pull/2260) (reviewed)
- [BroadcastSignal not work with Activiti Core API and Activiti Cloud Rest API](https://github.com/Activiti/Activiti/pull/2229) (reviewed)

[@miguelruizdev](https://github.com/miguelruizdev) worked on testing Beta 4 release and conformance tests scenarios refactoring

[@ryandawsonuk](https://github.com/ryandawsonuk) Updated ttc chart to [use latest gateway](https://github.com/Activiti/ttc-charts/commit/b217ea3067a20e767e47d3b09fdaaae267996881) version following upgrade to be boot 2.1. Ported [a patch](https://github.com/Activiti/activiti-cloud-acceptance-scenarios/commit/2f419334409ef10cf5d25ecd6ea52f5ae84b4a85) from PR to acceptance scenarios to fix step matching in security policy tests. Managed the release to maven central from bamboo. Updated quick starts and charts and added Beta4 entry to gitbook. Provided a way to [extend keycloak realm at deploy time](https://github.com/Activiti/activiti-cloud-charts/pull/32/files#diff-8e9b5b5cf988767272f16d363998e613R41).

[@erdemedeiros](https://github.com/erdemedeiros) worked on Beta 4 release. Reviewed pending pull requests. Reviewed pending tasks for admin APIs.

[@salaboy](http://twitter.com/salaboy) worked on testing Beta4 and updating dependencies after release. I fixed [#2275](https://github.com/Activiti/Activiti/issues/2275) which demonstrated the power of our CI/CD approach for our community members, fixing a bug from report time to release time in less than 3hs.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
