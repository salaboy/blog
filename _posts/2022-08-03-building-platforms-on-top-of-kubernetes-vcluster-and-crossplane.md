---
title: "Building platforms on top of Kubernetes: VCluster and Crossplane"
date: 2022-08-03 09:39:53 +0000
permalink: /2022/08/03/building-platforms-on-top-of-kubernetes-vcluster-and-crossplane/
description: "Last weekend I was playing with Crossplane and VCluster. I wanted to create a simple example showing how you can use Crossplane to abstract away the…"
tags:
  - "cloud"
  - "cloud native"
  - "docker"
  - "English"
  - "func"
  - "go"
  - "helm"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "tutorial"
  - "crossplane"
  - "k8s"
  - "knative"
  - "platform"
original_url: https://www.salaboy.com/2022/08/03/building-platforms-on-top-of-kubernetes-vcluster-and-crossplane/
---

Last weekend I was playing with [Crossplane](https://crossplane.io/) and [VCluster](https://www.vcluster.com/). I wanted to create a simple example showing how you can use Crossplane to abstract away the creation of Kubernetes Clusters in a way that you can choose when to create a fully-fledge cluster or something a little bit more lightweight using [VCluster](https://www.vcluster.com/). It took me a bit more time to get it working because I got greedy and wanted to install an application into the created cluster. I am building these examples in the context of building platforms on top of Kubernetes as part of my book [Continuous Delivery for Kubernetes](http://mng.bz/jjKP). Feel free to check it out if you are interested in these topics and examples.

If you are unfamiliar with [Crossplane](https://crossplane.io/) or [VCluster](https://www.vcluster.com/) I recommend you check out these two unique projects, which you will find helpful if you consider building a platform on top of Kubernetes.

[Crossplane](https://crossplane.io/) solves the provisioning of Cloud Resources by extending the Kubernetes APIs. When using [Crossplane](https://crossplane.io/) you can declaratively define which Cloud Resources need to be created for your applications to work. You do these definitions by creating Kubernetes resources that can be applied with `kubectl` or following a GitOps approach (or any other approach you use with Kubernetes). This becomes quite interesting if you are building a platform that needs to provision and configure a set of Cloud Resources, including Kubernetes Clusters in different Cloud Providers.

[VCluster](https://www.vcluster.com/) aims to provide flexibility and save on costs by lightweight Virtual Kubernetes Clusters. With [VCluster](https://www.vcluster.com/) you can create an isolated Virtual Kubernetes Cluster inside a host Kubernetes cluster. This reduces the complexity of creating and maintaining a fully-fledged Kubernetes cluster control planes that can become expensive and difficult to manage. Most of the time, you will hear about VCluster when discussing different approaches for isolating workloads in Kubernetes (also when talking about multi-tenancy). The following table compares the level of isolation and managing complexity of using `namespaces`, `vcluster` and fully-fledged Kubernetes Clusters:

[![Screenshot 2022 07 27 at 17.41.04 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/screenshot-2022-07-27-at-17.41.04-edited.png)](/content/images/2022/08/screenshot-2022-07-27-at-17.41.04.png)

### The Example: VCluster provisioning using Crossplane Compositions

Let's look at what we need to implement the example discussed in the intro, but let me first recap what I wanted to achieve.

For this example, I wanted to achieve:

- Have a platform cluster that accepts requests to provision new Environments
- These environments will host an instance of an application that can be installed using Helm
- The team requesting new Environments doesn't care where the Cluster is created, hence using Vcluster or creating a fully-fledged Kubernetes Cluster in a Cloud Provider should provide a similar experience for the end users.

I've created a  step-by-step tutorial that only requires installing KinD (Kubernetes in Docker) in your local environment that you can follow here: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/platform/crossplane-vcluster>

[![Ch08 platform vcluster app](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/ch08-platform-vcluster-app.png)](/content/images/2022/08/ch08-platform-vcluster-app.png)

As shown in the diagram above, we only need to create a KinD Cluster (it can be any Kubernetes Cluster) and then install Crossplane and the Crossplane Helm Provider. As we are not creating any Cloud Resource, we don't need to configure any other Crossplane Provider (such as GCP, AWS, Azure).

Let's go ahead and create a KinD Cluster

[![(Click image to see terminal recording)](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/screenshot-2022-08-03-at-09.33.36.png)](https://asciinema.org/a/VldhoqqnU2BRXKihK1GJ6EHkH)

*(Click image to see terminal recording)*

Now we are ready to install Crossplane and the Crossplane Helm Provider into our KinD Cluster

[![(Click image to see terminal recording)](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/screenshot-2022-08-03-at-09.35.35.png)](https://asciinema.org/a/bG69V2xkcPMiJdGLeoLq79eEp)

*(Click image to see terminal recording)*

Notice that as part of installing the Crossplane Helm Provider, we need to configure the correct Service Account for the provider to have the proper access to install Helm Charts on our behalf.

Now that we have Crossplane, the Crossplane Helm Provider, ready to go, let's take a look at the Crossplane Composition:

[![Environment vcluster composition](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/environment-vcluster-composition.png)](/content/images/2022/08/environment-vcluster-composition.png)

The Crossplane Composition defines what needs to be done when a new Environment resource is created. This composition is doing the following:

- Installing the VCluster Helm Chart using the Helm Provider Config configured when we installed the Helm Provider. When we install this chart we are creating a new VCluster, is that easy
- The VCluster installation creates a Kubernertes Secret containing the tokens needed to connect to the VCluster API Server
- We take that Secret to configure a second Helm Provider Config, which allows us to install Helm Charts into the freshly created cluster
- We use the second Helm Provider Config to install an application into the created VCluster

Let's take a deeper look at how this is achieved, but first, let's apply the Crossplane Composition and the Environment CRD into our cluster, so we can create new Environment resources:

[![(Click image to see terminal recording)](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/screenshot-2022-08-03-at-09.43.39.png)](https://asciinema.org/a/2RnKV13gTQI1i4w1FwxSBvho7)

*(Click image to see terminal recording)*

VCluster will install, in a new namespace, an instance of the API Server (using K3s) CoreDNS, and a Syncer. The idea here is to enable users to interact with the VCluster API Server by interacting with `kubectl` as with a regular cluster, the VCluster will be syncing these resources with the Host Cluster, the one in charge of scheduling the workloads.

Once we have configured Crossplane and the Crossplane Helm Provider, we can create our VClusters. I was blown away by the idea that we can create a new VCluster by just creating a new Helm Release installing a Helm Chart.

[![Ch08 vcluster architecture](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/ch08-vcluster-architecture.png)](/content/images/2022/08/ch08-vcluster-architecture.png)

By using VCluster, we are providing full access to the VCluster API server providing total isolation with the Host cluster API Server. Notice that we can create a VCluster just running `helm install ..`  against our cluster, but for our example, we are letting the Crossplane Helm provider do this for us as part of our composition.

Going back to our example, once the cluster is created, we need three things related to the credentials required to connect to the newly created cluster:

- We need VCluster to create a secret where the `kubeconfig` will be hosted so we can fetch it to connect and interact with the newly created API Server (<https://github.com/salaboy/from-monolith-to-k8s/blob/main/platform/crossplane-vcluster/composition/composition.yaml#L53>)
- We need the `kubeconfig` to point to the new API Server URL from within the cluster, by default, the generated `kubeconfig` points to `https://localhost:8443` (<https://github.com/salaboy/from-monolith-to-k8s/blob/main/platform/crossplane-vcluster/composition/composition.yaml#L62>)
- We need to enable the new service address to the list of accepted hosts that the API server will accept connections to (<https://github.com/salaboy/from-monolith-to-k8s/blob/main/platform/crossplane-vcluster/composition/composition.yaml#L71>)

Once we have the VCluster created with a proper `kubeconfig` created inside a secret, we can configure a second Helm Provider (or the same with a separate config) to install our applications / tools into the newly created VCluster. (<https://github.com/salaboy/from-monolith-to-k8s/blob/main/platform/crossplane-vcluster/composition/composition.yaml#L95>)

Inside the composition, we are creating another Helm Release using our Conference Application Helm Chart (<https://github.com/salaboy/from-monolith-to-k8s/blob/main/platform/crossplane-vcluster/composition/composition.yaml#L131>)

A critical detail here is to use the `providerConfigRef` to make sure that we are pointing to the correct Helm Provider Configuration, which has the credentials for the new VCluster (<https://github.com/salaboy/from-monolith-to-k8s/blob/main/platform/crossplane-vcluster/composition/composition.yaml#L136>)

Once everything is configured and we have created a new Environment, we can connect to the VCluster and check that the application was installed:

[![Ch08 platform vcluster result](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/ch08-platform-vcluster-result.png)](/content/images/2022/08/ch08-platform-vcluster-result.png)

One crucial detail here is that the VCluster CLI will not be able to connect to our cluster because we have modified the API Server URL to be an internal service (so the Helm Provider, which runs inside the cluster, can interact with the API server), so we can workaround this by specifying the server URL when using the CLI:

`vcluster connect dev-environment --server https://localhost:8443 -- ksh`

From outside the KinD Cluster the VCluster CLI will port-forward a connection to localhost.

So there you have it, creating VClusters with Crossplane.

### Next Steps

This is just a "simple" example of what teams building platforms will need to provide a self-service approach to provisioning not only cloud resources, but also entire environments wired up with the right tools for developers to be productive. I would love to have time to expand this example to:

- Install ArgoCD inside the VCluster and use a GitHub URL provided as an Environment parameter to implement GitOps, this will avoid using kubectl against the VCluster. The composition should create the ArgoCD resource to configure the repository and the cluster without any user intervention.
- Install Knative inside VCluster so developers can rely on Knative Functions, Knative Serving and Eventing capabilities to design their applications
- Have a generic ID to discover which types such as Environments can be created without the need for people to create resources against the Host Cluster
- Have GCP, AKS, and EKS implementations alongside the VCluster one, and decide which one to use based on an Environment parameter (such as size)

If you are interested in helping me expand this example, please contact me. Having examples like this to test Vcluster and Crossplane capabilities is the best way to find issues and start with your OSS contributions journey.
