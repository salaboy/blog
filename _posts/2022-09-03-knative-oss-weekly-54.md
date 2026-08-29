---
title: "Knative OSS Weekly #54"
date: 2022-09-03 10:02:18 +0000
permalink: /2022/09/03/knative-oss-weekly-54/
description: "What a week! Things are getting intense as KubeCon and KnativeCon are approaching, if you haven't check the agendas you should!"
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "English"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "platform"
  - "serving"
  - "tutorial"
  - "book"
  - "community"
  - "functions"
  - "knative"
  - "release"
  - "weekly"
original_url: https://www.salaboy.com/2022/09/03/knative-oss-weekly-54/
---

What a week! Things are getting intense as [KubeCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/program/schedule/) and [KnativeCon](https://knativeconna22.sched.com/) are approaching, if you haven't check the agendas you should! I really want to complete the [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) book drafts so I am expecting to have a couple of very busy months. I might be taking a break from this blog posts, but I will try to keep writing important updates happening in the Knative community. We are still aiming to get Knative Functions first GA version by KubeCon/KnativeCon and that requires the project to join the [Knative release stream for the 1.8 release](https://github.com/knative/release).

This week I was very focused on working on this PR for `func` : <https://github.com/knative-sandbox/kn-plugin-func/pull/1212>, so I didn't had the chance to write about other initiatives that are running in parallel.

If you are interested in contributing to the Knative Functions release, there are a number of issues open for On-Cluster builds that will benefit for more people getting involved. If you have experience with Tekton, we need you, check this Epic to see which issues are still open: <https://github.com/knative-sandbox/kn-plugin-func/issues/620>

As I've mentioned before this work is related to having the first GA version of Knative `func` out the door. As with every GA version, the Function Working Group wanted to make sure that the format of the `func.yaml` file was a bit more structured making it easier to consume by end users but also by other tools that might be interested in sets of properties instead in all of them. As usual, with these structural changes in the core structures of the project we need to make sure that we are consistent. As you can see in the issue ([#817](https://github.com/knative-sandbox/kn-plugin-func/issues/817#issuecomment-1236071276)) there is a long discussion about these changes and I think the PR is reflecting most of the suggestions and tackling most of the concerns raised.

The structure of the `func.yaml` file implemented in the PR looks like this:

specVersion: 0.0.0 name: testfunc created: 2022-05-25T22:44:47.36886+09:00 runtime: go invocation: format: http registry: "" image: "" imageDigest: "" template: "" build: type: local git: url: "" revision: "" contextDir: "" builderImages: [] builder: "" buildpacks: - paketo-buildpacks/go-dist - ghcr.io/boson-project/go-function-buildpack:tip buildEnvs: [] run: volumes: [] envs: [] deploy: namespace: "" annotations: {} options: {} labels: [] healthEndpoints: liveness: /health/liveness readiness: /health/readiness

This new structure group different properties in different buckets which represent the different lifecycles of a function. If the user is trying to configure parameters for running `func build` , the `build` section in the `func.yaml` file is the place to look. For running the function locally, the `run` section allows you to set up `volumes` and environment variables, which will be reused by the `deploy` phase too. Properties that only make sense in the context of running our functions in a Kubernetes cluster are reserved for the `deploy` section.

The team has already identified some other features and behaviors that can be implemented on top of this change, like for example, making sure that we enable the user to define different environment variables and volumes depending if they are running the function locally or deploying it to a cluster, and I firmly believe that this change allows us to implement these suggestions in a simple way, as now the different stages are clearly separated.

If you have time, check the PR code and add comments or questions, that will be highly appreciated by the community.

### Shoutouts

This week I had the luck of meeting and having awesome conversations with Michael Gasch (ex-VMware) and Christopher Hedley from Syntasso. These chats which are all about sharing knowledge are one of the main reasons why I am still in tech, the learnings never stop! And of course the T-shirts! Look at my new limited edition [Kratix.io](https://kratix.io) T-Shirt!

[![Img 0775 medium](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/09/img_0775-medium.png)](/content/images/2022/09/img_0775-medium.png)[![Img 2644 medium](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/09/img_2644-medium.png)](/content/images/2022/09/img_2644-medium.png)
