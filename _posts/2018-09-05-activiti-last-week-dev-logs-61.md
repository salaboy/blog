---
title: "Activiti: Last week Dev Logs #61"
date: 2018-09-05 08:35:58 +0000
permalink: /2018/09/05/activiti-last-week-dev-logs-61/
description: "Last week we worked hard on updating the Trending Topics Campaign workshop to work with Keycloak and aligned dependencies for Beta1 and latest snapshots."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "cloud native"
  - "community"
  - "docker"
  - "open source"
  - "roadmap"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/09/05/activiti-last-week-dev-logs-61/
---

Last week we worked hard on updating the Trending Topics Campaign workshop to work with Keycloak and aligned dependencies for Beta1 and latest snapshots. This week we are pushing our CI/CD approach to move away from fixed versions for all the services and enable fast development cycles for our Cloud Native Building Blocks. There is some more work around SSO and IDM around our workshop and there are in progress discussions about the architecture of a set of UI/Operation controllers to report on inflight operations inside the infrastructure.

[@ffazzini](http://github.com/ffazzini) cloud connector definition and runtime <https://github.com/Activiti/Activiti/issues/1972>https://github.com/Activiti/Activiti/issues/1982

[@lucianoprea](https://github.com/https://github.com/lucianoprea) worked on testing the Activiti Cloud HELM Charts

[@balsarori](https://github.com/balsarori) Created [PR](https://github.com/Activiti/Activiti/pull/1979) which removes all activiti5 compatibility code from the activiti 7 code base.

[@igdianov](https://github.com/igdianov) working to solve <https://github.com/jenkins-x/jx/issues/1563>. Found solution via customizing Jenkins-X pod templates via myvalues.yaml configuration

[@cristina-sirbu](https://github.com/cristina-sirbu) working on the spring boot starter for Events Adapter

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked on modeling service for moving endpoint from aps to community

[@almerico](https://github.com/almerico) Worked on helm deployment to install models to  APS injenkins X pipelines.

[@miguelruizdev](https://github.com/miguelruizdev) kept working in the keycloak implementation within the ttc-dashboard angular project (front end of the TTC Workshop) following the keycloak.js api

[@ryandawsonuk](https://github.com/ryandawsonuk) initial skipe on CI/CD for community projects (libs)

[@erdemedeiros](https://github.com/erdemedeiros) set up a cluster with TTC examples; started writing acceptance tests to cover TTC examples.

[@salaboy](http://twitter.com/salaboy) worked on Spring Cloud Kubernetes Discovery filters for Service and worked with [@constantin-ciobotaru](https://github.com/constantin-ciobotaru) to refine the backend services for the Modeling Application.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
