---
title: "RFC: Activiti Cloud Connectors"
date: 2017-10-12 07:41:11 +0000
permalink: /2017/10/12/rfc-activiti-cloud-connectors/
description: "Open Source Java Process Engines historically provide a way to create system to system integrations. It is something basic expected from a BPMS."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "rfc"
  - "roadmap"
  - "workflow"
  - "activiti"
  - "BPM"
  - "community"
  - "spring cloud"
original_url: https://www.salaboy.com/2017/10/12/rfc-activiti-cloud-connectors/
---

Open Source Java Process Engines historically provide a way to create system to system integrations. It is something basic expected from a BPMS. The problem begins when these mechanisms impose a non-standard way of doing those integrations. By non-standard I mean, something that feels awkward coming from outside the BPM world. Nowadays with the rise of microservices, there are several alternatives on how system to system integrations are designed and implemented. Projects such as Apache Camel and Spring Integrations are quite popular and they solve most of our integration problems for us.

Today’s real life integrations push us to use a lot of pre-baked tools to add fallback mechanisms, circuit breakers, bulkheads, client and cluster side load balancing, content type negotiation, automatic scaling up and down of our services based on demand, etc. Simple REST calls are not enough anymore.

In this blog post I share the approach that we are taking for Activiti Cloud Connectors. This is a request for comments blog post and it describes the underlying technology that we are planning to use. With time, we will simplify the mechanism shown in here to make sure that we don’t push our users to add too much boilerplate.

### Java Delegates & Classpath Extensions (The old way)

Java Delegates & Classpath extensions are quite a powerful tool to extend the behavior of the process engine and the main entry point for system integrations. Until Activiti 6.x if you wanted to interact with external (running outside of the process engine) services you were responsible for writing a Java Class that implements the ***"org.activiti.engine.delegate.JavaDelegate"*** interface which exposes a single method:

```java
void execute(DelegateExecution execution);
```

As you can imagine, you can do all sorts of things with this. It’s simple and extremely flexible. However, there are downsides to this approach too that are common across any in-process extension model. For example, the JavaDelegate classes are directly referenced from within the process definitions, and this introduces a tighter coupling than is ideal between definition and implementation. Also, if you do make an error when coding your JavaDelegate then you run the risk of bringing down the JVM that is also running other processes. One other area that can cause difficulty is managing the Java class path and ensuring that it is replicated consistently across each member of your cluster of process engines and Job Executors.

For these and other reasons we want to introduce the concept of Activiti Cloud Connectors and decouple the responsibility of dealing with system to system interactions from the Process Engine.

Just to be clear, we are not removing JavaDelegates, instead we are providing a new recommended out-of-the-box mechanism that will tackle these problems.

### Spring Cloud Connectors & Kubernetes

The Spring framework provides the concept and abstraction layer on top of Service Connectors and how these can be integrated in different cloud platforms. The main concept behind service connectors is to make sure that if your service depends on another service you delegate to the infrastructure the lookup to that service. This is usually referred as service/resource binding. You know that you want to interact with a very specific type of service but you don’t know where it is or how to locate it, so you delegate that responsibility to another layer that will look up to the available types of services, locate them and provide your service a way to interact with it.

Spring Cloud Connectors provides this level of abstraction and you can find more about them here: <http://cloud.spring.io/spring-cloud-connectors/> They provide different implementations for different cloud providers: CloudFoundry, Heroku and Local for testing and developing.

