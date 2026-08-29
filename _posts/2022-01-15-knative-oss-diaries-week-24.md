---
title: "Knative OSS Diaries – week #24"
date: 2022-01-15 11:46:02 +0000
permalink: /2022/01/15/knative-oss-diaries-week-24/
description: "Welcome once again to these weekly report on what I've been up to in the Knative community and some other personal and community updates."
tags:
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "docker"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "serving"
  - "spring-native"
  - "cloudnative"
  - "community"
  - "containers"
  - "knative"
  - "open source"
  - "oss"
  - "tekton"
  - "weekly"
original_url: https://www.salaboy.com/2022/01/15/knative-oss-diaries-week-24/
---

Welcome once again to these weekly report on what I've been up to in the Knative community and some other personal and community updates.

This last week was all about planning and writing proposals for conferences. For **KubeCon**, and conferences which are closer to the infrastructure, I am really interested in presenting about Platform building and how different tools can be glued together to simplify the day to day delivery for different teams. I've noticed that for developer conferences (**SpringOne, Devoxx, JOnTheBeach, JBCNConf**, etc.) I am all about making sure that different services can be written using different tech stacks, all relying on the same principles and standards without making use of stack dependent tools and frameworks that makes them not to play nice with each other. It is also becoming a pattern for me to submit proposals with other speakers, not only because it is more fun, but because I've noticed that the quality of the proposals and the end results are way much better than when I do things on my own. Which takes me to the next point, if you are interested in submitting and presenting into a conference and you want to pair up with me to write the proposal, submit and present I am all in for that. I am starting to enjoy reviewing and reading other's proposals and I believe that I can provide valuable feedback.

### Knative weekly update

This week I was hit by a [regression in Knative Serving 1.1](https://github.com/knative/serving/issues/12462), which is already fixed related with liveness probes in Knative Services. It is super cool to see when you report and issue and this was already reported 3 days previously and there was a fix already merged and ready to go out to 1.2, but also back ported to other releases as well. This is definitely one of the signs that you need to look for in Open Source projects before adopting it.

This week also most of the [PRs for the On Cluster Build](https://github.com/knative-sandbox/kn-plugin-func/pulls?q=is%3Apr+is%3Aclosed) for the project `func` were merged, so there is something new to play around with. These PRs implemented a basic flow for building `func` projects using Tekton pipelines. The `func` now creates programatically [Tekton pipelines](http://tekton.dev) to build and deploy `func` projects using [Tekton](http://tekton.dev) Tasks. If you are interested in contributing to this initiative, check [this issue](https://github.com/knative-sandbox/kn-plugin-func/issues/620) which describe some of the remaining tasks to get this working in different environments and with different providers.

I was also looking at the [RabbitMQ Broker](https://github.com/knative-sandbox/eventing-rabbitmq/) implementation for Knative and I was surprised by the numbers and the performance analysis that [you can find here](https://github.com/knative-sandbox/eventing-rabbitmq/tree/main/test/performance/broker-rmq).

I've also started with a community friend ([Ishan Khare](https://twitter.com/ishankhare07)) the Knative Serving and Eventing CD Events Controllers, that you can find here:

- [Knative Serving CD Events Controller (WIP)](https://github.com/salaboy/knative-serving-events-controller)
- [Knative Eventing CD Events Controller (WIP)](https://github.com/salaboy/knative-eventing-events-controller)

These two projects are based on the `sample-controller` template and uses the CD Events SDK to emit CD Events. I am hoping to be able to expand the PoC demo included in the CD Foundation Repository to expand the integration capabilities with Knative events. I do see a lot of potential for integration purposes, interoperability and reducing dependencies in client applications such as `func`.

Next week I will be doing a streaming session, I will share more details via Twitter when I have them available.

See you all next week, and don't forget that you can reach out via [Twitter @Salaboy](http://twitter.com/salaboy) my DMs are open as always.
