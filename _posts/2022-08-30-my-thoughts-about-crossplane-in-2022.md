---
title: "My Thoughts about Crossplane in 2022"
date: 2022-08-30 14:32:15 +0000
permalink: /2022/08/30/my-thoughts-about-crossplane-in-2022/
description: "I’ve been very (positively) vocal about Crossplane in the last few years. I remember realizing that Crossplane was much more than allowing us to provision…"
tags:
  - "cloud"
  - "English"
  - "go"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "platform"
  - "cloud native"
  - "community"
  - "crossplane"
  - "oss"
original_url: https://www.salaboy.com/2022/08/30/my-thoughts-about-crossplane-in-2022/
---

I’ve been very (positively) vocal about [Crossplane](https://crossplane.io) in the last few years. I remember realizing that Crossplane was much more than allowing us to provision cloud resources using the Kubernetes API. Since then, I keep seeing teams using Crossplane as a critical component for building their platforms. I wanted to take the time to describe why I think that Crossplane is bringing a lot of good things to the ecosystem but how it can also become problematic in some areas, where other projects might want to copy/duplicate some of its core functionality. There are also some drawbacks (in my opinion) to the project's current state that will benefit from some extensions and modularity.

My intention with this blog post is to do a brain dump on where I am conceptually in the understanding of the project (bringing an external point of view) and if I can explain in a simple way where some of these problems can materialize. I am not trying to criticize the project or its vibrant community, so if you read this, take it as constructive feedback.

This is also not the place to learn about Crossplane core functionalities, as I will need to write too much text to explain what Crossplane is doing and how it works.

But let me start this blog post talking about what I understand to be Crossplane main components/behaviors.

### Crossplane Core

I recognize three central core components/behaviors that Crossplane is providing today that I want to focus on:

- **Making (SaaS) APIs Kubernetes-native:** This is where Crossplane providers come into play: AWS, CGP, and Azure providers allow us to have a way to provision Cloud Resources. By providing support to different Cloud Providers, we can start thinking about multi-cloud deployments where we have a centralized place to control how we connect and consume cloud resources.  It is pretty common that you arrive at Crossplane because of the Cloud Providers integrations. These Crossplane providers for all major Cloud Providers already bring a lot of functionality to the table, and keeping up with each Cloud Provider set of services is a full-time job. It is also vital to understand that Crossplane provides all the machinery to extend its functionality by creating your custom Crossplane Providers that can consume any available API and make it Kubernetes-native. If you have internal systems at your company and want to manage them using Kubernetes abstractions, you just create your Crossplane provider to interact with your internal system APIs, and now you can use all the available Kubernetes tooling to manage and monitor your internal system using the Kubernetes APIs.
- **Creating Platform APIs by Composition:** Crossplane composition allows us to group a bunch of cloud resources under a new API (CRDs) that Crossplane will create and maintain for us. Crossplane Compositions are pretty advanced in that they not just group resources but also cover use cases where you want to wire and configure resources to work together. Crossplane Compositions are grouping and monitoring Kubernetes resources that are being reconciled, so their status can be linked and propagated to other components. In a way, Crossplane Compositions are acting as Kubernetes Resources orchestrators since they can aggregate and perform actions based on the resource’s statuses. Compositions also play a critical role here, as they also serve as the line that we can use to delineate the responsibility of platform teams (how the cloud resources will be created, in which cloud providers, using which credentials), and what our application development teams will be able to use (the newly created APIs of our compositions).
- **Packaging, installing and managing Kubernetes extensions as OCI images:** Crossplane provides a mechanism where you can package Crossplane compositions as OCI images, that is, packaging a bunch of YAML files as a container image that can be fetched, read, and their contents installed in the cluster where Crossplane is running. The interesting thing about this mechanism is that it has built-in the mechanism to install, manage and clean up CRDs and associated resources. Crossplane will manage and version these packages using a dependency management mechanism I haven't had the time to research, but it allows you to define dependencies such as the Crossplane version or other packages' versions.

You need to install Crossplane somewhere in a Kubernetes Cluster for all this to work. This immediately brings the question, should Crossplane run in the same cluster as our Applications? While you can start by doing that, the answer is usually NO. Having a Platform Cluster (also know as Management Cluster) where all the platform-wide tools will run seems more like a sensible option.

The larger the organization is, and the more teams you have, the question of “would it be enough with just having a single Crossplane installation?” becomes important too. For Crossplane providers to work, you need to provide Cloud Provider credentials and Service Accounts so that Crossplane can create resources on our behalf. While you can install and configure the same provider to use different credentials, let’s say for other teams. If you have multiple Crossplane installations, you will probably want something to manage these installations, and recently I have seen more and more Crossplane as the Control Plane for Control Planes, which means that you can use Crossplane to control and manage more than one Crossplane installation that can be talking to multiple Cloud Providers. At this point, this is too meta, but larger teams need this level of complexity to solve real-life problems. While I am not planning to cover this scenario in this blog post, I know it is one of the use cases the Crossplane community is trying to tackle.

So let’s jump into some topics that I would like to see moving forward at the community level, maybe with some push from other companies that are also building platforms using Crossplane at the core. I know that the Crossplane community is working on some mechanisms to solve some of these topics that I will mention in the following sections, and some of these topics, depending on what you are planning to use Crossplane for, might not be relevant for you, but this has been top of my mind for some time so let me try to explain them. Let’s take a look at them in the following order:

- Do we need Crossplane Distributions?
  - Crossplane + others + automation
- Cloud Provider’s Providers and others
- Advanced Compositions
- Compositions Marketplace and the need for a unified Cloud Provider model
- Crossplane needs modularity
- Polyglot Crossplane extensions

### Do we need Crossplane Distributions?

Crossplane is just one project you will use in the big scheme of things, but it will not solve all your problems. Several videos and blog posts about using tools like ArgoCD (<https://www.youtube.com/watch?v=eEcgn_gU3SM> ) or FluxCD (<https://www.cncf.io/blog/2022/07/26/how-to-apply-gitops-to-everything-with-crossplane-and-flux/>) in conjunction with Crossplane make a lot of sense. You want the power of having compositions that create and configure many cloud resources, and you want to manage those resources using a GitOps approach. The GitOps use case alone makes me think that Crossplane distributions should be a thing. Just to be clear I am refering to “distribution” in the sense of a collection of projects integrated and packaged together with a set of clear use cases in mind. Some common examples are Ubuntu (Linux distribution optimized for desktop use cases), Openshift and Tanzu (Kubernetes distributions aimed for enterprise use cases).

I am not sure we can save time by having best practices for using these two tools together. As for multi-cluster setups, we need a lot of automation to make things happen without too much pain. What do you think? Do we need Crossplane distributions? I imagine a Crossplane installation with ArgoCD at the platform level (GitOps for the platform) and an easy way to create new Clusters with ArgoCD installed inside them. In fact, the company behind Crossplane, [Upbound](https://www.upbound.io/) has its own enterprise distribution UPX [https://github.com/upbound/universal-crossplane](https://www.google.com/url?q=https://github.com/upbound/universal-crossplane&sa=D&source=docs&ust=1661777840868867&usg=AOvVaw0w0aH6vN37_c3BVhrfRokZ), which makes me think that in the community there is a need for a process for curating and promoting Crossplane distributions.

If you are serious about GitOps and automation, the next step would be to install, configure and use the Crossplane Github/Gitlab Providers ( <https://github.com/crossplane-contrib/provider-github> and <https://github.com/crossplane-contrib/provider-gitlab>) as they will allow you to create and configure new repositories to use as the source of truth for your CD tools.

### Cloud Provider’s Providers and others

Using Crossplane Providers (AWS, GKE, AKS, and others), you can provision and manage fully-fledged Kubernetes Clusters in a declarative way. A common use case is installing tools inside these Clusters, as a plain Kubernetes Cluster will not do much for you. The nice thing about Crossplane is that when creating these Cloud Resources, it will create a Kubernetes Secret in the Cluster where Crossplane is running, containing the credentials to connect to the freshly created resource. Because we will have the credential, we can connect and install anything we need in that cluster. But as a user, I would expect a declarative way to define what needs to be installed instead of starting an imperative pipeline (let’s say a Tekton Pipeline) to install a bunch of tools in that cluster.

The Crossplane Kubernetes Provider (<https://doc.crds.dev/github.com/crossplane-contrib/provider-kubernetes>) and Crossplane Helm Provider (<https://doc.crds.dev/github.com/crossplane-contrib/provider-helm>) come in handy, but they still have some limitations. If you want to install something unavailable as a Helm chart or if you have a large set of Kubernetes resources to install, you are on your own. My gut tells me there should be a more declarative way to install and manage software into Kubernetes Clusters, and maybe the Helm and Kubernetes providers should be hidden away from users. One possible option might be to use labels or annotations in resources that reference packaging systems or use these providers in the background.

My gut feeling tells me that to simplify the user experience and to reduce cognitive load, the term “Providers” should be kept for Cloud Services and not things that can be done internally. Even if the mechanisms are technically similar, it feels like mechanisms not consuming external APIs have different behaviors (like installing things on existing resources) that might require a completely different name/term.

### Advanced Compositions

Crossplane Compositions, as they are today, are not enough.  If you want to group and glue resources and tools using Crossplane Compositions, you need more powerful tools to express conditional blocks and loops (to mention the most popular requests I’ve heard).

This is where tools like Pulumi shine, as they allow you to use your programming language of choice to build compositions of Cloud Resources. But tools like Pulumi are coming from a different angle. Pulumi apps (compositions in code) are not running inside the Cluster hence they are not leveraging the core behaviors Crossplane brings to the table. Check the Pulumi Kubernetes Operator, which combines the idea of Compositions and GitOps: <https://www.pulumi.com/docs/guides/continuous-delivery/pulumi-kubernetes-operator/>, which once again highlights the importance of the GitOps use case.

So we need something in the middle, something powerful enough to build complex resource compositions that reuse the Kubernetes resource model and reconciliation. The Crossplane community is already defining how these Custom Compositions should look and work: <https://github.com/crossplane/crossplane/issues/2524> and a PR with the spec: <https://github.com/crossplane/crossplane/pull/2886>. What worries me about these more advanced mechanisms is seeing Crossplane becoming much more complex and managing the lifecycle of complex extension points. By this, I mean that Custom Compositions should define a clean API and allow people to hook their behaviors without depending too much on Crossplane specifics. The cleaner the API and Crossplane interact with these custom behaviors, the better. My personal preference would be the webhook approach described in the proposal. In my perspective, Crossplane shouldn’t be taking care of running and managing these extension points, for example, by running containers and managing them. If a user wants to provide a custom composition that requires a container to be running, the user should be in charge of managing that container, maybe using a GitOps approach.

There is currently a SIG that you can join if you are passionate about Compositions in the Crossplane Slack organization called **#sig-custom-composition**.

It is also good to see some progress in assisting users with their YAML creation in their IDEs: <https://blog.upbound.io/moving-crossplane-package-authoring-from-plain-yaml-to-ide-aided-development/>

### Compositions Marketplace and the need for a unified Cloud Provider model

If we are building our internal development platform, we will create a bunch of Crossplane Compositions that will define not only which Cloud Resources Application Development teams can create and use but also the interfaces/contracts that Application Development teams will consume. These contracts and definitions need to be maintained and will evolve. Hence having a repository where we can store, share and evolve these definitions makes a lot of sense. If you want to extend that outside the boundaries of your company and leverage the fantastic Crossplane community, a public marketplace for Compositions feels like a great way to not only share advanced configurations but also promote best practices. From my perspective, a Marketplace is a must, so I am sure this is coming soon.

If we keep looking at the use cases that I’ve mentioned before, multi-cluster setups using Crossplane to provision Kubernetes Clusters, it makes a lot of sense to start thinking about creating Cloud-Provider agnostic compositions. For example, creating a Kubernetes Cluster might require particular parameters (or even a set of Cloud Resources) that are different for each Cloud Provider, but it feels that we are at a point where these abstractions (at least to cover simple use cases) can be made. It will be great to have a (Kubernetes) Generic Cluster resource that we can apply no matter which Cloud Provider we have. It does feel like we can create our composition to achieve that, but having a Crossplane blessed abstraction allows tooling to be built on a shared abstraction that everybody can use, saving research and maintenance time. What do you think? Are these kinds of abstractions necessary?

### Crossplane needs modularity

As I mentioned in the Crossplane Core section, Crossplane covers different angles, from supporting Cloud Providers resources to enabling users to create higher-level APIs via compositions. When a project like this starts solving multiple problems simultaneously, you can reach a point where you are not solving any problem to a depth that makes it usable for large scenarios (think about the compositions not being powerful enough example, check the *Advanced Compositions* section). The main problem that projects at that stage suffer is: being a monolith, not allowing adopters to pick and choose the mechanisms they need for their implementations.

I will be really happy to see, for example, the composition + API mechanism completely separated from the other Crossplane core functionalities, like providers and the packaging and distribution of resources.

My main worry about modularity comes from the fact that if someone else needs the API creation mechanism that Crossplane is providing but not all the other components, they will be tempted to duplicate this functionality. One option might be to have a generic provider out-of-the-box that allows you to hook custom behaviors for the APIs and compositions that Crossplane is managing.

I’ve been very vocal about projects like Kratix (<https://github.com/syntasso/kratix/>) which are not in the space of provisioning Cloud infrastructure, but are definitely in the business of Platform Building and, as part of that, creating abstractions by extending Kubernetes do overlap with Crossplane machinery.

The same happens with Compositions and grouping resources together. If you have a use case where you need to group resources, monitor their status, and then perform some operations using the Kubernetes reconciliation mechanism, you will find tools like Cartographer <https://cartographer.sh/> for building reusable Supply Chains, which once again will overlap with some of the Crossplane core behaviors.

The tools I’ve mentioned here (Crossplane, Kratix, Cartographer) will all benefit from a shared marketplace and a mechanism to distribute, manage and install extensions. Projects like Tekton (https://tekton.dev) have already implemented a marketplace that can be used as inspiration for providing basic functionality <https://hub.tekton.dev/> .

But more importantly, I believe that if they are not modularized enough for other people to use, the composition features will see more and more projects overlap in this space.

Related to Compositions, another issue currently being solved is about making sure that Core Kubernetes and tooling (like `*kubectl`) work well with tons and tons of CRDs (in the order of the thousands). While this is currently being solved by ensuring that Kubernetes can handle the load, it will be great to start exploring more dynamic loading of CRDs and providers. The use case is simple; you want to create a resource that doesn’t exist in the current cluster where Crossplane is installed. It will be great to dynamically query which resources are available and* install the correspondent provider. Another alternative would be to “lazy load” resources or have a way to load them on demand when they are used.

I know this is a significant ask for a project like Crossplane, as it might involve a core rearchitecture and some significant changes, but I think the exercise of deeply analyzing what can be modularized is worth the time. Bringing more companies and external communities closer for those discussions might also be a wise thing to do.

### Polyglot Crossplane extensions

More than two years ago, I implemented my first Custom Crossplane Provider. And while it was a simple experience, if you have been working with Kubernetes, Go, KubeBuilder, Controller Runtime, Makefiles, Containers, and YAML files for more than five years, this is not everyone's cup of tea. Irony aside, to extend Crossplane, you must write, maintain and deploy a Kubernetes Controller in Go. You need to get ready to understand the lifecycle of the APIs that you are interacting with and the lifecycle of the Kubernetes resources you will be creating. Building these kinds of components generate many edge cases you were not anticipating, as you should expect when building distributed systems. But to go back to the point of this section, if you are forced to do this in a language or with a set of tools you are unfamiliar with, the task becomes 100 times harder.

I would love to see a copy&paste of the approach used by the MetaController (<https://metacontroller.github.io/metacontroller/guide/create.html>), which allows for polyglot implementations, no “Kubernetes'' dependencies, and no playing with Kubernetes RBAC. MetaController’s controllers (the ones you need to write) accept a JSON payload and return a JSON payload. You can implement them using any programming language and deploy them into Kubernetes or other platforms. Then, based on declarative configurations, you can wire your controller to MetaController, which will be in charge of notifying you about resource changes and will understand how to create or update sub-resources.

While this is also a big ask, I see concrete steps to make this happen in the short term. I think this will benefit not only the Crossplane community but also other communities that sometimes are scared of being forced to use Go to extend Kubernetes.

### Sum up

Crossplane is fantastic, don’t take me wrong, but I am always looking for improvements, and there is a high-demand for some of the core components and behaviors that Crossplane is bringing to the table, so I would love to see less duplication and more integrations with other projects in the CNCF ecosystem.

If you are reading this blog post and are passionate about some of these topics, I encourage you to join the online discussions. I will keep adding my insights and links to this blog post when I find them, as I am not involved with the day-to-day operation of the Crossplane project. There might be some points in this blog post currently being addressed and probably other essential topics I am not covering.

If you are planning to attend to [KubeCon North America](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/), make sure you check out KnativeCon, where [Viktor](https://twitter.com/vfarcic) from [Upbound](https://www.upbound.io/) and me will be presenting about [building serverless platforms on top of Kubernetes with Open Source and CNCF projects (Crossplane, Knative, ArgoCD, etc)](https://sched.co/1AGb2) .

Feel free to drop me a comment here or a DM on Twitter [@Salaboy](https://twitter.com/salaboy) if you have suggestions, corrections, or pointers to resources.
