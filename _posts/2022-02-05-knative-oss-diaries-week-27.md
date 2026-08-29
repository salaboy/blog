---
title: "Knative OSS Diaries - week #27"
date: 2022-02-05 10:31:13 +0000
permalink: /2022/02/05/knative-oss-diaries-week-27/
description: "This week was pretty exciting, I recorded my first appearance in the Changelog ShipIt Podcast from Gerhard Lazu and we had a pretty good conversation…"
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "tekton"
  - "cdevents"
  - "cloudnative"
  - "community"
  - "knative"
  - "oss"
  - "weekly"
original_url: https://www.salaboy.com/2022/02/05/knative-oss-diaries-week-27/
---

This week was pretty exciting, I recorded my first appearance in the [Changelog ShipIt Podcast](https://changelog.com/shipit) from [Gerhard Lazu](https://changelog.com/person/gerhard) and we had a pretty good conversation about the topics I love which include [Knative](http://knative.dev), Continuous Delivery, the [book I am writing](http://mng.bz/jjKP), the foundation and the [From Monolith to K8s](http://github.com/salaboy/from-monolith-to-k8s/) examples that I've been working from the last 3 or 4 years. I don't know exactly when the episode will be publically available, but make sure to subscribe to [Ship It](https://changelog.com/shipit) and any other [Changelog Podcast](https://changelog.com/) that you find interesting, they have a lot of interesting content and amazing guests!

[![Screenshot 2022 02 05 at 08.29.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/02/screenshot-2022-02-05-at-08.29.58.png)](https://changelog.com/shipit)

To close this amazing week I received some amazing news from [JBCNConf 2022](https://www.jbcnconf.com/2022/)! This will be my 10th year in a row speaking this conference! I am so looking forward to go to Barcelona, meet a lot of old and new friends and share my learning from the Go ecosystem (from a Java and Kubernetes developer perspective, of course!).

[![Logo jbcnconf](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/02/logo-jbcnconf.png)](https://www.jbcnconf.com/2022/)

Let's jump into some stuff that is on going and is worth sharing at this time.

### CD Foundation CloudEvents for CD Interoperability

In the past couple of weeks I've been collaborating with the [CD SIG-Events Working Group](https://github.com/cdfoundation/sig-events) from the CD Foundation around building a set of Kubernetes Controllers for [Knative Serving](https://github.com/salaboy/knative-serving-events-controller) & Eventing which will [produce and consume CD Events](https://github.com/cdfoundation/sig-events/issues/107). The main reason behind building these controllers is to use CloudEvents for enabling interoperability between tools in the CD space and integrations with other tools or software components, no matter if they run on Kubernetes or not.

By creating these components we iterate the CD Events vocabulary definitions and we make sure that what's defined in the specs can be used for real world use cases. Currently, most of the work is being done by [@Ishan Khare](https://github.com/ishankhare07), a community member interested in learning all the pieces required for getting these controllers out. Because he has been doing an amazing work, I am expecting a PoC showing how [Tekton](http://tekton.dev) and Knative can be integrated only by consuming and producing events from the CD Event Spec.

A good example of how the CD Events vocabulary can evolve to cover real-life scenarios is expressed in this issue <https://github.com/cdfoundation/sig-events/issues/111> which proposes adding a new event to the vocabulary to cover cases when a Service is deployed but also accessible to users, in the Kubernetes Cluster this might mean that there is a public URL available for users to access the service from outside the cluster.

Another good sign, is that there are request for creating a [Java SDK for CD Events](https://github.com/cdfoundation/sig-events/issues/110), so an extension to the CloudEvents SDK might make a lot of sense, but I know there are conversations happening about how to refactor the [current Go SDK](https://github.com/cdfoundation/sig-events/tree/main/cde/sdk/go).

The Working Group Leads are doing an amazing work pushing all these forward and I am looking forward to see CD Events in CD Con and as a [prominent initiative in the CD space](https://github.com/orgs/cdevents/) as now the group has a separated Org in Github and an awesome logo!

[![Cdevents](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/02/cdevents.png)](/content/images/2022/02/cdevents.png)

### Spring Cloud Functions & CloudEvents

Following on CloudEvents, this week I did some work around Spring Cloud Functions, more than work were experiments. I was interested to understand what current approach is to deal with [CloudEvents](http://cloudevents.io) when working with Spring, Spring Boot and more concretely [Spring Cloud Functions](https://spring.io/projects/spring-cloud-function).

Because Spring is such a mature framework, the concept of an envelope or wrapper to move around data across disparate systems has been around for long time. Mostly driven by [Spring Integrations](https://spring.io/projects/spring-integration), their abstraction is called [Message that contains Headers and a Payload](https://docs.spring.io/spring-integration/docs/current/reference/html/message.html#message) in a similar way that a [CloudEvent has Headers and Data](https://github.com/cloudevents/spec/blob/v1.0.1/spec.md#event-data). If you are using Java and already using Spring Boot, you are probably familiar with using Messages and by using messages you will have access to other tools in the ecosystem. Spring Integrations follows the [Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com/), to cover similar use cases as [Apache Camel](https://camel.apache.org/) would do if you were not in the Spring ecosystem.

On the other hand we have the [CloudEvents Java SDK](https://cloudevents.github.io/sdk-java/) which defines a [CloudEvent interface](https://github.com/cloudevents/sdk-java/blob/master/api/src/main/java/io/cloudevents/CloudEvent.java#L25) which similarly to Message in Spring Boot will allow you to encapsulate your domain-specific data and define a set of [CloudEvent attributes usually encoded as headers](https://github.com/cloudevents/sdk-java/blob/a4bc7a836890b69fb7eff81ccfa91d50d1010e6d/api/src/main/java/io/cloudevents/CloudEventAttributes.java#L34).

If you dig deeper, the CloudEvents Java SDK provides some Spring integration, meaning that you can create CloudEvents in the Spring ecosystem. If you are using Spring Boot, [you can find an example that I've published here](https://github.com/salaboy/fmtok8s-java-cloudevents/blob/main/pom.xml#L32) using the [CloudEvent Java SDK and Spring](/2022/01/29/event-driven-applications-with-cloudevents-on-kubernetes/), you can clone and run this project if you want to. I recommend you to explore the dependencies and check how you can create and consume a CloudEvent.

Now, if you jump to use [Spring Cloud Functions](https://spring.io/projects/spring-cloud-function), the programming model is different hence the framework takes more responsibility so you can focus on writing your functions logic. If you are writing functions, you are interested in an Event coming in which will trigger the function logic and when the logic is done an Event will go out. The Event that goes out can trigger one or more functions. At this point the event format or where the event is coming from doesn't matter much, as soon as we can read and write them, our functions will work. Spring Cloud Functions rely on the [Function interface](https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html) provided by the Java language.

@SpringBootApplication public class Application { public static void main(String[] args) { SpringApplication.run(Application.class, args); } @Bean public Function<String, String> uppercase() { return value -> value.toUpperCase(); } }

This very simple example, shows a function that consumes a String and returns a String, which shows the most basic thing that you can do, mutating a String. Where the input String comes from, it could be a CloudEvent or from a Message, the framework will take care of evaluating the incoming event and getting the payload/data for you to use inside your function. The same happens with the output String, which will need to be transformed by the framework to the right format.

An interesting detail from the Spring Cloud Functions perspective,  you should focus on writing your functions, hence the current implementation doesn't use directly the CloudEvents SDK to write CloudEvents, as most of the work is done using the Message abstraction. But you as a user have the option to use the CloudEvents SDK APIs to use CloudEvents types in your code, but this approach is limited compared with using Messages. Let's quickly check three examples: Using CloudEvents SDK APIs, using Java POJOs and using Messages.

CloudEvents example: <https://github.com/cloudevents/sdk-java/blob/master/examples/spring-function/src/main/java/io/cloudevents/examples/spring/DemoApplication.java>

@Bean public Function<CloudEvent, CloudEvent> events() { return event -> CloudEventBuilder.from(event) .withId(UUID.randomUUID().toString()) .withSource(URI.create("https://spring.io/foos")) .withType("io.spring.event.Foo") .withData(event.getData().toBytes()) .build(); }

You can see in this example, we can access to the CloudEvent metadata inside our function, because we have a CloudEvent object. We can also access the Payload/Data by using `event.getData()`. If we want to parse this data into a Java Object we will need to use something like Jackson if the data is encoded in JSON. At this point the framework cannot do much, as the CloudEvent interface is not parameterizable.

If we look now at [Spring Cloud Functions with POJOs](https://github.com/spring-cloud/spring-cloud-function/blob/main/spring-cloud-function-samples/function-sample-cloudevent/src/main/java/io/spring/cloudevent/DemoApplication.java), everything is kept simple, and it focus on the data

@Bean public Function<Person, Employee> hire() { return person -> { Employee employee = new Employee(person); return employee; }; }

In this example, we don't care about the envelope or the headers, we just care about the content of the event, hence the framework can do way much more, it will get an event, extract the data and hydrate the POJOs in this case Person is the input data. We can also return a POJO which will be automatically wrapped in a CloudEvent by the framework.

Finally, if you want to have more control, and you still want the framework to parse the data you can use [Messages which are parameterizable](https://github.com/spring-cloud/spring-cloud-function/blob/main/spring-cloud-function-samples/function-sample-cloudevent/src/main/java/io/spring/cloudevent/DemoApplication.java).

public Function<Message&lt;Person&gt;, Message&lt;Employee&gt;> hire() { return message -> { Person person = message.getPayload(); Employee employee = new Employee(person); return CloudEventMessageBuilder.withData(employee) .setId("123456") .setSource(URI.create("https://cloudevenets.sample")) .build(); }; }

With this example, we have a function that understand the data which is encoded inside the CloudEvent, but it can also access the CloudEvents headers using the Message abstraction. In my opinion, this is getting the best of both worlds, we are using CloudEvents, but we are letting the framework to take care of the parsing and encoding of the data

Check [Oleg's](https://spring.io/team/olegz) blogs (Spring Cloud Function team member) covering these topics in more details

- <https://spring.io/blog/2020/12/10/cloud-events-and-spring-part-1>
- <https://spring.io/blog/2020/12/23/cloud-events-and-spring-part-2>

### Knative Release and End-User representation in Steering

Last but not least, [Knative 1.2 was released 10 days ago already](https://github.com/knative/serving/releases/tag/knative-v1.2.0), so if you are running Knative I would recommend you to give that a try and report any issues that you might find.

My big congratulations to [Murugappan Sevugan Chetty](https://twitter.com/itsmurugappan) from Optum for being appointed new Knative Steering Committee member serving a 1-year term on the End User seat.

See you all next week!
