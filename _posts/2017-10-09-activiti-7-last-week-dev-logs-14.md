---
title: "Activiti 7: Last week Dev Logs #14"
date: 2017-10-09 18:48:26 +0000
permalink: /2017/10/09/activiti-7-last-week-dev-logs-14/
description: "Last week (02/10/17 - 8/10/17) we covered numerous fronts. System to System integrations was a the core, but Igor and Ryan made huge progress on…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "open source"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "devlogs"
  - "docker"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2017/10/09/activiti-7-last-week-dev-logs-14/
---

Last week (**02/10/17 - 8/10/17**) we covered numerous fronts. System to System integrations was a the core, but Igor and Ryan made huge progress on integrating with GraphQL and JHipster.

[@igdianov](https://github.com/igdianov) finalized the GraphQL Pull Requests and improved our existing Query Code.

[@ryandawsonuk](https://github.com/ryandawsonuk) created the first version of a JHipster generator for Activiti. Currently, this only supports embedding Activiti into an app rather than creating a runtime bundle and Activiti Cloud architecture but we’ve got a plan and have taken initial steps for covering the new Cloud components.

[@erdemedeiros](https://github.com/erdemedeiros) worked on message queue implementation for service tasks. The first PoC was successful: the new service task implementation sends a message to a queue and the execution waits for a new message containing the result before continuing. Improvements on the message content and filters are in progress.

[@salaboy](http://twitter.com/salaboy) worked on getting an example with Service Cloud Connectors, Docker and Spring Cloud Streams working in kubernetes using Spring Cloud Connectors Kubernetes. This week will be all about merging finished pull requests on the GraphQL side, refining the JHipster integration and finalizing the System to System Cloud Connectors (a blog post is coming about this). We are planning to do our last big repository refactoring related to the activiti-services and activiti-build to improve how we build and release all these new artifacts. If you experience any problem during this week, let us know so we can make sure to correct any issue that might arise. We want to welcome back [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) who will be working on finalizing the MongoDB integration for our Audit module. We also want to welcome [@willkzhou](https://github.com/willkzhou) who just joined our community contributors and will be working on ElasticSearch integration.
