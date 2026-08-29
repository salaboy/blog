---
title: "Extending Platforms with WebAssembly"
date: 2023-04-15 09:44:04 +0000
permalink: /2023/04/15/extending-platforms-with-webassembly/
description: "Webassembly is becoming a popular way of extending existing tools with extra functionality."
tags:
  - "cloud-native"
  - "kubecon"
  - "platforms"
  - "webassembly"
  - "wazero"
  - "darp"
  - "statestore"
  - "pubsub"
  - "distributed"
  - "amsterdam"
  - "distributed applications"
original_url: https://www.salaboy.com/2023/04/15/extending-platforms-with-webassembly/
---

You will be gluing many pieces and existing projects when building platforms. You will be tempted to write your in-house solutions if a tool/project doesn’t do 100% of what you need to solve the problem.

This blog post will look at a pattern that is becoming popular, creating extension points with [WebAssembly](https://webassembly.org/). To understand the context of why this is important and how it plays in the Cloud Native space, we will be using the [Dapr](https://dapr.io) project as an example, as it recently added [WebAssembly](https://webassembly.org/) integration for one of its extension points.

## What is Dapr, and why is it essential when Building Platforms?

[Dapr](https://dapr.io) is a Distributed Application Runtime. Initially, the name didn’t mean much to me. It is a framework for building distributed applications. It sounds really abstract at first. Looking at the <https://dapr.io> website, you can quickly see that Dapr aims to solve everyday challenges by providing users with ***Dapr Components*** that implement different behaviors.

![Screenshot 2023 04 12 at 08.40.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/Screenshot-2023-04-12-at-08.40.07.png)

Immediately three Dapr components caught my attention: ***State Management, Publish & Subscribe, and Service Invocation***. Let’s see what this means to Platform Teams in charge of building platforms that Development Teams can use.

Imagine that your application development teams are in charge of building an application that looks like this:

![Kubecon eu 01 apps](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/kubecon-eu-01-apps.png)

They have applications that write data to a persistent store *(Write App - Yellow)*, let’s say, a database, a bucket, or the filesystem. Applications that read data *(Read App - Green)* from storage and make some processing and applications that want to be subscribed to notifications that happen asynchronously *(Subscriber App - Purple)*.

To access all the functionality these backend applications provide, a Frontend application glues all these backend services together to make them accessible to our end users.

From the platform team's perspective, they must sort out what that Cloud is in the middle of the applications. What storage will these applications use, and what message broker will deal with notifications? They need to understand what these applications do to know how these components will be configured and tuned. Questions like: will we run these components on-premise or on a Cloud Provider? What about security? Do we need backups? What about data encryption?

Platform teams should strive not to push application development teams to answer any of these questions. A clear separation between what infrastructure and development teams need to know to build their features is fundamental to increasing development velocity. If teams can focus on building features and working with well-known APIs, they wouldn’t need to worry about where the platform will store data or what it will use to move messages between applications.

For example, we use Redis, a Key/Value store, to persist and read data from our Writer and Reader applications. And the platform team decide to use Kafka as a message broker to deal with asynchronous messaging for the Subscriber App.

![Kubecon eu 02 apps without dapr](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/kubecon-eu-02-apps-without-dapr.png)

As you can see now, applications must include the Redis and Kafka Client into their applications as a library/dependency. Application developers are now in charge of ensuring that they have the correct version and sometimes make sure that they have the right one, meaning that there might be multiple libraries to connect or interact with these infrastructure components. For some components that are not popular enough, developers might struggle to find a library/client that works for their technology stack.

Another challenge that application developers will face when building applications like the one described above is made apparent in the Frontend application that needs to interact with all the backend components. Imagine that you make these interactions using HTTP requests. To make sure that the application is reliable other frameworks and tools must be used to, for example, retry the request if, for some reason, any of the backend services go down. Retries and Circuit breakers are very common patterns you will need to implement for your distributed applications, pushing your developers to choose which libraries they use for implementing those behaviors. Forcing developers to make all these decisions that had nothing to do with the applications that they are building represents an enormous waste of time and resources.

Dapr was created to solve some of these challenges and to provide a clear separation of concerns between developers and platform teams. If you are running your application on Kubernetes and install Dapr into your Kubernetes Cluster, your application can make use of ***Dapr Components*** like in the image below:

![Kubecon eu 03 apps with dapr](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/kubecon-eu-03-apps-with-dapr.png)

With Dapr Components, like, for example, the Dapr `Statestore` and `PubSub` your applications can now rely on the Dapr local APIs instead of interacting directly with the infrastructure components such as Redis and Kafka as shown in the diagram. Dapr works by injecting a sidecar into your application Kubernetes Pod. This enables the application code to make local calls to HTTP/gRPC to Dapr Components.

> If you are not into sidecars, check this alternative: <https://github.com/dapr-sandbox/dapr-ambient>

Both the `Statestore` and `PubSub` components are configured using Kubernetes Resources. Look at these Kubernetes resources here: [statestore.yaml](https://github.com/salaboy/kubecon-eu-2023/blob/main/resources/statestore.yaml) and [pubsub.yaml](https://github.com/salaboy/kubecon-eu-2023/blob/main/resources/pubsub.yaml)

I’ve created the application and a step-by-step tutorial for you to run in your own Kubernetes Cluster that you can find here: <https://github.com/salaboy/kubecon-eu-2023>

If you run this application, it should look like this:

![Kubecon eu 05 app frontend](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/kubecon-eu-05-app-frontend.png)

By using [Dapr](https://dapr.io), Platform teams can change the ***Dapr Components*** configuration to use different instances of Redis and Kafka for different environments or to change them for other implementations, for example, PostgreSQL and RabbitMQ or a Cloud-Provider managed database and message broker.

Using Dapr in the Frontend application, platform teams can configure [resiliency policies](https://docs.dapr.io/getting-started/quickstarts/resiliency/resiliency-serviceinvo-quickstart/) for retry and circuit breakers without changing the application source code.

And one more important thing about Dapr. Because Dapr now controls the incoming and outgoing traffic from the application’s services, Platform teams can customize and add filters to the HTTP processing pipelines using a component called Middleware.

![Middleware](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/middleware.png)

With Middleware components, you can process the incoming and outgoing requests with already standard filters that you can find in this list: <https://docs.dapr.io/reference/components-reference/supported-middleware/>

![Screenshot 2023 04 15 at 10.36.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/Screenshot-2023-04-15-at-10.36.21.png)

OAuth2, Rate Limiting, and applying OPA policies are great examples of what can be done by using these Middleware components, but what happens if you want to do something very specific to your scenario? You want to add an HTTP header that requires some calculation done by a company-specific library, or you want to change and adapt the URL parameters of the request to something that you cannot know in advance. Changing Dapr or adding that logic to your application code is too complicated. There is why the last Middleware component, the WASM middleware component, was born.

## Where does WebAssembly fit here?

As defined in the <https://webassembly.org/> site:

***“WebAssembly (abbreviated Wasm) is a binary instruction format for a stack-based virtual machine. Wasm is designed as a portable compilation target for programming languages, enabling deployment on the web for client and server applications.”***

WebAssembly was born in the browser, and it is quite low-level as it was designed to be compiled and run anywhere you have a WebAssembly runtime. It is still early days for WebAssembly, but looking at how the Kubernetes and Docker communities and adopting it, I can see it gaining momentum on the server side too.

For our use case and similar use cases in the Service Mesh space, it makes a lot of sense to enable developers to write WebAssembly code, compile it and run it on existing components running as part of the infrastructure.

Writing WebAssembly directly is too low-level, in my opinion. Hence writing your extensions using popular languages like Go and then compiling them into WebAssembly makes a lot of sense. But you still need to have a WebAssembly Runtime, which is exactly what the Dapr WASM Middleware component provides. This component extends the Dapr sidecar with a WebAssembly runtime called [Wazero (by Tetrate)](https://wazero.io/), which does not add any other CGO dependencies to our Dapr sidecar.

![Dapr wazero](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/dapr-wazero.png)

For our example, this will look like this:

![Kubecon eu 04 apps with dapr wazero](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/kubecon-eu-04-apps-with-dapr-wazero.png)

I created a `filter.go` file implementing my custom HTTP filter. Then we can compile it into WebAssembly using TinyGo, a project that can compile directly into WASM files. With this line, you compile a Go file into a WASM file:

```
tinygo build -o filter.wasm -scheduler=none --no-debug -target=wasi filter.go
```

Then to wire things up, we need to create a [Middleware component](https://github.com/salaboy/kubecon-eu-2023/blob/main/resources/middleware.yaml) and a [Dapr Configuration](https://github.com/salaboy/kubecon-eu-2023/blob/main/resources/configuration.yaml) to ensure that the Dapr Sidecar knows where the HTTP filter needs to be added. Finally, we need to make the `filter.wasm` file available to the Dapr sidecar, and for this example, I’ve used a Kubernetes ConfigMap, but we are looking into other ways of making these extension files available to the Dapr runtime (for example, this: issue).

If you follow the step-by-step tutorial, you will see that if you submit text to your application using the Frontend application, a text like this `:metal:` is transformed to 🤘. This is a silly example of what the filters can do, but you can access the request to modify it, add headers, change the URI, etc.

![Kubecon eu 06 app with emojis](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/kubecon-eu-06-app-with-emojis.png)

We can recognize emoji tags and render them with the newly added Middleware HTTP filter. We added one more feature to the filter. For now, the platform team has decided to ban cat emojis, but they plan to add them again after fixing some CVEs 😺. Dogs are always welcome! 🐶

Remember, if you want to try this application and play around with the configurations needed to get this working, you can follow the step-by-step tutorial here: <https://github.com/salaboy/kubecon-eu-2023>

## Sum Up

This is just an example of how [WebAssembly](https://webassembly.org/) can be used as extension points to enable platforms to extend the default behavior provided by tools like [Dapr](https://dapr.io). The fact that you can compile your code into WebAssembly using different tools is promising, as writing WebAssembly directly makes no sense to me. Tools like [Wazero](https://wazero.io/) provides a great way to embed a WASM runtime into your Go applications without adding extra dependencies.

The WASM community is having a colocated [WASM Day at KubeCon EU](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-wasm-day/). I am watching for projects like [RunWASI](https://github.com/containerd/runwasi) from `containerd`, which enable our Kubernetes Cluster to run containers and WASM programs side by side. I look forward to meeting some of these projects face-to-face and seeing where they are heading.

Time to get ready for [KubeCon EU](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/) now! If you are heading to Amsterdam see you at the [Diagrid](https://diagrid.io)/[Dapr](https://dapr.io) booth! Come and say hi!

![Back wall](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/04/Back-wall--1-.png)
