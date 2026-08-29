---
title: "Activiti: Last week Dev Logs #64"
date: 2018-09-26 13:24:43 +0000
permalink: /2018/09/26/activiti-last-week-dev-logs-64/
description: "Last week we spend a lot of time configuring our CI/CD pipelines and that work is going to continue this week."
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "workflow"
  - "bpmn"
  - "ci/cd"
  - "cloud native"
  - "containers"
  - "jenkinsx"
  - "knative"
  - "microservices"
original_url: https://www.salaboy.com/2018/09/26/activiti-last-week-dev-logs-64/
---

Last week we spend a lot of time configuring our CI/CD pipelines and that work is going to continue this week. We are now building our libraries using Jenkins X, publishing to our public Alfresco Nexus and configuring Docker Hub for our Docker Images. We are still working on publishing our HELM charts from our CI/CD pipelines via Github Pages.

I am currently at [SpringOnePlatform.io](http://SpringOnePlatform.io), so if you are around and interested in these topics, get in touch! I am presenting the journey of Activiti Cloud to Kubernetes using Spring Cloud on PKS.

[@igdianov](https://github.com/igdianov) - planning to add GraphQL WebSockets and Notification services for Kubernetes. Researched Kubernetes Nginx websocket support and configurations to provide session affinity. Will be working on PoC next week.

[@ffazzini](http://github.com/ffazzini) created connector definitions endpoint in RB, created acc test for connector definitions, implemented all requested changes in all connector definitions PRs

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for making model types dynamic using beans  and remove form model type and references to form service

[@miguelruizdev](https://github.com/miguelruizdev) completed the implementation of keycloak to the ttc-dashboard-ui angular project.

[@ryandawsonuk](https://github.com/ryandawsonuk) Worked with @erdemedeiros to [apply POM refactoring](https://github.com/Activiti/Activiti/issues/1995) across repositories. Implemented a PoC to prove we can trigger a jenkins build from creation of a tag. Started importing the activiti projects into a designated build cluster to build using the jx-activiti-cloud user.

[@erdemedeiros](https://github.com/erdemedeiros) Complete the POM refactoring on the missing repositories. Worked with @ryandawsonuk to apply them across repositories.

[@salaboy](http://twitter.com/salaboy) preparing for S1P and working in improving the gateway, also PoC with KNative for Cloud Connectors

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
