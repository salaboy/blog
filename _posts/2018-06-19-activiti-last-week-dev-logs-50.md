---
title: "Activiti: Last week Dev Logs #50"
date: 2018-06-19 06:58:30 +0000
permalink: /2018/06/19/activiti-last-week-dev-logs-50/
description: "Wow 50 weeks of heavy work! Last week we (the Activiti Team) presented in JDK.IO and JBCNConf. You can find the slides and the workshop instructions here…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "bpmn"
  - "cloud native"
  - "community"
  - "conference"
  - "docker"
  - "jenkinsx"
  - "microservices"
  - "transparency"
  - "update"
  - "weekly"
  - "workshop"
original_url: https://www.salaboy.com/2018/06/19/activiti-last-week-dev-logs-50/
---

Wow 50 weeks of heavy work! Last week we (the Activiti Team) presented in [JDK.IO](https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation) and [JBCNConf](http://www.jbcnconf.com/2018/infoTalk.html?id=24). You can find the slides and the workshop instructions here:

- <https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation>
- <https://github.com/Activiti/ttc-docs/blob/develop/workshop.md>
- [http://www.jbcnconf.com/2018/infoTalk.html?id=24](http://www.jbcnconf.com/2018/infoTalk.html?id=24http://www.jbcnconf.com/2018/infoTalk.html?id=24)

We moved forward the Quickstart clean up and refactoring plus we made huge progress on the API side.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) continued working with Docker and Docker Compose in order to deploy the Task Manager Service and its dependent components (Database and UI) into different containers.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked for investigating and [fixing](https://github.com/Activiti/Activiti/pull/1912) about the issue [#1902](https://github.com/Activiti/Activiti/issues/1902) on this week. He will return to creating examples and acceptance tests about BPMN Cloud Signals from next week

<https://github.com/Activiti/activiti-cloud-examples/tree/feature/daisuke-1687-signal-cloud>

<https://github.com/Activiti/example-runtime-bundle/tree/feature/daisuke-1687-signal-cloud>

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for export models as xml/json files endpoints

[@ryandawsonuk](https://github.com/ryandawsonuk) presented with [@erdemedeiros](https://github.com/erdemedeiros) at [JDK.IO](https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation). Contributed to keycloak helm chart with options to [load realm with start argument](https://github.com/kubernetes/charts/pull/5950) and [run kcadm scripts](https://github.com/kubernetes/charts/pull/6108). Worked on [porting quickstart example](https://github.com/ryandawsonuk/environment-ferretmaze-staging/tree/master/env) to deploy on Jenkins-X using keycloak chart (and other charts).

[@erdemedeiros](https://github.com/erdemedeiros) presented and attended to [JDK.IO](https://jdk.io/jdk-io-2018/talks/231-cloud-native-business-automation) conference with [@ryandawsonuk](https://github.com/ryandawsonuk); Reorganized the new Java API Maven modules to be able to add dependency to the model only (without the dependency to the activiti-engine).

[@salaboy](http://twitter.com/salaboy) did a workshop at JBCNConf about Activiti Cloud, Spring Cloud and Kubernetes. We used Jenkins X to deploy services, configure environments and understand how all the pieces work together.

This week we will finish the API work plus the migration of the Quickstart to use Jenkins X conventions for creating Docker images and HELM charts for deployments. We are getting really excited with the progress that we are making so keep an eye on the gitter channel for more updates about our first Beta release.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
