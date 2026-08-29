---
title: "Knative OSS Weekly #35"
date: 2022-04-16 10:45:29 +0000
permalink: /2022/04/16/knative-oss-weekly-35/
description: "A lot of hacking was done this week and a lot of coordination for the upcoming conferences is starting to happen."
tags:
  - "book"
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "crossplane"
  - "docker"
  - "engine"
  - "English"
  - "event"
  - "func"
  - "go"
  - "helm"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "tekton"
  - "cdevents"
  - "cloudnative"
  - "eventing"
  - "events"
  - "knative"
  - "oss"
original_url: https://www.salaboy.com/2022/04/16/knative-oss-weekly-35/
---

A lot of hacking was done this week and a lot of coordination for the upcoming conferences is starting to happen. With Devoxx UK, KubeCon, CDEventsCon, KnativeCon and Spring I/O happening in May we (as a community) take the opportunity to create demos to highlight the latest features of the projects that we are working and in the process we refine, find and fix bugs and improve documentation. Some people will call this CDD (Conference-Driven Development), but I personally take this as an opportunity to challenge and push the limit on the tools that we are building for more than "Hello Worlds" examples.

These are the sessions and conferences where I will be presenting, so if you are around feel free to drop by and say hello:

- [Devoxx UK (London, UK)](https://www.devoxx.co.uk/speaker-details/?id=5362) - Knative and Spring - Bringing back the func
- [Devoxx UK (London, UK)](https://www.devoxx.co.uk/speaker-details/?id=5362) - Reduce Cognitive Load: Pave the Golden Path On Your Internal Platform
- [KnativeCon (Valencia, Spain)](https://events.linuxfoundation.org/knativecon-europe/program/schedule/) - Knative Functions: An Introduction, Demonstration and Roadmap
- [CDEventsCon (Valencia, Spain)](https://cdeventscon2022.sched.com/event/10GLj/expanding-interoperability-in-the-cd-ecosystem-mauricio-salatino-vmware) - Expanding Interoperability in the CD Ecosystem
- [KubeCon (Valencia, Spain)](https://kccnceu2022.sched.com/event/ytlS/overview-and-state-of-knative-mauricio-salatino-vmware-carlos-santana-ibm?iframe=yes&w=100%&sidebar=yes&bg=no) - Knative Maintainers Track - Overview and State of Knative
- [KubeCon (Valencia, Spain)](https://kccnceu2022.sched.com/event/11LVP?iframe=no) - Dockerless and YAMLess experience for Kubernetes
- [Spring I/O (Barcelona, Spain)](https://2022.springio.net/sessions/knative-and-spring-native-bringing-back-the-func) -  Knative and Spring Native - Bringing back the func

### Quick Overview of some demos and initiatives

Because most of the sessions are short and there is not enough time to go deep on all the topics that we (co-speakers and myself) want to cover, we try to create demos that show the projects in action, instead of using slides and diagrams. The good thing is that even with the same demo, we can demonstrate different aspects of it to different audiences. While we will have some sessions more focused on scaling and infrastructure other sessions will be more focused on developer experience. While some sessions might be focused on getting started with simple use cases, another session will have more focused on CloudEvents and Event-Driven Architectures which can be interesting to more advanced audiences looking for eventing solutions in cloud-agnostic environments.

One thing that all sessions have in common is that all the demos show polyglot environments with a heavy focus on integrations and interoperability of different tools from the Cloud Native landscape. I am passionate about using multiple projects to deliver business value and save developers time. There is no single tool that can achieve that for us, hence we need to glue multiple tools together.

Here are some of the stuff that I am working on with a whole community of people and not just the co-speakers on the presentations.

#### Functions for Kubernetes, getting started and developers' experience

Architecting applications using a functions approach takes a different mindset and this mindset requires us (developers) to have the appropriate tools to be efficient. When working with functions, first of all we will not be able to save any single bit of state, hence we will need to have storage, for the simple demo we chose Redis which provides us with a Key/Value store to keep track of the application data. Depending on the functionality that you are trying to build, you will need to define which functions you need and who is going to call these functions.

[![Game architecture](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/04/game-architecture-1.png)](/content/images/2022/04/game-architecture-1.png)

The use case of the example doesn't matter much here, but when you have multiple functions and you are enabling users to interact with them from outside the cluster a FrontEnd Service is usually needed to serve as the API Gateway that will be in charge of creating requests to the functions, which are only accessible for services inside the cluster. This functions paradigm promotes functions to be written in different languages and using different tech stacks, opening the door for testing different frameworks and programming languages, hence we will be showcasing different tools and programming models to highlight common pitfalls and issues that you will find when building applications like this one.

While for this simple use case all the interactions are happening in a synchronous fashion using HTTP requests, the application can be extended to use Knative Eventing and CloudEvents to leverage a more Event-Driven approach for cases that requires async communications.

The examples around this scenario become really complicated when we start talking about scaling and handling bidirectional connections with the client-side application by for example working with WebSockets to build a more reactive application. If you are curious and want to see what we are up to check the following repo which is still a work in progress: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/game>

#### Platform Building, Supply Chain and integrations

Switching gears to platform building, continuous delivery and allowing teams of developers to have what they need in a self-service way, I am collaborating with the folks building [Kratix](https://github.com/syntasso/kratix), an OSS supply chain tool that allows us to declaratively build platforms in a tools independent way.

The aim here is to show some key topics, challenges and pitfalls that you will need to consider when you embark on the journey of building your own internal or external platform as a service. We will be showing just one solution that can help you to save time, but we hope the core concepts translate to other projects and tools.

[![Platform building first draft](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/04/platform-building-first-draft-2.png)](/content/images/2022/04/platform-building-first-draft-2.png)

Check out [Kratix](https://github.com/syntasso/kratix) and this repo for more information about the demo using Knative, Crossplane, Kratix and RabbitMQ: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/platform>

#### CloudEvents for interoperability

Finally, it is becoming quite clear that some kind of integrations between tools is being built using the Kubernetes Control Plane, usually by defining new CRDs that serve as interfaces for all the tools to use to provision and reconcile infrastructure. While this is great and Kubernetes has come a long way to become the defacto way for us to express which resources we want, there is still a big gap in the Data Plane (how services talk to each other) way of integrating different tools that had been designed using different protocols and technology stacks. Luckily for us, the CloudEvents Specification came to be that transport/protocol-agnostic way of sharing Events between different systems.

With this in mind, the presentations that I am working on are all about integrating tools like Knative, Crossplane, Tekton, Cartographer and to be honest any other tool by just using CloudEvents.

Some flows that we are looking to implement are the following:

Tekton and Knative work together based on events, no need to build an integration if they know what to do when they exchange certain kinds of events:

![Monitoring Knative Serving Services to trigger pipelines for load testing or benchmarking.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/7482025/152681048-389042ba-4ddd-4230-874a-3f6fdb2163b7.jpg)

*Monitoring Knative Serving Services to trigger pipelines for load testing or benchmarking.*

![Knative OSS Weekly #35](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/7482025/152681158-f187e6f4-cbc1-4fc4-827b-181cea60b3a1.jpg)

For all these integrations to work, you need a common and shared vocabulary of events that can capture these interactions, without the need for you to come up with those definitions. For that reason, the CDFoundation CDEvents is working hard to put these events to test in these scenarios: <https://cdevents.dev/>

### Sum up

Feel free to get in touch if you want to collaborate with these initiatives and examples. We are learning so much in the process of building these demos that I would strongly recommend joining these initiatives if you are interested in Open Source, integrations, the Cloud Native Landscape and coding in general.

Stay safe and do more Open Source! See you all next week!
