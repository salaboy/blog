---
title: "Knative OSS diaries – week #4"
date: 2021-07-30 17:12:19 +0000
permalink: /2021/07/30/knative-oss-diaries-week-4/
description: "Ok, finishing my first month working for the Knative Project full-time and it has been already quite a ride."
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "kubernetes"
  - "microservices"
  - "cloudnative"
  - "knative"
  - "open source"
  - "oss"
original_url: https://www.salaboy.com/2021/07/30/knative-oss-diaries-week-4/
---

Ok, finishing my first month working for the Knative Project full-time and it has been already quite a ride. I've learnt a lot about the project already and I feel that I am starting to be more aware of all the initiatives that are going on in the community. So far the most important link that I've found is this one: <https://github.com/knative/community/issues/696> If you are using Knative and you can share your details there that will be awesome!

Expanding from my last week post: </2021/07/23/knative-oss-diaries-week-3/> I've been looking at CloudRun, and I feel that I am making progress but it hasn't been as productive as I expected when I started at the beginning of the week. I am still doing onboarding tasks, and trying to catch up with different Working Groups, so I am happy with the learnings acquired during this last week.

To go back to conformance, an extra diasctintion that I need to make about the ways that we can run the tests, against Cloud Run specifically include two different options:

- [Google CloudRun fully managed (Kubernetes is hidden here)](https://cloud.google.com/run)
- [Google CloudRun for Anthos (GKE + Knative)](https://cloud.google.com/anthos/run)

For running conformance tests against these two CloudRun versions we will need to setup the tests in different ways and I am still trying to figure out the requirements both at the test level and on the CloudRun configurations.

For all these tests it is really important to know that the Env Variable called `KO_DOCKER_REPO` will define where the Docker Images used by the tests are hosted. I do have all these images hosted in docker hub under my user `salaboy` built from the main branch of the Knative Serving project.

I've also started experimenting with `gotestsum` a framework that is in charge of formatting the output of go tests. Weirdly enough the XML JUnit format is quite popular, so other tools can parse and process these outputs. Luckily enough it is one of the [Sonobuoy](http://sonobuoy.io) supported formats, so that was a big win!

### Running Tests against CloudRun Fully Managed

In order to interact with a managed service, I am expecting to configure a public domain hence I've been investigating the `-resolvabledomain` flag. If this flag is set to true, the tests will use the domain set on the Route of the Service to check if the services are up and reachable. If this flag is set to false, it will try to resolve the URL for the service by looking at the Ingress Gateway (which by default is [Istio](https://istio.io)). You can override the IngressGateway by setting the following Env Vars: `GATEWAY_OVERRIDE` and `GATEWAY_NAMESPACE_OVERRIDE` . Hence CloudRun is fully-managed I believe that I will need to [buy and setup a domain](https://cloud.google.com/run/docs/mapping-custom-domains) to get this working. This worries me a bit from the automation point of view, as it require extra steps inside Google Cloud that are not easy to automate (**#prerequisite**).

Conformance tests do create Knative Services, Routes, Configurations and other Knative resources, hence the tests need to be able to talk with the CloudRun APIs. To achieve this from your local environment you need to set up a couple of ENV Vars. First, you need to have a special `.kube/config` that is used to connect to CloudRun endpoints. The content of this `config` file should look like:

```
apiVersion: v1
clusters:
- cluster:
    server: https://us-central1-run.googleapis.com
  name: hosted
contexts:
- context:
    cluster: hosted
    user: hosteduser
  name: hostedcontext
current-context: hostedcontext
kind: Config
preferences: {}
users:
- name: hosteduser
  user:
    auth-provider:
      config: null
      name: gcp
```

Then the tests need an ENV Variable called `KUBE_CONFIG_OVERRIDE` pointing to that file.

In order to be able to interact with these APIs you will also need a Service Account, that you can create inside Google Cloud by following this steps: <https://cloud.google.com/docs/authentication/production#auth-cloud-implicit-go>

After creating the ServiceAccount you will be able to download the key in a JSON format. Once you have that JSON file locally you need to export the following variable:

export **GOOGLE_APPLICATION_CREDENTIALS**="`KEY_PATH`"

Then you can run tests with:

go test -v -tags=e2e -count=1 ./test/conformance/runtime  -resolvabledomain=true -run ^TestMustHaveCgroupConfigured$

I am still trying to figure out how CloudRun deals with namespaces. I can see CloudRun creating the service in the `serving-tests` namespace, but I am not 100% sure how is that working as if I use `-test-namespace` flag with a different value it fails to create the namespace.

### Running Tests against CloudRun for Anthos

For running tests against CloudRun for Anthos, you need to generate a `.kube/config` from the Kubernetes Cluster in GCP which has CloudRun installed.

[![Enabling CloudRun in GKE](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/07/cloudrun-gke-anthos.png)](/content/images/2021/07/cloudrun-gke-anthos.png)

*Enabling CloudRun in GKE*

I've created a script to create a service account and the `.kube/config` that you can find here: <https://github.com/salaboy/sonobouy-knative-serving/blob/main/create-config.sh>

If you are using Sonobuoy you need to create a secret with the config encoded using base64 so Sonobuoy can mount it and use it to connect to the remote cluster.

If you are running the tests from your local environment, the tests will fail because again the Knative Service doesn't have the public IP to reach the instance. I will be working on trying to figure out how to mitigate this.

These configuration of CloudRun in Anthos seems to be using Istio, but I still need to check out the details.

### Sum Up

Unfortunately, I didn't manage to make the tests pass against CloudRun or CloudRun on Anthos, but I feel that I am much closer to understand all the moving pieces in different setups and when I manage to make them work I feel that automating the process shouldn't be hard, as it will be just changing configurations depending on the environment. As you seen in this blog post, most parameters that can be configured for running the tests are covered and I have the feeling that we might need to extend some of these configurations to support more advanced setups by Cloud Providers.

As always, if you are interested in these topics and want to join forces to gain experience with the project or to submit your first contributions, get in touch!

Special thanks to [@yanweiguo](https://knative.slack.com/team/U949PSE12) and [@dprotaso](https://knative.slack.com/team/U9T98N1D0) from the Knative community for the help and guidance.
