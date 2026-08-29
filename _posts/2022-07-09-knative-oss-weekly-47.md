---
title: "Knative OSS Weekly #47"
date: 2022-07-09 09:04:39 +0000
permalink: /2022/07/09/knative-oss-weekly-47/
description: "This week I did a bit of coding on the two issues that I am currently trying to move forward so I will write a bit about that."
tags:
  - "book"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "func"
  - "go"
  - "Java"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "functions"
  - "knative"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2022/07/09/knative-oss-weekly-47/
---

This week I did a bit of coding on the two issues that I am currently trying to move forward so I will write a bit about that. But first things first, let's take a look at the ["good-first-issues"](https://github.com/knative-sandbox/kn-plugin-func/issues?q=is%3Aopen+is%3Aissue+label%3Akind%2Fgood-first-issue) of the week:

- [Show user used to push a container image to a registry](https://github.com/knative-sandbox/kn-plugin-func/issues/1095)
- [Updating Spring Boot Functions templates](https://github.com/knative-sandbox/kn-plugin-func/issues/1061)

If you are looking to get started as a Knative Functions contributor there are two very simple issues to get your hands dirty and go through the entire contribution flow.

### Knative Functions Migrations & Dry Run with Kn --target

Let's start with implementing a `dry-run` functionality for the `func` CLI. As I mentioned last week, after looking at the `kn` CLI I've noticed that there is already a functionality that is pretty close to what I expected to build with a `--dry-run` flag. Hence, it didn't make much sense to just create a separate code to do something that is 80% the same. So this week I've started looking for ways to collaborate with the `kn` team to see if we can build something in the `kn` CLI that we can reuse in `func`. Here is the issue where the discussion is happening: <https://github.com/knative/client/issues/1195>

Next, I kept working on the refactoring for the `func.yaml` file structure, as I mentioned last week I am going for simpler changes to validate the assumptions with a final structure looking like this:

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

I am not at the point where I need to figure out the migration strategy to maintain backward compatibility with the old structures. Luckily, there is a migration mechanism in place that picks old versions of the `func.yaml` file and applies transformations until the file is valid with the latest version of `func`. I am still researching this mechanism to see if it is enough to support the big changes introduced in this PR.

I am trying to create a draft with the steps I believe we should follow to do this migration in particular so I can see how many changes we need in order to get this done. You can take a look at the current migration mechanism here: <https://github.com/knative-sandbox/kn-plugin-func/blob/main/function_migrations.go> and the unit tests <https://github.com/knative-sandbox/kn-plugin-func/blob/main/function_migrations_unit_test.go>

### Shout-outs of the week

This week I wanted to give a shout-out to [Christian Posta](https://twitter.com/christianposta) and [Chris Love](https://twitter.com/chrislovecnm) for writing these two amazing books. I still remember that evening on the beach in Barcelona, after Kubecon EU 2019 where these two books were being discussed. If you haven't read these books you should, I highly recommend these two books if you are working with Kubernetes and want to expand your understanding of how things work under the covers. I've already read them in digital form but having the printed versions is really cool because I can use them as references whenever I need them.

- [Istio in Action](https://www.manning.com/books/istio-in-action?query=istio%20in%20action)
- [Core Kubernetes](https://www.manning.com/books/core-kubernetes?query=core%20kubernetes)

[![Istio core kube books](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/istio-core-kube-books.png)](/content/images/2022/07/istio-core-kube-books.png)

### Update on Continuous Delivery for Kubernetes

The content is shaping up, I am currently rewriting [Chapter 3 (Pipelines) and 5 (Release Strategies)](http://mng.bz/jjKP) to make sure that it aligns with the new application structure and features. Matheus is working on adding back observability (Prometheus and Grafana dashboards) and Loki for logging aggregation. I wanted to make sure that I push these topics left in the process so we can see how all the other tools work by aggregating metrics. The new frontend is looking awesome as Esala made the entire app reactive, so it now works on phone screens too. All these small changes and the upgrade of the services to Spring Boot 2.7 + Spring Native with the builds (for arm64 and amd64 platforms) on GitHub actions make the entire process of projects into the mix pretty straightforward.

[![Book](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/07/book.png)](http://mng.bz/jjKP)

With all these changes I've updated the tutorials that you can find here: <https://github.com/salaboy/from-monolith-to-k8s> (if you can give the repo a star will also help)

- [Installing the Conference Platform application using Helm](https://github.com/salaboy/from-monolith-to-k8s/tree/main/helm)
- [Installing the Conference Application in KinD](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kind)
- [Using Tekton to build Service Pipelines](https://github.com/salaboy/from-monolith-to-k8s/tree/main/tekton)
- [Using ArgoCD for GitOps and Environment Pipelines](https://github.com/salaboy/from-monolith-to-k8s/tree/main/argocd)

If you are interested in beta testing these examples please get in touch as feedback is highly appreciated.

I've recently added two sections ("[Go vs Java in the context of Kubernetes](https://github.com/salaboy/from-monolith-to-k8s/tree/main/javavsgo)" and "[Kubernetes Controllers](https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers)")  that might become an appendix for the book, as most of the projects that I am showing in the book are Kubernetes extensions, having an appendix about how to extend Kubernetes and the options available in 2022 seems worth the effort. The comparison between Go and Java might not make it into the book, but I also think is worth comparing different ecosystems and trying to get the best of both worlds, always in the context of CD and Kubernetes.

That's all for now, see you all next week!
