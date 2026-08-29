---
title: "Activiti: Last week Dev Logs #30"
date: 2018-01-29 11:55:31 +0000
permalink: /2018/01/29/activiti-last-week-dev-logs-30/
description: "30 weeks in and we are making huge progress in our Cloud Native approach. We are closing January and we will be working in polishing some rough edges in…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "community"
  - "open source"
  - "progress"
  - "spring boot"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/01/29/activiti-last-week-dev-logs-30/
---

30 weeks in and we are making huge progress in our Cloud Native approach. We are closing January and we will be working in polishing some rough edges in our main components (Runtime Bundle, Query/Notifications and Audit)  and starting some PoCs on the new stuff that we want to get before doing a major release. This is an excellent opportunity to join the community, if you are interested in helping out or working on your own extension get in touch!

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) started the Investigation for <https://github.com/Activiti/Activiti/issues/1687> that signals are exchanged cross multiple Runtime Bundles(each database).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) Investigated options to add Kubernetes ConfigMaps and Secrets and integration with spring-cloud-incubator/spring-cloud-kubernetes.

[@mteodori](https://github.com/mteodori) Started <https://github.com/Activiti/Activiti/issues/1696> to update the cloud example UI to Angular/ADF.

[@lucianoprea](https://github.com/lucianoprea) started investigating [#1688](https://github.com/Activiti/Activiti/issues/1688) and updated the copyright for all Activiti github repos

[@ffazzini](http://github.com/ffazzini) solved the performance problem of keeping the whole activiti and the dbp working increasing the ec2 instances size, started a poc on bdd tests for activiti

[@ryandawsonuk](https://github.com/ryandawsonuk) Started a PoC on separating the GraphQL query and notification components to run in different containers and in developing this came to decide that the approach of the PoC was not the best direction. Reviewed pull requests and helped with the work to move to dedicated channels for connectors, identifying what appears to be a bug in the latest spring cloud sleuth.

[@erdemedeiros](https://github.com/erdemedeiros) Kept working to move connectors to dedicated channels (<https://github.com/Activiti/Activiti/issues/1680>, <https://github.com/Activiti/Activiti/issues/1681>). Even if this approach requires some extra configuration at connectors side, it was confirmed by Spring Cloud Stream guys as being the direction to go. Currently creating a reproducer for a problem related to trace IDs (Sleuth) when using dynamically bound destinations.

[@salaboy](http://twitter.com/salaboy) Working on the initial PoC for the Application Services which will deploy Activiti Cloud Applications and will serve as the entry point for users and UIs which wants to interact with them. We are using Spring Cloud Deployers so we are collaborating with their community to get a generic mechanism for Activiti Cloud Apps provisioning.

As usual:

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>

If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
