---
title: "Knative OSS Diaries – week #16"
date: 2021-10-23 08:43:41 +0000
permalink: /2021/10/23/knative-oss-diaries-week-16/
description: "One week closer to the @KnativeProject 1.0 Release so naturally, I've spent some of my week trying to understand how the release process should go."
tags:
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloudevents"
  - "crossplane"
  - "docker"
  - "English"
  - "eventing"
  - "func"
  - "kubernetes"
  - "serving"
  - "tekton"
  - "cloud native"
  - "community"
  - "go"
  - "knative"
  - "microservices"
  - "open source"
  - "oss"
  - "release"
  - "weekly"
original_url: https://www.salaboy.com/2021/10/23/knative-oss-diaries-week-16/
---

One week closer to the @KnativeProject 1.0 Release so naturally, I've spent some of my week trying to understand how the release process should go. Funny enough, things are not as easy as you would expect, they never are and this tweet sums it up pretty well:

[![🤯](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/10/screenshot-2021-10-23-at-08.42.29.png)](https://twitter.com/dghubble/status/1450874707582996483)

*🤯*

As a newbie, trying to understand how the CI automation might work and looking at the [knative/release github repository](http://github.com/knative/release) I took some notes that might be useful for newbies like myself.

### Release Notes and modules dependency diagram

- Main Reference: [github.com/knative/release](http://github.com/knative/release)
- [Planning document](https://docs.google.com/document/d/1_khEw5_l8Zhh4FuY3NM56o_OM-cNWmmq1vXfLCxZqMA/edit) with different options to not confuse people and make Go happy.

- [Hack](http://github.com/knative/hack) and [PKG](http://github.com/knative/pkg) are core repos
  - Hack contains scripts for all the other repos to import
  - PKG contains a low level library that eventing and serving depends on

So the release needs to be cut (a branch needs to be created) in each of these repos so CI can produce the new version.

PKG depends on KubeClient and we have a release schedule to update these dependencies: <https://github.com/knative/community/blob/main/mechanics/RELEASE-SCHEDULE.md>

Usually [kubeclient](https://github.com/knative/pkg/blob/main/go.mod#L58) is compatible with previous and forward versions so it is not mandatory to update immediately.

Both “hack” and “pkg” doesn’t have versions per se, they use the git commit hash, so when a release branch is created, the version should be the hash of the HEAD in that branch.

[Bouy](https://github.com/knative/test-infra/tree/main/buoy) is a tools that was built by the Knative team to check dependencies[.](https://github.com/knative/test-infra/tree/main/buoy)

Go Mod version is not updated unless we are using a special feature of the language in the module, for example in pkg inside the [go.mod file you can find: go 1.14](https://github.com/knative/pkg/blob/main/go.mod#L3) , but in [Serving you see the following version: go 1.16](https://github.com/knative/serving/blob/main/go.mod#L3)

We are “***vendoring***” all dependencies. This means that we download all the code for the Deps in case that the repo disappear. It also means that we have all the source code of all the Deps in our repos. Inside the [vendor/](https://github.com/knative/serving/tree/main/vendor) dir. This avoid cases where dependencies are broken (on purpose or not) but it means that now simple repositories have a lot of source code. This also guarantees that we can go back to previous version of the libraries just with the repo history.

[![Knative Modules dependency graph](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/10/knative-release-process.jpg)](/content/images/2021/10/knative-release-process.jpg)

*Knative Modules dependency graph*

In the previous figure, Blue Boxes represent supporting repositories and libraries that implementations will use. red Boxes are core APIs. Most of the implementations are under Networking and Eventing, while Clients (Grey Box, other clients not included here) just consume the APIs. It is also interesting to see how the release process has been structured with a "code freeze" by creating a branch on the supporting repos one week before the release, so the CI system can produce and publish these core packages that will be consumed by almost every other module. I found it really interesting the fact that core libraries are not tagged with the release number and hashes are used to point to specific versions.

The Hack and PKG branches will be created this next **Tuesday 26th October,** so stay tuned for more news about the release.

### Func

On the bright side of things, I've started digging up [Func (ex boson-project)](https://github.com/knative-sandbox/kn-plugin-func) which is basically a Knative Client that uses [buildpacks](http://buildpacks.io) to provide a really nice user experience to build functions in some way hiding [Knative](http://knative.dev), Kubernetes and Containers. Whatever that makes the user experience better is worth investigating and a ***functions-as-a-service*** approach definitely goes in that direction.

[Func](https://github.com/knative-sandbox/kn-plugin-func) itself is a binary (also a [`kn` plugin](https://knative.dev/docs/client/install-kn/)) that will create Knative Resources for us but as I mention before it provides a whole experience around developing, building and deploying functions.

[Func](https://github.com/knative-sandbox/kn-plugin-func) requires you to have Knative installed in a Kubernetes Cluster for it to be able to deploy functions, as mentioned before `func` will create Knative Resources.

[Func](https://github.com/knative-sandbox/kn-plugin-func) provides 4 main commands:

- **Create**: create from a template a function, and you can choose from different stacks (go, java, python, etc)
- **Build**: build and publish all the resources needed to run this function. This uses [buildpacks](http://buildpacks.io) to the magic and it aims to remove the need for having a *Dockerfile* and a bunch of YAMLs to worry about. A super interesting feature in build is that if you have [Tekton](http://tekton.dev) installed in the cluster, you can have remote builds for your [buildpacks](http://buildpacks.io), instead of building them locally. I see this as a killer feature.
- **Run**: run allows you to run the function locally to test it and see how it behaves. This uses the local docker deamon to run a docker container locally. For development purposes this is pretty useful.
- **Deploy**: deploys the published application to a Kubernetes Cluster with Knative installed.

You can get [func](https://github.com/knative-sandbox/kn-plugin-func) installed using homebrew:

brew tap knative-sandbox/kn-plugins  
brew install func

Stay tuned because a demo and some [PRs](https://github.com/knative-sandbox/kn-plugin-func/pull/601) are coming. There is a lot of activity around this project so feel free to take a look at their `issues` to get involved. As the project is a client library, the entry point is quite ok. Feel free to reach out if you want to pair up in solving some of them as well as I will be working on that.

Finally, there's still time to get the [**50% off out of my Continuous Delivery for Kubernetes**](http://mng.bz/jjKP) book using the code **mlsalatino2** at the checkout. A new chapter is about to go out to the [MEAP](http://mng.bz/jjKP) readers about [Crossplane.io](http://crossplane.io) soon.
