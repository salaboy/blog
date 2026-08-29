---
title: "Knative OSS Diaries - week #21"
date: 2021-11-27 08:38:22 +0000
permalink: /2021/11/27/knative-oss-diaries-week-21/
description: "Another week in the Knative Community and there is some interesting work going on in the func space."
tags:
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloudevents"
  - "community"
  - "crossplane"
  - "docker"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "tekton"
  - "cloud native"
  - "knative"
original_url: https://www.salaboy.com/2021/11/27/knative-oss-diaries-week-21/
---

Another week in the [Knative Community](http://knative.dev) and there is some interesting work going on in the `func` space. As I mentioned last week, there is a current initiative to integrate Tekton with the Knative `func` CLI would provide some interesting features such as the possibility of writing functions locally that are built and deployed remotely without the need of having Docker installed on your laptop.

We have now identified a set of changes and improvements that we need to implement into the CLI to make work better in the context of a Tekton Pipeline. The more I think about it the more I like the idea of having two [Tekton Tasks](http://tekton.dev) one for `func build` and one for `func deploy` as I sketched here: <https://github.com/salaboy/func-oncluster-build-experiments/tree/main/catalog/task> I will be creating a PR to the Tekton Catalog as soon as we make a more robust `func` CLI to support these scenarios.

### `func build`

For `func build` the main change that we need to implement is to be able to build + push the resulting container image to a docker registry. `func build` right now doesn't have any way to push after the build is done. I am in favour of adding a new argument  `func build --push` to enable this functionality without changing the default CLI behaviour. It will push only if this flag is present or an alternative property is set in the `func.yaml` file.

Another potential issue here is how the `func` CLI interacts with the `func.yaml` file. When running, at the end of the build the CLI writes the container image SHA to the func.yaml so then func deploy knows which container image SHA needs to deploy. While this is ok for a local environment where we run func build + func deploy in the same context, for a Pipeline, this is not optimal. To understand why let's talk a bit about `func deploy`.

### `func deploy`

For `func deploy` it makes a lot more sense to be able to take a container image SHA as the input and then just execute the deploy operation into a cluster. Doing a `func deploy` without having the source code make a lot of sense for these remote scenarios, hence it is worth exploring the possibility to add an argument to `func deploy --image` which takes an already built container image and removes the need of having a `func.yaml` file

So far these two small changes will improve how `func` integrates into a remote pipeline scenario, enabling not only [Tekton](http://tekton.dev), but other tools that want to use `func` in similar scenarios.

### Tekton + `func` integration

While the experiments that I made uses a YAML file definition for the Tekton pipeline it makes some sense to programmatically create the pipeline from inside the `func` CLI. Hence Zbynek from Red Hat is going to do some experiments around that to see if we arrive at a good solution. I am worried that by adding a dependency to the Tekton APIs we might end up having too many dependencies and making the CLI bloated. My main doubt is around other tools integrations. If we add the Tekton API dependencies we are building only for Tekton.

### `func` and Knative in KCD Guatemala

Today, Gabriel Freites and I will be presenting at KCD Guatemala, we will be talking about "Abstractions on top of Abstractions" and how the Kubernetes Ecosystem is building on top of several layers of abstractions to simplify everyday tasks, very specific scenarios and how some of these tools can help us to go faster. We will be talking about [Tekton](http://tekton.dev), [Buildpacks](http://buildpacks.io), [Knative Func](http://github.com/knative-sandbox/kn-plugin-func), [Knative Serving](http://knative.dev) and [Crossplane](http://crossplane.io).

[![11 banner twitter profesionales](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/11-banner-twitter-profesionales.jpg)](/content/images/2021/11/11-banner-twitter-profesionales.jpg)

Finally, I have the feeling that next week is going to be a very good week for these projects. Stay tuned for more news!
