---
title: "Knative OSS diaries – week #10"
date: 2021-09-18 13:20:03 +0000
permalink: /2021/09/18/knative-oss-diaries-week-10/
description: "Week 10 already!! This last week was a bit different because I was preparing my KubeCon NA 2021 presentation recording as it looks like I am not going to…"
tags:
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "docker"
  - "English"
  - "event"
  - "Jenkins X"
  - "microservices"
  - "open source"
  - "oss"
  - "Trips"
  - "community"
  - "crossplane"
  - "eventing"
  - "knative"
  - "kubecon"
  - "roadmap"
  - "serving"
original_url: https://www.salaboy.com/2021/09/18/knative-oss-diaries-week-10/
---

Week 10 already!! This last week was a bit different because I was preparing my [KubeCon NA 2021](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/program/schedule/) presentation recording as it looks like I am not going to be able to make it to Los Angeles since the travel ban is still around. I am not cancelling my reservations until the last day of September 🤞!

My session titled: **["Tools I wish existed 3 years ago to build a SaaS Platform"](https://sched.co/lV3A)** includes [Knative](http://knative.dev), [Helm](http://helm.sh), [Tekton](http://tekton.dev) and [Crossplane](http://crossplane.io), so I've been working on a bunch of examples that combine all these projects together to build a SaaS platform. You can find this example in the following repository: <http://github.com/salaboy/from-monolith-to-k8s>

On the [Knative](http://knative.dev) project side, I can see that there is a strong community push to go 1.0/GA and for that to happen a lot of coordination and a lot of people closing things need to happen. This next week is going to be interesting to see how the work is organized about documentation, conformance and to define what blockers can stop a possible GA version to go out.

There is a very important public resource that is being used to track the progress for this important milestone which you can see here:

<https://docs.google.com/spreadsheets/d/1dH4c3_2bZUQn6nz09Hmn5VLcVNUV1ZocCEAN76jYjas/edit#gid=0>

I will be actively working to close some of these pending issues starting early next week and I will keep pushing to implement conformance suites for Serving and Eventing. Pull requests to exercise the Serving APIs will keep flowing, like for example this one: <https://github.com/knative/serving/pull/12016> as the more coverage we have on the API side the easier would be to test conformance of different Knative implementations. My hope is that community can split conformance and the GA release into separate concerns, so we can have a GA release that we can keep improving iteratively with future releases. With a GA release out of the door we can build a conformance suite that targets that specific release as well as any subsequent release afterwards.

Do you wanna help to make this happen? Get in touch! ([@salaboy](http://twitter.com/salaboy) on Twitter or drop me a comment here in my blog)

There are some very exciting news in the making, so stay tuned!
