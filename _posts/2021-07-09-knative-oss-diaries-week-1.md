---
title: "Knative OSS diaries - week #1"
date: 2021-07-09 18:21:07 +0000
permalink: /2021/07/09/knative-oss-diaries-week-1/
description: "Wow, It has been a while since I don't write something interesting here and what better to get started again with the habit than sharing how exciting was…"
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "eventing"
  - "knative"
  - "oss"
  - "serving"
original_url: https://www.salaboy.com/2021/07/09/knative-oss-diaries-week-1/
---

Wow, It has been a while since I don't write something interesting here and what better to get started again with the habit than sharing how exciting was my first week as part of the Knative OSS community project.

First of all, I was blown away with the response in Twitter:

[![Screenshot 2021 07 09 at 18.21.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/07/screenshot-2021-07-09-at-18.21.59.png)](/content/images/2021/07/screenshot-2021-07-09-at-18.21.59.png)

This speaks highly of the quality and passion in the Knative community.

To get me started with the project, and just for my own curiosity I started looking into the GitHub issues for both Knative Serving and Eventing and I found this issue:  <https://github.com/knative/serving/issues/8949> which got my attention because I always wondered how Knative deal with sidecars, but my gut feeling told me that the issue itself wasn't easy to solve.

By looking at the code in Knative Serving, there are two aspects that I needed to understand to get more comfortable with the structure of the project and the issue itself.

First, the tests checking Revisions, which are in charge of containing the containers data/specification. This is tested in the `deploy_test.go` file <https://github.com/knative/serving/pull/11634/files#diff-d93eacd83502ff2061608160378ff8c5c8b199fed97cd44e2b1ab73f419b9aab>  which checks that both, liveness and readiness probes are maintained for sidecar containers. By looking at the test and the internals of how the Revisions are built, you can clearly see that the main container, the "serving container", which is the one that is going to serve traffic rewrites the readiness probe to be forwarded to the Queue/Proxy container that Knative uses to manage the lifecycle of the containers in a Revision. This is done to have finer control on the probes (under second (0.25) checks for fast startups, really important for functions).

The second half that I needed to understand are validation admission web hooks that are something that I knew from Kubernetes, but I had no idea on how Knative was checking Knative specific CRDs. There was a rule checking and rejecting sidecars which defined liveness and readiness probes. Luckily, that is easy to disable or change: <https://github.com/knative/serving/pull/11634/files#diff-874e991d6178734f4fec8bb5d3823e1e1582d313e761c21c390a78c2aa91477c> . All the validation admission web hooks  can be found here: <https://github.com/knative/serving/blob/f0625f8ac176d5ded5206cde11808956c08c43b5/pkg/apis/serving/k8s_validation.go#L362>

I've created a simple [PR suggesting](https://github.com/knative/serving/pull/11634/files) to remove the validation and make sure that the probes are added to the side containers, but after getting feedback from the team, it makes a lot of sense of not to do that. Having split readiness probes from the `kubelet` and the queue proxy is not optimal. Hence it makes a lot of sense to keep researching, and understanding how the readiness probes are executed to make sure that the entire revision is consistent.

From looking into Revisions in Knative Services I jumped to a completely different topic which is conformance tests.

With Knative pushing really hard to get into 1.0 GA, conformance tests are needed to validate different implementations by different vendors and Cloud Providers such as CloudRun.

There are several projects related to conformance testing and having Kubernetes which is released and "certified" in every Cloud Provider for every minor release. Knative should follow a similar approach, but besides the particularities of how it gets implemented I've started looking at the following projects:

- Sonobuoy (<https://sonobuoy.io>) a project that simplify the task of running conformance tests against Kubernetes Clusters. By default, you can easily run the official Kubernetes E2E tests and extend them. This blog is awesome explaining how the Kubernetes e2e tests can be filtered for checking different conformance types: <https://sonobuoy.io/understanding-e2e-tests/>
- The [`reconciler-test` framework](http://- https://github.com/knative-sandbox/reconciler-test/) which defines a library for creating conformance tests by defining Alpha, Beta features as well as MUST, SHOULD, MAYBE checks for assertions.
- The E2E Kubernetes upstream framework: <https://github.com/kubernetes-sigs/e2e-framework> which is very aligned with the `reconciler-test` framework. So I will need to spend more time investigating more in detail how this tests are working for Kubernetes and how these tests can be extended for writing Knative conformance tests.

It was an intense week, but I feel that next week will be interested as I keep researching more these projects and how we can implement conformance scenarios to push Knative 1.0 GA out of the door.

If you want to get involved or help please get in touch or join the [Knative Slack channels](https://knative.dev/community/).
