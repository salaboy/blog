---
title: "Activiti & Activiti Cloud Roadmap Update 29/08/18"
date: 2018-08-29 05:15:08 +0000
permalink: /2018/08/29/activiti-activiti-cloud-roadmap-update-29-08-18/
description: "Hi everyone, it has been long since the last Roadmap update, this blog post address the main reasons why we delayed Activiti Core & Activiti Cloud Beta1…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "workshop"
  - "BPM"
  - "cloud native"
  - "docker"
  - "microservices"
  - "roadmap"
  - "update"
original_url: https://www.salaboy.com/2018/08/29/activiti-activiti-cloud-roadmap-update-29-08-18/
---

Hi everyone, it has been long since the [last Roadmap update](/2018/05/03/4280/), this blog post address the main reasons why we delayed [Activiti Core & Activiti Cloud Beta1](/2018/08/13/activiti-core-activiti-cloud-beta1-released/) and how the work is going to come moving forward. It is important to notice that this update represent the work that is being done in the Open Source community for Activiti Core and Activiti Cloud and we encourage anyone reading this article to join us in our journey.

This blog post is divided into 3 sections, ***Past, Present and Future***. For the sake of transparency, and in addition to our weekly blog posts, we wanted to summarise our work (community) during the last 5 months.

## Past: Some background about Beta1

[Before Beta1](/2018/08/13/activiti-core-activiti-cloud-beta1-released/), while we were doing Early Access Releases, we were defining the shape of Activiti Cloud. As in every experimentation exercise, we create a set of Proof of Concepts to demonstrate how an Activiti Cloud Applications were supposed to be built. We started with Spring Cloud and Docker, and it made a lot of sense at that point to use Spring Cloud Netflix OSS libraries to build Cloud Native applications. These libraries and services such as the Eureka Service Registry, Zuul (Gateway) and Spring Cloud Config Server helped us to demonstrate our points for Cloud Native Applications.

While looking at Kubernetes, we knew that there were some overlaps, all of the Early Access releases and examples contained dependencies to client libraries to connect to these infrastructural services. After getting the initial examples using Docker Compose, we started testing on Minikube, but quickly we realise that we better work in real life clusters than in local VMs. While testing on real life clusters such as GKE and AWS + Kops we realise that we didn’t need much of the Netflix OSS libraries, so we start moving away from them and started collaborating with the Spring Cloud Kubernetes project.

Once the PoCs were done, we defined a new set of APIs for the Runtime Services. These APIs needed to be defined at all levels, meaning Activiti Core, Java Services and at Activiti Cloud REST and Message Driven Endpoints level. This was a very interesting exercise, because previous version of Activiti didn’t define a public/private APIs that we can reuse. For this new APIs we focused on the Runtime aspects first but more APIs will come to cover others (such as data consumption, modeling, etc.). At the same time we did another two important and related pieces of work around HELM and Jenkins X. The team presented at a set of conferences and prepared the Trending Topic Campaigns Workshop with heavy focus on building a real scenario that can be used to demonstrate the power of Activiti Cloud.

These large pieces of work(moving away from Netflix OSS, the new APIs definitions, HELM, Jenkins X and workshop examples) took us 5 months of work to stabilise and validate our ideas with the Java, Containers and Kubernetes communities. During these 5 months of work, it became clear that after Beta1 we couldn’t keep working in the same way to be efficient, we decided that we needed to spend time in our internal workflows in order to accelerate the project speed and in order to propagate those working practices to our consumers.

## Present: Beta1

[Beta1](/2018/08/13/activiti-core-activiti-cloud-beta1-released/) is focused on the main Runtime building blocks for Activiti Cloud Applications in Kubernetes. These building blocks can now be consumed using the provided [HELM charts](h) as templates for building custom applications. These HELM Charts has been tested in AWS+Kops, GKE and PKS (EKS is coming). If you are interested in testing in Openshift, Azure or any other Cloud Provider please get in touch, we are more than happy to help.

