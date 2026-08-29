---
title: "The Challenges of Platform Building on Top of Kubernetes 1/4"
date: 2022-09-29 13:40:02 +0000
permalink: /2022/09/29/the-challenges-of-platform-building-on-top-of-kubernetes-1-4/
description: "TLTR: Platforms are hard to build; in the context of Kubernetes, we usually talk about multi-cloud, multi-cluster setups, and a forever-changing CNCF…"
tags:
  - "book"
  - "CD"
  - "cdevents"
  - "CDF"
  - "cdfoundation"
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
  - "helm"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "crossplane"
  - "knative"
  - "kubecon"
  - "oss"
  - "platform"
  - "tekton"
original_url: https://www.salaboy.com/2022/09/29/the-challenges-of-platform-building-on-top-of-kubernetes-1-4/
---

***TLTR: Platforms are hard to build; in the context of Kubernetes, we usually talk about multi-cloud, multi-cluster setups, and a forever-changing CNCF ecosystem. Managing all this complexity shouldn't be left to application developers focused on writing new features or fixing bugs. Reaching a point where we have a Platform that can reduce our application development teams' cognitive load and offer a self-service way to consume complex infrastructure on demand is key to improving delivery speed.***

I will be presenting these topics at the following conferences and meetups:

- **Loft Meetup London (29th Sept):** <https://www.meetup.com/loft-meetup-london/events/288021586/>
- **KnativeCon NA Detroit, USA 25th Oct:** <https://sched.co/1AGb2>
- **KubeCon NA Detroit, USA 27th Oct:** <https://sched.co/182LV>

This series of blog post are divided by topics:

- Intro and intro to challenges (This blog post)
- Challenges: 
  - Platform topologies
  - The importance of providing Platform Self-Service APIs
  - Tailored Developer Experiences

