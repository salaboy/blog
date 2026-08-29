---
title: "Activiti 7: Last week Dev Logs #19"
date: 2017-11-13 08:26:25 +0000
permalink: /2017/11/13/activiti-7-last-week-dev-logs-19/
description: "Last week (6/11/17 - 12/11/17) we focused on some core refactorings in how our dependencies are managed and organized across all our repositories."
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "microservices"
  - "progress"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/11/13/activiti-7-last-week-dev-logs-19/
---

Last week (6/11/17 - 12/11/17) we focused on some core refactorings in how our dependencies are managed and organized across all our repositories. We found some issues and we are planning to fixed them one by one. [@igdianov](https://github.com/igdianov) presented on friday a session about GraphQL subscriptions and a PoC to bring those features into our new component called activiti-cloud-notifications. This will enable our services to push notifications via the STOMP protocol to all interested parties. We are also working hard to get some examples with our brand new Activiti Cloud Connectors, to demonstrate how you can scale our services based on demand when hosting in a Cloud Infrastructure such as Kubernetes.

[@willkzhou](https://github.com/willkzhou) worked on Elasticsearch repository implementation for querying Tasks and Process Instances. Testing this coming week before committing current code.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) only [updated Runtime Bundle Endpoints](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/7) to use content type header instead of PATH.

[@igdianov](https://github.com/igdianov) worked on a GraphQL subscription mechanism for Tasks and Process Intances, new RFC post coming. Polished PoC and explored using Spring WebSocket Message Broker for better and more robust web application messaging backbone. This week I am going to prepare and commit PoC in development branch, explore integration with Apollo GraphQL client library  and expand RFC descriptions for review and discussion.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) - out on holidays -

[@lucianoprea](https://github.com/lucianoprea) working on Spring REST docs for Activiti Cloud Services Audit

[@balsarori](https://github.com/balsarori) worked on our first iteration of our new Form Service, which is an evolution of the form services provided in version 6.x

[@ffazzini](http://github.com/ffazzini) working on kubernetes probes, swagger fixes in audit and query services

[@ryandawsonuk](https://github.com/ryandawsonuk) - out on holidays -

[@erdemedeiros](https://github.com/erdemedeiros) added badges to all the repositories and checked that the quality tools were properly set. Currently working with @salaboy to improve the dependency management across the repositories.

[@salaboy](http://twitter.com/salaboy) worked on improving our Swagger contract for runtime bundles and improved dependency management for all our repositories to be more aligned with JGitflow practices. A blog post about our lesson learned with maven, multi repositories and Jgitflow is coming.

This week is going to be all about Cloud Connectors and refining our services to support Spring Cloud Contracts and Spring Rest Docs. We are going to provide some examples on how you can test our services against their contracts without the need of starting an instance. We are also working on a Feign generated client for our runtime bundles, so you can leverage the power of service discovery, circuit breakers and much more for service to service interactions.

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>
