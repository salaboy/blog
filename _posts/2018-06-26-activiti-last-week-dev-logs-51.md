---
title: "Activiti: Last week Dev Logs #51"
date: 2018-06-26 08:03:28 +0000
permalink: /2018/06/26/activiti-last-week-dev-logs-51/
description: "Last week we made considerable progress on moving forward on the new API implementation in our core services."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "process"
  - "rfc"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "community"
  - "docker"
  - "helm"
  - "open source"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/06/26/activiti-last-week-dev-logs-51/
---

Last week we made considerable progress on moving forward on the new API implementation in our core services. [@erdemedeiros](https://github.com/erdemedeiros) got the Runtime Bundle and Query Service implementation updated and I took the lead on Audit. Now our core services should use the same data types such as ProcessInstance, Task and Variables. Our Services APIs are now in charge of receiving data in a standard format (CloudRuntimeEvent) and returning data in structures that will wrap the previously mentioned types. Our Service API layer is now in charge of transforming these “standard” types into whatever model that they need for storage, decoupling the APIs from the underlying technology used to store and retrieve data.

[@igdianov](https://github.com/igdianov) working on Jenkins X set up for custom example.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on creating examples and acceptance tests about BPMN Cloud Signals.

<https://github.com/Activiti/activiti-cloud-examples/tree/feature/daisuke-1687-signal-cloud>

<https://github.com/Activiti/example-runtime-bundle/tree/feature/daisuke-1687-signal-cloud>

<https://github.com/Activiti/activiti-cloud-acceptance-tests/pull/16>

[@ryandawsonuk](https://github.com/ryandawsonuk) continued working on porting the quickstart example for Jenkins-X, [adding acceptance tests](https://github.com/ryandawsonuk/activiti-cloud-acceptance-tests) and beginning [integration of spring cloud gateway](https://github.com/ryandawsonuk/activiti-cloud-gateway), including submitting a PR for spring cloud gateway to [support x-forwarded-prefix](https://github.com/spring-cloud/spring-cloud-gateway/pull/382)

[@erdemedeiros](https://github.com/erdemedeiros) completed work on integrating the new Java API to query service, which is no longer depending on activiti-engine for events reception.

[@salaboy](http://twitter.com/salaboy) working on the new API and updating Audit Service to use it internally.

This week we will be moving forward our acceptance tests to use the new APIs and make sure that we can easily run them inside our Jenkins X pipelines.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
