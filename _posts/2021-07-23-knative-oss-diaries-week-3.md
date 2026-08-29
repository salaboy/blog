---
title: "Knative OSS diaries – week #3"
date: 2021-07-23 10:22:35 +0000
permalink: /2021/07/23/knative-oss-diaries-week-3/
description: "Kinda short and crazy week over here, loads of things going on and all related with Knative. I've recorded my DevOps World talk with Andrea Frittoli from…"
tags:
  - "cloud"
  - "cloud native"
  - "community"
  - "docker"
  - "English"
  - "kubernetes"
  - "microservices"
  - "knative"
  - "open source"
  - "oss"
original_url: https://www.salaboy.com/2021/07/23/knative-oss-diaries-week-3/
---

Kinda short and crazy week over here, loads of things going on and all related with Knative. I've recorded my [DevOps World](https://www.cloudbees.com/devops-world-2021/registration?utm_source=google&utm_medium=cpc&utm_campaign=DW21-GSN-EU&utm_content=&_bt=529287387250&_bk=devops%20world&_bm=p&_bn=g&gclid=Cj0KCQjw0emHBhC1ARIsAL1QGNey8btddpniCd7rq0_EchSR94XeMN20i9sz3Pn68wA71W5sS9ii-YUaAuQwEALw_wcB) talk with Andrea Frittoli from IBM using [Tekton](http://tekton.dev), [Knative](http://knative.dev) and [Keptn](http://keptn.sh) and I've just finished my 8th consecutive time participation in [JBCNConf](http://jbcnconf.com), here I've presented about [Crossplane](http://crossplane.io), [Tekton](http://tekton.dev), [Knative Serving/Eventing](http://knative.dev) and [Helm](http://helm.sh).

Besides participating and recording for conferences I've spent most of my week understanding more about how Sonobuoy runs tests and the existing **[Knative Serving Conformance](https://github.com/knative/serving/tree/main/test/conformance)** test suite.

It is now clear that there are different options to run these tests and we need to make sure that we keep supporting them. To summarise these different modes I can say that I am aiming to run these tests in the following ways:

- Locally against a [KIND Cluster](https://kind.sigs.k8s.io/docs/user/quick-start/)
- InCluster, for CI or when using [Sonobuoy](http://sonobuoy.io)
- InCluster against a remote cluster
- InCluster against a Managed Service such as [GCP CloudRun](https://cloud.google.com/run)

Each of these modes present different challenges and there are different configurations involved, so let's take a quick look at each of them. But first, the prerequisites for running these tests are:

- Having Knative Serving Installed in a Kubernetes Cluster
- Having the tests available to run using `go test`

### Locally against a KIND Cluster (or any other local cluster)

[![Local Tests against a Local Cluster§](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/07/screenshot-2021-07-23-at-08.56.33.png)](/content/images/2021/07/screenshot-2021-07-23-at-08.56.33.png)

*Local Tests against a Local Cluster§*

For running the tests against a local cluster, the test will use the KUBECONFIG environment variable to connect to the cluster where Knative Serving is installed. This is the most common way for developers to run the tests.

### In Cluster for CI or using Sonobuoy

[![Running tests from inside a Kubernetes Cluster](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/07/screenshot-2021-07-23-at-09.53.10.png)](/content/images/2021/07/screenshot-2021-07-23-at-09.53.10.png)

*Running tests from inside a Kubernetes Cluster*

When running the tests from inside a Kubernetes cluster the first thing that you will need is a Docker Container which contains the tests that you want to run. I've created a Docker Image with the tests ([Dockerfile](https://github.com/salaboy/sonobouy-knative-serving/blob/main/Dockerfile) & [image](https://hub.docker.com/repository/docker/salaboy/knative-serving-conformance) here).  You might want to containerise the tests to be able to run these tests as part of your Continuous Integration suite, for example to validate Pull Requests.

Notice that for running the tests here, the Credentials are being picked from the container itself if it has a valid ServiceAccount. Kubernetes will mount the credentials in the Pod. In this scenario, tests will work as soon as Knative is installed in the same cluster where the tests are running.

I've used Sonobuoy to run the tests in this fashion. I've created a [Sonobuoy plugin](https://github.com/salaboy/sonobouy-knative-serving/blob/main/sonobuoy-knative-serving.yaml) that allows you to run the Knative Serving Tests using this approach.

### InCluster against a remote Cluster

[![InCluster against a remote Kubernetes Cluster](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/07/screenshot-2021-07-23-at-09.06.49.png)](/content/images/2021/07/screenshot-2021-07-23-at-09.06.49.png)

*InCluster against a remote Kubernetes Cluster*

Unfortunately, the previous approach will not work if our Knative Serving installation is located in a remote cluster, not the same as where the tests are running. The main change here, is that we will need the credentials to interact with the remote cluster, hence we will need to do some extra configurations that will include:

- Install Knative Serving in a remote cluster
- Create a ServiceAccount,  Role and RoleBinding for defining access to these remote cluster
- Create a KUBECONFIG to be able to access the resources for the previously created ServiceAccount
- Mount this KUBECONFIG into the cluster where the tests will run

Unfortunately, to this day, Sonobuoy doesn't support adding Secrets to a plugin in a easy way when using `sonobuoy run`. I've created the set of Kubernetes manifest that `sonobuoy run` creates, which allows us to add other resources such as Secrets and configMaps. You can find the ["manual sonobuoy running manifests" here.](https://github.com/salaboy/sonobouy-knative-serving/blob/main/manual-plugin.yaml) With these resources, instead of running `sonobuoy run` we can just apply the resources using `kubectl apply -f`

Before applying these resources you will need to create the ServiceAccount, Role and RoleBinding in the target cluster and for this, I've create a [simple script that automates this process](https://github.com/salaboy/sonobouy-knative-serving/blob/main/create-config.sh), creates the KUBECONFIG token for the service account and finally prints the secret that you will need to include to the Sonobuoy manifests.

Note: For creating these Kubernetes manifest, I did some digging and I've found and [example here](https://github.com/vmware-tanzu/sonobuoy-plugins/tree/master/reliability-scanner/plugin) doing something similar.

[This article](https://docs.armory.io/docs/armory-admin/manual-service-account/) was pretty helpful to find out how to create the service account, and then the KUBECONFIG for it.

### InCluster against a Knative Managed Service such as GCP CloudRun

[![InCluster against a Managed Knative Serving instance](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/07/screenshot-2021-07-23-at-09.22.15.png)](/content/images/2021/07/screenshot-2021-07-23-at-09.22.15.png)

*InCluster against a Managed Knative Serving instance*

Finally, we want to run conformance about different vendors managed services. This approach is quite similar to the previous one, because we are interacting with a remote cluster that has Knative Installed. The main difference here is how Knative Serving was installed and which underlaying configurations were used. In order to run the tests against CloudRun, we will need to configure the tests to understand the context where Knative Serving is running.

I will be looking into the specifics of CloudRun next week, so if you are interested or already know about CloudRun and want to collaborate on improving these projects, get in touch!

### Other Notes about Conformance

While doing this research and experimentation I've been taking notes of some extra requirements that we will need to standardise and automate conformance testing for a project such as Knative Serving.

The following is just a brain dump of points that I want to be able to remember later on:

- Automate the creation of the docker image containing the tests. Create a Tekton Pipeline to clone a tag from the Serving repository, which creates a small docker image with the Go Runtime and Tests. Make sure that this container is parameterizable for the previously described scenarios, but also include different networking configurations (Istio, Kourier, Contour, etc). This docker image needs to be hosted into an official repository for each tag (minor version of the project)
- Work on report back status to Sonobuoy, to make sure that after running the tests it is easy to get and understand the results.
- Find out what's the best way to report back and run each individual test, look into tagging and organising tests into separate groups. The current [`run.sh` script](https://github.com/salaboy/sonobouy-knative-serving/blob/main/run.sh#L50) that is invoked from the docker image is looping over the available test names and then executing one by one, so we can report on progress. But I am sure this can be improved.
- Clean up resources after running tests, as not everything is being cleaned up right now (namespaces and test resources)
- I am wondering how other projects are running their conformance tests, [Crossplane](http://crossplane.io) might be doing something similar
