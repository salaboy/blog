---
title: "Spring Cloud Kubernetes Catchup #2 (23/10/18)"
date: 2018-10-24 08:03:28 +0000
permalink: /2018/10/24/spring-cloud-kubernetes-catchup-2-23-10-18/
description: "We (@spencerbgibb, @ryanjbaxter, @trisberg, @iocanel, @geoand) had another very productive session yesterday about the future of Spring Cloud Kubernetes."
tags:
  - "activiti cloud"
  - "English"
  - "Java"
  - "knative"
  - "kubernetes"
  - "open source"
  - "spring cloud"
  - "progress"
  - "roadmap"
  - "transparency"
  - "weekly"
original_url: https://www.salaboy.com/2018/10/24/spring-cloud-kubernetes-catchup-2-23-10-18/
---

We ([@spencerbgibb](https://twitter.com/spencerbgibb), [@ryanjbaxter](http://@ryanjbaxter ‏), [@trisberg](https://twitter.com/trisberg), [@iocanel,](https://github.com/iocanel) [@geoand](http://github.com/geoand)) had another very productive session yesterday about the future of Spring Cloud Kubernetes.

Here are some of the topics that we discussed:

- Documentation: is still top of the list. We need to align the current README.md files to AsciiDoc so it can be aggregated with all the other Spring Cloud Projects.
- Testing, we discussed about Arquillian Cube and how we can use it to improve the test coverage.
- Examples: we are still trying to find out what is the best way to link to more complex examples that people can see and run in their own clusters/MiniKube/microk8s
- Roadmap and deadlines: the 15th of November there is a planned milestone for the [Spring Cloud Greenwich release](https://github.com/spring-cloud/spring-cloud-release/milestones?direction=asc&sort=due_date). We are going to review how much bug fixes and features can be included in that milestone.
  - As a parallel discussion we also discussed about releases for the 0.2.x branch which is Spring Boot 1.5.x based.
- The Kubernetes Service Catalog integration was discussed as well (Connector vs AutoConfiguration approaches).
- Istio Awareness was discussed as well, and it is becoming clear where the starting points will be.

For next week, we will focus on triaging issues that are already reported to the different milestones and see what is the order of priority for those issues.

This is a great time to get involved, if you are interested in this project take a look at the [reported issues](https://github.com/spring-cloud/spring-cloud-kubernetes/issues) and write comments on the one that you think that should be prioritised first.

If you re interested in these topics or if you want to get involved you can join us on our next catch up every Tuesday at 4:30pm London UK time using this [Zoom Meeting link](https://alfresco.zoom.us/j/407166668).

If you want to get an invite to your calendar get in touch and we can add you to the group.
