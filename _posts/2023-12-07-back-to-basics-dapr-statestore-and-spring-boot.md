---
title: "Back to basics: APIs to rule them all (Dapr Statestore APIs) #1"
date: 2023-12-07 13:58:24 +0000
permalink: /2023/12/07/back-to-basics-dapr-statestore-and-spring-boot/
description: "In this short blog post, I wanted to share some of the projects I've been working on lately. I hope that by sharing some of these integrations…"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/12/cover.png
tags:
  - "dapr"
  - "spring-boot"
  - "cloud-native"
  - "statestore"
  - "kubernetes"
  - "Java"
  - "distributed"
  - "store"
  - "oss"
  - "examples"
  - "tutorial"
  - "code"
original_url: https://www.salaboy.com/2023/12/07/back-to-basics-dapr-statestore-and-spring-boot/
---

In this short blog post, I wanted to share some of the projects I've been working on lately. I hope that by sharing some of these integrations, experiments, and simple examples, you can apply some of the lessons I learned to your projects, so let's jump right into it.

For the past 8+ years, I've been working with many tools related to Kubernetes. I've felt the pain of coding and running applications on top of it, most of the time, by pushing me to understand how Kubernetes works and how I need to configure it to work for me. It is pretty common to have a local or remote cluster running even before I started coding. In this series, we will look into the [Dapr](https://dapr.io) project, which extends Kubernetes with application-level APIs for developers to code their applications, abstracting away infrastructure and promoting best practices and common cloud-native patterns. I know a mouthful, but let's jump into the problem space for this blog post.

### **The problem space**

No matter what kind of application you are developing, you will need to read and store data. If you don’t want this data to go away when you restart your application, you will need to use persistent storage. Relational Databases, Key/Value Stores, Document Databases, and Graph databases are all used to keep data safe and be able to retrieve it whenever we need to do something with it.

Developers need to understand what kind of data source they are connecting to, where it is located, and what they need (inside their applications) to connect to it. More importantly, someone needs to install and configure this data source somewhere.

![Dapr basics statestore](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/12/dapr-basics-statestore-1.png)

While these data sources will be correctly set up in the environment where the application will run for our customers (the production environment), it is hard, and not always possible, to give developers access to the same version running with the same configurations to developers. This not only causes issues by introducing differences across environments, but it can also introduce different behaviors in the application when deployed to a new environment.

![Dapr basics statestore](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/12/dapr-basics-statestore-2.png)

Can we decouple how developers connect to these data sources (and other infrastructure services) by providing them with APIs instead of pushing them to add libraries to their applications that tie them to specific vendors and versions of these components?

### **One part of the solution: Dapr API for developers**

The [Dapr](https://dapr.io) project was created to separate applications from the infrastructure they require, in this case, a data source, by introducing application-level APIs consistent across environments.

Developers can use these APIs from their applications, and each environment can provide different implementations for these APIs to store and retrieve data.

To use Dapr, you will need to have a Kubernetes Cluster and install and configure Dapr. This is usually done by a Platform Team with access to cloud infrastructure, can create clusters, install tools on top of them, and prepare environments for our applications to run.

![Screenshot 2023 12 07 at 09.31.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/12/Screenshot-2023-12-07-at-09.31.03.png)

Once Dapr is installed, the Platform team can start wiring available infrastructure to Dapr. In this example, we will be using the Dapr Statestore APIs; hence, the Platform team will need to configure the Dapr Statestore component (YAML resource) to point to a persistent storage, in this case Redis ([check all the available options here](https://docs.dapr.io/reference/components-reference/supported-state-stores/)).

But let's go back to our developers. If we want them to use the Dapr APIs, do we need a Kubernetes cluster? Well, it depends...

### **The second part of the solution: Dapr + Testcontainers for Spring Boot**

We want to enable Spring Boot developers to use the Dapr APIs to interact with infrastructure. Still, we don’t want to add to their day-to-day development inner loops more tools and steps that can be complicated and not directly related to the work they are doing.

The Dapr Testcontiners module (<https://testcontainers.com/modules/dapr/>) and the Dapr Spring Boot Started serve this purpose. These projects include the configurations and sensible defaults to enable developers to write applications using the Dapr APIs without the hassle of downloading new tools, creating Kubernetes Clusters, or writing YAML files.

At the same time, this integration provides a simplified testing experience, and by relying on the Dapr APIs, developers can trust that the application will behave the same when running across different environments.

### Let’s code!

I wanted to code a simple application showing the Statestore Dapr APIs, highlighting how easy it is to get started and how developers can write and test applications that consume these APIs without adding any extra complexities to their development inner-loops.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/BGx73XBmHnQ?feature=oembed" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Back to basics: APIs to rule them all (Dapr Statestore APIs) #1"></iframe></div>

You can find the source code of this example here: <https://github.com/salaboy/dapr-spring-boot-basics>

To recap the most important parts that I’ve shown in the video:

You need this dependency added to your Spring Boot project to work with Dapr

```xml
<dependency>
  <groupId>io.diagrid.dapr</groupId>
  <artifactId>dapr-spring-boot-starter</artifactId>
  <version>0.10.6</version>
</dependency>
```

Then you need to create a Dapr Client to use the Dapr APIs:

```java
try (DaprClient client = new DaprClientBuilder().build())
```

You can save and get state from the Statestore API, to achieve these we can use the following methods:

```java
client.saveState(STATE_STORE_NAME, CUSTOMER_KEY + customer.id(), customer).block();
```

and:

```java
client.getState(STATE_STORE_NAME, CUSTOMER_KEY + customerId, Customer.class).block();
```

To test these APIs, you can use the Testcontainers integration that will start the Dapr Sidecar with an in-memory implementation for the statestore APIs and other sensible defaults (Basic Profile shown below).

By using new features provided by Spring Boot 3.1+, you can create a SpringBootApplication definition to be used by your tests. This configuration can include the Testcontainers integration by using the @ImportTestcontainers annotation:

```java
@SpringBootApplication
public class CustomerCatalogTestApp {
   public static void main(String[] args) {
       SpringApplication.from(CustomerCatalogApplication::main)
       .with(TestConfigurations.class)
        .run(args);
   }


  @ImportTestcontainers(DaprBasicProfile.class)
  static class TestConfigurations{

  }

}
```

This creates a new setup for tests that can also be used to start the application with `mvn spring-boot:test-run`.

### Sum up

In this blog post, we created a very simple Spring Boot application that uses the Dapr APIs. We didn’t introduce any new tools developers will need to learn besides the Dapr APIs used to interact with the Statestore Dapr building block.

Now that we have a simple app working with the APIs, we can explore more advanced use cases where Dapr shines. If you want to help me test these libraries and write more complex examples, get in touch, and let's build something together!

Stay tuned!

,
