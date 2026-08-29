---
title: "Activiti: Last week Dev Logs #63"
date: 2018-09-17 08:23:40 +0000
permalink: /2018/09/17/activiti-last-week-dev-logs-63/
description: "Last week we made a huge step forward into our CI/CD approach. We have validated that we can create environments that can connect to our services such as…"
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "microservices"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "devlogs"
  - "docker"
  - "kubernetes"
  - "open source"
  - "process"
  - "progress"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/09/17/activiti-last-week-dev-logs-63/
---

Last week we made a huge step forward into our CI/CD approach. We have validated that we can create environments that can connect to our services such as Nexus and DockerHub and we are ready to start importing all the framework projects into the new CI/CD environment. We are still looking into how to publish our charts coming from CI/CD to be able to publish new versions as soon as the underlying libraries change.

There has also been some amazing work on the TTC workshop which now has acceptance tests for validating the basic scenarios. I am expecting to add also some experiments with Telepresence and the new Devpods in JX with the embedded Theia IDE.

[@danielpancu](https://github.com/pancudaniel7) Added implementation for getting all users and all roles implementation for Activiti core

[@ffazzini](http://github.com/ffazzini) <https://github.com/Activiti/Activiti/issues/1982> in java api and RB Cloud scenario

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for activiti modeling integration with keycloak

[@miguelruizdev](https://github.com/miguelruizdev) worked on fixing issues in TTC acceptance tests and collaborated on the PoCs for CI/CD

[@ryandawsonuk](https://github.com/ryandawsonuk) worked on and documented PoCs to publish to maven central, alfresco nexus and dockerhub from a Jenkins-X cluster

[@erdemedeiros](https://github.com/erdemedeiros) refactored POM files on Activiti-cloud projects to conform to CI/CD pipelines.

[@salaboy](http://twitter.com/salaboy) PoC on telepresence, improving platform components such as the Gateway, working on the framework side of CI / CD.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
