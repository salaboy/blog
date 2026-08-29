---
title: "Knative OSS Weekly #46"
date: 2022-07-02 10:56:09 +0000
permalink: /2022/07/02/knative-oss-weekly-46/
description: "This week on the Knative Project weekly, I will be sharing about the work that I am currently doing on the Knative Functions and Knative Flows initiatives…"
tags:
  - "CD"
  - "cdevents"
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
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "k8s"
  - "knative"
  - "oss"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2022/07/02/knative-oss-weekly-46/
---

This week on the Knative Project weekly, I will be sharing about the work that I am currently doing on the Knative Functions and Knative Flows initiatives and a couple Open Source projects that I think might be very interesting to collaborate on. Before jumping into these topics let's start with the weekly "good-first-issues":

- Document the `--build` flag: <https://github.com/knative-sandbox/kn-plugin-func/issues/1085>
- Persist the namespace on the first deployment: <https://github.com/knative-sandbox/kn-plugin-func/issues/1087>

As usual, these two issues are great for getting started and testing the contribution flow. These issues will force you to set up your development environment, fork the project, understand how to run the tests, and then submit a PR that will be reviewed by the project maintainers. My only recommendation is to hurry up, these issues are being picked up faster than I anticipated, and thanks a lot to the project maintainers for creating these issues! If you have questions about how to do all these things that I've mentioned please get in touch or drop us a comment on the issues.

### Knative Functions and Knative Flows

This week I've been actively working on two separate issues that we want to close before 1.0. I've mentioned these issues before and it still feels that I am doing some discovery tasks to understand how to proceed but I feel much closer to having a first draft PR for both.

First of all, refactoring the `func.yaml` to be more structured is quite a large change and after having a long chat with the working group and a [long discussion on the Github issue](https://github.com/knative-sandbox/kn-plugin-func/issues/817), I am working on an initial PR where the changes focus on having a simple hierarchy that allows us to group properties that are related to specific stages in the functions lifecycle.

```
version: X.X.X
name: myfunc
invocation: 
  format: http
// shared parameters by build & run
build: 
  // all build related parameters here
run: 
  // all run parameters here
```

I am learning a lot from people like [Luke](https://github.com/lkingland) who always remember the team the purpose of this file and the philosophy behind it. In Luke's words: *"This file represents the serialized Function struct, so we should look at the struct and its properties and then see who is using what"* and also *"This file represents a function that is deployed in an environment"* both very important design decisions that are not so obvious to figure out when using the project as a user. I will provide more updates at the next Working Group meeting, if you are interested in this topic I recommend you to join our weekly calls.

The second issue that I've been working on is the [`--dry-run` flag for `func deploy`](https://github.com/knative-sandbox/kn-plugin-func/issues/1060). The idea here is to instead of doing a deploy operation against a Kubernetes Cluster, which creates a Knative Service resource programmatically, have the Knative Service resource in a YAML format. My initial instinct was just to grab the Knative Service that was being programmatically created and marshall it to YAML using the YAML libraries available. Unfortunately, I spent too much time dealing with [Docker authentication issue that I hit](https://github.com/knative-sandbox/kn-plugin-func/issues/1094) because I do have two docker credentials in my setup, I know I am really good at finding issues 🤓

After more research and to avoid creating a completely new mechanism I dug into the `kn` CLI already has a sort of `dry run` functionality which you can use by setting the `--target` flag. This allows you to redirect all the queries and creation of resources to files that can be serialized in JSON or YAML. Right now, my gut tells me to reuse this mechanism and align with `kn` as if we want a more specific `--dry-run` functionality for `func` we can also add that to `kn` itself by extending the target mechanism. The `--target` flag is implemented as a completely new `knServiceClient` called `knServiceClientGitops` which makes a lot of sense, as that is the main use case that we are trying to cover with the `--dry-run` flag.

On the Knative Flows side, this last Wednesday we had Jens from the [Direktiv project](https://direktiv.io/) giving us a presentation about how the Direktiv project works, how it integrates with Knative, and the main states that you can define in a workflow definition. Here you can find the examples used during the session, showing the different states and capabilities of the workflow engine: [https://github.com/jensg-st/knative-demo/](https://github.com/jensg-st/knative-demo/blob/main/c_actions/simple3.yaml)

I've learned two main things in the session, besides the details on the language for defining workflows, the fact that they use PostgreSQL to store state, and the fact that there are no CRDs or Kubernetes integrations. Both design decisions make a lot of sense for their project/product.

### Identity Management, SSO, and Virtual Clusters with Knative

This week I wanted to give a shoutout to the folks from [Zitadel](https://zitadel.com/) who are working on an [Open Source Identity Management](https://github.com/zitadel/zitadel) solution with an awesome developer experience. I've met a couple of engineers at [Devoxx UK](https://www.devoxx.co.uk/) and I thought that we should catch up. I believe that there are a couple of collaborations possible with the Knative Functions and Knative Eventing projects.

[![Screenshot 2022 07 02 at 11.47.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/screenshot-2022-07-02-at-11.47.41.png)](/content/images/2022/07/screenshot-2022-07-02-at-11.47.41.png)

I would love to have some examples of functions using authentication with a Single Sign-On component like [Zitadel](https://zitadel.com/). I do imagine that it would be useful to have some examples in the `func-tastic` repository showing how to easily integrate different languages with a Single Sign-On component that is easy to install and configure on Kubernetes or run as a SaaS service.  For eventing, I imagine some scenarios with role access control to brokers hence it will be an interesting area for doing some PoCs.

Their focus is to make sure that developers can get started in 5 minutes, and be honest their documentation and guides are rock solid. Trying to adap the example (<https://github.com/salaboy/from-monolith-to-k8s/)> that I am working for the [Continuous Delivery For Kubernetes](http://mng.bz/jjKP) book which will require the following steps:

- [Install Zitadel in the cluster](https://docs.zitadel.com/docs/guides/installation/run) (Check their docs, they have a Knative approach too!)
- Configure Zitadel Organization and Project with users and roles
- Connect the frontend application ([React frontend](https://docs.zitadel.com/docs/guides/overview) & Spring Boot backend) for login redirection
- Connect backend services to do token validation ([Spring Boot services with Spring Security](https://github.com/zitadel/zitadel-examples/blob/main/java/spring-boot/api/src/main/resources/application.yml))

Doesn't feel like it will take forever and I will be probably updating the application with those changes soon.

![Knative OSS Weekly #46](https://github.com/loft-sh/vcluster/raw/main/docs/static/media/vcluster_horizontal_black.svg)

On a separate note, a big shoutout to my friend [Ishan Khare](https://github.com/ishankhare07) who is working on integrating Knative Serving into [VCluster](https://github.com/loft-sh/vcluster). I think this is great, as you can share a single Knative Serving installation with multiple Virtual Clusters. The idea here is to make sure that Knative can route traffic to virtual clusters in a transparent way for the users not to worry about where Knative Serving is installed. Ishan shared a TODO/progress list here: <https://github.com/ishankhare07/vcluster-plugins/blob/knative-serving-plugin/knative-plugin/ROADMAP.md>

That's all for this week, see you all soon. Stay tuned!
