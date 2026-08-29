---
title: "KubeCon & Spring One 2020: From Monoliths to K8s"
date: 2020-09-24 09:29:09 +0000
permalink: /2020/09/24/kubecon-spring-one-2020-from-monoliths-to-k8s/
description: "Last month was quite a rollercoaster, I've presented at KubeCon EU (Virtual) and Spring One (Virtual)."
tags:
  - "bpmn2"
  - "camunda"
  - "cloud"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "event"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "spring cloud"
  - "workflow"
  - "zeebe"
  - "ci/cd"
  - "cloud native"
  - "containers"
  - "k8s"
  - "kubecon"
  - "tutorial"
original_url: https://www.salaboy.com/2020/09/24/kubecon-spring-one-2020-from-monoliths-to-k8s/
---

Last month was quite a rollercoaster, I've presented at [KubeCon EU (Virtual)](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/) and [Spring One (Virtual)](https://springone.io). Both conferences were amazing and even that the title of the presentation was different the code examples and material used can be found in the following repository:  <https://github.com/salaboy/from-monolith-to-k8s>

Both conferences were focused on Kubernetes, of course targeting different audiences, which is constant validation of where the industry is going. You can find all the recordings and links at the end of this blog post.

### KubeCon Session

KubeCon is the [largest conference](https://www.cncf.io/blog/2020/09/23/kubecon-cloudnativecon-europe-2020-virtual-conference-transparency-report-a-very-successful-first-virtual-event/) where I've presented so far and it was a pleasure this time to present with [Tracy Miranda](https://twitter.com/tracymiranda) (Executive Director of the [CD Foundation](http://cd.foundation)). We focused the session on how [Jenkins X](http://jenkins-x.io) and other projects like [Zeebe](http://zeebe.io) are helping teams to accelerate while they are going to the Cloud.

The presentation heavily relied on the [Accelerate book](https://www.amazon.co.uk/Accelerate-Software-Performing-Technology-Organizations/dp/1942788339/ref=sr_1_1?adgrpid=105606882844&dchild=1&gclid=EAIaIQobChMIo-jQibuB7AIVBZ53Ch2Qxge9EAAYASAAEgLSXPD_BwE&hvadid=447114987736&hvdev=c&hvlocphy=9072502&hvnetw=g&hvqmt=e&hvrand=17004903559092500393&hvtargid=kwd-307609789829&hydadcr=18461_1772266&keywords=accelerate+book&qid=1600939151&sr=8-1&tag=googhydr-21) which describes all the practices that can boost your team's productivity while building complex and distributed applications.

![Screenshot 2020 09 22 at 14.49.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/09/screenshot-2020-09-22-at-14.49.26.png)

We got amazing feedback from the people joining the live stream and further discussions were started from there that made me believe that I need to keep working and expanding on the working examples for people to use as a reference.

### Spring One Session

This session was more focused on the Spring Ecosystem and the tools that Java Developers are using to build, package, and deploy their Cloud Native Applications on top of Kubernetes.

It was really interesting to see how Pivotal/VMWare are going all in towards Kubernetes with their new iteration of [Cloud Foundry for Kubernetes](https://www.cloudfoundry.org/blog/cloud-foundry-becomes-more-kubernetes-native-with-cf-for-k8s/).

This presentation included examples inside the Demo Application on how to use [Spring Cloud Gateway](https://spring.io/projects/spring-cloud-gateway), [Consumer-Driven Contract Testing with Spring Cloud Contracts](https://spring.io/projects/spring-cloud-contract) and how to add fallbacks and circuit breakers with [Resielience4J](https://github.com/resilience4j/resilience4j).

The goal for all these examples, is not to show how these projects work but how they were architected following Cloud Native patterns and Best Practices.

The feedback and the number of live attendees were amazing (almost 1200 online viewers while I was doing the presentation) so I am looking forward to participating in this amazing conference in the future.

### Links and References

Check out the recordings and if you have any questions, comments, feedback, or if you want to help me to make the examples better, feel free to drop me a comment here or a DM in twitter [@salaboy](http://twitter.com/salaboy)

<https://springone.io/2020/sessions/from-java-monoliths-to-k8s>

[![Screenshot 2020 09 11 at 11.22.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/09/screenshot-2020-09-11-at-11.22.14.png)](https://springone.io/2020/sessions/from-java-monoliths-to-k8s)

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/238384966" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/RbGy4oK_0qw" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

<https://www.slideshare.net/salaboy/kubecon-2020-eu-virtual-how-we-migrated-our-monolith-to-k8s>
