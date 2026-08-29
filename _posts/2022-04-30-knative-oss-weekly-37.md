---
title: "Knative OSS Weekly #37"
date: 2022-04-30 11:19:54 +0000
permalink: /2022/04/30/knative-oss-weekly-37/
description: "Ok so busy week, but I have the feeling that everything is aligning well for Devoxx UK and KubeCon + collocated events in Valencia."
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
  - "engine"
  - "English"
  - "event"
  - "func"
  - "go"
  - "helm"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "tekton"
  - "CD"
  - "cloudnative"
  - "eventing"
  - "functions"
  - "knative"
  - "kubecon"
  - "platform"
  - "serving"
  - "weekly"
original_url: https://www.salaboy.com/2022/04/30/knative-oss-weekly-37/
---

Ok so busy week, but I have the feeling that everything is aligning well for Devoxx UK and KubeCon + collocated events in Valencia. This week I had the luck to hang out with some Kubernetes folks like [@rawkode](https://twitter.com/rawkode) ([Pulumi](https://www.pulumi.com/)),  [@bwplotka](https://twitter.com/bwplotka) ([Red Hat](http://redhat.com)),  [@suhailpatel](https://twitter.com/suhailpatel) ([Monzo](http://monzo.com)) and [@ArthurSilvaSens](https://twitter.com/ArthurSilvaSens) ([GitPod.io](http://gitpod.io)) so what can I say, learning a lot from the best! I am really looking forward to taking a look at [@bwplotka](https://twitter.com/bwplotka) book [Efficient Go](https://www.oreilly.com/library/view/efficient-go/9781098105709/) , which sounds like a fundamental book for me to read. Another really important news this week is that [@rawkode](https://twitter.com/rawkode) is creating his own conference [KubeHuddle](https://twitter.com/KubeHuddle)! ([blog post explaining the why KubeHuddle is a thing](https://rawkode.news/issues/byebye-cncf-hello-kubehuddle-1136379?via=twitter-card&client=DesktopWeb&element=issue-card)), it sounds like I am going to Scottland in October!

And a shout to [@wiggitywhitney](http://twitter.com/wiggitywhitney) and [@asaikali](http://twitter.com/asaikali)  for her session about application security that you can [find here](https://www.youtube.com/watch?v=7AsoVOZRikY&feature=youtu.be)

### Building Self-Service Platforms on top of Kubernetes

I am a big fan of platform building and I've been working with teams and companies that are basically defining their own platforms for their customers or even more meta, platforms to build platforms for their customers.

[![Blog](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/04/blog.png)](/content/images/2022/04/blog.png)

This week I had the pleasure of pairing up with the folks from [Syntasso (Paula and Chris)](https://www.syntasso.io/) to build a kick-ass demo and what I believe is going to be a great Devoxx UK presentation titled: "[Reduce Cognitive Load: Pave the Golden Path On Your Internal Platform](https://www.devoxx.co.uk/talk/?id=6857)"

For this presentation and demo, I've been documenting the scenario and how to get the demo up and running here (still work in progress): <https://github.com/salaboy/from-monolith-to-k8s/tree/main/platform>

### Knative Functions, Eventing and Workflows

This past week we had a very good Knative meetup ([meetup recording](https://www.youtube.com/watch?v=cA9CkJ0cJ30)) about how to connect multiple clusters using Knative Brokers, by Pablo from TriggerMesh. Most of the components shown in the demo make a lot of sense for Knative Eventing itself as exposing brokers outside the cluster and enabling triggers to dispatch CloudEvents using HTTPS and authentication are real-world requirements, I am really interested to see how these components can be added to the upstream projects.

[![Screenshot 2022 04 30 at 09.15.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/04/screenshot-2022-04-30-at-09.15.42.png)](/content/images/2022/04/screenshot-2022-04-30-at-09.15.42.png)

Switching to a completely new topic, lately, I've been thinking a lot about workflows and Knative, a topic that is very close to my heart as I worked previously for 3 different workflow vendors and I haven't seen a truly Knative-like solution and by this, I mean, not a tool built on top of Knative, but the main building blocks to build a workflow solution at the Knative level of abstractions.

At the end of last year, I created a simple PoC named Knative State and a public proposal document highlighting how state machines can relate to Knative constructs while remaining agnostic of the language used to describe the state machines and adopting a purely event-driven approach. Here are some links about this PoC and proposal document (that I am planning to change now)

- [Knative State PoC Controller and CRD](https://github.com/salaboy/knative-state)
- [Knative State PoC State Machine runner](https://github.com/salaboy/knative-statemachine-runner)
- [Proposal Document](https://docs.google.com/document/d/1W9F6HUoqAQ7PVIYjBR4DRdbiD8YzwX7pXl4YM_qlMhk/edit?usp=sharing)

After talking with a bunch of folks and now with the Flows WG created I've recognized a few flaws in my proposal and I am happy with what I am discovering based on the opinions of more experienced folks.

What we should be looking at defining for Workflows and Knative are:

- A set of interfaces on how the workflows are defined and how applications can interact with them
- A the Knative Level, because of other abstractions we should be only focused on consuming events and emitting state changes events that other applications can react to
- The state machine runners (as I call them) should be serverless by nature, scaled to zero while they are not performing a state change
- We need to define the runtime contracts for these components, we don't need REST APIs for these components (my mistake in the proposal), we can have specific State Change CloudEvents as the main way to react to changes in the state machines. Another mistake that I've made is around cardinality and defining too strongly how state machines should be deployed, so I will be changing that.
- Looking at the Serverless Workflow Spec can help us to focus the work and the scope for the runtime contract definitions, but I am not 100% sure that the spec as it is right now is what we need. The spec goes to define certain behaviours that at least from the Knative (my Knative perspective) we should be interested in, more on this topic will come in the following weeks.
- From my perspective, the key entities that we should be looking at are **States**, **State Transitions Events**, and **Events** that the State Machine Definition is interested in **consuming**.

I guess that now I will be providing more frequent updates on this topic as I believe it will become more important in the community if we manage to make progress on defining these contracts.

On the Knative Functions side, I've been doing some work about exporting the Knative Service resource that the `func` CLI creates based on the `func.yaml` file. By exporting the Knative Service, if we need more flexibility to configure our function project we can access all the parameters from the Knative Service itself, in some way going around the simplified view exposed by the `func.yaml` configuration. Some use cases that might benefit from this include: configuring another container to run alongside your function, patching the Knative Service using tools like Kustomize (for conformance reasons), configure options that are not currently exposed by the `func` CLI. While doing this, I realized that having a way to instruct the `func` CLI to override the `func.yaml` configurations can open the door for more functionality, for example, for cases when you want to deploy another resource as part of your function project, this might include Triggers for example to connect event-driven functions. I am sure that I will be writing more about this soon.

Related to Knative Functions, I am super excited to see the Knative Func and Github Actions integration by [@vitalethomas](https://twitter.com/vitalethomas) as you can see here in [this link](https://github.com/knative-sandbox/kn-plugin-func/issues/982) that we are using to track the progress. Our demo for Devoxx UK is going to rock too ([Knative and Spring - Bringing back the func](https://www.devoxx.co.uk/talk/?id=5267))!

Stay tuned! more news coming next week!
