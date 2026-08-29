---
title: "JHipster Conf: Rocks!"
date: 2019-07-03 08:40:33 +0000
permalink: /2019/07/03/jhipster-conf-rocks/
description: "Last week I presented at JHipster Conf in Paris, France. It was the second edition of the conference and it was a lot of fun."
tags:
  - "cloud"
  - "cloud native"
  - "community"
  - "English"
  - "knative"
  - "kubernetes"
  - "open source"
  - "spring cloud"
  - "tutorial"
  - "conference"
  - "docker"
  - "Java"
  - "k8s"
original_url: https://www.salaboy.com/2019/07/03/jhipster-conf-rocks/
---

Last week I presented at [JHipster Conf in Paris](https://jhipster-conf.github.io), France. It was the second edition of the conference and it was a lot of fun. The topics of the presentations were quite broad, from stories around people using the projects, companies sharing their experiences, how [Open Collective](http://opencollective.com) is used and why it is really important for the project to very deep technical talks about the new stuff that it is coming to the project.

![JHipster Conf: Rocks!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/07/img_2720.jpg)

I was really happy about the opportunity to present my initial PoC of a [JHipster K8s Operator](http://github.com/salaboy/jhipster-operator), because I got a lot of feedback to move the project forward in a direction that can be useful for the entire community.

![Jhipster team](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/07/jhipster-team.jpg)![JHipster Conf: Rocks!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/07/img_2756.jpg)![JHipster Conf: Rocks!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/07/img_2763.jpg)![Screenshot 2019 07 03 at 09.23.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/07/screenshot-2019-07-03-at-09.23.58.png)![K8s jhipster](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/07/k8s-jhipster.jpg)

### Slides & Video

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/9iqTtwptTT8" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/152190264" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

### JHipster K8s Operator work

***[Update: A new RFC for the JHipster K8s Operator Created here, get involved!](https://github.com/jhipster/generator-jhipster/pull/10054)***

As I mention in the introduction, I got a lot of feedback from the core team, so I've created a [branch into the repository called "jhipsterconf19"](https://github.com/salaboy/jhipster-operator/tree/jhipsterconf19) to host the code that I presented. Notice that there is a README.md file inside the repository that explain step by step how to get the Operator up and running into your Kubernetes cluster. [Also, you might want to check out my previous blog, which guide you to get a local K8s environment running a JHipster App using Kubernetes KIND.](/2019/06/27/jhipster-microservice-application-in-kubernetes-kind/)

Based on the feedback I will be implementing the following changes in the master branch:

- Remove Spring Cloud Gateway and create Ingress routes or/and Istio Gateway integration
- Add new CRDs to ***jhipster kubernetes*** and ***jhipster kubernetes-helm*** generators with an option to generate these manifests.
- Remove endpoint to send JDL file (due previous point) and due the fact that it feels more natural for the operator itself to monitor and not deploy
- Add tests for the core services
- Add integration tests
- Create a pipeline in Azure DevOps for CD

If you want to get involved please get in touch, drop me a message or a [tweet](http://www.twitter.com/salaboy). I will be creating some issues in the the JHipster project as well to see if the community is interested in picking some of these things up.
