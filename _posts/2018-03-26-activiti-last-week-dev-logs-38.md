---
title: "Activiti: Last week Dev Logs #38"
date: 2018-03-26 11:20:45 +0000
permalink: /2018/03/26/activiti-last-week-dev-logs-38/
description: "Last week we manage to finally release to Maven Central and Docker Hub our Early Access Release 201802-EA artifacts."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
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
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/03/26/activiti-last-week-dev-logs-38/
---

Last week we manage to finally release to [Maven Central and Docker Hub our Early Access Release 201802-EA](/2018/03/21/activiti-activiti-cloud-7-201802-ea-are-out/) artifacts. You can read more about this release and our [updated Roadmap plans here](/2018/03/22/activiti-activiti-cloud-roadmap-update-22-3-18/). As stated in our Roadmap update we will now focus on getting things ready for a [Beta1](https://github.com/Activiti/Activiti/milestone/9) release which is intended to come by the end of April.

Updated Roadmap: <https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap>

[@MiguelRuizDev](https://github.com/MiguelRuizDev) implementing states to the Task Manager service pet project, as well as crafting methods to change and store properties of objects already present in the database

[@igdianov](https://github.com/igdianov) working on Web Sockets and Gateway integration.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on streams for BPMN signals. Also, he is working on reviewing the pull request ([ACT-4316](https://github.com/Activiti/Activiti/pull/1831))

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) investigated “delete task” and implement (still tests to add) [#1812](https://github.com/Activiti/Activiti/issues/1812), investigated bug in “show process instance diagram” for “fixSystemFailure” process definition (related to [#1808](https://github.com/Activiti/Activiti/issues/1808)), started adding error handling in acceptance tests during implementing “try to activate a cancelled process instance”

[@lucianoprea](https://github.com/lucianoprea) worked on issues from runtime-bundle that are blocking the demo-ui development ([#1803](https://github.com/Activiti/Activiti/issues/1803) [#1813](https://github.com/Activiti/Activiti/issues/1813))

[@mteodori](https://github.com/mteodori) added temporary dependency check exclusion for CVE-2018-7489 [#1838](https://github.com/Activiti/Activiti/issues/1838)

[@ffazzini](http://github.com/ffazzini) investigation around possible issues on helm charts regarding remote env deployments

[@ryandawsonuk](https://github.com/ryandawsonuk) added options to activiti-scripts ([#3](https://github.com/Activiti/activiti-scripts/pull/3)) to handle releasing of example repos and added a property to the examples so that json can be used over hal ([#80](https://github.com/Activiti/activiti-cloud-examples/pull/80)) so as to finalise the release before attending a training workshop

[@erdemedeiros](https://github.com/erdemedeiros) work with [@ryandawsonuk](https://github.com/ryandawsonuk) to get the release ready before attending a training workshop.

[@salaboy](http://twitter.com/salaboy) worked on updating the roadmap plan and writing the release announcement in our gitbook and blog posts. There was a fair amount of testing and improvements on the acceptance tests which are now modularized and can be run independently.

We will appreciate help from the community in reviewing our [Beta1 milestone](https://github.com/Activiti/Activiti/milestone/9) and making sure that we are covering the things that you want to see included in this release.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
