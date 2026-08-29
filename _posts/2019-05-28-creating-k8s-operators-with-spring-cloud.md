---
title: "Creating K8s Operators with Spring Cloud"
date: 2019-05-28 11:11:43 +0000
permalink: /2019/05/28/creating-k8s-operators-with-spring-cloud/
description: "In this blog post I will be sharing my latest weekend project(s) that I've created in order to share with people why and how to create Kubernetes…"
tags:
  - "ci/cd"
  - "cloud"
  - "community"
  - "English"
  - "event"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "Trips"
  - "tutorial"
  - "workshop"
  - "cloud native"
  - "docker"
  - "spring cloud"
original_url: https://www.salaboy.com/2019/05/28/creating-k8s-operators-with-spring-cloud/
---

In this blog post I will be sharing my latest weekend project(s) that I've created in order to share with people why and how to create Kubernetes Operators using Java, Spring Boot and Spring Cloud. Most of the time when you start reading about Operators you will find some popular tooling like [KubeBuilder](https://www.github.com/kubernetes-sigs/kubebuilder) and [Operator SDK](https://github.com/operator-framework/operator-sdk), but are in Go (GOLANG), and I've heard multiple times ***"we tried to create one in Java, but we decided to learn go to create our operator"***. In reality, there is no technical reason for us to not have our Operators in Java. But there is a big practical reason to do it with these popular Go tools, and that is that in Java we still don't have the same  tools (mostly scaffolding) to generate our Operators templates. For this reason, on this article, I will be sharing my experiments while trying different approaches and Java libraries. Luckily for us, there are some good initiatives going on where we can join forces to make sure that creating Operators in Java is easy and fast.

I've presented these examples in [JBCNConf - May - 2019](http://jbcnconf.com) - Barcelona, Spain, so here are the slides:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/147913562" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

![Creating K8s Operators with Spring Cloud](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2564-1.jpg)

The code for the examples can be found here: <https://github.com/salaboy/extending-k8s-with-spring-cloud> and I encourage you to try to run this on your own Kubernetes Cluster. The previous link also has a sub section about how to create your own cluster in GKE (for free) so if you really want to learn how to use these tools, getting your hands dirty is always the recommended way, you have no excuses :)

### What, When And Why do we need Operators?

Let's start with some definitions (*"the What"*):

> "An Operator is a Controller that uses CRDs (Custom Resource Definitions) to encapsulate operational knowledge for a specific application.."

Which push us to know what a controller is:

> "A controller actively monitor and maintains a set of Kubernetes resources in a desired state."

In order to understand *"the When"* we need Controllers or Operators, we need to understand about what I refer as the ***"Kubernetes Maturity Waves"***, and these waves refer to your cloud native journey stages on moving your services/applications to Kubernetes. The three waves that I can recognise today are:

