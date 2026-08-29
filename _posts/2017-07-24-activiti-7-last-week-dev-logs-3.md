---
title: "Activiti 7: Last week Dev Logs #3"
date: 2017-07-24 08:13:23 +0000
permalink: /2017/07/24/activiti-7-last-week-dev-logs-3/
description: "Hi everyone, here another Dev Log from the Activiti 7.x (17/7/17 - 23/7/17) team. We are making a lot of progress on creating the new services decoupled…"
tags:
  - "activiti7"
  - "basic"
  - "bootcamp"
  - "bpmn2"
  - "cloud"
  - "community"
  - "English"
  - "Java"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "engine"
  - "microservices"
  - "open source"
  - "process"
  - "roadmap"
original_url: https://www.salaboy.com/2017/07/24/activiti-7-last-week-dev-logs-3/
---

Hi everyone, here another Dev Log from the **Activiti 7.x (17/7/17 - 23/7/17)** team. We are making a lot of progress on creating the new services decoupled and independent. We are reaching a point where we can start writing examples that demonstrate clear advantages in comparison with the traditional (monolith) approach.

As usual, you can track the progress via the GitHub project:  <https://github.com/Activiti/Activiti/projects/1>

Here is the list of people contributing to the project on daily basis and the work that they performed last week:

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) was adding new ProcessDiagramGenerator for new REST API that generates SVG for Process Definitions and for Process Instances. In contrast with the previous version that only generated PNG/JPG which are difficult to manipulate.

[@gmalanga](https://github.com/gmalanga) was working on a metadata set of endpoints for process definitions. This will enable us to check against different components to see if all the requirements to run our deployed process definitions are met by the runtime environment. One simple check might be to check if the users and groups required by our processes are defined in our IDM provider.

[@abdotalaat](https://github.com/abdotalaat) was working in a PR related to code quality, removing dead code and updating the PR after some changes in master.

[@fcorti](https://github.com/fcorti/) was working on a simple but concrete example process, defining an Emergency Call Center coordinating the requests together with different Organizations (Fire Department, Police, Hospitals, etc.). The process definition will run in Activiti 6, but it will be ready to be deployed in a microservices architecture in the future Activiti 7. The project is in the development phase and you can find the design at [this link](https://docs.google.com/a/alfresco.com/document/d/1o6NypPu1vQdjvq_RpG-SSZtIqZ9kRKidXOInz4Oapgg/edit?usp=sharing). Feedback and help are more than welcome.

[@erdemedeiros](https://github.com/erdemedeiros) mainly worked on the initial PoC of the new History/Audit module: make the REST API read-only; improve the result presentation. He’ll carry on that next week.

[@ryandawsonuk](https://github.com/ryandawsonuk) verified the Keycloak integration with some tests in the sample project and mocking for identity in the spring boot starter project. I also set up the Keycloak integration to use a docker container that loads sample configuration from a json file. I then moved on to doing PoCs to assess options for the new Query Service.

[@salaboy](http://twitter.com/salaboy) was working on adding the initial version of the activiti-services. These modules will contain the core logic to expose our brand new HAL APis and Message Based Endpoints. These modules are in draft stage and will evolve quickly if you are interested in more details about these services get in touch.

### This Week on Activiti 7

This week we will be working towards polishing all these services and making sure that we have examples to demonstrate how they all work in coordination. We will also publish a couple of RFC (Request For Comments) blog posts about the new HAL APIs, Data Types and Message Based Endpoints. You will also see some changes in how the artifacts are versioned so we can release an Early Access version (EA) every month.

We are also encouraging the community to join us in the community workshops that we are going to organize once every two weeks to work on the project. If you are in the London area, get in touch, join the [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) channel and ask us for more details.

This is a great chance to get involved and shape the future of the Activiti project.
