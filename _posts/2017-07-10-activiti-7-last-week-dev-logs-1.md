---
title: "Activiti 7: Last week Dev Logs #1"
date: 2017-07-10 07:10:37 +0000
permalink: /2017/07/10/activiti-7-last-week-dev-logs-1/
description: "Hi everyone, welcome to the Activity 7 Dev Logs #1 (3/07/17-9/07/17). Last week we published the initial short term roadmap for Activiti 7 and we started…"
tags:
  - "activiti7"
  - "case management"
  - "cloud"
  - "community"
  - "English"
  - "Java"
  - "microservices"
  - "open source"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn2"
  - "engine"
  - "roadmap"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/07/10/activiti-7-last-week-dev-logs-1/
---

Hi everyone, welcome to the Activity 7 Dev Logs #1 (3/07/17-9/07/17).

Last week we published the initial [short term roadmap for Activiti 7](/2017/07/05/activiti-7-kick-off-roadmap/) and we started executing according that plan. We got a lot of great feedback and some external community contributors are already working with us. This is a short update about what we did last week.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) our community contributor from Japan is helping us with cleaning up the parent pom dependencies and tests that are failing when the Locale is set to Japanese. He is also having discussions with @ryandawsonuk about IDM and is that going to work in the future. You can track Daisuke work here: <https://github.com/daisuke-yoshimoto>

[@fcorti](https://github.com/fcorti) and @cijujoseph are working on creating our flagship example process that we will use to demonstrate all the new changes in the project infrastructure .

[@balsarori](https://github.com/balsarori) helped us with clean up of the old Form classes contained inside the process engine.

[@erdemedeiros](https://github.com/erdemedeiros) is working on the new REST HAL APIs and Data Types, this is an initial PoC to make sure that we can interact with the process engine via REST making sure that we have clear definitions (in JSON format)  of the data types accepted and returned by these endpoints. You can track Elias' work here: <https://github.com/erdemedeiros>

[@ryandawsonuk](https://github.com/ryandawsonuk) is working on integrating keycloak as our default IDM and SSO provider and removing the IDM module from inside the process engine. This is valuable contribution to the keycloak project as well that it didn't supported spring boot 2 just yet, so Ryan [provided the PR to the spring boot keycloak adapter](https://github.com/keycloak/keycloak/pull/4279).  You can track Ryan's work here: <https://github.com/ryandawsonuk>

[@salaboy](http://twitter.com/salaboy) (myself) I'm working in making sure that the process engine emits events using well defined data types via messages using Spring Cloud Stream. These messages should use the same JSON data types and payloads that Elias is defining, so I'm currently working in a PoC to demonstrate this event emitters and endpoints in action. You can track my work here: <https://github.com/Activiti/Activiti/tree/history-refactoring>

Consider that all the code references are work in progress so they will evolve accordingly once the basics are done. We aim to improve coverage and code with every commit/merge to master branch.

### This Week in Activiti 7

This week  we are moving the activiti-rest and activiti-common-rest modules to the [activity-compatibility repository](https://github.com/activiti/activiti-compatibility), so we can focus only on the core engine inside the Activiti repository.

We will aim to have a first draft of all Data Types, Commands and Endpoints for the new HAL APIs and message based communications, so we can share and ask for feedback to the community. We will also try to have a working example with Keycloak to demonstrate all the advantages of having a fully fledge SSO and pluggable IDM for our infrastructure.

NOTE: if you want to send a contribution to 6.x version of the engine please  send PRs to the 6.x branch. We are going to a clean up process in Github, so if you have an open PR, branch or issue please get in touch. We will not discard any issue but we need to make sure that all the PRs, branches and issues are still relevant.

[Feel free to join us in the official Gitter channel of the project and join the discussions.](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
