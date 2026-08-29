---
title: "Zeebe with Spring Boot in Kubernetes"
date: 2019-10-25 07:26:12 +0000
permalink: /2019/10/25/zeebe-on-kubernetes/
description: "This blog post covers how to use a Zeebe Cluster inside Kubernetes and how to build an application that connects to the Zeebe Cluster using Spring Boot."
tags:
  - "bpmn2"
  - "camunda"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "workflow"
  - "zeebe"
  - "bpmn"
  - "cloud native"
  - "helm"
  - "k8s"
  - "microservices"
  - "tutorial"
original_url: https://www.salaboy.com/2019/10/25/zeebe-on-kubernetes/
---

This blog post covers how to use a Zeebe Cluster inside Kubernetes and how to build an application that connects to the Zeebe Cluster using Spring Boot.

Zeebe is a workflow engine for Microservices Orchestration, it is super easy to use and if you are running in Kubernetes you are in luck because it provides [Kubernetes Helm Charts](http://helm.zeebe.io) that can be installed in your existing cluster.

![Zeebe on k8s white](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/zeebe-on-k8s-white.png)

The client side part of Zeebe also provide several integrations with different frameworks and languages so no matter in which language you are building your applications you can connect to Zeebe with one of the existing clients. In this blog post I will be covering the Spring Boot integration.

### Why Zeebe and how does it work?

If you are building microservices, sooner or later you will find the need to define the sequence in which these services should be called to perform a given task. The first, and arguable the easiest way to achieve that is to hard code the sequence inside of your services. If the task as hand is quite technical and it is not critical to your business, having this sequence buried in code might be ok. But if the task at hand is quite central to your business and it require frequent changes to optimize how your business is working you might want to take a look at Zeebe.

Zeebe allows you to define and execute workflow definitions to define the sequence and conditions in which your microservices will be called.

![Orchestration example](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/orchestration-example-1.png)

From a very high level view, Zeebe can run these BPMN workflows in a very efficient and distributed way to enable scaling up to a large number of execution per second. While other similar solutions rely on a Relational Database to store the workflow state, Zeebe uses an event log that can be stored to disk efficiently and fully restored by replying those events if necessary.

From an architecture point of view, Zeebe provides two main components Zeebe Brokers and Zeebe Gateway. Zeebe Brokers (arranged in a cluster, usually referred to Zeebe Cluster) are in charge of execution instances of these workflow definitions. The Zeebe Gateway serves as a single entry point for your applications to interact with these workflow instances.

![Zeebe cluster with workers](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/zeebe-cluster-with-workers-1.png)

Zeebe Brokers are in charge of executing operations on our workflows, and they were designed to do this in a very scalable way. All the query operations are delegated outside of the Zeebe Cluster. For that reason, all the operations happening in the brokers is externalised using Zeebe Exporters. A common exporter is the ElasticSearch exporter, which send all the broker events to be indexed by ElasticSearch.

> You can implement your own exporters if ElasticSearch doesn't suit your needs.

A typical implementation with Zeebe looks like this:

![Typical zeebe impl](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/typical-zeebe-impl-1.png)

- You have your existing services/microservices already running
- You model a workflow using [Zeebe Modeler](https://github.com/zeebe-io/zeebe-modeler) or any other BPMN modeling tool
- You create a Zeebe Cluster
- You deploy your workflow model to the Zeebe Cluster
- You create and deploy your workers to connect your services with the workflow execution
- A service or manually someone start a Workflow Instance

### Getting Started with an Example

This example create a very simple workflow definition and run it inside  Zeebe which is running inside a Kubernetes Cluster. The Workflow Definition defines 3 Service Tasks which require three Zeebe Workers to be implemented.

To get [Zeebe](http://zeebe.io) installed in your Kubernetes Cluster, follow the official instructions on how to install [Zeebe in your Cluster using Helm](https://stage.docs.zeebe.io/kubernetes/README.html).

![Zeebe getting started example](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/10/zeebe-getting-started-example-3.png)

1. Use the Zeebe Modeler to create your Workflow Definition
2. Use [`zbctl`](https://github.com/zeebe-io/zeebe/releases/tag/0.21.1) to deploy and create instances of your workflows
3. Create a Spring Boot project with the Zeebe Client dependency to implement 3 workers
4. Data will be sent to Elastic Search
5. You can use Zeebe Operate to monitor the Workflow Instances (executions)

The following repository includes the instructions on how to get an example up and running from scratch in your own environment.

<https://github.com/salaboy/zeebe-k8s-getting-started/> (give it a start if you liked it!)

The source code for the example Spring Boot Zeebe Workers can be found here:

<https://github.com/salaboy/zeebe-worker-spring-boot-example>

The following video shows this example in action (running on GKE):

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/kWiLCKHQQMI" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

If you have questions, comments or if you find any issues with the **[Getting Started Guide](https://github.com/salaboy/zeebe-k8s-getting-started/)** please get in touch, I will be more than happy to help you to get started.

Useful Links:

- Zeebe on Kubernetes with Helm: <https://docs.zeebe.io/kubernetes/README.html>
- Getting Started Guide: <https://github.com/salaboy/zeebe-k8s-getting-started/>
- Example Spring Boot Worker: <https://github.com/salaboy/zeebe-worker-spring-boot-example>
- Youtube video: <https://youtu.be/kWiLCKHQQMI>
