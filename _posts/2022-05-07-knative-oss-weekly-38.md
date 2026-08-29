---
title: "Knative OSS Weekly #38"
date: 2022-05-07 09:15:10 +0000
permalink: /2022/05/07/knative-oss-weekly-38/
description: "DevoxxUK is coming next week!! If you are coming to Devoxx and you are reading this, please come and say hello!"
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
  - "English"
  - "event"
  - "func"
  - "go"
  - "helm"
  - "microservices"
  - "open source"
  - "serving"
  - "spring cloud"
  - "spring-native"
  - "eventing"
  - "knative"
  - "oss"
  - "platform"
original_url: https://www.salaboy.com/2022/05/07/knative-oss-weekly-38/
---

[DevoxxUK](https://www.devoxx.co.uk/) is coming next week!!  If you are coming to Devoxx and you are reading this, please come and say hello! I will be presenting with [Paula Kennedy about Platform building and with Thomas Vitale about Knative Functions and Spring](https://www.devoxx.co.uk/speaker-details/?id=5362).

This week I did spend more time with the Kratix folks (an amazing group of folks!) building a demo that in short defines a concise API to enable development teams to provision whole environments using a self-service approach. This is obviously in the Supply Chain arena which is a 🔥 topic in the industry right now.

This week is not much about Knative itself, but about other projects in the ecosystem that can be used alongside Knative to build platforms.

The following might sound like a rant of some sort, but without the intention to hurt anyone's feelings I am doing a brain dump of what I am seeing around Supply Chains related tools for Kubernetes. This is a topic that I will be covering in the last two chapters of my book [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) so here is a brief description of where my mind is at the moment of writing this blog post.

I will be talking about my experience with:

- [Kratix](https://github.com/syntasso/kratix)
- [Cartographer](http://cartographer.sh)
- [Keptn](http://keptn.sh)

### Kratix

In [Kratix](https://github.com/syntasso/kratix) (a framework for building platforms as a product), you create a [Promise](https://github.com/syntasso/kratix/blob/main/docs/promises.md) definition, which creates dynamically a Custom Resource Definition (your high-level API) and associate that new resource type to a pipeline (a.k.a the supply chain definition for that new resource type).

When you create a new resource instance, behind the covers, a supply chain is triggered to orchestrate different tools like Crossplane, to provision multi-cloud resources including a Kubernetes Cluster, which is monitored and as soon it is ready Knative Serving is installed in it.

[![Screenshot 2022 05 07 at 10.23.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/screenshot-2022-05-07-at-10.23.54.png)](/content/images/2022/05/screenshot-2022-05-07-at-10.23.54.png)

The whole point of the demo is to show the high-level API that Development teams can use to create requests to the platform. It also highlights the tools that Platform engineers can use to define their own domain-specific platform with their very custom requirements. An important aspect in my opinion is that "pipelines" in Kratix can be basically anything you want, from a script to probably running a Tekton pipeline, but that doesn't really matter and it is abstracted away for Platform Engineers to use their tool of choice. While I see this as an advantage it might require extra work for Platform Engineers to hook custom tools, but at least Kratix doesn't impose any limitations on what those tools need to be.

In my opinion, what would make Kratix a killer tool is a Platform Portal, so instead of dealing with YAML users can parameterize their Promise instances using a User Interface like Backstage. I know that this is in the making, so I am really looking forward to giving that a try when that is ready.

### Cartographer

Following similar lines, I've learnt a lot about [Cartographer](https://cartographer.sh/) ( a Supply Chain Choreographer ) this week, another supply chain tool that takes a different approach to solving similar problems. You can take a look at the summarized explanation from [Whitney Lee](https://twitter.com/wiggitywhitney):

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/1dpkcVTDzes" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

In Cartographer you use the concept of a "[Workload](https://cartographer.sh/docs/v0.3.0/reference/workload/)" resource (`workload.yaml`) to abstracts developers from the supply chain itself, similar to what is done in Kratix by creating a new dynamic Custom Resource Definition when defining a Promise, but here the Workload object is kinda fixed, you can, of course, have different types of Workloads which will trigger different supply chains. Inside a Workload definition, you can provide the inputs from your Supply Chain, which is something that I really like, here you will find where the source code that you want to run is and some other configurations that might impact how your code will be built and how it will run (env vars). Check the workload definition here: <https://cartographer.sh/docs/v0.3.0/reference/workload/>. Interesting enough there is a parallelism with [Knative Functions](http://github.com/knative-sandbox/kn-plugin-func) project definition file (`func.yaml`), but the use cases are different enough for these definitions to have different responsibilities.

Something that I am not sure if I like or not, is how you define the supply chain itself. Here you need to define each step in YAML and you need to deal with the outputs and inputs of something that looks pretty much like  Tekton Pipelines and Tasks. I like the idea of the Cartographer being a controller of the controller, but this means that the tools that Cartographer can orchestrate need to be something designed for Kubernetes. They have integration hooks for other tools too, but they are not native and you will be basically on your own to adapt external tools to the Cartographer's mental model.  My feeling here is that the "chain" itself is a key mechanism in Cartographer, while platform builders will be more focused on the APIs exposed to their App Development teams. Doing choreography of Kubernetes resource events (controller of a controller) sounds ok, but why not just do choreography on any kind of event? And that's pretty much the Keptn approach.

### Keptn

Finally, I've used [Keptn](http://keptn.sh) in the past which uses an Event-Driven approach to orchestrate tools for delivery. Check their concepts and how they describe stages for delivering software: <https://keptn.sh/docs/concepts/delivery/> I really like the non-intrusive and very non-opinionated way of coordinating tools based purely on events. Keptn more than a supply chain tool is just a non-opinionated orchestrator, and they managed to focus on really important aspects of delivery such as what happens after you arrive in production, which other tools can provide but I haven't seen any concrete examples of that. You define your supply chain as a set of stages, but Keptn is not in charge of knowing how to execute each of these stages, it will just emit events for other tools to execute whatever needs to be done and wait for events to move forward to the next stage.

[![Screenshot 2022 05 07 at 10.25.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/screenshot-2022-05-07-at-10.25.54.png)](/content/images/2022/05/screenshot-2022-05-07-at-10.25.54.png)

Keptn provides more guidelines for quality gates, continuous performance verification, etc.

The fact that Keptn integrates with other tools by orchestrating CloudEvents makes all the integration problems around creating an event consumer and emitter for the tool that you want to integrate (Kubernetes or not), so this means that if you want to integrate with Tekton you just need to capture Keptn Events and translate to Tekton Triggers. Related to this, we have built an example using CDEvents from the CDFoundation and it really goes a long way, no matter what you want to integrate or how many stages you have in your orchestration you just work with Events. Check that PoC here: <https://github.com/cdfoundation/sig-events/tree/main/poc>

### And the Winner is!!! 🥳

I know that Supply Chain software is on the rise, but I stopped for a bit yesterday to think, what of these approaches do I like the most? Which one would I use for my own personal projects?

And the answer is probably a mix of all of them and here is why:

- **Kratix** focuses on platform building and the abstractions needed to decouple Platform Engineers from App Development teams, and this is a real problem that we need to solve. Concise APIs and Platform portals are being built by every company going SaaS, hence tools like Kratix can save tons of time by providing different teams with the tools that they need to collaborate.
- **Cartographer's** approach to defining what a Workload is serves as a great abstraction for defining what we want to run and not how, as a Supply Chain will need to be created to define the how. Workload resources provide that clear separation of concerns, so operation teams can define how the code of an application needs to be built, tested, verified and deployed.
- **Keptn** focuses on the whole delivery space and deliberately uses a CloudEvents orchestration approach to integrate with any tool. Focusing on the broader delivery space does provide concrete value in implementing patterns that other tools are not, such as manual approvals and live environment monitoring.

As a user in this space, what I would like to see? I will definitely place myself in the shoes of a Platform Engineer, where I need to be able to provide a self-service approach to my customers (which can be internal Application Development teams). From this point of view, Kratix Promises gives me what I need, well half of it, because I will need to build the user interface to make sure that my end-users don't need to spend loads of time dealing with Kubernetes resources. At the same time, Kratix promises to fit very well with using a GitOps approach, so that translation from the user interface to Kubernetes resource will be a great addition. From this point of view, having multi-cloud blueprints using tools like Crossplane (maybe making Crossplane a first-class citizen would be a great bet).

On the pipelines side of things, I would call this orchestration, I really like the CloudEvents approach from Ketpn, as it makes all integrations the same. If you use Keptn and Knative Eventing you can easily route events coming from different sources and create very advanced orchestrations for your Supply Chains.

I do see the concept of Workload as very useful in the context of platform building, I would use the Workload concept inside Kratix alongside other tools to define what other things needs to be installed alongside our applications. I do see Cartographer's Workload focus on applications as something that can be combined with a Kratix Promise to have all the inputs that you need to transform source code into a runnable package that can be deployed into production. I don't see myself defining supply chains in YAMLs where I can use Tekton or other tools like the good old Jenkins to drive a concrete sequence of steps.

### Sum up

As I mentioned in the begging, this is my current understanding of the tools that I am describing here, and I am wearing the hat of a Platform Engineer delivering a self-service platform to their customers (internal or external). I am really looking forward to seeing how these tools evolve and mutate to make platform building a breeze.

See you all next week with more Devoxx and Knative news!