Lately (over the last three years), I’ve been thinking, talking, and working with tools (Crossplane, Knative, Message Brokers, Frameworks, Kubernetes itself, VCluster, Jenkins X, ArgoCD, Tekton, etc.) that enable people to build platforms. This topic has gained popularity, and you can notice that this was a hot topic at KubeCon EU in Valencia, Spain, this year ([check Daniel's summary about the topic](https://blog.getambassador.io/kubecon-eu-2022-summary-cloud-novices-golden-paths-and-software-supply-chains-f38d34b0c5a4)).  Companies are maturing fast in their adoption and use of Kubernetes. As a result, some engineers have been focused on curating and managing the complexity of gluing projects together to build cohesive platforms for application development teams while providing API-based solutions which hide away all the inherent complexity of the Cloud Native space.

In this series of blog posts, I wanted to cover some of the challenges that I see people facing when trying to build platforms on top of Kubernetes (also referred to as internal developer platforms) and the tools available today to tackle some of these challenges.

## Are you building a platform? If not, the platform will build itself

New practices and teams have been organically forming around these internal platforms. The book Team Topologies ([www.teamtopologies.com](http://www.teamtopologies.com)) seems to be the most quoted book around these groups.

A new team, called the “***Platform Team***”, is separated from the Application Development and the Infrastructure teams. Their whole purpose is to build a platform that automates and brings the best practices from the infrastructure teams so they can be consumed by the Application Development teams using  APIs as contracts. By exposing an API, the Platform team removes the burden from developers to know how to create and configure the required infrastructure for them to do their work.

[![Screenshot 2022 09 29 at 12.11.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/09/screenshot-2022-09-29-at-12.11.46.png)](/content/images/2022/09/screenshot-2022-09-29-at-12.11.46.png)

For example, if an Application Development team needs a new database for a service they are building, they shouldn’t be in charge of provisioning and configuring this database instance. They should focus on fixing bugs and writing new features. Until they don’t have this database up and running, they are blocked, as their development relies on being able to read and write data to the database.

Traditionally, this team would need to file a ticket for the Infrastructure team to provision (install and configure in the right machine/VM) the database. In the Cloud era, almost anyone can create a new PostgreSQL or Redis instance in the cloud with less than five clicks, but this requires the team to have the right account to the cloud provider, with the proper access, and most importantly, they need to know about the specific cloud provider that they are using. And let’s not trick ourselves, databases don’t come alone, you need to probably secure its access and manage certificates, provision storage to host the data, configure the networking layers to make sure that the applications and your developers can access it, and let’s not forget about the backup policies!

Platform teams are responsible for understanding Application Development teams’ needs and encapsulating this complexity with the help of Infrastructure teams behind a simple API. For the previous example, we can have an API that allows developers to create DevelopmentDatabases allowing them to configure the kind of database that they want (SQL, NOSQL), maybe some storage sizes to indicate the amount of data they expect to be handling, and some other parameters that Application Development teams’ might be interested in tuning.

In this series of blog posts, I will be covering some of the tools that are currently being developed in the CNCF, some of them are not in the CNCF, and some are cloud provider specific, but I wanted to focus on covering the main challenges that I see coming forward that we as participants of the CNCF ecosystem will need to tackle more actively.

Learning how to use and how Kubernetes works is a lot, and while it can benefit some developers and architects when they design their applications, it shouldn’t be required for every developer in the team. It is essential to recognize that Kubernetes is just the starting point, as depending on which other projects from the CNCF landscape you decide to adopt are the tools and methodologies your teams will need daily. So while the platform will encapsulate all the infrastructure knowledge behind the API exposed to App Dev teams, it can also promote best practices and methodologies by encapsulating the decisions made by the platform teams on what is installed in our Kubernetes Clusters.

As the title of this section mentions, the trick is, if you are not consciously building a platform with a platform team responsible for it, the platform is building itself by the choices of different teams and the tools they have decided to use in their journey to Kubernetes.

Let’s jump into the recurring challenges I’ve seen when people build these platforms.

## Challenges of building a Cloud Native platform

Let's be clear here we are using the term Platform to mean: "*A set of Services and APIs that will encapsulate the creation and configuration of complex infrastructure to reduce the cognitive load of the ones that need to consume this infrastructure*".

Following this definition Google Cloud, AWS and Azure are platforms, which is 100% true. But we need to be more concrete than that. Internal Development Platforms (IDP) are constructed on top of Cloud Providers or On-Prem infrastructure, and they aim to encapsulate your company's specific requirements, something that none of the Cloud Providers can do. IDPs aim to make it transparent to the Application Development teams to not care about where or who is running the infrastructure. As soon as Application Development teams can get what they need, everyone is happy.

IDPs are the kind of platforms that we will be covering in this and following blog posts. And this kind of platform presents its unique challenges. And I wanted to be even more concrete here by adding Kubernetes into the mix. These are the specific challenges that I see teams trying to tackle when building Internal Development Platforms on top of Kubernetes.

- **Platform Topologies and available tools:** which mechanisms will the platform use to enable application development teams with what they need to do their work? In this blog post, I will discuss the obvious fact that one Kubernetes cluster is not enough and that Kubernetes is just the beginning. I will also be talking a bit about the complexity of gluing several tools together that were not designed to work together.
- **Self-Service APIs:** how do you create and expose contracts that make sense to your application development teams and enable you to evolve the platform without impacting the teams already working? Here I will dig deeper into the cultural/mind shift required to build these platforms and why having powerful tools to create and expose these APIs is vital for your platform engineering team.
- **Tailored Developer experiences:** IDPs can be the enablers for more tailored developer experiences. In these developer experiences, you leverage the decisions made by the platform team to enable developers with the tools they need specifically for the kind of work they are doing. I will show an example based on building a Function as a Service (FaaS) platform, but the example can be extrapolated to your specific and custom development requirements. Having the right tools to ensure that developers are not "forced" to make decisions they are not supposed to make (base image for containers or CPU and memory requests, for example) is key to improving their productivity.

That's all for now. The following blog post will explore Platform Topologies and some tools that can guide your platform-building decision-making process. I promise the next blog post will have real tools and step-by-step tutorials around these topics.