There is a Kubernetes Cloud Connector (<https://github.com/spring-cloud/spring-cloud-kubernetes-connector>), that we might want to pick up (the one that I’m using in the example) that looks like a very good start but it's not being actively maintained. So we will probably take the lead to push that project forward. Don’t get me wrong, the project is great, but we will need to get more juice from it. We also believe that this project can be moved to the incubator project related to kubernetes, so versions can be aligned on every front.

### Activiti Runtime Bundle Integration Events

As mentioned before, we are pushing out of the Process Engine the responsibility to execute system to system integrations. From the Process Engine point of view Service Tasks (and other integrations) will be executed in an Async fashion. This means that the Process Engine will only emit an ***IntegrationRequestEvent*** and wait for an ***IntegrationResultEvent***.

By pushing the responsibility to Connectors, the Process Engine doesn’t care anymore about what technology, practices or language do we use to perform the system to system integrations. In other words, please welcome **“Polyglot Connectors!”**

![Screen Shot 2017-10-11 at 18.04.28.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/10/screen-shot-2017-10-11-at-18-04-28.png)

We are aiming to provide an out of the box solution for Service Tasks, where you don’t really need to specify which connector is going to be in charge of performing the integration. By doing this, we remove the need to add a reference to a Java Class inside the Process Definition, decoupling completely the *“What needs to be done”* from the *“How needs to be done”* and following a mode declarative approach.

### Inside Activiti Cloud Connectors

Activiti Cloud Connectors will run outside of our Runtime Bundles, meaning that Runtime Bundles will not fail if a Connector fail. It also means that we will be able to scale them independently.

From a very high level perspective Activiti Cloud Connectors will be responsible for:

- Listen to ***IntegrationRequestEvents***
- Process ***IntegrationRequestEvents*** (Perform the Remote/Local - Sync/Async call)
- Return ***IntegrationResultEvents***

Activiti Cloud Connector projects can bundle any number of system to system interactions that are related and can be managed together. This means that if you recognize a set of services that are often updated together you can bundle inside an Activiti Cloud Connector all these interactions, so your business processes can use them.

Activiti Cloud Connectors will be automatically discovered and registered inside the service registry provided by the infrastructure. This means that we can, at runtime, ask the service registry about the available connectors and their types. Our modelling tools can make use of that registry to present to the user the available connectors as well.

![Screen Shot 2017-10-11 at 18.08.06](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/10/screen-shot-2017-10-11-at-18-08-06.png)

## The Proof of Concept

You can find the PoC in my github account here: <https://github.com/Salaboy/test-spring-cloud-connectors>

This repository contains several pieces that demonstrate how to create connectors. You will find inside the repository:

- [Connector-consumer-app](https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/connector-consumer-app) : Our connector that listen for IntegrationEvents and produces IntegrationResults after finishing the external system to system integration.
- [Payments-api](https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/payments-api) : From the client (connector) point of view we just create a definition of the service that we want to connect to. This will help us to create different implementations for the same service for different environments.
- [Payments-local-connector](https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/payments-local-connector) : a local connector that will use Spring Connectors with a local service registry.
- [Payments-kube-connector](https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/payments-kube-connector) : a kubernetes service connector, that allows you to discover a Kubernetes Service and connect to it.
- [Payments-service](https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/payments-service) : a very simple Payment Service to connect as an example. This is a spring boot application that works in complete isolation from the Connector.

The Connector Consumer App can be packaged using different dependencies and configurations based on the selected profile. We have the “***local***” and “***kube***” profile. By default the “***local***” profile is active, this means that the local connector will be included.

Even if you are running with the local profile, you need to have rabbitMQ running for working with Spring Cloud Streams and for that reason, the project provides a docker-compose that will start the Payments Service plus RabbitMQ. <https://github.com/Salaboy/test-spring-cloud-connectors/blob/master/docker/docker-compose.yml>

Once you have that running, you can start the Connector Consumer App which also expose a REST endpoint to trigger integrationEvents:

<https://github.com/Salaboy/test-spring-cloud-connectors/blob/master/connector-consumer-app/src/main/java/org/salaboy/streams/SampleApplication.java#L57>

This is just to make it simple to test for this example, but the Process Engine will produce an event that will be picked up by the @StreamListener here: <https://github.com/Salaboy/test-spring-cloud-connectors/blob/master/connector-consumer-app/src/main/java/org/salaboy/streams/SampleApplication.java#L63>

The service connector resolution magic happens here:

```java
PaymentService payment = cloud.getServiceConnector("payment",PaymentService.class,null);
```

Where cloud is an instance of Cloud created using a CloudFactory:

```java
private Cloud cloud = new CloudFactory().getCloud();
```

This allows us to detect the environment where we are running and then obtain references to the services that we want to interact in a decoupled way.

Depending on the (Spring) Service Connector that we have in the classpath different lookup mechanisms will be used to get a reference to the service. We can even have multiple (Spring) Service Connectors inside our Activiti Cloud Connector project which will be enabled and disabled based on the Cloud Platform that is detected.

If you jump now to the two connectors implementation, you will find that they share a lot of code. The only thing that change is how the service reference is obtained. One uses a property file as a service registry and the other one uses the Kubernetes Service registry filtering by labels to get hold of the service reference.

There is no magic inside the connectors (local and kube) just a RestTemplate executing an exchange:

<https://github.com/Salaboy/test-spring-cloud-connectors/blob/master/payments-local-connector/src/main/java/org/salaboy/service/local/connectors/PaymentServiceImpl.java#L30>

Each of these connectors will be registered to the specific cloud provider depending on which ServiceInfoCreator we provide.

```java
public class PaymentServiceInfoCreator extends LocalConfigServiceInfoCreator
```

And

```java
<b>public class PaymentServiceInfoCreator extends KubernetesServiceInfoCreator<PaymentServiceInfo>
```

Spring does the resolution by using service loaders, and for that reason you need to register your own implementations by creating a couple of descriptors in ***META-INF/services/***

You can take a look at this descriptors here:

- Local: <https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/payments-local-connector/src/main/resources/META-INF/services>
- Kubernetes: <https://github.com/Salaboy/test-spring-cloud-connectors/tree/master/payments-kube-connector/src/main/resources/META-INF/services>

These connectors are using different techniques to identify in which platform we are running.

In order to enable cloud connectors you need to set a property in your application.properties file:

```xml
spring.cloud.appId=myApp
```

In the case of Kubernetes, it looks at some ENV VARIABLES that must be set when you are running inside Kubernetes. For running the local connector you need to add a new properties file that will contain the service registry (which services are available and where they can be located). For our local payment service we have:

```xml
spring.cloud.payment=payment://localhost:8081/payment
```

In the case that we are running in kubernetes the connector will use the Kubernetes Registry to find out which services are available and where they are.

The following diagram show the isolation of connectors from the Process Engine (Runtime Bundle instance) and the external service. Adding an abstraction layer that allow developers to use the framework/technology of their choice to implement these connectors.

![Screen Shot 2017-10-11 at 18.13.19](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/10/screen-shot-2017-10-11-at-18-13-19.png)

It is important to notice that the Payment Activiti Cloud Connector lives inside the Activiti Infrastructure. This means that it can leverage all the other components available inside the infrastructure, for example, distributed logging and configuration service, the Service Registry, etc.

To finish this long post I wanted to mention some important points:

- This PoC represent the most complex scenario that you might find while planning your integrations, so it might not be considered as the hello world example.
- I mentioned this before, but Activiti Cloud Connectors will be the perfect place to bundle multiple calls (integrations) against the same type of services. When using JavaDelegates you had two options: 1) Create specific JavaDelegate for a certain service call, follwing this approach you end up with very simple JavaDelegates, but with a lot of them. 2) Create a very generic JavaDelegate that can be parameterized to make different calls to the same service. With this you end up with one very complex delegate that becomes complicated to maintain. With this new approach, Activiti Cloud Connectors allow you to define the granularity and the set of filters that you want to apply to the @StreamListeners to process different types of integrations.
- If you are only targeting Kubernetes you can use the Kubernetes APIs directly to resolve Kubernetes exposed services. The Spring Cloud Kubernetes Connector is leveraging the Spring Cloud Connectors layer to make sure that our services are not tied to Kubernetes and can run in different infrastructures. This is a common case, you will probably want to run the same application locally outside kubernetes and in kubernetes, the abstraction layer is necessary.
- Even though I’ve included 5 projects inside the PoC repository, you can end up with only one project + the service that you are trying to integrate with. I was trying to split in different modules the different connectors to make sure that we all understand the boundaries of the services and the requirements from the client perspective.
- The Activiti Cloud project will suggest on how to create these connectors, but you are free to use any technology inside them, at your own risk :)
- We are currently finishing the internal bits in the process engine. You can follow the PR here ( <https://github.com/Activiti/Activiti/pull/1479/files> )

As soon as we have the PR ready to be merged in the process engine we will create some cloud connectors examples to demonstrate these concepts in action. Stay tuned and get in touch if you want to help or have comments about these topics.
