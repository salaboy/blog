---
title: "Activiti: Last week Dev Logs #57"
date: 2018-08-08 09:25:54 +0000
permalink: /2018/08/08/activiti-last-week-dev-logs-57/
description: "Beta1 release time has arrived. We are working on merging the last round of APIs refactoring and the Beta1 release process will start today."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/08/08/activiti-last-week-dev-logs-57/
---

Beta1 release time has arrived. We are working on merging the last round of APIs refactoring and the Beta1 release process will start today. Stay tuned for a blog post about what is included and what is not in our first Beta1 release.

[@almerico](https://github.com/almerico) Working on configuration and helm chart creation for GKE cluster. Help Igor with presentation cluster. Learn how to create skaffold multi image configurations.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on adding variables when throwing signals <https://github.com/Activiti/Activiti/pull/1951> <https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/70> . Also, he is working on applying new audit service API interface to <https://github.com/Activiti/activiti-cloud-audit-service-mongo>.

[@miguelruizdev](https://github.com/miguelruizdev) worked on covering all hruser cases in activiti-cloud-acceptance-tests, implementing parameterization in JBehave stories and shared session variables within scenarios.

[@balsarori](https://github.com/balsarori) Working on integrating/routing forms with process engine / runtime bundle.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) --holidays--

[@lucianoprea](https://github.com/https://github.com/lucianoprea) start working on some issues regarding process instance variables from runtime-bundle.

[@ryandawsonuk](https://github.com/ryandawsonuk) brought the activiti infrastrastructure and application charts together into a single activiti-cloud-full-example chart that deploys a an example app. Deployed this to some vanilla clusters on different cloud providers to check the setup and provide README instructions.

[@erdemedeiros](https://github.com/erdemedeiros) worked with @Salaboy on the 3rd round of refactorings for the API. Merged the 2nd round of refactorings for the API on develop.

[@salaboy](http://twitter.com/salaboy) working on the 3rd round of API refactoring pre beta1 release.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
