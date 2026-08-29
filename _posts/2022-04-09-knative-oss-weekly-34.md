---
title: "Knative OSS Weekly #34"
date: 2022-04-09 10:26:24 +0000
permalink: /2022/04/09/knative-oss-weekly-34/
description: "What a week!!!! loads of in-flight initiatives, conferences preparation talks and exciting news!"
tags:
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "docker"
  - "engine"
  - "English"
  - "event"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "sig-events"
  - "book"
  - "CD"
  - "community"
  - "eventing"
  - "functions"
  - "knative"
original_url: https://www.salaboy.com/2022/04/09/knative-oss-weekly-34/
---

What a week!!!! loads of in-flight initiatives, conferences preparation talks and exciting news! I will try to keep this blog short so let's go straight to the point:

- Knative Eventing Enlightining Session
- Continuous Delivery for Kubernetes - Chapter 7: Functions for Kubernetes
- Func Initiatives:  CRD Like resource refactoring and exporting Knative Service to enable override
- Knative Eventing Working Group update

### Knative Eventing Enlightining Session

This past Thursday I did my first [Enlightining Session about Knative Eventing](https://youtu.be/eRKR53nOKyA) and it went really well. I am super happy about all the feedback that I got on Twitter and the beautiful lightboard drawings really made my week. You can find the recording here: <https://youtu.be/eRKR53nOKyA> Thanks a lot [Whitney](https://twitter.com/wiggitywhitney) for having me on the show it was sooooo much fun! Follow [@wiggitywhitney](https://twitter.com/wiggitywhitney) on Twitter for news about Enlightening!

[![Knative eventing](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/04/knative_eventing.jpg)](/content/images/2022/04/knative_eventing.jpg)

I believe that now with [Carlos' Knative Servicing](https://www.youtube.com/watch?v=Z9epsn52M6s) session and having covered Knative Eventing we have enough background to do a session on Knative Functions!

### #CD4K8s Chapter 7: Functions for Kubernetes

This past week [Chapter 7 titled Functions for Kubernetes](https://www.linkedin.com/feed/update/urn:li:activity:6917788053709152257/) was released under the Manning MEAP program. This chapter is all about leveraging a function-driven approach to build distributed, decoupled and event-driven systems. In this chapter, we build on top of what we have been learning about Knative Serving, Knative Eventing and Tekton to provide a simplified developer experience that let developers focus on writing their business logic, instead of writing Dockerfiles or YAMLs. Feedback is highly appreciated!

[![Salatino hi](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/12/salatino-hi-1.png)](https://www.linkedin.com/feed/update/urn:li:activity:6917788053709152257/)

### Knative Func updates

I will continue with the work to refactor the current structure of the `func.yaml` file into a CRD-Like resource. Some definitions were made during the week around splitting this work to also enable func to export the Knative Service that `func deploy` generates for overriding more advanced configurations. While the main idea behind the `func.yaml` is to keep a simple configuration file without a complex structure, enabling `func` to reuse a Knative Service descriptor for more advanced configurations makes a lot of sense and adds a lot of flexibility.

While thinking about exporting the Knative Service, I believe that we can go one step further and create a new directory called `config/` or `resoruces/` where we can store the exported Knative Service or any other resource that `func` can use when running `func deploy`. This will enable use cases where we want to deploy our function along with another resource, for example, some triggers.

If you are interested in this feature or into getting involved please reach out or add a comment in the following Github issue: <https://github.com/knative-sandbox/kn-plugin-func/issues/817>

### Knative Eventing Working Group update

On the Knative Eventing side, there were great discussions about moving some experimental features to GA and moving those features to the Knative Eventing Spec, which pushes all broker's implementations to add the feature. The conversation included two main features: Time Outs for delivery and CloudEvents SQL filters. I am looking forward to seeing these features popping up in the spec and into the RabbitMQ Broker.

We also touch on conformance profiles (coarse grain profiles), for example, one to cover Brokers and Triggers and another for Channels and Subscriptions. It is my personal belief that the Knative Event Spec might benefit from having these profiles and then a more strict conformance test suite and documentation to validate which components are actually implementing the specs. By having a clear understanding of the spec coverage, all the implementation benefits and all the users have a clear picture of which features are provided.

We also started a Flows task force with an intention to define goals and the scope of the work around flows. The conversations so far include streaming scenarios and more traditional workflows (task-driven) scenarios as well. I will be providing more updates about this task force every week.

Stay tuned! See you all next week!
