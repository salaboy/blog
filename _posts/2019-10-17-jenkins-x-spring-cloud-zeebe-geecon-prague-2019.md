---
title: "Jenkins X, Spring Cloud &  Zeebe @ GeeCon Prague 2019"
date: 2019-10-17 14:02:51 +0000
permalink: /2019/10/17/jenkins-x-spring-cloud-zeebe-geecon-prague-2019/
description: "This year I've presented a session called From Monolith to Kubernetes where I showed how to split a Monolith application into a set of Microservices, the…"
tags:
  - "BPM"
  - "bpmn2"
  - "camunda"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "community"
  - "docker"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "spring cloud"
  - "workflow"
  - "workshop"
  - "zeebe"
  - "bpmn"
  - "cloudnative"
original_url: https://www.salaboy.com/2019/10/17/jenkins-x-spring-cloud-zeebe-geecon-prague-2019/
---

This year I've presented a session called [From Monolith to Kubernetes](https://2019.geecon.cz/schedule/) where I showed how to split a Monolith application into a set of Microservices, the main challenges that you will face and some solutions for those.

![Screenshot 2019 10 17 at 15.55.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.55.48.png)![Screenshot 2019 10 17 at 15.55.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.55.38.png)![Screenshot 2019 10 17 at 15.55.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.55.18.png)![Screenshot 2019 10 17 at 15.54.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.54.39.png)![Screenshot 2019 10 17 at 15.56.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.56.51.png)![Screenshot 2019 10 17 at 15.58.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.58.07.png)![Screenshot 2019 10 17 at 15.57.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.57.58.png)![Screenshot 2019 10 17 at 15.59.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/screenshot-2019-10-17-at-15.59.13.png)

First I showed how to deploy a monolith application to Kubernetes (GKE) using [Jenkins X](http://jenkins-x.io) and then I jumped to split the application into 4 micro services.

I showed how when splitting micro services using Spring Cloud Gateway can help you route requests to services that are not exposed outside the Kubernetes cluster. You can find the example here: [demo-conference-site](http://github.com/salaboy/demo-conference-site)

Once I have my 4 micro services working and connecting to each other, I introduced [Zeebe](http://zeebe.io) to automate and takes care of the services orchestration. This included modifications to add the [Zeebe](http://zeebe.io) Client Spring Boot integration to my C4P project to deploy and create new instances of the workflow and then I've modified the Agenda service to serve as a [Zeebe](http://zeebe.io) Worker to pickup Job from the orchestration engine. You can find the Zeebe integration example here: [demo-conference-c4p](http://github.com/salaboy/demo-conference-c4p)

The source code for this services can be found here:

- [demo-conference-monolith](http://github.com/salaboy/demo-conference-monolith)
- [demo-conference-site](http://github.com/salaboy/demo-conference-site)
- [demo-conference-c4p](http://github.com/salaboy/demo-conference-c4p)
- [demo-conference-agenda](http://github.com/salaboy/demo-conference-agenda)
- [demo-conference-email](http://github.com/salaboy/demo-conference-email)

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/183132158" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

If you want to run the demo in your environment get in touch, I will be more than happy to help you with that.

As soon as I have the recording I will post it here.

Stay tuned!
