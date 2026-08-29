---
title: "Spring Cloud Kubernetes Example"
date: 2018-05-24 06:25:58 +0000
permalink: /2018/05/24/spring-cloud-kubernetes-example/
description: "Hi everyone, as part of the Activiti Cloud project we have been testing our Cloud Native building blocks extensively into Kubernetes clusters."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "cloud native"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "docker"
  - "example"
  - "tutorial"
original_url: https://www.salaboy.com/2018/05/24/spring-cloud-kubernetes-example/
---

Hi everyone, as part of the [Activiti Cloud](http://activiti.org) project we have been testing our Cloud Native building blocks extensively into [Kubernetes clusters](https://dzone.com/articles/why-did-kubernetes-win). We started by using [MiniKube](https://kubernetes.io/docs/getting-started-guides/minikube/) and that worked well for some time, but now we are moving to real clusters to do our development, testing and continuous deployment approach ([Activiti Cloud & Jenkins X:  Blueprint in AWS and GCE](/2018/05/15/activiti-cloud-jenkins-x-blueprint-in-aws-and-gce/)). We believe that as part of being an Open Source project we should demonstrate, share and highlight best practices regarding software evolution, maintenance and testing. For that reason, we started looking into [Jenkins X](http://jenkinsx.io) and [Spring Cloud Kubernetes](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes), to fill some of the gaps of how to maintain the Spring Cloud programming model when we target Kubernetes as our main deployment platform. On this blog post I will be share an example that is evolving based on [Ryan Dawson’s Minions in Minikube Blog post](https://dzone.com/articles/minions-in-minikube-a-kubernetes-intro-for-java-de).

## The Scenario

As described by Ryan in his blog post, we have minions, they are workers. Imagine your services here, they will perform a certain job, minions are just a simple spring boot app. We can have tons of them, and then can be configured in different ways to perform different things. Minions can and want to do some work, but they need a boss to tell them what to do.

![minions-boss](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/05/minions-boss.jpg)

This means that in this scenario, minions will look for a Boss until they find him/her and then ask for a particular mission to work on. If there is no boss, they will not know what to do.

If we translate this to a microservice architecture, we will have services that will use service discovery mechanism to find another service that has been labeled in a certain way to specify that it provides certain functionality, in this case a Boss service. We wanted to make sure that if we run in Kubernetes we don’t use Eureka/Consul, mostly because Kubernetes already provide a built-in ***Service Registry***. In most of the cases, service discovery is handled by just the ***“serviceId”*** which is usually a string that allows your service to connect to another service. For cases when this is not enough, for example, finding a service based on its *metadata/selector* you will required to query the service registry and filter the available services based on this extra information to get hold of the ***“serviceId”*** that you are looking for.

In most scenarios, these services need to be configured and we want to avoid to deploy the [Spring Cloud Config Server](https://github.com/spring-cloud/spring-cloud-config) if we have config maps already provided by Kubernetes.

Last but not least important, if we are deploying multiple minions and bosses, we want to make sure that we provide a single entry point for our clients to interact with these services. For that reason the example includes the new (and shiny) [Spring Cloud Gateway](https://cloud.spring.io/spring-cloud-gateway/), which uses the ***@DiscoveryClient*** implementation to locate services and automatically register new routes.

## Demo Flow

We will start by deploying a single minion service. This service have a Scheduled task to look for a Boss that provides something to work on.

If the minion find a Boss service, it will work on the task provided by the boss for a period of time (another Scheduled task to finish the task at hand). Then it will try to find a boss again. In order to find a Boss Service we will use the DiscoveryClient to query the Kubernetes Service Registry. We will use the metadata (labels / annotations) to filter out which services match with **“type: boss”**.

We can tail the logs of the minion service and we will see that it will keep looking for a Boss.

Next step is to deploy a Boss service. As soon as this service gets deployed, the minion will find it out via Service Discovery and the Minion will be able to request a new mission by executing a POST request to the recently discovered Boss service. The Boss service will return a task for the minion to perform.  We can also tail the logs of the boss service to see that it is receiving requests from minions.

At all times, we can access each of the individual services that are deployed and running via the Gateway Service. This gateway is also using the Discovery Client to find which services has been deployed and automatically registering these services as routes. If a service goes down the route will be automatically unregistered.

You can access to all the registered routes by doing a GET request to:

> http://&lt;gateway url&gt;/actuator/gateway/routes

Where you should be able to find 2 routes defined one for the minion and one for the boss:

> http://&lt;gateway url&gt;/spring-cloud-k8s-minion/

> http://&lt;gateway url&gt;/spring-cloud-k8s-boss/

## The Projects

You can find these projects in my GitHub account:

- [Salaboy/spring-cloud-k8s-minion](https://github.com/Salaboy/spring-cloud-k8s-minion)
- [Salaboy/spring-cloud-k8s-boss](https://github.com/Salaboy/spring-cloud-k8s-boss)
- [Salaboy/spring-cloud-k8s-gateway](https://github.com/Salaboy/spring-cloud-k8s-gateway)

You can fork this projects and build them locally, but they are using (depending on) the Spring Cloud Kubernetes projects to enable Service Discovery, Configuration and Client Side Load Balancing with Ribbon.

You can make these project run in MiniKube, but I recommend you to try it out in a real cluster such as [AWS + Kops or GCE (where you can get a free account to try stuff)](/2018/05/15/activiti-cloud-jenkins-x-blueprint-in-aws-and-gce/).

You can even use [Jenkins X](https://jenkins-x.io)  (which is what I'm using in the video) if you want to forget completely about how to build the Projects, build the Docker images, create Kubernetes descriptors and HELM charts.

In the following video I will be describing how these services will interact and how we can use the same concepts defined in Spring Cloud inside a Kubernetes deployment.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/EWcgTub32dw" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

## (Important) Notes about Kubernetes Deployments

There are some important things that you will need to understand if you are deploying these services into a Kubernetes Cluster. These notes are separated by projects so you can follow the changes in their own GitHub repository:

### Minion

[Salaboy/spring-cloud-k8s-minion](https://github.com/Salaboy/spring-cloud-k8s-minion)

When we look at the minion project it is consuming data from the Service Registry and the Config Maps.

All the Helm Charts and deployment descriptors templates where generated by [Jenkins X](https://jenkins-x.io) import process, so we needed to tweak some of these descriptors in order to allow this service to interact with Kubernetes Services.

To leverage [Spring Cloud Kubernetes Config](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes#propertysource-reload) module, we included a config map configuration inside the helm chart [deployments descriptor template directory](https://github.com/Salaboy/spring-cloud-k8s-minion/blob/develop/charts/spring-cloud-k8s-minion/templates/minion-config-map.yaml).

This will allow us to read configurations from this ConfigMap following the same programming model that we used in Spring Cloud Config Server. Where we can @Autowired an Object Oriented representation of the properties that we want to configure.

This configMap will be deployed along our service by the Jenkins X pipeline.

In the same way that we added the configMap, we needed to add some security configurations (service-account and role bindings) to enable our service to consume Kubernetes internal services (ConfigMaps and Service Registry). This services are not enabled for anyone to consume, so we need to enable Spring Cloud Kubernetes to access some internal resources.

You can look at these configurations here:

- [Service Account](https://github.com/Salaboy/spring-cloud-k8s-minion/blob/develop/charts/spring-cloud-k8s-minion/templates/serviceaccount.yaml)
- [Role Binding](https://github.com/Salaboy/spring-cloud-k8s-minion/blob/develop/charts/spring-cloud-k8s-minion/templates/rolebinding.yaml)
- [Role](https://github.com/Salaboy/spring-cloud-k8s-minion/blob/develop/charts/spring-cloud-k8s-minion/templates/role.yaml)

(This is very similar for the gateway)

Another small tune-in of the service and deployment descriptors templates were done in order to remove the release name from the published service name in the registry. This is to maintain the expected service name without taking into account the environment which follows the same approach of working outside Kubernetes with Spring Cloud.

### Boss

[Salaboy/spring-cloud-k8s-boss](https://github.com/Salaboy/spring-cloud-k8s-boss)

On the Boss side, there are not too many changes because the Boss is quite simple and it is only accepting requests from minions. As an extra exercise, you can try to add configuration using configMaps and connect back to minions using client side load balancing with Ribbon.

In the previous video you saw how we did import the project using Jenkins X and **Helm Charts(and descriptors templates)**, ***Skaffold.yaml*** and ***JenkinsFile*** were created. Then I just customised the service names  to remove the release name (which contains the environment prefix).

### Gateway

[Salaboy/spring-cloud-k8s-gateway](https://github.com/Salaboy/spring-cloud-k8s-gateway)

The Gateway is also a simple project, but it has some configurations that are important to be highlighted.

We created this Gateway using the new Spring Cloud Gateway implementation and just added the Spring Cloud Kubernetes Discovery implementation. Then we customised some of the properties to enable automatic routes registration, as you can see in here:

[spring-cloud-k8s-gateway/application.yml](https://github.com/Salaboy/spring-cloud-k8s-gateway/blob/develop/src/main/resources/application.yml)

Notice also that we changed the default pattern from **“lb://'+serviceId'”** to **“’http://'+serviceId”** to get it working. I’m currently investigating if this is needed or not and how to support client side load balancing in the Gateway.

Also we added the ***serviceAccount***, ***role*** and ***rolebinding*** as explained in the minion project for service discovery.

## Conclusions

We are making sure that Activiti Cloud can leverage these capabilities, because we require for dynamic route registration of Activiti Cloud Applications and to provide the option of centralized (and watchable) configuration for our services. It is important to understand that there are several ways of doing Service Discovery, and this might only be appropriate for certain advanced and well justified use cases. If you are not trying to solve an use case where you need dynamic (based on metadata) service filtering or in some kind of router/gateway you should use the “***serviceId***” in order to interact safely with other services. This simplified approach reduce the number of configuration needed in your services. For such simpler use cases we are looking at Istio Service Mesh to provide, control and monitor our service to service interactions.

We are comfortable with using ConfigMaps as our mechanism to configure our services and containers and Client Side Load Balancing with Ribbon and Hystrix to provide Fallback mechanism is something that you might want to include in your services. We are looking forward to keep contributing to the Spring Cloud Kubernetes project and make it better for everyone else in the community to use.

If you have questions about this example, feel free to drop me a message here or [join our Gittter channel](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) to get in touch.
