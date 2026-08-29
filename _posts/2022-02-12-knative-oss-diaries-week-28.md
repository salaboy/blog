---
title: "Knative OSS Diaries - week #28"
date: 2022-02-12 09:54:14 +0000
permalink: /2022/02/12/knative-oss-diaries-week-28/
description: "A trippy week with some fever and a positive COVID Test, I thought that I wouldn't be able to have fun, but since there are always going on in the Knative…"
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "func"
  - "go"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "eventing"
  - "knative"
  - "update"
original_url: https://www.salaboy.com/2022/02/12/knative-oss-diaries-week-28/
---

A trippy week with some fever and a positive COVID Test, I thought that I wouldn't be able to have fun, but since there are always going on in the Knative Community I decided to write a short update this week full of news and fun!

### KnativeCon What?!!!????!??!??!🤯🤯

🤯🤯🤯🤯 Yeah, this is happening! [KubeCon Day 0 co-located event (17th May 2022, Valencia, Spain)](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/) and CFPs are open! Are you using Knative? Are you building a Platform with Knative in it? Do you have a cool demo to show? This is your chance to share with the entire community and meet some of the founders and contributors in person!

Here is the CFPs URL with some more details about the event: <https://linuxfoundation.smapply.io/prog/knativecon_europe_2022/>

Hurry up because the ***CFPs close on the 11th of March***. If you are insecure or if you want help writing a proposal feel free to reach out I am happy to review/comment and help you to submit one.

I am really looking forward to seeing you all there!

### Knative Eventing

> A quick update on the [Continuous Delivery for Kubernetes book](http://mng.bz/jjKP), the draft of the chapter that covers Knative Eventing was just released under the [MEAP program](http://mng.bz/jjKP). If you want to check it out remember that you can have 35% off by using the code: **au35sal** . Also, I think is good to remember that you can get the [Knative In Action book for free](https://tanzu.vmware.com/content/ebooks/knative-in-action) (in exchange for your email) from the VMware site here.

We had a very interesting Knative Eventing Workflow catch up this week, there were a lot of old friends from Red Hat, and the projects that I've worked on in the past. Sebastien from TriggerMesh was also there and I do believe that interesting things are forming around the Knative community and finally workflows are going to materialize in 2022. I am looking forward to seeing how we can define the right boundaries and components that can serve to build workflow solutions on top of Knative. The more I think about workflows and Knative, I think about building blocks like Serving and Eventing, that can be used independently to build different capabilities needed for a Workflow solution.

Here is just a brain dump that reflects my current understanding of the problem space with some links to some PoCs that I've been working on. There are the high-level capabilities that I think that we can separate into different building blocks:

- **State**: basically associating  events to a labels/state names, I will rephrase my [Knative State proposal](https://docs.google.com/document/d/1W9F6HUoqAQ7PVIYjBR4DRdbiD8YzwX7pXl4YM_qlMhk/edit?usp=sharing) to just cover this and show which kind of use cases you can accomplish with just keeping track of state. This should allow people to say things like: “When an event with the type X arrives, we are in this state”. A more advanced feature can be something like: “When I am moving into State X I will emit this Event, and when I am moving out of State X I will emit this other event”. These state names will be associated to just an ID which is used to correlate events that wants to be grouped together. (StateMachineId) in my proposal
- **Context**:  this is the contextual data part of the problem, most of the time you need to move data around with your state changes or to keep the incoming data from the events involved. As mentioned yesterday, usually this data leaves outside, for ML in S3 buckets or similar. The context module should enable users to keep track of contextual data associated to a context Id, that can be linked with state if needed, but not necessarily
- **Reminders/Timers**: time always plays a role in workflow solutions, but most of the time, these are higher level timer services that are very use case driven. These timers can trigger batch jobs or just send emails to remind something to a user. This module should be a CloudEvent based reminder service with a simple API. [PoC](https://github.com/salaboy/fmtok8s-reminders)
- **Versioning/Revisions:** a big big issues with workflow implementations is how they deal with versioning progressive changes in their models, hence this feels to me, needs to be solved from start when evaluating building capabilities for workflows at the knative level.
- **(Workflow) Definitions Language transformers:** I strongly believe that we can build all previous modules without using a pre-defined definition language. Hence we will need transformers that based on a language create resources for the previous modules.
- **Async + Retry + Guarantee Delivery:** We don’t want to only support sync interactions, hence we need to solve async communications with some kind of callbacks. In general, I would remove this feature from here, as this is a generic mechanism that can be used for any other use case.

Lionel's from IBM created a [proposal to expand Parallels and Sequences with Composables](https://hackmd.io/Tz3aNec4Tr2xRir5M2z-OA), which I find really interesting, as this builds right on top of existing Knative Eventing constructs that are in some way limited and require more features to expand into the workflow capabilities. I really like this exploration approach that the community is taking, as finding the right level of features/capabilities to be added to Knative is key to making sure that we don't end up creating an entire workflow solution.

### Knative Func, Spring Cloud Functions and Spring Native

I didn't manage to make too much progress on the Knative `func` OnCluster builds with Tekton issue to support the [--git parameter](https://github.com/knative-sandbox/kn-plugin-func/issues/765), but there are interesting things going on and most of my week I spent working around some issues on [Spring Cloud Functions](https://spring.io/projects/spring-cloud-function) and [Spring Native](https://docs.spring.io/spring-native/docs/0.11.2/reference/htmlsingle/).

The use case is simple, but to get things working there were two main blockers

- How CloudEvents headers in the http binding were parsed, these headers are also used for dynamic (expression based) routing. [Issue](https://github.com/spring-cloud/spring-cloud-function/issues/804)
- How functions are registered and how from CloudEvents properties Spring Cloud Functions can automatically route events to a function signature doing type marshalling, so we don't need to worry about parsing the body of the message. [Issue](https://github.com/spring-cloud/spring-cloud-function/issues/806)

Now everything is working in SNAPSHOTS (`3.2.2-SNAPSHOT`) thanks to Oleg's speedy investigations and I am hoping these fixes will make it to the next release of Spring Cloud Functions, so I can update the [`Spring Boot func` templates.](https://github.com/knative-sandbox/kn-plugin-func/tree/main/templates/springboot)

The end result that I was aiming for is to make sure that we can produce CloudEvents from a different language (using a different CloudEvent SDK) and that Spring Cloud Functions, that is not using the CloudEvent Java SDK would consume and produce events using the binary format. Mission accomplished!!! , more on the example that I am working on probably next week.

Before I go, let me repeat this again KnativeCon is coming! Don't forget to submit your CFPs soon!

Here is the CFPs URL with some more details about the event: <https://linuxfoundation.smapply.io/prog/knativecon_europe_2022/>

Hurry up because the ***CFPs close on the 11th of March***.
