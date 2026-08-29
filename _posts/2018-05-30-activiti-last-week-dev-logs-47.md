---
title: "Activiti: Last week Dev Logs #47"
date: 2018-05-30 09:40:33 +0000
permalink: /2018/05/30/activiti-last-week-dev-logs-47/
description: "Last week we spend a lot of time refining examples and upgrading our infrastructure to leverage kubernetes services by using Spring Cloud Kubernetes…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "progress"
  - "transparency"
  - "weekly"
original_url: https://www.salaboy.com/2018/05/30/activiti-last-week-dev-logs-47/
---

Last week we spend a lot of time refining examples and upgrading our infrastructure to leverage kubernetes services by using Spring Cloud Kubernetes projects. We started working on upgrading the BluePrint: Trending Topic campaigns in order to use the new set of dependencies and improve the Application Service to work in such environments. We are getting quite close to finish the new Process & Task Runtime Java APIs and we want to make sure that we refactor all the services to consume this new layer. A lot of refinements in our Spring Boot Starters is happening to make sure that we clean up all the rough edges and provide Auto Configurations when possible to reduce the burden in the consumer side.

[@MiguelRuizDev](https://github.com/MiguelRuizDev) worked on implementing logic to the Resource Assembler in the Task Service and on Actions Buttons dynamically displayed in the corresponding UI.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) presented at [JJUG CCC Spring 2018](/2018/05/26/jjug-ccc-2018-spring-cloud-docker-kubernetes/) with [@salaboy](http://twitter.com/salaboy)

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) added more test coverage for organization controllers and for process modeling controllers, complete the integration between aps process modeling and activiti organization

[@pancudaniel7](https://github.com/pancudaniel7) Kubernetes deployment setup investigation

[@lucianoprea](https://github.com/lucianoprea) did some investigations about helm charts

[@ryandawsonuk](https://github.com/ryandawsonuk) Created PRs to set create auto-configurations for more of the modules in common level under [#1850](https://github.com/Activiti/Activiti/issues/1850). Got the trending topics blueprint working with Jenkins X and submitted PRs to make it easier for the modules to be configured from the parent-level values.yaml and work together with rabbit.

[@erdemedeiros](https://github.com/erdemedeiros) made sure that all the REST controllers are using the new Java API: covered ProcessInstance controller and variable controllers.

[@salaboy](http://twitter.com/salaboy) presented at [JJUG CCC Spring 2018](/2018/05/26/jjug-ccc-2018-spring-cloud-docker-kubernetes/) and improved the Trending Topic Campaigns Blueprint for the Beta1 release. Also managed to sync face to face with our community rock start member [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) about the Cloud approach for BPMN Signal, Messages and Timers.

This week we started migrating our core example to follow the same approach that our BluePrint adopting some of the [Jenkins X](http://jenkinsx.io/) conventions for service descriptors, helm charts and coding standards.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
