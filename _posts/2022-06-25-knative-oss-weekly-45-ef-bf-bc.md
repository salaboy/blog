---
title: "Knative OSS Weekly #45￼"
date: 2022-06-25 12:01:29 +0000
permalink: /2022/06/25/knative-oss-weekly-45-ef-bf-bc/
description: "First of all happy weekend everyone! 45 weeks in and things are getting exciting, this week on the Knative weekly I will be talking about Knative…"
tags:
  - "cloud"
  - "cloud native"
  - "community"
  - "English"
  - "func"
  - "go"
  - "Java"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "spring cloud"
  - "spring-native"
original_url: https://www.salaboy.com/2022/06/25/knative-oss-weekly-45-ef-bf-bc/
---

First of all happy weekend everyone! 45 weeks in and things are getting exciting, this week on the Knative weekly I will be talking about  Knative Functions and the work that I want to get done before 1.0.

Before I start, here are the two "***good-first-issues***" for the week, if you want to get involved:

- **Python template alignment:** <https://github.com/knative-sandbox/kn-plugin-func/issues/1077>
- **Spring Boot dependency updates:** <https://github.com/knative-sandbox/kn-plugin-func/issues/1061>

If you are a Python developer interested in functions and Kubernetes, please get in touch, we need your help! Writing a blog post or some simple examples for the Python community would be an awesome contribution that I am sure will lead to improving the Knative Functions experience overall.

A big shoutout to [Matheus Cruz](https://github.com/mcruzdev) for closing one of the issues from last week: <https://github.com/knative-sandbox/kn-plugin-func/issues/1062>

If you are interested in contributing and you have more Kubernetes and Knative experience you can look at both Serving and Eventing "***good-first-issues***" list:

- Knative Serving: <https://github.com/knative/serving/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>
- Knative Eventing: <https://github.com/knative/eventing/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>

### Knative Functions, my personal journey to 1.0

I am currently working on two different but related issues, one that needs to be done before 1.0 and the other one that in my opinion is a must for real-life use cases (not hello-world demos).

The first issue titled: [Refactoring `func.yaml` file to follow a CRD format](https://github.com/knative-sandbox/kn-plugin-func/issues/817)

Besides the title that might be misleading, the main objective of this issue after loads of discussions is to make sure that the `func.yaml` file has a more structured shape, clearly separating `build` configuration parameters from the function's `runtime` parameters. While this sounds like a trivial change it is not, as it does touch the entire CLI code.

This is a critical issue to get for 1.0 as the format will change. Worry not, as part of 1.0 I am expecting to also get an automated translation from the old format to the new one.

***Have you been using Knative Functions? Is there any other major breaking change that you would like to see before 1.0? If so get in touch!***

The second issue title: [Exporting Knative Service when requested in the CLI using --dry-run](https://github.com/knative-sandbox/kn-plugin-func/issues/1060)

This second issue aligns pretty well with On-Cluster builds which is another big chunk of work that needs to be polished for 1.0, where we want to make sure that we can dry-run the Tekton Pipelines that are generated for each function.

The main objective behind this second issue is to support GitOps scenarios where we want to dump the Knative Service that gets deployed to the cluster when we run `func deploy` instead of doing a deployment. This will allow automated pipelines to generate the YAML for tools like ArgoCD/FluxCD to apply to the cluster, instead of relying on the `func` CLI.

Along these two issues and On-Cluster builds related work, I would love to see a proposal that is currently being discussed restructuring the docs to explain Knative for newcomers using the "functions" approach. It is my personal opinion that using functions as the main entry point to explain the overall project functionality is the way to go, as I keep meeting people that have old preconceptions about what Knative is and what it's not.

One more thing that I would love to see is some Github action examples to work with functions. On-Cluster builds are great for platform builders, but for day-to-day developers, we should support some official Github actions to at least build and publish the function artifacts. Are you interested in helping out with these Github Actions? Check this issue for the ongoing conversation: <https://github.com/knative-sandbox/kn-plugin-func/issues/982>

See you all next week!
