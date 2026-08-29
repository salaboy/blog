---
title: "Activiti: Last week Dev Logs #79"
date: 2019-01-22 11:44:45 +0000
permalink: /2019/01/22/activiti-last-week-dev-logs-78-2/
description: "Last week we work hard to upgrade all our builds, pipelines and repository to use JDK 11. This is a major change that requires the use of JDK 11 in all…"
tags:
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "cloud native"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2019/01/22/activiti-last-week-dev-logs-78-2/
---

Last week we work hard to upgrade all our builds, pipelines and repository to use JDK 11. This is a major change that requires the use of JDK 11 in all the consumers of the libraries. We also included tests and new APIs conformance tests and we started with the preparations for DevCon. Part of the team was involved in a Kubernetes training by [@learnk8s](https://learnk8s.io/) which was awesome and totally recommended. We are aiming to release RC1 by the end of the week.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked for [Handling expressions for json variables](https://github.com/Activiti/Activiti/issues/2184). Next he is working on [Integrate Modeling Service's backend and frontend into one Docker container](https://github.com/Activiti/Activiti/issues/2324).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for [[Acceptane Tests] Add scenarios for process extensions in modeling](https://github.com/Activiti/Activiti/issues/2310) and [Add extraVolumes and extraVolumeMounts to service helm charts](https://github.com/Activiti/Activiti/issues/2368)

[@CTI777](https://github.com/cti777) Worked on following issues:  
Writing tests in acceptance tests and scenarios.  
#2369 Add admin delete process endpoint   
#170 Root task query implemented in a proper REST way

[@almerico](https://github.com/almerico) Jdk 11 support

[@igdianov](https://github.com/igdianov) Worked on troubleshooting Jdk 11 example pipelines with @almerico Worked on investigating and troubleshooting HTTPS support for Activiti Cloud Helm chart. Worked on Notifications Service Helm charts to add support for HTTPS, Sticky sessions, and Jdk11

[@miguelruizdev](https://github.com/miguelruizdev) worked on the PRs addressing this [issue](https://github.com/Activiti/Activiti/issues/2281)

[@ryandawsonuk](https://github.com/ryandawsonuk) Worked on [moving configurations from examples to spring boot starters](https://github.com/Activiti/Activiti/issues/2258) before attending training

[@erdemedeiros](https://github.com/erdemedeiros) checked missing issues to cover admin rest endpoints before attending Kubernetes training.

[@salaboy](http://twitter.com/salaboy) review Pull Requests and help on the JDK 11 migration. Worked on DevCon slides for my “Future of Activiti Cloud OSS” presentation with [@erdemedeiros](https://github.com/erdemedeiros)

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
