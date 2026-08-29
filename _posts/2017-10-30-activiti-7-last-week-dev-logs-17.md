---
title: "Activiti 7: Last week Dev Logs #17"
date: 2017-10-30 09:10:10 +0000
permalink: /2017/10/30/activiti-7-last-week-dev-logs-17/
description: "This week we had the pleasure of recieving @agoncal (Java Champion / Devoxx FR organizer) in our offices to work in a PoC using JHipster, Activiti and…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
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
  - "activiti cloud"
  - "community"
  - "devlogs"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/10/30/activiti-7-last-week-dev-logs-17/
---

This week we had the pleasure of recieving [@agoncal](https://github.com/agoncal) (Java Champion / Devoxx FR organizer) in our offices to work in a PoC using JHipster, Activiti and Keycloak.

![DND4onoXkAA57Gh.jpg](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/10/dnd4onoxkaa57gh.jpg)

We already have a JHipster generator, but we went further into analyzing what are the common problems that people will face when adopting architectures like the one proposed by JHipster. Luckily for us, Activiti is quite aligned with that technology stack so for the microservice approach most of the challenges are around security mechanisms, forwarding security tokens and being able to connect systems in a secure way. We are open to do these kind of workshops, because we manage to identify a couple of issues that we will need to fix to make developers experience more smooth, so they can get started in minutes.

[@willkzhou](https://github.com/willkzhou) worked on the ElasticSeach integration and created and abstract for DevCon ‘18

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) only fixed [the critical bug](https://github.com/Activiti/Activiti/issues/1525) that database operation until error occurrence is committed when java.lang.Error like StackOverflow is thrown. Also, he is preparing for the DevCon 2018.

[@igdianov](https://github.com/igdianov) is working on defining the Notification component and how it will relate to our GraphQL implementations.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) finished basic configuration for process model service and started implementing some simple process model rest endpoints

[@lucianoprea](https://github.com/lucianoprea) continued working with Spring Rest Docs for the runtime bundles

[@balsarori](https://github.com/balsarori) Created Activiti Form Dependencies BOM and initial form runtime modules.

[@ryandawsonuk](https://github.com/ryandawsonuk) started creating an initial version of process definition security restrictions for runtime bundles before pausing that to upgrade to the latest keycloak version (including a new build of the boot 2 adapter) to support the version used by JHipster

[@erdemedeiros](https://github.com/erdemedeiros) was working on IntegrationEvents and how to improve our initial version of the interaction between the engine and external connectors provided in the infrastructure.

[@salaboy](http://twitter.com/salaboy) was working on getting an initial implementation of a Cloud Connector for twitter and an example that can demonstrate how to dynamically scale the instances of the engine based on demand.

This week is all about releasing our Monthly Early Access binaries to Maven central and Docker Hub. We will do some planning and I (@salaboy) will be traveling to the USA (New York and Washington) on Monday to Friday, so if you are around and want to hang out and do some open source coding get in touch via twitter. For more info find us in Gitter: <https://gitter.im/Activiti/Activiti7>
