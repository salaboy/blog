---
title: "Activiti: Last week Dev Logs #70"
date: 2018-11-05 12:00:41 +0000
permalink: /2018/11/05/activiti-last-week-dev-logs-70/
description: "Last week was all about planning for the next iteration plus trying to solve some critical issues that we found while doing Beta2 release."
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "devlogs"
  - "docker"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/11/05/activiti-last-week-dev-logs-70/
---

Last week was all about planning for the next iteration plus trying to solve some critical issues that we found while doing [Beta2](https://github.com/Activiti/Activiti/milestone/10) release. [Beta3](https://github.com/Activiti/Activiti/milestone/15) will come quite fast, we hope accelerate the release cycle for the Beta phase to make sure that we fix well known issues and we provide consumable artifacts for community users. If you find issues with [Beta2](https://github.com/Activiti/Activiti/milestone/10) please feel free to report, comment and vote issues here: <https://github.com/activiti/activiti/issues>

[@balsarori](https://github.com/balsarori) worked on exposing form key to process definition and task [#2082](https://github.com/Activiti/Activiti/issues/2082)

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked to adapt the APS modeling to new activiti Beta2 modeling zip structure

[@miguelruizdev](https://github.com/miguelruizdev) worked on the refactoring and the increase of coverage of the acceptance tests.

[@ryandawsonuk](https://github.com/ryandawsonuk) Updated the gitbook with details of migration from beta1 to beta2 and updated charts README to clarify how to enable modeling. Ran through the slackbot demo together with [@miguelruizdev](https://github.com/miguelruizdev) and [@erdemedeiro](https://github.com/erdemedeiros) to define, raise and address a related set of issues on task visibility in query.

[@erdemedeiros](https://github.com/erdemedeiros) worked with [@ryandawsonuk](https://github.com/ryandawsonuk) to identify the cause of main issues in query service (<https://github.com/Activiti/Activiti/issues/2092>, <https://github.com/Activiti/Activiti/issues/2093>, <https://github.com/Activiti/Activiti/issues/2103>). Fixed those issues.

[@salaboy](http://twitter.com/salaboy) worked on new scenarios conformance document, organizing the GitHub issues under [Beta3 milestone](https://github.com/Activiti/Activiti/milestone/15), planning and creating a new stable set 7.0.55 for activiti cloud dependencies.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
