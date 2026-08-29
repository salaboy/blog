---
title: "Activiti: Last week Dev Logs #58"
date: 2018-08-15 10:30:41 +0000
permalink: /2018/08/15/activiti-last-week-dev-logs-58/
description: "Last week we worked on the release of Activiti Core and Activiti Cloud Beta1. We wrote some Getting Started guides and we tested the maven artifacts and…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "cloud native"
  - "community"
  - "helm"
  - "microservices"
  - "open source"
  - "progress"
  - "transparency"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2018/08/15/activiti-last-week-dev-logs-58/
---

Last week we worked on the release of Activiti Core and Activiti Cloud Beta1. We wrote some Getting Started guides and we tested the maven artifacts and example services and deployment descriptors quite extensively. We got the Beta1 release deployed in PKS and also tested that the released example services can work in a Minikube deployment using the same Activiti Cloud Full Example HELM charts. Congrats to everyone involved in the release and thanks a lot for all of you who are providing early feedback about this release.

- Beta1 Release: </2018/08/13/activiti-core-activiti-cloud-beta1-released/>
- Getting Started with Activiti Core 7.x: </2018/08/13/getting-started-with-activiti-core-7-0-0-beta1/>
- Getting Started with Activiti Cloud: </2018/08/13/getting-started-with-activiti-cloud-beta1/>

This week we already started with some large refactorings regarding source code organization and improving our work practice to fully switch to Continuous Deployment. We will aim for doing a Beta2 release quite soon, and we will be updating the Gitbook and the Roadmap accordingly this week.

[@almerico](https://github.com/almerico) Upgrades according to latest release with our google cluster.

[@miguelruizdev](https://github.com/miguelruizdev) worked on the overall testing of the third API refactoring, fixing tests in the acceptance test security module, reporting issues on faulty endpoints for future fixes beyond Beta1, and, along with [@erdemedeiros](https://github.com/erdemedeiros), created new clusters within the company organization in GKE using Jenkins X.

[@balsarori](https://github.com/balsarori) initial Form Router discussions

[@mteodori](https://github.com/mteodori) - holidays -

[@cristina-sirbu](https://github.com/cristina-sirbu) Worked on Activiti Cloud Events Adapter Service ( a Spring Boot Application which gets the events from RabbitMq, enrich them to a new format and pushes them to an ActiveMq instance). Communication between RabbitMq and ActiveMq done. Enrichment of the events is still in progress.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for adding import/export applications/models endpoints in modeling.

[@ryandawsonuk](https://github.com/ryandawsonuk) Added minikube instructions to activiti-cloud-full-example chart. Updated the audit-service module to follow the query-service module in using the newly-refactored versions of the services for security and identity. Added tests for an example cloud connector to the serenity-based BDD acceptance tests and updated the tests so that the security-policies tests work together with the deployment conditions for runtime tests. Updated the release scripts for building and tagging the example-level repos using their new structure.

[@erdemedeiros](https://github.com/erdemedeiros) worked with @Salaboy to get all the API related PRs ready to merge. Set up a GKE cluster using Jenkins X to test the latest changes in the APIs.

[@salaboy](http://twitter.com/salaboy) worked on the release process and creating tutorials and examples.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
