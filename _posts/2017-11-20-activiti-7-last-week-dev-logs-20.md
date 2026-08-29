---
title: "Activiti 7: Last week Dev Logs #20"
date: 2017-11-20 08:44:26 +0000
permalink: /2017/11/20/activiti-7-last-week-dev-logs-20/
description: "(WOW 20 weeks already!) Last week (13/11/17 - 19/11/17) was all about polishing our services and looking into other aspects of our infrastructure such as…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "roadmap"
original_url: https://www.salaboy.com/2017/11/20/activiti-7-last-week-dev-logs-20/
---

***(WOW 20 weeks already!)*** Last week **(13/11/17 - 19/11/17)** was all about polishing our services and looking into other aspects of our infrastructure such as monitoring, distributed configurations, security and system to system interactions. We spent a good amount of time with our project structures and we will keep  refining our [GitBook](https://activiti.gitbooks.io/activiti-7-developers-guide/content/) to keep it as updated and full of examples as possible. As always feedback is more than welcome.

[@willkzhou](https://github.com/willkzhou) worked on ElasticSearch Query module implementation, quite close to be completed.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) This week, he was maintaining the old version He worked on  backporting [call activity business key](https://github.com/Activiti/Activiti/pull/1567) to 5.x .

[@igdianov](https://github.com/igdianov) worked on notification services using GraphQL subscriptions

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) - out on holidays -

[@lucianoprea](https://github.com/lucianoprea) worked on the new Activiti Cloud Service Organization (work in progress)

[@balsarori](https://github.com/balsarori) worked on refactoring the Form Service brought from 6.x form service and adding spring integration

[@ffazzini](http://github.com/ffazzini) Feign client in activiti-cloud-examples and related bug reproducer, Zipkin investigation and PoC.

[@ryandawsonuk](https://github.com/ryandawsonuk) - out on holidays -

[@erdemedeiros](https://github.com/erdemedeiros) mainly worked to provide audit events for integration requests (work in progress). Also did some improvements related to the internal Maven dependency management.

[@salaboy](http://twitter.com/salaboy) worked on testing latest refactorings on dependency management and artifacts alignment, add more documentation to our [gitbook](https://activiti.gitbooks.io/activiti-7-developers-guide/content/) and worked on an Activiti Cloud Connectors example that is going to be published as soon as the PRs .

This week there are a couple of RFC blog post coming out, so stay tuned and if you are interested in the project please review those blog post and send feedback. It is a great time to influence the project direction, priorities and to engage in collaborations.

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>

If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
