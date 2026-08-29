---
title: "Activiti: Last week Dev Logs #72"
date: 2018-11-19 08:51:52 +0000
permalink: /2018/11/19/activiti-last-week-dev-logs-72/
description: "Last week we worked quite hard to improve our library pipelines, acceptance tests and issues that we are targeting for Beta4."
tags:
  - "Java"
original_url: https://www.salaboy.com/2018/11/19/activiti-last-week-dev-logs-72/
---

Last week we worked quite hard to improve our library pipelines, acceptance tests and issues that we are targeting for Beta4. We welcomed 3 new (but well-known) members in our community effort [@CTI777](https://github.com/cti777), [@almerico](https://github.com/almerico) and [@igdianov](https://github.com/igdianov) who are working full time in our [Beta4](https://github.com/activiti/activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3ABeta4) milestone. We have closed 9 issues already and we hope to be able to tackle down most of what is still open in the following next two weeks.

[@CTI777](https://github.com/cti777) worked on admin suspend/resume end points and integration tests.

<https://github.com/Activiti/Activiti/issues/2150>, <https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/145>

<https://github.com/Activiti/Activiti/issues/2148> (in progress)

[@almerico](https://github.com/almerico) working on new the automation of the example repositories towards automated testing with acceptance tests.

https://github.com/Activiti/activiti-cloud-query/pull/47

Worked also on <https://github.com/Activiti/Activiti/issues/2117>  and <https://github.com/Activiti/Activiti/issues/2151>

[@igdianov](https://github.com/igdianov) Worked on

- [Enable single pull request merge for updatebot configurations in activiti-dependencies repository](https://github.com/Activiti/Activiti/issues/2167) (wip)
- [It would be nice to have additional attributes in RuntimeEvent](https://github.com/Activiti/Activiti/issues/2069) (wip)
- [ParentId added to process instance and events API](https://github.com/Activiti/activiti-api/pull/39) (ready for review)
- [fix: Rename REST endpoint to resume a suspended process](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/147)  (closed)
- [feat: add process runtime context attributes in RuntimeEvent api](https://github.com/Activiti/activiti-api/pull/35) (closed)
- [fix: add missing processInstanceId in RuntimeEvent api](https://github.com/Activiti/activiti-api/pull/37) (closed)

[@balsarori](https://github.com/balsarori) Working on variable mapping

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) did some improvements on modeling regarding json based model types required in aps side

[@miguelruizdev](https://github.com/miguelruizdev) worked on the refactoring of acceptance tests

[@ryandawsonuk](https://github.com/ryandawsonuk) worked on validation of process variables at process start and making process variables easy to interact with as json for <https://github.com/Activiti/Activiti/issues/2049>. Presented together with [@mteodori at a public meetup about our experiences with keycloak](https://skillsmatter.com/skillscasts/13120-identity-management-and-single-sign-on-how-much-flexibility)

[@erdemedeiros](https://github.com/erdemedeiros) worked to make process definitions available from query (<https://github.com/Activiti/Activiti/issues/2149>). Currently they are only available from Runtime Bundle. Experimented some problems because the spring cloud message was sent to early (work in progress).

[@salaboy](http://twitter.com/salaboy) working with [@igdianov](https://github.com/igdianov) and [@almerico](https://github.com/almerico) on the automation of our example layer and overall improvements to our pipelines. Worked with [@miguelruizdev](https://github.com/miguelruizdev) to finish the Acceptance Tests refactoring and merged the changes in our new repositories. I did some work during the weekend to update the Gitbook to start preparing for Beta4 <https://www.gitbook.com/book/activiti/activiti-7-developers-guide/>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
