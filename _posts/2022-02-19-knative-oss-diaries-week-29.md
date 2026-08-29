---
title: "Knative OSS Diaries – week #29"
date: 2022-02-19 10:22:44 +0000
permalink: /2022/02/19/knative-oss-diaries-week-29/
description: "This past week felt like 3 months, so this blog post is more about the highlights than what actually happened."
tags:
  - "book"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "crossplane"
  - "docker"
  - "English"
  - "event"
  - "func"
  - "go"
  - "Java"
  - "kubernetes"
  - "open source"
  - "oss"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "CD"
  - "cloudnative"
  - "eventing"
  - "k8s"
  - "knative"
  - "tutorial"
original_url: https://www.salaboy.com/2022/02/19/knative-oss-diaries-week-29/
---

This past week felt like 3 months, so this blog post is more about the highlights than what actually happened. Monday and Tuesday I was still recovering from COVID 🤒, but I got some really good news:

- I got accepted to talk at [Devoxx UK](https://www.devoxx.co.uk/) with my friend [Thomas Vitale](https://twitter.com/vitalethomas), we will be talking about Knative `func` + Knative + Spring Cloud Functions + Spring Native. I am super excited with this opportunity as it is close to home and I will manage to finally meet and present with Thomas. I am sure that we will be building a demo out in the open and we will probably need help on testing it and suggestions on how to improve it. If you are interested get in touch!
- A new chapter of my book [Continuous Delivery for Kubernetes](http://mng.bz/N492) was released as part of the MEAP program. This chapter is about Event-Driven architectures and how [Knative Eventing](https://knative.dev/docs/eventing/) can help you building those when you are working with Kubernetes.
- I got an invitation to join [Whitney Lee](https://twitter.com/wiggitywhitney) to do a Twitch session around Knative Eventing for VMware Tanzu TV Enlightning sessions, where we will try to explain Knative Eventing concepts with some cool live drawings. If you haven't checked out her session about [Dockerfiles and CloudNative Buildpacks](https://www.twitch.tv/videos/1300983001) with [Cora Iberkleid](https://twitter.com/ciberkleid) you should!

### Knative `Func` weekly

This short week I spend some time working on an example to connect different functions together, to be able to show people some low-level details about how functions work, what do you need from Knative Eventing to connect them and also some differences between different frameworks in different languages. You can find the step-by-step tutorial (still in draft) in my GitHub repository: <https://github.com/salaboy/from-monolith-to-k8s/blob/master/knative/func.md> .

You can find the functions projects that I've created here:

- Java `Func` Project (Spring Boot + Spring Cloud Functions + Spring Native) <https://github.com/salaboy/fmtok8s-java-function>
- Go `Func` Project <https://github.com/salaboy/fmtok8s-go-function>

Both of these functions are doing the same, in different languages but both accept a [CloudEvent](http://cloudevents.io) (*UppercaseRequestedEvent*), do some processing and then return a [CloudEvent](http://cloudevents.io) (*UpperCasedEvent*).

If we are using Knative Eventing, we can create a Broker and some triggers to route events to our functions.

[![Fmtok8s funcs and broker trigger](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/02/fmtok8s-funcs-and-broker-trigger-2.png)](/content/images/2022/02/fmtok8s-funcs-and-broker-trigger-2.png)

With this simple setup, every time that we put a ***UppercaseRequestedEvent*** into the **Broker**, both functions will receive a copy of the event, do some processing and then place it in the Broker one ***UpperCasedEvent*** each. At this point, we are not doing anything with ***UpperCasedEvent***, we can definitely can. For this, we need a new function and trigger, so functions can be chained together by just subscribing to another function output event:

[![Here we chain functions based on the CloudEvents that they produce, but we also include more than one function per func project which require us to have a routing mechanism inside the project which can decide to which internal function the CloudEvent needs to be routed. If you are using Spring Cloud Functions, you can use their provided router that can be configured to inspect the CloudEvent headers and route based on their values, for example, based on the CloudEvent Type ( ce-type ):](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/02/fmtok8s-funcs-and-broker-trigger-chain-2.png)](/content/images/2022/02/fmtok8s-funcs-and-broker-trigger-chain-2.png)

*Here we chain functions based on the CloudEvents that they produce, but we also include more than one function per func project which require us to have a routing mechanism inside the project which can decide to which internal function the CloudEvent needs to be routed. If you are using Spring Cloud Functions, you can use their provided router that can be configured to inspect the CloudEvent headers and route based on their values, for example, based on the CloudEvent Type ( ce-type ):*

spring.cloud.function.definition=functionRouter spring.cloud.function.routing-expression=headers['ce-type']

<https://github.com/salaboy/fmtok8s-java-function/blob/main/src/main/resources/application.properties>

To get this example working I needed to tweak a bit some of the projects involved, issues and pull requests were created 🥳:

- <https://github.com/spring-cloud/spring-cloud-function/issues/806>
- <https://github.com/spring-cloud/spring-cloud-function/issues/804>
- <https://github.com/spring-projects-experimental/spring-native/pull/1496>
- <https://github.com/knative-sandbox/kn-plugin-func/pull/840>
- <https://github.com/knative-sandbox/kn-plugin-func/pull/838>

Luckily, most of the changes in [Spring Cloud Functions](https://spring.io/projects/spring-cloud-function#overview) were included in the 3.2.2 Release.

A couple of issues and PRs to keep an eye on for the next couple of weeks:

- **Openshift detection logic, really nice conversation in the PR**: <https://github.com/knative-sandbox/kn-plugin-func/pull/825>
- **CRD-Like func.yaml discussion and PoC**: <https://github.com/knative-sandbox/kn-plugin-func/issues/817>

### CD Events Proposal and Knative Integration

My friend [Ishan K](http://twitter.com/ishankhare07)[h](http://twitter.com/ishankhare07)[are](http://twitter.com/ishankhare07) is making solid progress on building a PoC with a new large use case using CD Events with Knative and Crossplane. More news about this soon, as we might be presenting together at CDCon if our proposal gets accepted!

Also, I just found this issue 🥳 CDEvents day at KubeCon EU!: <https://github.com/cdfoundation/sig-events/issues/115>

**Repos:**

- <https://github.com/cdfoundation/sig-events>
- <https://github.com/cdfoundation/sig-events/issues/107>
- <https://github.com/salaboy/knative-serving-events-controller>
- <https://github.com/salaboy/cdevents-provider>

See you all next week!
