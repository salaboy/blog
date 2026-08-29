---
title: "Activiti: Last week Dev Logs #83"
date: 2019-02-20 18:18:24 +0000
permalink: /2019/02/20/activiti-last-week-dev-logs-83/
description: "Last week it was all about the GA release. We worked hard to improve our coverage and acceptance test to make sure that we reduce the potential issues…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "ci/cd"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "community"
  - "containers"
  - "docker"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2019/02/20/activiti-last-week-dev-logs-83/
---

Last week it was all about [the GA release](/2019/02/18/activiti-cloud-7-0-0-ga-released/). We worked hard to improve our coverage and acceptance test to make sure that we reduce the potential issues after releasing. You can find more about the GA release here, and you can keep track of the [Service Release 1 (SR1)](https://github.com/Activiti/Activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3A7.0.0.SR1) that will follow if critical issues are found. We improved our [getting started guides](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud) and simplify the deployment steps to make sure that you can get all the services up and running with a single HELM command.

Moving forward we started planning the 7.1 Release Train so feel free to get in touch via Gitter/Twitter/Email if you are interested in being part of those planning sessions.

[@CTI777](https://github.com/cti777) Worked on following issues: #2465, #1862, #2272 (Missing audit event api's for signals)

[@igdianov](https://github.com/igdianov)   
Completed PRs:

- [Activiti/activiti-cloud-connector-quickstart](https://github.com/Activiti/activiti-cloud-connector-quickstart) [fix; (version) update dependencies to 7.0.0.GA](https://github.com/Activiti/activiti-cloud-connector-quickstart/pull/4)
- [Activiti/activiti-cloud-runtime-bundle-quickstart](https://github.com/Activiti/activiti-cloud-runtime-bundle-quickstart) [fix: (versions) update dependencies to 7.0.0.GA](https://github.com/Activiti/activiti-cloud-runtime-bundle-quickstart/pull/4)
- [Activiti/activiti-cloud-platform-quickstart](https://github.com/Activiti/activiti-cloud-platform-quickstart) [feat: Add Activiti Cloud Platform Quickstart for Jenkins-X CI/CD pipelines](https://github.com/Activiti/activiti-cloud-platform-quickstart/pull/1)
- [Activiti/activiti-cloud-environments](https://github.com/Activiti/activiti-cloud-environments) [feat: Add Activiti Cloud GitOps based Environments](https://github.com/Activiti/activiti-cloud-environments/pull/1)
- [Activiti/activiti-7-developers-guide](https://github.com/Activiti/activiti-7-developers-guide) [Update getting-started-activiti-cloud.md](https://github.com/Activiti/activiti-7-developers-guide/pull/37)
- [Activiti/activiti-cloud-charts](https://github.com/Activiti/activiti-cloud-charts) [fix: remove graphiql ingress annotations](https://github.com/Activiti/activiti-cloud-charts/pull/49)
- [Activiti/activiti-cloud-charts](https://github.com/Activiti/activiti-cloud-charts) [Common chart to rule values with Helm](https://github.com/Activiti/activiti-cloud-charts/pull/48)
- [Activiti/activiti-cloud-connector-quickstart](https://github.com/Activiti/activiti-cloud-connector-quickstart) [Upgrade Activiti Cloud Connector Quickstart to 7.0.0.RC1 and Java 11](https://github.com/Activiti/activiti-cloud-connector-quickstart/pull/3)

[@almerico](https://github.com/almerico)   Made pr to JenkinsX, pipelines configurations.

[@miguelruizdev](https://github.com/miguelruizdev) worked on the coverage of LIKE operator in Query, identified redundancy of description field in process at the cloud level and fixed edge case of standalone tasks variable retrieval in Query ([2514](https://github.com/Activiti/Activiti/issues/2514))

[@ryandawsonuk](https://github.com/ryandawsonuk) worked on the GA release.

[@erdemedeiros](https://github.com/erdemedeiros) finished work on connector variable mapping (<https://github.com/Activiti/Activiti/issues/2213>) for both non-cloud and cloud implementations. Provided examples for it.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) Fixed process variable mapping json format ([2483](https://github.com/Activiti/Activiti/issues/2483)), added process id in process extension json file ([2497](https://github.com/Activiti/Activiti/issues/2497)), updated aps to work with activiti modeling 7.0.0.GA, worked for fixing swagger in case of jackson mixin in api models ([2456](https://github.com/Activiti/Activiti/issues/2456))

[@salaboy](http://twitter.com/salaboy) worked with [@ryandawsonuk](https://github.com/ryandawsonuk) and [@erdemedeiros](https://github.com/erdemedeiros) to polish the last issues around 7.0.0.GA and we did the release.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