- **Running**: by just running your applications inside Kubernetes you are making a big progress. After creating all the yams files that you need to deploy your containerised application, you can probably run any existing application. While doing this first iteration you learn a lot about the Kubernetes Native resources and concepts. At this stage, having CI/CD pipelines becomes fundamental to automate how you deploy new versions of your application to Kubernetes.  The more that you learn about the Kubernetes platform, the more that you understand about how to leverage it. Most of the time this means that you will need to refactor/split your applications and apply some Cloud Native Patterns.
- **Extending**: As soon you have your services running inside Kubernetes you will probably want to integrate them natively to the platform. The main reasons for this is to make sure that your applications/services are managed and monitored in a way that make sense for the domain. Your services will probably have concepts, scalability concerns, management concerns, etc that are most likely to be Domain Specific. In order to "teach" Kubernetes about these Domain Specific concepts, we can use Custom Resource Definitions (CRDs). These Custom Resources can be "installed" in K8s and will be managed by the platform.
- **Automating**/**Integrating** (Controllers/Operators): Once we have our CRDs we will need a component that understand how these resources needs to be managed and how these resources will relate to K8s native resources. At this point you are looking at making sure that your services are understood by the platform and we have components that will understand how to manage their Domain Specific lifecycle. You will be ready to allow other people to "*install*" your services and deal with higher level concerns such as Domain Specific versioning, security management, identity management and other cross cutting concerns that are specific to your domain. As soon as you have an Operator, you start thinking about how your Operator can integrate with other Operators out there (for example in http://operatorhub.io). The most basic example is integrating with Databases (or Message Broker) Operators, because Databases have very domain specific scalability concerns, it makes a lot of sense to use an operator to handle that for us, and if we have an Operator for our Applications, it might be wise to make our Operator play nicely with these other third party Operators.

### Getting your hands dirty

As I mention before, it really depends on where of your Kubernetes journey you are, is how you see the world and where your priorities are. If you feel that you don't need an Operator right now, that is more than fine, but this section will show you what is possible and it will give you pointers to where to look when you are ready.

If you follow the README.md file in this repository: <https://github.com/salaboy/extending-k8s-with-spring-cloud/blob/master/README.md> you will find some exercises with different checkpoints where you can deploy services, see how  they interact and how they integrate with the platform.

Briefly this is what each checkpoint covers:

#### Checkpoint #0:

We deploy 3 services ServiceA, ServiceB and FunctionA. For this we use the Kubernetes native concepts of Service, Deployment(and ReplicaSet) and Pod. We also deploy FunctionA using a Knative Service.

![Workshop](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/workshop-1.png)

You can see that ServiceA is in charge of calling ServiceB and FunctionA. It does this using Scheduled tasks every 10 seconds. If the service or the function are unavailable, that is printed in the output. If the service and functions are available, we will see the output of these services out.

Finally, if we want to access our services from outside the cluster we can use Istio Gateway Virtual Services to route traffic from outside into our service instances.

#### Checkpoint #1:

We introduce a Kubernetes Controller that understand about K8s Services. We are using the Spring Cloud Gateway with Spring Cloud Kubernetes. This allow us to create a router that look at the Kubernetes Service Registry and create a route per Service that it finds. This give us a single entry point and we only require to create a single Istio VirtualService.

![Workshop](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/workshop-3.png)

This is just an example to show how use Spring Cloud Kubernetes to interact with the Kubernetes APIs, this means that we also need to cover the security aspects of interacting against the platform APIs from inside a Pod in the case. There is an RBAC section that allows you to configure all you need to make sure that your controller can interact with the Server without hitting any security related issue.

#### Checkpoint #2:

We built on top of Checkpoint #1 to show how we can now react when we detect a change in a Kubernetes resource. This is useful for monitoring or building notifications. Until now we are just consuming existing types. Let's add our own types in the next checkpoint.

#### Checkpoint #3:

Here we move forward to implement our own Custom Resource Definitions. We deploy them and test them by creating new Resource instances. Here we will create the following CRDs: ServiceA, ServiceB and Application. Notice that the root concept here is Application which is a logical boundary between A and B.

![Workshop](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/workshop-4.png)

Now we need an Operator (component) that understand about these new Resources and manage their lifecycle (Creation, Updates, Deletion).  As you can see now, the concept of Application is just a logical boundary between ServiceA, ServiceB and Function. This means that now we can introduce our Domain Specific logic to deal with how Applications are versioned and exposed to users. We can now differentiate between different set of services related to different applications.

Because we are using the Spring Cloud Gateway, and because we know understand about the topology of our Application we can expose hierarchical routes, for example: /apps/my-app/1.0/a/my-a/ to access a service inside an application.

#### Checkpoint #4:

We expand on checkpoint #3 and we link our resources ServiceA, ServiceB and Application to Kubernetes Native resources. This allows us to react and update/remove our Resources if the K8s Services, Deployments, Pods are not available to provide the runtime for our concepts.

![Workshop](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/workshop-6.png)

If you run the example, you can see how if you delete a Kubernetes Service that is backing up a ServiceB resource, the application will be marked as UNHEALTHY and the route to expose that application will be removed.

### Links

It is important to mention that all these projects were created with Spring Cloud Kubernetes, but I've tried other approaches and helpful tools as well, here are some of those:

- [JVM Operators](http://github.com/jvm-operators)
  - WIP branch in k8s-operator -> question asked to the project -> <https://github.com/jvm-operators/abstract-operator/issues/50>
- [AP4K](http://github.com/ap4k/ap4k)
  - You can look at the 2 mins video from @iocanel [here](https://www.youtube.com/watch?v=XctRwTu4ma4)
  - You can take a look at the ap4k branch of the example-service-a project.
- [KIND](http://github.com/kubernetes-sigs/kind)
- GOLANG tools to compare
  - [KubeBuilder](https://www.github.com/kubernetes-sigs/kubebuilder)
  - [Operator SDK](https://github.com/operator-framework/operator-sdk)

### Conclusions

I really want to encourage people to try these examples, create issues, write questions here (or in GitHub) and give feedback so we can make them better all together. I will really appreciate if you give the repo a star, as it will help me to share these projects with more people and I am sure that will make the examples better for everyone.

Stay tuned!
