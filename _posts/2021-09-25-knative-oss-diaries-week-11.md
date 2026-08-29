---
title: "Knative OSS diaries – week #11"
date: 2021-09-25 08:37:06 +0000
permalink: /2021/09/25/knative-oss-diaries-week-11/
description: "Sad news first, I am not going to KubeCon NA in LA this year 😟, I had to cancel my flights and hotel reservation due the travel ban in the US."
tags:
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "go"
  - "Jenkins X"
  - "microservices"
  - "open source"
  - "book"
  - "cloudnative"
  - "knative"
  - "kubecon"
  - "kubernetes"
  - "release"
original_url: https://www.salaboy.com/2021/09/25/knative-oss-diaries-week-11/
---

Sad news first, I am not going to [KubeCon NA in LA](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/?utm_source=Google&utm_medium=Search&utm_campaign=KubeConNA2021&gclid=Cj0KCQjwpreJBhDvARIsAF1_BU3DLStCBn2D8cPWXRdC521YzPaeG_ZOsxbyt4E6HEgcqyGELr2tsi0aAnjQEALw_wcB) this year 😟, I had to cancel my flights and hotel reservation due the travel ban in the US. The good news is that the ban is going to be lifted by November 1st, it was sooooo close! I've already recorded my presentation, with all the demos and everything so I will be joining virtually once again, now I can sit and relax 🤓. I can't wait for [KubeCon 2022 in Spain](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/) 🤞.

On the bright side of the internet, my book was announced this week! An almost secret project that I've been working with Manning for a while now finally saw the light of day. My book titled [Continuous Delivery for Kubernetes](https://www.manning.com/books/continuous-delivery-for-kubernetes) aim to give readers an overview of several Open Source projects that can speed up your Continuous Delivery journey.

[![Continuous Delivery for Kubernetes](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/360/480/resize/book/9/cd1bcf2-72c4-45af-96de-33267d386bc1/salatino-meap-hi.jpg)](https://www.manning.com/books/continuous-delivery-for-kubernetes)

*Continuous Delivery for Kubernetes*

Because I wrote the book, all the projects are covered from a Developer/Architect perspective. If you are interested in joining the early access program to review and provide feedback this is the perfect time to do so. There is currently a 35% discount on all [Manning](https://www.manning.com/books/continuous-delivery-for-kubernetes) books that you get by just using this code: **au35sal** .

While the book and KubeCon have kept me busy, I am getting really excited about the progress that has been made in the [Knative](http://knative.dev) Community towards releasing a 1.0 / GA release. Software projects, traditionally put a lot of effort to demonstrate their users how mature their features are and how stable the software is. [Knative](http://knative.dev) is not an exception, Cloud Native projects evolve differently and judging them just by the version number or a label such as GA can be tricky and confusing. For Knative, reaching 1.0 means allowing users that were skeptical of how stable the project is just because the version number to adopt and rethink about using the project in their solutions. The meticulous community process to verify, document and test the software for a GA release is quite interesting to see. If you are using Knative already, please reach out as the more data that we can gather about which components are being used and valued by community members the easier it gets to make a clear definition of the maturity state of the components included in version 1.0 GA.

The [Knative](http://knative.dev) project is in a very good position, with a large and stable set of features (both in Serving and Eventing), with large scale deployments in production such as [Cloud Run from Google](https://cloud.google.com/run) and with Software Providers such as [Red Hat](https://www.redhat.com/en/topics/microservices/what-is-knative) and [VMware](https://tanzu.vmware.com/content/ebooks/knative-fundamentals) building products on top of it as well as Open Source projects which makes heavy use of their features such as [Kyma](https://kyma-project.io). I am 100% sure that the Kubernetes community will welcome this 1.0 release.

See you all next week, stay tuned!
