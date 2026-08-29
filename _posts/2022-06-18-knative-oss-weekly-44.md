---
title: "Knative OSS Weekly #44"
date: 2022-06-18 07:27:29 +0000
permalink: /2022/06/18/knative-oss-weekly-44/
description: "It is always fantastic to see how vibrant the Knative community is. This week I've participated in various conversations about great ideas to move the…"
tags:
  - "CD"
  - "cdevents"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloudevents"
  - "engine"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "platform"
  - "serving"
  - "sig-events"
  - "tekton"
  - "workflow"
  - "cloud native"
  - "community"
  - "containers"
  - "docker"
  - "knative"
  - "Salaboy"
  - "weekly"
original_url: https://www.salaboy.com/2022/06/18/knative-oss-weekly-44/
---

It is always fantastic to see how vibrant the Knative community is. This week I've participated in various conversations about great ideas to move the project forward. There are several proposals, demos and PoCs coming. I am pretty excited about the following ones:

- Knative Flows Working Group
- Knative Serving and Argo Rollouts
- Contributing to Knative Functions
- Appreciation and awesomeness!

### Knative Flows Working Group

I've been working with Workflows for a long time, written books, designed frameworks and also led training about different workflow tools implementations; this topic is very close to my heart. I am looking forward to helping the Knative community to bring workflow constructs to enable application developers to define workflows/state-machines to orchestrate CloudEvents and Functions.

The Knative Flow Working Group is very new, and it is still not clear what the main goal of the group. Still, in this discovery phase, we are trying to figure out if the Serverless Workflow Specification is a good fit or starting point for Knative to think about workflows or if we better focus on behaviours and interfaces. Next Wednesday, we will have a short presentation from the founders of [Direktiv.io](https://direktiv.io/), which is a workflow engine which uses and integrate with Knative Serving and Eventing, but it doesn't use the Serverless Workflow Spec.

My main concern right now is the complexity of the languages used to express these workflows, as they tend to build a large set of complicated features that help you to get started quickly but, in the long run, complicate the maintenance of the project by concentrating too many responsibilities in the workflow definition (integration, sequencing, data transformation, data storage, among others).

### Knative Serving and Argo Rollouts

I've been playing with ArgoCD, and when looking at Argo Rollouts, I was very curious to see if they were integrating with Knative for implementing different release strategies. Unfortunately, this was not the case, but once again, someone reached out to the Knative Community to make this integration happen.

Personally, this means ***"LET'S COLLABORATE!"***.  Check the issue where we will try to create a proposal to see if we can me this happen: <https://github.com/knative/serving/issues/13024>

Are you familiar with Argo Rollouts and Knative? We need your help!

### Contributing to Knative Functions

This week I've started a new initiative on the Knative Functions WG. I want to ensure that we bring new people to help us with our language templates; as we are mostly Java and Go developers, it will be great to have people from Node, Rust and Python helping us with our function templates. I am really looking forward to starting to create more advanced templates to make developers' live easier. To kickstart this initiative, I've created a couple of #goodfirstissue on the Knative Function repository and tweeted about them. I was surprised with the feedback. You can check the thread here:

[![Screenshot 2022 06 17 at 20.16.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-17-at-20.16.03.png)](https://twitter.com/salaboy/status/1536688231290380288?s=20&t=a58nfz7NmsAJS1aejMx13Q)

I personally know that I need to get better at creating issues that are accessible for community members, so I will do my best moving forward to include links and a short description of these issues every week. Here are the two issues that I've created this week:

- <https://github.com/knative-sandbox/kn-plugin-func/issues/1062> (which I am happy to say that [Matheus Cruz](https://twitter.com/mcruzdev1) already closed it)
- <https://github.com/knative-sandbox/kn-plugin-func/issues/1061> (Are you interested in fixing this one?)

### Appreciation and awesomeness!

This week I received a mention on the [changelog.com](https://changelog.com) blog by Gerhard ([follow his podcasts here](https://twitter.com/ShipItFM)), and I am still shocked to see the mention with the other folks in that blog post. I love the fact that the screenshot used is from the Knative Maintainer track that we did with [Carlos Santana](https://twitter.com/csantanapr) at KubeCon Valencia (the Knative Functions Quiz Game was on the screen!. 🥳🥳🥳🥳🥳🥳)

[![Screenshot 2022 06 17 at 20.21.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-17-at-20.21.27.png)](https://changelog.com/posts/kubecon-cloudnativecon-europe-2022)

I want to highlight Gerhard's takeaways from KubeCon 2022 - Valencia which you can read in his changelog blog here: <https://changelog.com/posts/kubecon-cloudnativecon-europe-2022>

##### 1. Kubernetes & cloud native achieved peak maturity

##### 2. Big drive for platforms on top of Kubernetes

##### 3. Almost everyone that I talked to is thinking about supply chain security

##### 4. eBPF is big, popular & growing

##### 5. GitOps is a foregone conclusion

##### 6. Mixed feedback about Istio/Envoy

##### 7. Crossplane continues growing from all perspectives
