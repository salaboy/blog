---
title: "Knative OSS Diaries - week #23"
date: 2022-01-08 10:27:43 +0000
permalink: /2022/01/08/knative-oss-diaries-week-23/
description: "Ok, so not much news on my side since I've been catching up most of the week with the different initiatives happening in the Knative community."
tags:
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "eventing"
  - "func"
  - "go"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "spring cloud"
  - "spring-native"
  - "tutorial"
original_url: https://www.salaboy.com/2022/01/08/knative-oss-diaries-week-23/
---

Ok, so not much news on my side since I've been catching up most of the week with the different initiatives happening in the Knative community. I've been also writing [Chapter 6 of the Continuous Delivery for Kubernetes](http://mng.bz/jjKP) book where I am focusing on building Event-Driven applications with [Knative Eventing](http://knative.dev). Because of that, I wanted to get a very simple example comparing frameworks like Spring Boot in Java to a more simple stack like Go. The whole point of the example is to show the parallelism between different tools, in this case using the [CloudEvent SDKs](http://cloudevents.io) for Java and Go. Before expanding a bit more on the example here is a list of things that are happening and I am involved. I hope to be able to get into more details in the following weeks when I manage to push these initiatives forward. Unfortunately, this week felt a bit slow as I am just getting started and there are tons of in-flight planning happening.

### Knative Initiatives

The following projects/initiatives are happening in the following weeks

- **`func` progress with OnCluster Builds:** there is progress being made towards allowing `func` projects to be built remotely with pipelines preconfigured using Tekton. I will be creating a PR to the `kn-plugin-func` repository with the Tekton task definitions for `func build` and `func deploy` tasks which are currently located here: <https://github.com/salaboy/func-oncluster-build-experiments/tree/main/catalog/task> . Getting OnCluster Builds to work on a Kubernetes cluster where you had admin rights should be pretty straight forward, but getting all these configured in more restricted environments has proven to be challenging, so the work will be split into getting it working first end-to-end and then fine-tune the configurations for more restricted scenarios. I do personally want to enable the integration with other pipeline engines using [CD Events](http://github.com/cdfoundation/sig-events), but that is going to take much more time and coordination.
- **`func` repository reorg (`kn-plugin-func`):** there is work being done to rename the repository to just `func` and also split the core functionality in a module repository called `func-pkg`. This will help to separate the CLI from the core library and utility functions which can be embeded in other clients.
- **Knative Release 1.2** is coming along and it should [be out by the 25th Jan](https://github.com/knative/release#schedule)
- [**CNCF Due Dillegence Document**](https://docs.google.com/document/d/e/2PACX-1vSh2fYe7cFGYMieKinzgguVu2AYV4Nv3NMiFVXR3rx60MEQxZBGgfsYAdekrlgWjkbLHLpSEI9_2vLq/pub) is being completed to [move forward the incubation proposal](https://github.com/cncf/toc/pull/762), If you are intersted in helping out reach out to [Evan Anderson](https://twitter.com/e_k_anderson) who is leading and coordinating the collaboration to get this done.

### Other initiatives

Here are just some other initiatives that are ongoing that I think will be taking some of my time in the next following months:

- **[Tickets Sale Portal as part of my From Monolith to K8s examples](https://github.com/salaboy/from-monolith-to-k8s/blob/master/knative/knative-eventing-example.md):** this example shows an Event-Driven application using Knative Eventing, CloudEvents and different brokers implementaions such as RabbitMQ and Kafka. The angle for this example is to show a medium complexity application which requires CloudEvents to be delivered to different services including a FrondEnd application using React and WebSockets.
- **Real-Time interactive serverless Game**: I will be building a simple game to test Knative `func`, the main idea behind this example is to test the platform and shows how developers can continously build a game by adding new levels in a polyglot environment. This example relies on functions and CloudEvents heavily to simplify the developer experience and will allow us to go deeping into fine-tuning Knative for scaling to provide an interactive experience with multiple players playing at the same time.
- **[Donating From Monolith to K8s to a foundation:](https://github.com/salaboy/from-monolith-to-k8s)** I will heavily refactoring the repository to be able to donate the example, including source code and tutorials to a foundation where other tools can be added and tutorials can be maintained by a community. I believe that the examples and tutorials are getting mature enough to provide value to a wider community. If you are reading this and feel like giving the main repository a star, that would help a lot to demonstrate the value of the examples to justify a donation.

### CloudEvents example

I've been working a bit on a very very very simple example to create consumers and producers of CloudEvents into different tech stacks. The whole purpose is to evaluate the state-of-the-art tooling around languages to understand more in-depth the pain that developers need to go to just consume and produce CloudEvents in polyglot environments. I've started with Go and Java, but as I mentioned I am interested in real-life tools and frameworks that people will use if they are building real-life applications, hence I needed to go deeper into choosing frameworks, libraries and tools to create these very simple projects. I also tried to in some way maintain parallelism in the projects, for example, using the same environment variables to customize the applications.

The end result should be an end to end tutorial where you can get producers and consumers sending events to each other. Because I am all about Kubernetes and because I don't expect everyone to set up all the developer tools needed to get the examples going, I've packaged each application using Docker, hence the evaluation of tools and frameworks also cover what is needed to package and distribute these containers.

This example requires its own blog post, but you can find the tutorial and the links to the projects here: <https://github.com/salaboy/from-monolith-to-k8s/tree/master/cloudevents>

If you are familiar with Rust, Python or JavaScript and want to help me to expand the examples I would really appreciate it. At the end of the day, I end up going back to these examples every time that I want to try out a new idea or quickly get started with a new project, hence I believe that these examples can be really useful for other people too.

See you all next week with more updates from the community!
