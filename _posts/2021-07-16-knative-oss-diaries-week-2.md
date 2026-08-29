---
title: "Knative OSS diaries - week #2"
date: 2021-07-16 17:06:45 +0000
permalink: /2021/07/16/knative-oss-diaries-week-2/
description: "Second week is over and it was pretty fun as the first. This week I focused on learning more about Sonobuoy and how the current Conformance Tests are…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2021/07/16/knative-oss-diaries-week-2/
---

Second week is over and it was pretty fun as the first. This week I focused on learning more about [Sonobuoy](https://sonobuoy.io) and how the current Conformance Tests are implemented inside Knative Serving.

The purpose of these tests is to make sure that the Knative Serving implementation is following the Spec defined here: <https://knative.dev/docs/reference/api/serving-api/>

As part of this exploratory task I've created a new repo that contains a Sonobouy plugins that execute the conformance tests defined here: <https://github.com/knative/serving/tree/main/test/conformance> against a Knative installation. This is now happening inCluster, meaning that Knative Serving needs to be installed inside the same Cluster where Sonobuoy is installed, but I will be looking into ways of testing a remote cluster by configuring the right permissions.

I also need to investigate more Sonobuoy and how to report back status, the current implementation run each conformance test individually and report progress to Sonobuoy sidecar, but still that progress doesn't show on `sonobuoy status`.

If you want to run these tests against your cluster you can install Sonobuoy and Knative Serving and follow the instructions here:

<https://github.com/salaboy/sonobouy-knative-serving>

I am really interested into doing a PoC with the `reconciler-test` framework that Knative Eventing is using, but I do find value at trying to run the existing conformance tests as they are to understand how the pieces connect and the requirements to execute these tests.

I find it always funny how by trying new projects and doing experiments you can find bugs or opportunities to clean up code. This was the case for my first PR: <https://github.com/knative/pkg/pull/2191>  which just removes a check for how these tests can be executed. By removing this check, Conformance Tests can now be run from inside a Kubernetes Cluster, meaning that the tests will be able to obtain the appropriate credentials from the environment instead of `KUBECONFIG`.

If you are interested in helping out or get involved with the project, next week I will be working on creating some Tekton pipelines to automate the creation of the Docker image that Sonobuoy is running, which contains the conformance test source code. Feel free to reach out via Twitter (DMs Open) or Slack if you want to get involved.
