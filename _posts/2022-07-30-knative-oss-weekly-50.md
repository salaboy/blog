---
title: "Knative OSS Weekly #50"
date: 2022-07-30 10:43:48 +0000
permalink: /2022/07/30/knative-oss-weekly-50/
description: "I made it alive to week #50! 🥳 and what a week! I have a lot of topics to discuss this week, but here are the most important ones: Knative Eventing…"
tags:
  - "book"
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "eventing"
  - "func"
  - "go"
  - "helm"
  - "kubernetes"
  - "open source"
  - "oss"
  - "platform"
  - "serving"
  - "crossplane"
  - "functions"
  - "k8s"
  - "knative"
  - "meetup"
  - "microservices"
  - "roadmap"
  - "Salaboy"
original_url: https://www.salaboy.com/2022/07/30/knative-oss-weekly-50/
---

**I made it alive to week #50!** 🥳 and what a week! I have a lot of topics to discuss this week, but here are the most important ones:

- Knative Eventing RabbitMQ Components Going GA Blog PR
- The road to Knative Functions 1.0.0
- Knative Meetup: Knative + VCluster by my friend Ishan Khare
- Ask Me Anything about Serverless and Kubernetes with Viktor (Crossplane) & Whitney (VMware)

Before jumping into the main content of the blog post let me share the two `first-good-issues` of the week:

- **Rust Dependencies for templates:** <https://github.com/knative-sandbox/kn-plugin-func/issues/1111>
- **Create KinD step-by-step tutorial to gather community feedback for 1.0.0 release:** <https://github.com/knative-sandbox/kn-plugin-func/issues/1151>

### Knative Eventing RabbitMQ Components Going GA Blog PR

**Spoiler Alert:** <https://github.com/knative/docs/pull/5135>

Are you interested in using RabbitMQ and Knative Eventing? Are you using it already? We need your help, we need feedback to make sure that we build a healthy community and we make sure that these components works for a wide range of use cases.

We have created an adopters list here: <https://github.com/knative-sandbox/eventing-rabbitmq/blob/main/ADOPTERS.MD> You can send us a PR to the repository or get in touch, join the **#eventing-rabbitmq** slack channel in the Knative Slack and we can add your details. The project and the community's future depends on better understanding of its users and their use cases.  🙏🙏🙏🙏🙏🙏

### The road to Knative Functions 1.0.0

This week we did some planning for [Knative Functions project](https://github.com/knative-sandbox/kn-plugin-func/milestones?direction=asc&sort=due_date&state=open) and I am happy to say that it looks like we have a plan. Thanks lot [Lance](https://twitter.com/lanceball) for all the work on the project board! The deadline to release Knative Functions in October the 4th. As you can see in the following snapshot from GitHub there is a lot of work to tackle so this is perfect time to get involved.  The 0.26.0 release is due the 25th of August and it will be great to have community help to test this release and provide feedback that will have a direct impact in the 1.0.0 release.

[![Screenshot 2022 07 29 at 17.28.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/screenshot-2022-07-29-at-17.28.37.png)](https://github.com/knative-sandbox/kn-plugin-func/milestones?direction=asc&sort=due_date&state=open)

I was thinking to create a small tutorial that people can follow using KinD and the `func` CLI to create a sample project that can be used to provide initial feedback and improvements/polishing areas for the whole development experience. I've created the `first-good-issue` linked above (<https://github.com/knative-sandbox/kn-plugin-func/issues/1151>).

### Knative Meetup: Knative + VCluster

**Unfortunately the recording is not up yet, but I will update this when it is uploaded and publically available.**

I wanted to mention and highlight [VCluster](https://www.vcluster.com/) in my book [Contin](http://mng.bz/jjKP)[u](http://mng.bz/jjKP)[ous Delivery for Kubernetes](http://mng.bz/jjKP) because I see many people starting their Kubernetes journey using namespaces to isolate different tenants in the same cluster. This is the easiest way to start, compared with creating separate clusters for each tenant, which is quickly becoming expensive and hard to manage without the proper automation. Still, there is a sweet spot in the middle, which is exactly what VCluster provides.

[![Screenshot 2022 07 27 at 17.41.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/screenshot-2022-07-27-at-17.41.04.png)](/content/images/2022/07/screenshot-2022-07-27-at-17.41.04.png)

Last Wednesday, [Ishan](https://twitter.com/ishankhare07) presented to the Knative community the VCluster Knative plugin, which allows users to have a single installation of Knative working on the Host cluster (that is, the real Kubernetes Cluster where we are creating VClusters). That installation can be shared among all the VClusters created. This saves a lot of resources compared to installing Knative in every VCluster we create. It also opens the door to a new pattern of shared infrastructural components for different Kubernetes clusters, which I believe we will see much more in the future.

### AMA about Serverless on K8s

Last Thursday, I was invited to the [DevOps Toolkit](https://www.youtube.com/c/devopstoolkit) Ask me Anything session about Serverless on Kubernetes. I joined [Viktor](https://twitter.com/vfarcic), [Darin](https://twitter.com/DarinPope), and [Whitney](https://twitter.com/wiggitywhitney), and we tried to answer questions non-stop for an hour! You can check the recording here:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/Nv1qWibfsSw" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

Some takeaways from this session are:

- I need to take a look at [KubeMQ](https://kubemq.io/) in the context of Knative Eventing
- Check GCP Autopilot and Knative which was reported as not working
- Share more about KEDA and Knative <https://github.com/knative-sandbox/eventing-autoscaler-keda>as complementary tools instead of competitors
- **Knative doesn't require Istio or a full service mesh to work!** You can use much lighter API Gateways for the networking implementations.

Also Kudos to Viktor and Whitney, because they did more than 2hs of non-stop streaming on twitch and youtube before joining the AMA Session, you can check their [Crossplane Enlightning](https://tanzu.vmware.com/developer/tv/enlightning/) session here:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/CHBA34a0KEQ" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

See you all next week!
