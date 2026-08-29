---
title: "Activiti 7: Last week Dev Logs #12"
date: 2017-09-25 07:39:21 +0000
permalink: /2017/09/25/activiti-7-last-week-dev-logs-12/
description: "Last week (18/9/17 - 24/9/17) we spend most of our time hardening our examples and our release process."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "docker"
original_url: https://www.salaboy.com/2017/09/25/activiti-7-last-week-dev-logs-12/
---

Last week (**18/9/17 - 24/9/17**) we spend most of our time hardening our examples and our release process. [@ryandawsonuk](https://github.com/ryandawsonuk) spent most of his time fighting with scripts for making releases as simple and flexible as possible. [@erdemedeiros](https://github.com/erdemedeiros) reviewed and merged [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) Pull Request about supporting Mongo DB as an alternative Audit Service Module.

I’ve ([@salaboy](http://twitter.com/salaboy)) spent some time reviewing [@igdianov](https://github.com/igdianov) [Pull Request for supporting extra GraphQL endpoints](https://github.com/Activiti/Activiti/pull/1464) in our Query Service Module. This is a great addition and we are still reviewing how is the best way to add these functionality as an optional dependency to our Query Services. I will be interested in hearing from our community how feel about GraphQL. After some tests we can clearly see how UI components can leverage all the power of GraphQL endpoints.

This week we will be hardening our [Kubernetes deployments](https://github.com/Activiti/activiti-cloud-examples/tree/master/kubernetes) while we finish some bits that we want to include in our first Maven Central release. I encourage the community to [start looking at our GitBook](https://www.gitbook.com/book/activiti/activiti-7-developers-guide/details) which is slowly shaping up.

We will be also doing some planning for next month based on our progress, feel free to jump into our [Gitter channel](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) if you are interested in learning more about our plans.
