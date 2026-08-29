---
title: "Knative OSS Weekly #49"
date: 2022-07-18 07:03:40 +0000
permalink: /2022/07/18/knative-oss-weekly-49/
description: "This week I was away for JBCNConf, a conference that I've joined every year since the conference started in 2015."
tags:
  - "CD"
  - "cdevents"
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
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "serving"
  - "spring cloud"
  - "spring-native"
original_url: https://www.salaboy.com/2022/07/18/knative-oss-weekly-49/
---

This week I was away for [JBCNConf](https://www.jbcnconf.com/2022/), a conference that I've joined every year since the conference started in 2015. This year I did a very unusual presentation comparing Go and Java in the context of Kubernetes, where I've presented tools like KubeBuilder, Java-Operator-SDK, and [Metacontroller](https://metacontroller.github.io/metacontroller/) with [Knative Functions](https://knative.dev), I am adding the slides and resources at the end of this blog post.  Before going into the Knative-related sessions at JBCNConf, let's do the 'good-first-issue's for the week:

- Updating RUST template dependencies: <https://github.com/knative-sandbox/kn-plugin-func/issues/1111>
- Do you have experience with GitHub actions? <https://github.com/knative-sandbox/kn-plugin-func/issues/982>

There were 4 sessions where Knative was mentioned (including mine) and a workshop:

- [Whitney's presentation](https://www.jbcnconf.com/2022/infoSpeaker.html?ref=576aeba6a8ebcbe244cc16bd0f973593673cc530) about Knative Serving introduction and live demos
- [Viktor's presentation](https://www.jbcnconf.com/2022/infoTalk.html?id=61f1a0e0c4c4120b9d29afa0) about how by enabling teams to build their own self-service platforms, we can abstract Kubernetes away  using Crossplane and Upbound
- [Thomas presentation about building Developer Experiences for Kubernetes](https://www.linkedin.com/posts/vitalethomas_developer-experience-with-java-on-kubernetes-activity-6954822232841842688-tjvf?utm_source=linkedin_share&utm_medium=ios_app)
- [Daniel Oh's](https://www.jbcnconf.com/2022/infoTalk.html?id=621908084010570ba9b6dd6b) workshop about serverless functions using Quarkus

As I've mentioned before, in my presentation, I've created a Metacontroller and Knative Functions example, but I couldn't stop there, I've created a [Pull Request to the MetaController project](https://github.com/metacontroller/metacontroller/pull/565) itself so Java developers can easily get started with MetaController instead of building fully-fledged K8s controllers.

### Metacontroller and Knative Functions

While working for my presentation at JBCNConf, I wanted to implement the same controller using different languages and frameworks to be able to compare. The use case I've implemented is pretty simple, the controller reconciles a new type of resource called Conference, and each Conference resource represents a set of services composing a conference application instance. This application is composed of 4 independent services, so the controller is in charge of monitoring these services by interacting with their APIs, and if and only if all the services are up, the controller should create a new Deployment to run a set of production tests.

[![Use case](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/use-case.png)](/content/images/2022/07/use-case.png)

I've created 4 different implementations for this controller using 3 different projects; you can find these on [GitHub](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers).

- [KubeBuilder](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers/kubebuilder/conference-controller)
- [Java Operator SDK](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers/java-operator-sdk/conference-controller)
- MetaController
  - [Spring Boot Service](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers/metacontroller/conference-controller)
  - [Knative Function using Spring Boot template](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers/metacontroller/func-conference-controller)

A quick and special mention to the implementation for MetaController and Knative Functions, because there is no official example with Java, I've submitted a PR to the metacontroller project with a simplification of the example using spring-boot and Knative Functions: <https://github.com/metacontroller/metacontroller/pull/565>

This example will require maintenance, documentation, and improvements; if you are interested in helping me with that, please feel free to reach out.

### AMA about Serverless in Kubernetes

This next Thursday, 28th July, at 6pm UK time, I will be joining Whitney, Viktor, and Daniel in an Ask Me Anything session about ***Serverless on Kubernetes***. Save the date!

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/Nv1qWibfsSw" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

### Slides and Pictures

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/252237812" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

[![Img 2138 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2138-2-small.png)](/content/images/2022/07/img_2138-2-small.png)[![Img 2140 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2140-2-small.png)](/content/images/2022/07/img_2140-2-small.png)[![Img 2141 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2141-2-small.png)](/content/images/2022/07/img_2141-2-small.png)[![Img 2143 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2143-2-small.png)](/content/images/2022/07/img_2143-2-small.png)[![Img 2144 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2144-2-small.png)](/content/images/2022/07/img_2144-2-small.png)[![Img 2145 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2145-2-small.png)](/content/images/2022/07/img_2145-2-small.png)[![Img 2147 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2147-2-small.png)](/content/images/2022/07/img_2147-2-small.png)[![Fygkca5xkaan cq](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/fygkca5xkaan_cq.jpg)](/content/images/2022/07/fygkca5xkaan_cq.jpg)[![Knative OSS Weekly #49](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2171.jpg)](/content/images/2022/07/img_2171.jpg)[![Knative OSS Weekly #49](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2170.jpg)](/content/images/2022/07/img_2170.jpg)[![Img 2151 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2151-2-small.png)](/content/images/2022/07/img_2151-2-small.png)[![Img 2152 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2152-2-small.png)](/content/images/2022/07/img_2152-2-small.png)[![Img 2160 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2160-2-small.png)](/content/images/2022/07/img_2160-2-small.png)[![Img 2136 2 small](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/img_2136-2-small.png)](/content/images/2022/07/img_2136-2-small.png)
