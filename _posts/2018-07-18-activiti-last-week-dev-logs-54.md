---
title: "Activiti: Last week Dev Logs #54"
date: 2018-07-18 08:02:13 +0000
permalink: /2018/07/18/activiti-last-week-dev-logs-54/
description: "Last week we moved forward the new APIs refactoring to all of our services and extensions. We started validating the new data types and exposed endpoints…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "open source"
original_url: https://www.salaboy.com/2018/07/18/activiti-last-week-dev-logs-54/
---

Last week we moved forward the new APIs refactoring to all of our services and extensions. We started validating the new data types and exposed endpoints against our existing acceptance tests and we are a couple of tests away to finalize the first round of refactorings which will enable us to merge all the changes into the develop branch. Our Docker Compose Quickstart was updated and simplified for people that wants to start testing our building blocks.

[@igdianov](https://github.com/igdianov) worked on GraphQL upgrade modules to use new API data types and introduced a new graphQL query spring boot starter

[@almerico](https://github.com/almerico) cluster configurations and charts improvements.

Worked on https configuration support in jx environment.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on MongoDB upgrade to use new APIs data types

[@miguelruizdev](https://github.com/miguelruizdev) tested Activiti services following the docker-compose approach as well as the Jenkins X one; updated the Postman Collection with admin endpoints and use case sub-collections.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked on modeling organization: moved abstract repository layer to a separate module, add an api module with Application and Module abstract interfaces for entities, force rest layer to use json deserializer for Application and Module interface, remove connection from rest and jpa modules and use from rest layer only api and repository modules, update acceptance tests

[@ryandawsonuk](https://github.com/ryandawsonuk) - holidays -

[@erdemedeiros](https://github.com/erdemedeiros) moved commands (StartProcess, ClaimTask, CompleteTask, etc) to the Java API level. Made sure that acceptance tests are using the customized ObjectMapper which contains all the interface mappings.

[@salaboy](http://twitter.com/salaboy) worked on acceptance tests for the new API refactorings and deployed all new refactored services to a Kubernetes Cluster to validate new behaviour.

This week we will finish the missing acceptance tests and work on the complete automation of the execution of these tests including Security Policies scenario checking and new assertions to verify eventual consistency.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
