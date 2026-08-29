---
title: "Activiti in 2018: Now Cloud Native!"
date: 2018-12-31 10:55:03 +0000
permalink: /2018/12/31/activiti-in-2018-now-cloud-native/
description: "We are closing an amazing 2018 for Activiti. We’re moving the Activiti project forward to the cloud with Activiti Cloud, we moved from design, proof of…"
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "cloud native"
  - "containers"
  - "docker"
  - "knative"
  - "microservices"
original_url: https://www.salaboy.com/2018/12/31/activiti-in-2018-now-cloud-native/
---

We are closing an amazing 2018 for [Activiti](http://activiti.org/). We’re moving the Activiti project forward to the cloud with *Activiti Cloud*, we moved from design, proof of concept to implementation and stabilisation of the first set of Cloud Native Building blocks. Being an Open Source project we believe that this is a journey worth sharing. This blog post will share some of the key milestones that we accomplished during this year. You can find a more detailed [blog post about our journey to Beta phase here](/2018/10/31/the-road-to-activiti-core-activiti-cloud-beta2/).

![Activiti sticker](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti_sticker.png)

## It all began with a simple idea

Back in mid 2017 we started playing around with a very simple idea:

***“Let’s create a set of Business Automation building blocks using a modern Cloud Native stack.”***

We wanted to make sure that we avoid hitting the same traps of the past. Our goal was to provide a Digital Process Automation platform for the cloud and not just another ***“Microservices Orchestration”*** service.

Here are some failures from the past that we wanted to avoid:

- **Monolith architecture**: which pushed implementers to adopt all or nothing
- **Fragmented Deployments**: providing support for a wide range of Java Servlet Containers & Application Servers has its challenges, we need to standardize and leverage new technologies to deal with deployments, upgrades and migrations
- **Overlap with Infrastructure**:with the rise of cloud providers, we wanted to make sure that the platform provides value and it doesn’t overlap with services and features already provided by the platform. We wanted to make sure that we work in a *“integrate instead of build”* approach.
- **Non standard mechanisms for extensions**: frameworks relied on a single JVM to provide extensions, this always caused problems while trying to integrate the platform with third party libraries (single classpath, single JVM), maintenance headaches and extremely complicated clustering setups.
- **Vendor Lock-in Due to implementation details**: relaying on the JVM for Java based process automation platforms mean complete vendor lock-in due technicalities leaking into the process/business models.
- **Non-Friendly Developer/DevOps tools**: nowadays tools are built with concepts of CI/CD and GitOps from the ground up. Integrating process automation platforms with these practices has been always challenging due these tools were not built with those concepts in mind.
- **Not ready for the Cloud**: the cloud (cloud providers) didn’t existed back then, so it is natural to expect that most of the tools were not ready to even run efficiently in a cloud infrastructure.

Early 2018 (Jan) we had our first Proof of Concept where we built the initial implementations of our building blocks called: *Runtime Bundle, Cloud Connectors, Query Service, Audit Service and Applications Service*.

![Activiti in 2018: Now Cloud Native!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/lf82yhxkzghorxhkgj7erixbpyjsk-hg3g9pglgkkq50szhp-idhqn3_0vlrhuosgx4hbuncc2weyqtzfu3rrllktuja12us5oo9dti8yvmutwfezk3m-yqvcetpvbekibtkpq1l.png)

We began the year validating this approach and making sure that we got as much feedback as we could to make the right choices for the first version of Activiti Cloud.

We knew right from the beginning that we needed to validate not only our approach to Cloud Native, we needed to validate the whole technology stack, tools and practices used to build Cloud Native applications. The only way validate what we were doing was to share our Journey and speak with as many people as possible in order to understand what the maturity level was for each of the different tools we were using.  

## The Journey is the destination

When we started carefully analyzing each of the fundamental ideas and core Services for Activiti Cloud there were key technologies and tools (containers, orchestration and CI/CD), that if we adopted, would significantly influence the architecture of our cloud native building blocks (*Runtime Bundle, Cloud Connectors, Query Service, Audit Service and Applications Service*).

### First Milestone: Containers

Our first milestone was around two technologies that represent a big change in how you think about your solutions: [***Spring Boot***](https://spring.io/projects/spring-boot) ***&*** [***Docker***](https://www.docker.com/)

- Spring Boot promotes the creation of self contained applications/services which can be executed without thinking about deployment. A single, self-contained unit that can be distributed and executed, tested and monitored. Spring Boot also introduces the concept of “*Starters*” which are extensions to a Spring Boot Application. These extensions add functionality to your existing Spring Boot Application. Widely used extensions can be found in [start.spring.io](http://start.spring.io/) . With Activiti Cloud we aim to provide the main functionalities provided by Process Automation platforms as Spring Boot Starters, that you can attach to your existing Spring Boot ecosystems or run in isolation.
- [Docker](http://docker.com) pushed us to think even more about isolated units that can run using a single process approach. Docker Containers are immutable and this matches with the Spring Boot approach but it clashes with traditional process automation frameworks and Servers, which allowed users to deploy (at runtime) new process definitions. This was a clear indication that things will need to change.

Once you mature the idea on how containers work, and waste a lot of time discussing about why it is a terrible idea to containerize your old-fashion web application, your thoughts jump towards thinking about container orchestration and Cloud Native Architectural patterns.

Which takes us to the second milestone: [***Spring Cloud***](https://spring.io/projects/spring-cloud) ***&*** [***Kubernetes***](https://kubernetes.io/).

### Second Milestone: All in on [Kubernetes](https://kubernetes.io/)

Moving from single to multiple services creates the demand for container orchestration. Historic Process Automation platforms forced legacy tools on implementers—all or nothing. When modernized properly, both Docker and Kubernetes help a lot in this regard. Now our Cloud Native building blocks will transparently work with your distributed applications.  With Activiti Cloud we wanted to go one step further than ***“just fit in”***, we want to provide a ***context-aware*** set of building blocks that can leverage the infrastructure where they are running. We see this as critical to empower developers and devops teams to use modern and agile tools to move fast in the cloud.

We quickly realised that Docker is not enough, [Kubernetes](https://kubernetes.io/) pushes you to really think about Cloud Native patterns and ways of working that we couldn’t neglect when designing Activiti Cloud.  At that point, around March 2018 we made the decision to focus only on real Kubernetes deployments, leaving aside tools like Docker Compose and even Minikube, solutions that were good for quick demos, but introduce a lot of noise. *It is important to notice here, that all the building blocks provided by Activiti Cloud can be run with Docker Compose and in Minikube, but the team is focused on real life Kubernetes deployments.*

Now, if you are a Java Developer and want to develop Cloud Native applications, you will notice that Spring Boot is not enough. You need to step back and look at how your Microservices will interact with each other and components like: *Gateway, Message Broker, Configuration Server, Service Registry, etc*. become essential to building robust and reliable distributed applications. This is where [Spring Cloud](https://spring.io/projects/spring-cloud) steps in to fill this gap. When you look at Spring Cloud and Kubernetes, the patterns that they promote are quite similar and there is a huge match in terms of how both recommend to build distributed applications. It took us some time, but finally we realized that the power of Spring Cloud relies on the abstractions (interfaces) provided that promotes these patterns. The next big logical step was to contribute to the [Spring Cloud Kubernetes](https://github.com/spring-cloud/spring-cloud-kubernetes) framework, which basically provides implementations of these abstractions using [Kubernetes](http://kubernetes.io/) Native Services.

We strongly believe that [Spring Cloud Kubernetes](https://github.com/spring-cloud/spring-cloud-kubernetes) gives us the contextual awareness that our services require in order to best leverage the provided infrastructure. For this reason we are committed to contribute back with lessons learned, examples, documentation and new features that will enhance the capabilities that a Java Developer creating Spring Boot Applications will need when running their applications in [Kubernetes](http://kubernetes.io/).

Until here, everything was running smoothly, but the day to day Developer Experience was really bad and slow. We had introduced [Docker](http://docker.com/) *(Dockerfile and docker build)* and [Kubernetes](http://kubernetes.io/) *(Deployment Descriptors/Manifests, a.k.a. yaml hell)* on top of our Java Applications, and we started suffering the pain of maintaining all these extra steps in our pipelines. This pain takes us to the next Milestone: ***CI/CD***.

### Third Milestone: CI/CD from beginning to end

The Cloud Native approach promotes multiple isolated units—a good thing. Yet, this introduces complexity: a number of containers to release, manage, configure, monitor, etc. Delivering on agility is almost impossible without an effective and comprehensive CI/CD practice.

Developers and DevOps will need to be comfortable creating, testing and releasing containers. Yet, Cloud building blocks and microservices deployment pipelines are sophisticated and complex. Some of the common topics that you will need to sort out when moving to a cloud native approach are:

1. A single logical Application now lives in multiple repositories, where each one will generate a set of artifacts that needs to be managed, released and deployed to multiple environments
2. You now depend on a complex infrastructure where multiple tools needs to be coordinated together to automate as much manual work as possible
3. You need to define and maintain different environments to test and validate that your distributed applications are working as expected before promoting changes to production
4. You need to have the right monitoring tools to understand what is going on in your distributed application

For a big percentage of organizations, which are just starting their DevOps journey, all these points are a big leap forward and people tend to be scared about changing the way they work.

With this backdrop, [Jenkins X](https://jenkins-x.io/) comes into play. [Jenkins X](https://jenkins-x.io/) provides a very forward looking, [Kubernetes](http://kubernetes.io/) first way of doing CI/CD, which translates straight away over to providing the same consistent way of doing CI/CD in a multi-cloud environment. The technology choices and the approach of Jenkins X matched 100% with our practices and adapting our projects to work in the Jenkins X way was minimal.

As developers, we need to be always looking for tools that:

1. Simplify our day to day life
2. Promotes best practices from the community and encourage agility

[Jenkins X](https://jenkins-x.io/) was designed to provide both and it takes a lot of the burden of creating and releasing Docker Images, HELM charts and promotes the use of GitOps practices to be able to quickly reproduce your environments (where you run your containers) in no time by storing all the configuration in Git repositories.

[After several months of heavy work on automation](/2018/11/05/activiti-cloud-ci-cd-approach-for-java-libraries-and-beyond/), we can say that now we are building all Java Libraries, Docker Images and HELM charts using automated pipelines that create a release for every Pull Request. You can now browse all our repositories ([40+ repos](http://github.com/activiti/), including example ones) and you will see automated releases created after every merge to the master branch.

## This is just the beginning

We consider that Activiti Cloud represent the first set of Kubernetes-aware building blocks. There is a lot of work ahead to provide all the functionality that is expected from a Business Automation platform, but we believe that on top our basic build blocks (*Runtime Bundle, Cloud Connectors, Query Service, Audit Service, Notification Service and Applications Service*) we can build a very robust and modular solution, that you can adapt to whatever your business needs.

There are some important consequences that now appear evident to us, but we recognise that are not so easy to spot unless you go through a similar journey:

- Due the fact that now that Process Runtime will know about the infrastructure and it will try to use as many services as possible, the Process Runtime complexity is reduced. The Process Runtime should move towards more simple libraries with less responsibilities. In other words, by removing overlap between what we knew as Process Engine with the infrastructural services, the Process Runtime will deal with less concern and it will keep the focus on just running BPMN process models
- It makes a lot of sense to have a separated Task Runtime from the Process Runtime, due multiple Process Runtime will want to reuse the Task Runtime. This once again will promote single responsibility and simplicity for the Process Runtime.
- Everything is built API first and both REST and Message Driven APIs should be provided. These APIs now should be tested against different scenarios and the testing should now include conformance checks, that guarantees coherence across the entire distributed system.
  - In a world of mobile clients and user focused experiences we need to go one step further and provide full reactive APIs. We are quite close to include our GraphQL endpoints for data aggregation and subscriptions thanks to [@igdianov](https://github.com/igdianov/) community contributions!
- In the same way Spring Cloud provides interfaces, Activiti Cloud provides interfaces and separate implementations using different technologies. We recognise that a single implementation will not fulfil every possible use case, for that reason we encourage our community to provide different implementations of the Activiti Cloud components using their favourite technologies. An example of this can be easily explained with the Audit Service, which provides an implementation using a relational database to store audit events. For some use cases that will be more than enough, but if you are already using NoSQL databases, a MongoDB implementation (for example) makes a lot of sense to store, index and report on these events (Thanks to [@daisuke_yoshimoto](https://github.com/daisuke-yoshimoto), who provided this implementation as a community contribution).
- If containers are immutable, we can leverage tools like [Istio](https://istio.io/) to do blue/green deployments and to control traffic between Runtime Bundle versions.
- Due the similarity in infrastructure between Activiti Cloud Connectors and Functions as a Service (such has AWS Lambdas) we believe that the [Knative Project](https://github.com/knative/) represents the way to go for our Kubernetes approach. By using [Knative](https://github.com/knative/) we can simplify even further our Process Runtime and leverage the infrastructure even more in a cost efficient way.
- Understanding the boundaries of each Activiti Service and the Services provided by the infrastructure framework becomes really important to understand how the overall design will work and how the pieces fit together. We are 100% committed not to duplicate/overlap with the infrastructure frameworks that we are using, this includes: Kubernetes, Knative Project, Istio, Spring Cloud and [Spring Cloud Kubernetes](https://github.com/spring-cloud/spring-cloud-kubernetes). An example of this commitment might be the usage of Istio for Circuit Breaking instead of Ribbon + Hystrix provided by Spring Cloud. The moment that we see an overlap we contribute back with improvements, in this case to Spring Cloud Kubernetes, to be aware of the infrastructure (in this case that Istio is present). Understanding where the right abstractions are (where the interfaces should live) it is extremely important to avoid overlapping and allow us to make sure that we keep the focus of Activiti Cloud on digital process automation instead of solving infrastructural or tooling gaps.
- Thanks to tools and frameworks like [GraalVM](https://www.graalvm.org/), Spring Cloud Kubernetes and [JHipster](https://www.jhipster.tech/), the Java Community is quickly catching up and understanding its way to the Cloud, we expect this trend to continue improving our day to day developer experience. For this reason the Activiti Cloud team is really committed to adopt, collaborate and integrate with these frameworks and tools.

We are aiming to release [Activiti Release Candidate 1 (RC1)](https://github.com/Activiti/Activiti/milestone/11) by the end of January and share more about what is coming next year at that point.

## The Community is where you learn

We do everything in the Open and we encourage people to join us. If you are interested in building Cloud Native Applications, Activiti gives you an open way to learn about the tools that we are using and how they will work in a real Kubernetes Cluster.

This year (2018) was quite intense on presentations intent on sharing our Journey to Cloud Native Applications. We recognised that before even using Activiti Cloud people need to understand the advantages and the way of working with Cloud Native tools.

For that reason we participated in the following events:

- [Alfresco DevCon (Portugal) Jan ’18](/2018/01/17/lisbon-alfresco-devcon-2018/)
- [Alfresco Meetup (London) Feb ’18](/2018/03/19/activiti-cloud-introduction-at-mintelnews/)
- [uServices Meetup(London) March ’18](/2018/03/12/activiti-london-uservices-meetup-7-3-18/)
- [GeeCon Poland (Krakow) May ’18](/2018/05/11/geecon-18-lessons-learned-spring-cloud-in-activiti-oss/)
- [JJUG CCC (Japan, Tokyo) May ’18](/2018/05/26/jjug-ccc-2018-spring-cloud-docker-kubernetes/)
- [JDK.IO Denmark (Copenhagen) May ’18](https://www.youtube.com/watch?v=peI4VViDvBw)
- [JBCN Conf (Spain, Barcelona) June ’18](/2018/06/08/jbcn-conf-18-kubernetes-cloud-native-java-jenkins-x/) (2hs Workshop)
- [London Java Community (London) July ’18](/2018/07/18/ljc-july-18-spring-cloud-docker-k8s/)
- [SpringOne Platform (USA, Washington) Sept ‘18](/2018/09/27/the-s1p-experience/)
- [GeeCon Prague (Czech Republic) Oct ’18](/2018/10/22/the-geecon-prague-experience/)
- [uServices London Meetup (London) Nov ’18](https://skillsmatter.com/skillscasts/13120-identity-management-and-single-sign-on-how-much-flexibility)

We are now going full circle, and we will be presenting the first ***Release Candidate*** of Activiti Cloud at [Alfresco DevCon 2019 in Edinburgh](https://devcon.alfresco.com/). We have learnt a lot by sharing and this will continue in 2019.

If you are interested in Activiti, feel free to get in touch via [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link), we are really open to participate in Java User Groups and share our lessons learned around the technologies that we are using, the design approach of Activiti Cloud, our journey to CI/CD using [Jenkins X](https://jenkins-x.io/). You can also follow our getting started guides if you want to get your hands dirty with all the technology mentioned in this blog post:

- [Getting Started with Activiti Core -> Java + Spring Boot 2.x](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-core)
- [Getting Started with Activiti Cloud -> Java + Spring Boot 2.x + Spring Cloud + Docker + Kubernetes](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud)

Have a wonderful 2019 & Stay tuned!
