---
title: "From Monolith to K8s @SouJava"
date: 2019-11-07 09:08:09 +0000
permalink: /2019/11/07/from-monolith-to-k8s-soujava/
description: "Yesterday, I had the pleasure of presenting for the @SouJava user group. I talked about the challenges that you will face while going from Monolith…"
tags:
  - "BPM"
  - "bpmn2"
  - "camunda"
  - "ci/cd"
  - "cloud"
  - "community"
  - "English"
  - "event"
  - "Java"
  - "Jenkins X"
  - "jug"
  - "knative"
  - "kubernetes"
  - "open source"
  - "oss"
  - "spring cloud"
  - "tutorial"
  - "workflow"
  - "zeebe"
  - "bpmn"
  - "cloud native"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2019/11/07/from-monolith-to-k8s-soujava/
---

Yesterday, I had the pleasure of presenting for the [@SouJava](http://twitter.com/soujava) user group. I talked about the challenges that you will face while going from Monolith Applications to Microservices. I also show a some tools in action, like [Jenkins X](http://jenkins-x.io) and [Zeebe](http://zeebe.io), which used a complex tech stack (CCP, GKE, KNative, Tekton, Docker, Helm, GitHub, etc). Unfortunately the first part of the demo failed due some issues that Github was experiencing on sending push notifications.

Here you can find the recording of me suffering with GitHub WebHooks, but I am happy to see that the Zeebe Orchestration for Microservices worked as expected ;)

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/bVQ_XdiGq94" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

#### Slides

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/191103325" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

The projects that I've used in the presentation can be found in GitHub and I recommend you to give this a try if you have access to a Kubernetes Cluster where you can install Jenkins X.

Here some useful links:

- [Jenkins X](http://jenkins-x.io)
- [Zeebe](http://zeebe.io)
- [Helm Charts for Zeebe](http://helm.zeebe.io)
- [Zeebe Microservices Orchestration Cheatsheet](https://zeebe.io/blog/2018/12/microservices-workflow-automation-cheatsheet/)
- [Projects in Github](https://github.com/salaboy?utf8=✓&tab=repositories&q=demo-conference&type=&language=)

If you have questions or comments about the presentation or the tools, feel free to drop me a comment here or via twitter [@salaboy](http://twitter.com/salaboy)
