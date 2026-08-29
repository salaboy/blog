---
title: "Activiti: Last week Dev Logs #78"
date: 2019-01-14 09:31:12 +0000
permalink: /2019/01/14/activiti-last-week-dev-logs-78/
description: "DevCon is getting closer and we are working hard on making sure that we get Activiti Cloud RC1 out of the door."
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "cloud native"
  - "containers"
  - "docker"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2019/01/14/activiti-last-week-dev-logs-78/
---

[DevCon](https://devcon.alfresco.com) is getting closer and we are working hard on making sure that we get Activiti Cloud RC1 out of the door. We are focusing on Priority 1 issues that will impact the APIs and configurations of our building blocks. We will also increase the conformance testing on our distributed environments which will lead to the first GA release (we are aiming for the 15th of Feb). I know that I said this before, but this is a perfect time for you to get involved with the project and get in touch if you want to discuss your use cases or integrations with other Cloud Native tools.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto)  is working on the issue [#2324](https://github.com/Activiti/Activiti/issues/2324) about integrating Modeling Service's backend and frontend into one Docker container. Especially he focuses on replacing the authentication part (keycloak).

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) Rename applications in modeling to projects ([2177](https://github.com/Activiti/Activiti/issues/2177))

[@CTI777](https://github.com/cti777)Worked on following issues:  
#2330 Add and Delete Candidate Users Groups should emit events  
#2322 [Task formKey property not propagated to Query when updated](https://github.com/Activiti/Activiti/issues/2322)  
#1901 Create subtask endpoint has the wrong path  
#1964 RuntimeBundle TaskVariableController setVariables taskId param now  
#1745 fix hal collection rel name  
#2355 Update Task Name in the same way as we update priority

[@almerico](https://github.com/almerico) Working on support for OpenJDK 11 #2076

[@igdianov](https://github.com/igdianov) Worked on support for OpenJDK 11 #2076 and worked on Notifications GraphQL acceptance tests

[@miguelruizdev](https://github.com/miguelruizdev) worked on the addition of the completion task fields Duration and Completed Date.

[@ryandawsonuk](https://github.com/ryandawsonuk) automated the deployment of the trending topics backend services in a pipeline that also runs the trending topics acceptance tests. Also automated the deployment of a security policies setup together with running their acceptance tests. With updatebot version propagation these will enable us to know when a change breaks either example.

[@erdemedeiros](https://github.com/erdemedeiros) worked with @CTI777 to fix collection relation name for HAL responses across query, audit and runtime bundle (<https://github.com/Activiti/Activiti/issues/1745>)

[@salaboy](http://twitter.com/salaboy) worked on conformance tests for Call Activity BPMN element and reviewed pull requests. Also I started preparing for [DevCon](https://devcon.alfresco.com).

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
