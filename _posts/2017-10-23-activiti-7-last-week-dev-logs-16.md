---
title: "Activiti 7: Last week Dev Logs #16"
date: 2017-10-23 07:25:44 +0000
permalink: /2017/10/23/activiti-7-last-week-dev-logs-16/
description: "Last week (16/10/17 - 22/10/17) we started several initiatives to define a new set of services to support our new set of tools."
tags:
  - "activiti7"
  - "bpmn2"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "rfc"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "community"
  - "devlogs"
  - "microservices"
  - "open source"
  - "progress"
  - "release"
  - "spring"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/10/23/activiti-7-last-week-dev-logs-16/
---

Last week (**16/10/17 - 22/10/17**) we started several initiatives to define a new set of services to support our new set of tools. We started by creating a specification document (public) to define how the [Process Model Service](https://docs.google.com/document/d/1lFjusnLjQkK13Z43L1CLa33tnsUQd1mI6xgBYrldkQs/edit?ts=59e61316#heading=h.xqvx4a2y7bl7) is going to work. We also move forward some changes on the default behaviors for the process engine, such as use UUID for ID generators and the default Service Task behavior when running inside a Runtime Bundle. We manage to merge a PR vital to push Activiti Cloud Connectors forward and a new [Activti Cloud Connector Starter](https://github.com/activiti/activiti-cloud-connectors) was created.

[@willkzhou](https://github.com/willkzhou) was experimenting with ElasticSearch and getting used to the new repository structure.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) changed Audit Service with MongoDB to [expose read-only REST API using Spring Data REST](https://github.com/Activiti/activiti-cloud-audit-service/pull/2). Next, he will try the issue that provides [DB-based identity service that uses old tables and is rest-based](https://github.com/Activiti/Activiti/issues/1261).

[@igdianov](https://github.com/igdianov) started looking at graphQL subscriptions and we started discussing about how to create a notification mechanism for the entire platform.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) started looking at Spring Cloud Contracts and an initial version for the Process Model Service.

[@lucianoprea](https://github.com/lucianoprea) started looking at Spring Rest Docs for our runtime bundles.

[@balsarori](https://github.com/balsarori) worked on modifying the default Activiti Cloud starter configurations (removed unnecessary properties and enabled UUID generation by default). Additionally, started working on first version of Activiti Form Runtime Service.

[@ryandawsonuk](https://github.com/ryandawsonuk) documented how to secure Activiti endpoints using keycloak, started planning implementation of security by process definition and worked on changes to the release process to support using jgitflow

[@erdemedeiros](https://github.com/erdemedeiros) worked on message queue implementation for service tasks. After a further investigation the correlation id seems no longer necessary and was replaced by the execution id. The related pull request is the end of the review process and should get merged soon.

[@salaboy](http://twitter.com/salaboy) I’ve spent most of the week validating that the repository refactoring didn’t affect any module. I’ve also added new sections to our gitbook about each service and how we are going to adopt GitFlow as our main way of interactions with community and team members. This week we will be polishing some examples on the cloud connectors side, plus we will be getting ready for the release at the end of the month. If you want to contribute with the project, this is a perfect time to get in touch and help us out. [Reviews on the Gitbook are highly appreciated.](https://activiti.gitbooks.io/activiti-7-developers-guide/content/repositories.html) For more info find us in Gitter: <https://gitter.im/Activiti/Activiti7>
