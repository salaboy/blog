---
title: "Activiti: Last week Dev Logs #59"
date: 2018-08-20 08:14:03 +0000
permalink: /2018/08/20/activiti-last-week-dev-logs-59/
description: "Last week we started with a major clean up in our repositories to better decouple each project responsibility."
tags:
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
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "cloud native"
  - "docker"
  - "microservices"
  - "spring"
  - "weekly"
original_url: https://www.salaboy.com/2018/08/20/activiti-last-week-dev-logs-59/
---

Last week we started with a major clean up in our repositories to better decouple each project responsibility. This will enable us to build and version each module individually to allow faster development cycles. This week we will be setting up these pipelines to test the whole process for our libraries first followed by our service layer. We are still looking for Beta testers, if you want to get involved we recommend you to try the following two tutorials and get in touch via Gitter if you want to jump into more advanced topics:

- [Getting Started with Activiti Core](/2018/08/13/getting-started-with-activiti-core-7-0-0-beta1/)
- [Getting Started with Activiti Cloud](/2018/08/13/getting-started-with-activiti-cloud-beta1/)

[@mteodori](https://github.com/mteodori) - holidays -

[@lucianoprea](https://github.com/https://github.com/lucianoprea) - holidays -

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) - holidays -

[@balsarori](https://github.com/balsarori) worked on initial design of the Forms Router components.

[@igdianov](https://github.com/igdianov) worked on pipelines for Activiti Cloud Applications

[@cristina-sirbu](https://github.com/cristina-sirbu) Continued working on Activiti Cloud Events Adapter Service. Changed communication with RabbitMq (used Spring Cloud Stream). Helm Chart for this in progress. Also discovered the new Activiti Full Example App.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on applying new audit service API interface to

<https://github.com/Activiti/activiti-cloud-audit-service-mongo>.

[@almerico](https://github.com/almerico) Created presentation cluster based on new Activiti Cloud version.

[@miguelruizdev](https://github.com/miguelruizdev) worked on the ttc workshop, trying it out against the Beta1 version and identifying the changes that need to be implemented for it to work again.

[@ryandawsonuk](https://github.com/ryandawsonuk) Setup acceptance tests to run in a new custer against a JX-deployed example as part of review of CI/CD practices. Submitted PRs to Jenkins-X draft packs to help keep Activiti charts close to JX default practices. Helped Elias with package name refactoring to refine the API clarity/readability.

[@erdemedeiros](https://github.com/erdemedeiros) worked with @Salaboy and @ryandawsonuk to get Activiti API and Activiti Cloud API extracted to dedicated repositories (<https://github.com/Activiti/activiti-api> and <https://github.com/Activiti/activiti-cloud-api>). Maven modules has been renamed and package structure has changed.

[@salaboy](http://twitter.com/salaboy) worked on the next round of refactoring with [@erdemedeiros](https://github.com/erdemedeiros) and [@ryandawsonuk](https://github.com/ryandawsonuk) we aligned package names, maven module names and repositories to follow the same conventions. This will make it easy to document and easy to maintain in the long run. This changes are also helping us to move forward Continuous Delivery and we will keep our experimentation with Jenkins X to build each repository.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