As mention in the release post, these building blocks are: Runtime Bundle, Audit & Query Services. These Services expose REST and Message Driven endpoints using Spring Cloud Streams ( we test with RabbitMQ as our Message Broker). These services work on top of a common infrastructure composed by: A gateway, A Service Registry, Config Maps and Keycloak for SSO and IDM.

If we build for the Cloud, we need to work in the Cloud. In the Cloud not everything is perfect, so we have the basics now, we have a huge road ahead to simplify the experience for our customers. Jenkins X helped a lot on this front, for that reason we are collaborating with them to improve their tools for all of us.

Because Beta1 targeted Kubernetes deployments the release is not supposed to support other deployments (Local Spring Boot / Docker) as it is. Docker Compose is currently not working due the fact that we moved away from the Netflix OSS libraries. We can still support a Docker Compose scenario for getting started experiences, but we will need customised Docker Images for that (adding extra Netflix OSS dependencies for such environment). Get in touch if you want to help us on that front.

As you might notice, because Beta1 was focused on the Runtime Services, Modeling services were included but they need more polishing. Also the Application Service which is not considered as a Core Building Block was included but there are still more work to be done in order to be stable.

If you want to get started with Beta1, we recommend the following blog posts:

- [Getting Started with Activiti Core](/2018/08/13/getting-started-with-activiti-core-7-0-0-beta1/)
- [Getting Started with Activiti Cloud](/2018/08/13/getting-started-with-activiti-cloud-beta1/)

## Future: Beta2 (work in progress)

We are aiming to have Beta2 released by the end of September, and as mentioned before, we are making a lot of emphasis into our community process for building these release using a Continuous Deployment and Continuous Delivery approach. We believe that this change is crucial for 2 big reasons:

1. It will allow the community to evolve faster, allowing innovation streams to be included in the releases faster, enabling different components to evolve at their own pace and free engineering time to work on features instead of releases
2. Similar practices will be needed by whoever wants to consume these tools. We want to make sure that we lead the way (by eating our own dog food and generating recommendations and examples based on our experience) to our community and private customers.

For Beta2 we are aiming to have a set of CI/CD pipelines for all our libraries and building blocks as well as an environment where we can test in a continuous deployment fashion the impact of our changes at every level in our stack. Hence Beta2 will include a larger set of Acceptance Tests which will be validated after any pull request get merged at any level of the chain. We are aiming to change the versioning strategy for Activiti Core & Activiti Cloud to be able to evolve each library and building block independently without being tied to a single version for all of our components. We will use semantic versioning for all our artefacts (Major.Minor.Patch) and we should be able to generate and test a new release for every Pull Request that gets merged into our develop branches. We are still defining some of these details, so expect a new blog post about this subject soon.

We aim to not only have basic (conformance) examples plus their acceptance tests running in an environment 24/7, but we also want to have our workshop Trending Topic Campaigns being used to check that new releases can support more complex scenarios.

For Beta2 we are also spending time on our Modeling Services and we expect to release a new Modeling Application along our refined Runtime building blocks to be able to demonstrate an initial full cycle of how to build Activiti Cloud Applications from Modeling to Runtime in Kubernetes.

## Summary and Future (Post Beta2)

After Beta2 our focus will be on hardening our core services and to simplify the experience of building Activiti Cloud Applications for Developers. There are some big topics that we want to cover before going to Release Candidate and those include:

- Further refinements to our CI/CD approach, we know that we cannot get it right in the first time
- Istio is the most natural option in Kubernetes to support in an uniform way cross cutting concerns, so we want to make sure that we do some initial testing with it for our Cloud deployments
- Distributed BPMN Timers should be covered and added to our acceptance tests suite
- Spring Cloud Kubernetes enhancements for Distributed Timers
- Trending Topics Campaigns example / workshop running 24/7 in an environment.
- Performance Tests introduction (still under discussion)
- Pluggable Pipelines (still under discussion)

I hope that this blog post give you an overview about what is going on in the Activiti Core and Activiti Cloud projects, if there is something that you are interested that is not covered here, drop us a message or join our Gitter channel and we will be more than happy to expand the information provided here.
