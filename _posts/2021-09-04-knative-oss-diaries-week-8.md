---
title: "Knative OSS diaries – week #8"
date: 2021-09-04 08:35:23 +0000
permalink: /2021/09/04/knative-oss-diaries-week-8/
description: "Interesting week, the more I get to know the members of the Knative community, the more I enjoy being part of the project 24/7."
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "CD"
  - "knative"
  - "oss"
original_url: https://www.salaboy.com/2021/09/04/knative-oss-diaries-week-8/
---

Interesting week, the more I get to know the members of the Knative community, the more I enjoy being part of the project 24/7. It took less than a week for the issue that I've reported about conformance to be solved: <https://github.com/knative/eventing/issues/5663> and that clearly shows how serious is this community about reaching 1.0 for both Eventing and Serving.

On my side, I've opened a PR with an initial example structuring how a **Test Conformance Plan for Eventing** should look like for Eventing, so then we can automate these plans: <https://github.com/knative/specs/pull/58>, right after this PR another awesome community member (<https://github.com/lionelvillard> from IBM) opened a follow-up with another example covering some tests around **Content-based Routing** (<https://github.com/knative/specs/pull/56>) probing that if we have a shared structure to define test, we can work our way through the spec in parallel. If you are interested in helping out and learn about Knative reach out, the specs are big and the more eyes we have reviewing and testing these plans the better.

These last two days, I've switch back to review how conformance is being tested in Knative Serving (<https://github.com/knative/serving/tree/main/test/conformance>) which I think it should be close to how Kubernetes Resources are tested, but there are some fairly complicated tests on the Data Plane as well. Currently the Spec and the tests are divided into two main sections:

- **API**: (<https://github.com/knative/specs/blob/main/specs/serving/knative-api-specification-1.0.md#service-1>) which is tested here: <https://github.com/knative/serving/tree/main/test/conformance/api/v1>
- **Runtime Contracts**: (<https://github.com/knative/specs/blob/main/specs/serving/runtime-contract.md>) which are tested here: <https://github.com/knative/serving/tree/main/test/conformance/runtime>

As I've mentioned in some of my previous posts, these tests were designed to be run in different setups and it is a key requirement to be able to test Managed Services (such as [Cloud Run](https://cloud.google.com/run?utm_source=google&utm_medium=cpc&utm_campaign=emea-gb-all-en-dr-bkws-all-all-trial-e-gcp-1010042&utm_content=text-ad-none-any-DEV_c-CRE_539593768294-ADGP_Hybrid+%7C+BKWS+-+EXA+%7C+Txt+~+Compute+~+Cloud+Run%2320-KWID_43700065755204103-kwd-838047913651-userloc_9045943&utm_term=KW_google%20cloud%20cloud%20run-NET_g-PLAC_&gclid=Cj0KCQjwssyJBhDXARIsAK98ITSCVfr7g-qJGPs3T9FSM4_Ryqx9_WFk3BX032yVBmeDo5LMv1oK7ikaAjyJEALw_wcB&gclsrc=aw.ds), which is basically Knative as a Service managed by Google) for conformance hence how conformance is defined will include systems that are Knative implementations but might be be backed by Kubernetes. This is something that at the beginning sounded really odd, but now I can see the amount of effort being placed in the specs to also enable those scenarios.

Next week, I will focus on writing some tests around the API conformance side and report back around coverage of the spec, to see if I find more missing bits that are not covered and also to learn more about the internals.

I will be also speaking at the Islamabad CNCF group <https://community.cncf.io/events/details/cncf-islamabad-presents-closer-to-continuous-delivery-with-knative/> about why I think that Knative bring us closer to implement continuous delivery. I will be asking and trying to hard questions about how people uses Kubernetes today to deliver applications and how Knative can make your life easier.

See you all next week!
