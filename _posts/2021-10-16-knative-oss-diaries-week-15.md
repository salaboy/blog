---
title: "Knative OSS Diaries - week #15"
date: 2021-10-16 12:42:42 +0000
permalink: /2021/10/16/knative-oss-diaries-week-15/
description: "Ohhhh my....!! what a week! I don't even know where to start, I will try to keep it short and I will leave my notes about KubeCon at the end."
tags:
  - "book"
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "docker"
  - "English"
  - "event"
  - "go"
  - "helm"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "spring cloud"
  - "tekton"
  - "cloudnative"
  - "community"
  - "crossplane"
  - "eventing"
  - "knative"
  - "kubecon"
  - "open source"
  - "oss"
  - "serving"
  - "tutorial"
original_url: https://www.salaboy.com/2021/10/16/knative-oss-diaries-week-15/
---

Ohhhh my....!! what a week! I don't even know where to start, I will try to keep it short and I will leave my notes about KubeCon at the end.

This week was all about KubeCon and quite a bit of promotion on the book that I am writing for Manning. My session at [KubeCon](https://sched.co/lV3A) was very aligned with the topics and tools that I am covering in my [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) (**still 50% off** with the code: **mlsalatino2**) book, trying to keep it very developer-focused, always making sure that we have a Multi-Cloud angle and of course only using OSS tools. If you are interested in my presentation titled: [Tool I wish existed 3 years ago to build a SaaS](https://sched.co/lV3A) platform, the video is going to be released in a couple of weeks to YouTube and I will be creating a separate blog post for that. In the meantime, I wrote a blog post for the VMware Tanzu Blog on the same topic that tries to cover some of the same tools following the same approach: [Building Platforms on top of Kubernetes](https://tanzu.vmware.com/developer/blog/building-platforms-on-top-of-kubernetes/).

I've been commenting about this for the last couple of weeks but now it is official: [Knative is going 1.0](https://knative.dev/blog/articles/announcing-knative-1.0/) and the reference implementations for Serving and Eventing are going GA, this was announced in the [Official Knative Blog](https://knative.dev/blog/articles/announcing-knative-1.0/) and the confirmed date is the 2nd November 2021 (this is definitely an early Xmas gift for all the Cloud Native ecosystem). All PRs for Knative Serving are closed and there is just one pending PR to review on Knative Eventing, which makes me very confident that this release is going to be a big milestone. Also at KubeCon [Evan Anderson](https://twitter.com/e_k_anderson) ([Knative Project](http://knative.dev) Founder) presented about Knative Func which uses [buildpacks](http://buildpacks.io) to provide an awesome developer experience while building functions 120% recommended to check out: [Function to Container - Building a FaaS Platform](https://kccncna2021.sched.com/event/lV3n?iframe=no)

### My KubeCon Slides

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/250452825" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

I was blown away by the feedback and the [Crossplane](http://crossplane.io) folks made my week with this tweet. Crossplane is becoming a fundamental piece and glue to provision software on top of Kubernetes, so I am really glad that they like the presentation and the examples (that you can find here: <http://github.com/salaboy/from-monolith-to-k8s> and give it a start if you like them as well)

[![Screenshot 2021 10 16 at 09.15.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/10/screenshot-2021-10-16-at-09.15.44.png)](/content/images/2021/10/screenshot-2021-10-16-at-09.15.44.png)

### My very raw KubeCon Notes

Evan's session:

Salesforce SaaS: https://sched.co/lV4K

- MultiCluster Kubernetes
  - Reasons
    - Geography hybrid environments
      - At least one cluster in each region
    - Billing model
      - Align better
    - Security and Compliance
  - Challenges
    - Networking.. between clusters
    - Apps that needs to communicate to each other
  - SIGs MultiCluster
    - Creating API standards
    - MultiClusterServices
      - export and import services across clusters
    - Gateway API / Kubernetes Ingress V2
      - MultiCluster Ingress
- [apiclarity.io](http://apiclarity.io)  (CISCO)
  - API clarity, look at traffic to create openAPI spec
  - Find API deprecated
  - User UI
  - Envoy to forward traffic
- [Bridge for Kubernetes](https://docs.microsoft.com/en-us/visualstudio/bridge/bridge-to-kubernetes-vs-code) in VS Code, this was a great developer experience and demo
  - GitHub Actions with Preview environments ala Jenkins X, Preview created with Helm
  - Preview experience integrated with VS Code plugin (Bridge for Kubernetes) which used something like Telepresence
  - I should check out if it works with Go and Java
- Sieve ([github.com/sieve-project/sieve](http://github.com/sieve-project/sieve)) For testing controllers
  - Test for
    - Safety (it doesn’t do something bad)
    - Liveness (eventually works)
  - How does it work
    - Learning mode
      - When to Lag API server?
      - When to restart to cause issues?
      - Needs to trace an execution and controller and timing
    - Testing mode
    - In learning it checks for if the reconciler will fail if a state change is missed
    - Written in Python.. that was a big downside for me to check it out
- KubeFed
  - [Mck8s](https://hal.inria.fr/hal-03205743) this looked quite scientific and research oriented, I should check it out
    - Automated placement
    - Autoscaling multi cluster and cluster nodes
    - Inter-cluster network routing and load balancing
- Multitenancy vcluster: <https://github.com/loft-sh/vcluster>
  - Cluster control plane inside a namespace
  - Simplify the management and security
  - Syncer syncs only Pods to ETCD so pods gets scheduled in the real cluster
  - You can pause Vcluster (not sure if this is product only)
  - This is something to try out as Virtual Clusters inside a Kubernetes Cluster for multi tenancy is quite a good proposal
