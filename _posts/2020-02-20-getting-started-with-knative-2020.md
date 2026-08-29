---
title: "Getting Started with Knative 2020"
date: 2020-02-20 12:09:48 +0000
permalink: /2020/02/20/getting-started-with-knative-2020/
description: "The Knative project offers a set of components to build cloud-native applications on top of Kubernetes."
tags:
  - "camunda"
  - "cloud"
  - "community"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "zeebe"
  - "cloud native"
  - "cloudevents"
  - "docker"
  - "knative"
  - "spring boot"
  - "spring cloud"
  - "tutorial"
original_url: https://www.salaboy.com/2020/02/20/getting-started-with-knative-2020/
---

The [Knative project](http://knative.dev) offers a set of components to build cloud-native applications on top of Kubernetes. These components offer higher-level abstractions enabling developers to focus on their actual services instead of all the boilerplate required to deploy their applications in Kubernetes.

This blog post is all about getting started with Knative as fast as possible so you can experiment with Knative features by getting your hands dirty. Unfortunately, you will realize rather soon that Knative has a steep learning curve. This is not due to Knative concepts and it is directly related to the tech stack on which it is built.

The main reason why I’ve created this blog post is to make sure that Java developers like myself can install and understand the basics of Knative with simple examples, so I can provide more advanced blog posts on how the Zeebe ( <http://zeebe.io> ) Knative integration will work, the main reasons behind it and how you can take advantage of it.

In this blog post you will learn:

- How to get started with Knative in your own cluster
- How to deploy and interact with a simple Knative Service with an HTTP endpoint,
- Send/Receive CloudEvents using HTTP transport
- Write a Spring Boot + Spring Cloud Streams applications that communicate sending Cloud Events using Kafka

## Installing Knative with Gloo

There are several ways to install Knative and most of them depend on Istio. In this blog post, I chose to use `glooctl` for simplicity and leveraging the fact that it uses fewer resources. `glooctl` replaces Istio with Gloo which is a lightweight ingress controller and provides all the features required by  Knative. Alternatively, you can install Knative from the project official documentation: <https://knative.dev/docs/install/>

You can find the full instructions here: <https://docs.solo.io/gloo/latest/installation/knative/>

If you are running on Mac OSX you can install `glooctl` with brew:

> brew install solo-io/tap/glooctl

Once you have `glooctl` and a Kubernetes Cluster up and running and reachable with `kubectl`, you can install Knative Serving and Eventing 0.12.0 with:

> glooctl install knative -g -e --install-knative-version=0.12.0

Once Knative is installed, we need to install Gloo as an API Gateway to route traffic from outside the cluster to our Knative workloads. We do this by using their Helm charts:

> helm repo add gloo https://storage.googleapis.com/solo-public-helm  
>   
> helm repo update

Let's create a new namespace for Gloo and install the Helm chart in there:

> kubectl create namespace gloo-system  
>   
> helm install gloo gloo/gloo --namespace gloo-system -f values.yaml

Where the values file that I am using looks like this

`values.yaml`

gateway: enabled: false settings: integrations: knative: enabled: true version: 0.12.0

With this, you now have Gloo ingress controller and Knative Serving and Eventing up and running.

The files listed here and in the other sections can be found in this GitHub repository: <https://github.com/salaboy/knative-getting-started-java-resources>

## What did I just install?

We just installed [Knative Serving](https://knative.dev/docs/serving/) and [Knative Eventing](https://knative.dev/docs/eventing/) into our Kubernetes Cluster.

Knative Serving provides an abstraction layer on top of Kubernetes Services Deployments and Ingress.

Knative Serving is usually mentioned when people talk about Serverless on top of Kubernetes, as it provides Zero Downscale features out of the box for our applications, something that can’t be achieved with plain Kubernetes. The main concept in Knative Serving is a Knative Service. Initially, I was totally confused with the naming choice. Why call it a Service if Kubernetes already has a resource called Service? You can consider a Knative Service as a Kubernetes Service + Deployment + Ingress on steroids. A Knative Service provides us with a high-level concept to build cloud-native applications without worrying about all the low-level components required in Kubernetes to deploy and access our applications.

Knative Services, for example, uses an autoscaler which enables our services to be scaled based on demand. Enabling our services to be scaled down to zero when they are not being used - you will notice that, because of this, the serverless term is used quite a lot in the Knative site. Plus it provides an automatic point in time snapshots of our deployed code and configurations, advance traffic routing built on top of a service mesh.

With Knative Eventing we can define Event producers and Event consumers in a decoupled way - enabling our applications to be built independently. Knative Eventing allows us to push the decision on how our applications will communicate with each other (transports) to later stages.

If you are a Java Developer like me, implementing services or microservices is something that we do by writing Spring Boot applications, these applications are going to be our Knative Services. If we are building highly scalable systems, it is quite common to rely on a messaging infrastructure to communicate our services. Messaging tools such as Kafka, RabbitMQ and others provide our services guarantees about message delivery and an out of the box retry mechanism for when things go wrong. On top of Spring Boot, we have frameworks such as [Spring Cloud Streams](/2017/07/26/streams-and-rest-endpoints/) that came to make our life easier by abstracting all the low-level details that we need to know while using these messaging tools (Kafka, RabbitMQ, Google PubSub, etc). This push us to understand how frameworks such as Spring Cloud Streams will work with Knative Eventing, so let’s get our hands dirty with some examples that you can run in your cluster.

## Did I hear “Hello World”?

Now we have Knative installed with Gloo, let’s give it a try by creating a simple example. As usual, for any Kubernetes deployment we will need to create our app, then a Docker Image and then some YAML files to deploy our application into a cluster. We will be pushing these Docker Images to http://hub.docker.com so you will need to have an account there.

Repository here: [https://github.com/salaboy/knative-hello-world](https://github.com/salaboy/knative-hello-world.git)

The simple SpringBoot Application in Java, which exposes a REST Endpoint

[`KnativeHelloWorldApplication.java`](https://github.com/salaboy/knative-hello-world/blob/master/src/main/java/com/salaboy/knative/knativehelloworld/KnativeHelloWorldApplication.java#L29)

@SpringBootApplication @RestController public class KnativeHelloWorldApplication { ... @GetMapping("/{name}") public String hello(@PathVariable("name") String name) { return "Hello there Knative Traveller: " + name; } ... }

We need to compile this project with

> mvn clean package

To generate the fat-jar into the `target/` directory.

The most basic **Dockerfile** using OpenJDK:11 slim

`Dockerfile`

FROM openjdk:11-jre-slim COPY target/*.jar /app.jar CMD ["java", "-jar", "app.jar"]

We need to build the docker image with:

> docker build -t /knative-hello-world .

And then push to docker hub with

> docker push /knative-hello-world

And here is where Knative starts helping us to focus on our business logic instead of writing tons of YAML files for Kubernetes. For Knative we just need a single Knative Service manifest:

`kservice.yaml`

apiVersion: serving.knative.dev/v1 kind: Service metadata: name: knative-hello-world spec: template: spec: containers: - image: salaboy/knative-hello-world

> kubectl apply -f kservice.yaml

When a Knative Service is created, Knative automatically creates other resources (Configuration, Route, and Revision) including a Kubernetes Service, a Deployment and an Ingress. On the Knative side the following resources are automatically created:

- service.serving.knative.dev
- route.serving.knative.dev
- configuration.serving.knative.dev
- revision.serving.knative.dev

![Null](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/02/null.png)

This Knative Service will be automatically downscaled to 0 if there is no traffic going hitting the service after 90 seconds of inactivity.

### Interacting with our new Knative Service

Once we have our Knative Service up and running we can get more information by using `kubectl` :

> kubectl get ksvc

We will see that the Knative Service exposes the URL that we can use to contact our Knative Service.

![Null](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/02/null-1.png)

But `http://knative-hello-world.default.example.com` is definitely not reachable as we probably don’t own the domain `example.com`. In order to find the external IP from our ingress controller we can run:

> kubectl get svc -A

This should list the `knative-external-proxy` which is a LoadBalancer and has an External IP

> gloo-system knative-external-proxy LoadBalancer &lt;INTERNAL IP&gt; &lt;EXTERNAL IP&gt;

Then with this address, we can curl our service by setting the Host header to the request, so it gets redirected inside the cluster to our Knative Service.

> curl -H "Host: knative-hello-world.default.example.com" http://&lt;EXTERNAL IP&gt;/salaboy -v

Notice: that we need to include the Host header just because we don’t have a publicly available domain.

**Curl -H what? Why?**

If you are running on a Cloud Provider which can provision a LoadBalancer with a Public Ip, something that we can do is use XIP.io and configure Gloo DNS to use a XIP.io address.

<https://knative.dev/docs/install/knative-with-gloo/> -> Configuring DNS

> kubectl edit cm config-domain --namespace knative-serving

And modify it to look like [this](https://github.com/salaboy/knative-getting-started-java-resources/blob/master/gloo/configmap-dns.yaml):

apiVersion: v1 kind: ConfigMap metadata: name: config-domain namespace: knative-serving data: # xip.io is a "magic" DNS provider, which resolves all DNS lookups for: # *.{ip}.xip.io to {ip}. &lt;EXTERNAL_IP&gt;.xip.io: ""

You can use XIP.io to have a subdomain which is linked to your transforming the previous curl to

> curl http://knative-hello-world.default.&lt;EXTERNAL IP&gt;.xip.io/salaboy -v

This is much nicer. With just a Knative Service deployment we have a public route that we can expose for people to consume outside the cluster. Notice, no Ingress + Service + Deployment configurations required besides our Knative Service. Knative Serving will take care of managing the lifecycle of all the Kubernetes Core resources required for our application to run.

## “Hello World”s are for kids, bring it on!

If we are designing a distributed system we might want to communicate between different services. [Cloud Events](https://cloudevents.io) are becoming a popular way to do that by interchanging data in a common format/envelope. Luckily for us, Knative Eventing already supports Cloud Events and we can use that straight away. Knative Eventing gives us a set of components that enable late-binding for event sources (producers) and event consumers. This means that we can create our consumers and producers in a generic way and then link them together at runtime.

Let’s start simple, let’s modify our simple Knative Service from before to accept Cloud Events. Cloud Events and how we receive them will vary depending on which transport we want to use, but the content will always be the same. Because we want to start simple, we will expose an HTTP endpoint to accept CloudEvents.

Repository here: [https://github.com/salaboy/knative-hello-world](https://github.com/salaboy/knative-hello-world.git)

In Spring Boot you will do something like [this](https://github.com/salaboy/knative-hello-world/blob/master/src/main/java/com/salaboy/knative/knativehelloworld/KnativeHelloWorldApplication.java#L37):

... @PostMapping public String recieveCloudEvent(@RequestHeader Map<String, String> headers, @RequestBody Object body) { CloudEvent<AttributesImpl, String> cloudEvent = CloudEventsHelper.parseFromRequest(headers, body); ... } ...

Now we can send a CloudEvent with curl by adding the right headers

> curl POST http://knative-hello-world.default.&lt;EXTERNAL IP&gt;.xip.io -H "Content-Type: application/json" -H "ce-id: 536808d3" -H "ce-type: my-first-cloud-event" -H "ce-source: curl" -d '{"name":"salaboy"}' -v

Notice: `ce-type: my-first-cloud-event` which represents what kind of event it is. We can use this to decide if we are interested in it or not. Both the data (send with `-d`) and the `ce-type` are user-defined. Cloud Events doesn’t impose any restrictions on the data that is sent.

Notice: `Content-Type: application/json`, to avoid sending a form-data content.

And there you go, now every other application producing CloudEvents can send events to our small application.

When you look at Knative you will find that there are a lot of available Event Sources already, for example, `KubernetesEventSource`, `GitHubSource`, `GcpPubSubSource`, `AwsSqsSource`, `ContainerSource`, `CronJobSource`, `KafkaSource`, `CamelSource`.

But let’s create our own producer, another spring boot application that just sends a CloudEvent by posting content via HTTP.

Repository here: [https://github.com/salaboy/knative-event-producer](https://github.com/salaboy/knative-event-producer.git)

`KnativeEventProducerApplication.java`

@SpringBootApplication @RestController public class KnativeEventProducerApplication { ... @Value("${SINK_HOST:localhost}") private String HOST; @GetMapping("/{name}") public String doSomethingAndSendCloudEvent(@PathVariable("name") String name) { final CloudEvent<AttributesImpl, String> myCloudEvent = CloudEventBuilder.&lt;String&gt;builder() .withId("ABC-123") .withType("my-first-cloud-event") .withSource(URI.create("knative-event-producer.default.svc.cluster.local")) .withData("{\"name\" : \"" + name + "-" + UUID.randomUUID().toString() + "\" }") .withDatacontenttype("application/json") .build(); WebClient webClient = WebClient.builder().baseUrl(HOST).filter(logRequest()).build(); WebClient.ResponseSpec postCloudEvent = CloudEventsHelper.createPostCloudEvent(webClient, myCloudEvent); postCloudEvent.bodyToMono(String.class).doOnError(t -> t.printStackTrace()) .doOnSuccess(s -> System.out.println("Result -> " + s)).subscribe(); return "OK!"; } ...

`kservice.yaml`

apiVersion: serving.knative.dev/v1 kind: Service metadata: name: knative-event-producer spec: template: spec: containers: - image: salaboy/knative-event-producer env: - name: SINK_HOST value: knative-hello-world.default.&lt;EXTERNAL IP&gt;.xip.io

Notice: now we are configuring the `SINK` for the events produced in our service with an Environment Variable called `SINK_HOST` and we are pointing to the internal DNS name for our `knative-hello-world` Service.

If you build the project, the Docker image and then apply this Knative Service manifest, you can curl the event producer to emit a CloudEvent to our Knative Hello World Service.

![Null](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/02/null-2.png)

Now you have two services exchanging data using CloudEvents, that is pretty cool, but let’s take it up a notch.

## Toys for Grownups (aka Kafka)

In a real distributed application, you might want to use all the power of messaging and streaming of information. For such scenarios, Kafka is becoming a very popular option, so let’s give it a try with Knative.

In this scenario, we will have an application producing Kafka messages and we want to route the content of these messages to our HTTP CloudEvent consumer endpoint. We haven’t designed any of these applications to talk to each other, but because we are using CloudEvents (and JSON payloads) they can now interchange information.

In order to get this working we need to:

- Install Kafka or have it running somewhere where it is reachable by the cluster
- Install KafkaSource for Knative
- Create a Kafka Source for Knative to understand where the messages are coming from and where are they going. This is referred to as ‘late binding’ because you change the source, create new ones or remove them in runtime.
- Produce Kafka messages

Let’s install Kafka in our cluster using Helm:

> helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator   
>   
> helm install my-kafka incubator/kafka

Next we need to install KafkaSource for Knative

> kubectl apply -f https://storage.googleapis.com/knative-releases/eventing-contrib/latest/kafka-source.yaml

Now we are ready to create our Kafka Source with a sink pointing to our `knative-hello-world` Knative Service:

`kafka-knative-source.yaml`

apiVersion: sources.eventing.knative.dev/v1alpha1 kind: KafkaSource metadata: name: kafka-source spec: consumerGroup: knative-group bootstrapServers: my-kafka:9092 #note the kafka namespace topics: knative-topic sink: ref: apiVersion: serving.knative.dev/v1 kind: Service name: knative-hello-world

Now we can send messages to the `knative-topic` and they will be automatically forward to our Knative Service called `knative-hello-world`. Notice that `my-kafka` is the name of the Kubernetes service that was created by installing Kafka with Helm.

![Null](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/02/null-3.png)

A very lazy way to post messages to the `knative-topic` might be using a Kafka client from a Docker container, like this:

> kubectl run kafka-producer -ti --image=strimzi/kafka:0.14.0-kafka-2.3.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list my-kafka:9092 --topic knative-topic

Then type a message in the prompt:

> > {"msg": "This is a test!"}

That will send a Kafka message, which will be transformed into a cloud event and forwarded to our HTTP Cloud Event consumer (`knative-hello-world` Knative Service).

## How would you do it for real?

In a real project, it really doesn’t matter how you produce the Kafka message. One option would be to just grab the Kafka Java APIs and make your application write messages to the previous Kafka topic. But if you really like the late-binding approach you can leverage that from your Spring Boot applications as well by using Spring Cloud Streams, which gives you a common API for different messaging providers.

If we want to now create a Spring Boot application that can send messages to the Kafka Topic that we previously defined, we just need to use Spring Cloud Streams dependencies and the Kafka Binder. You can find the source code of this example here:

<https://github.com/salaboy/knative-spring-cloud-event-producer>

`pom.xml`

&lt;dependencies&gt; &lt;dependency&gt; &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt; &lt;artifactId&gt;spring-cloud-stream&lt;/artifactId&gt; &lt;/dependency&gt; &lt;dependency&gt; &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt; &lt;artifactId&gt;spring-cloud-stream-binder-kafka&lt;/artifactId&gt; &lt;/dependency&gt; ... &lt;/dependencies&gt;

And then a simple application that sends messages

`KafkaProducerApplication.java`

@SpringBootApplication @EnableBinding(MyChannels.class) @EnableScheduling public class KafkaProducerApplication { @Autowired private MessageChannel myProducer; ... @Scheduled(fixedDelay = 3000) public void sendMessageEveryX() { System.out.println("> Sending a message..."); myProducer.send(MessageBuilder.withPayload("{\"name\":\"salaboy : " + UUID.randomUUID().toString() + " \"}").build()); } }

This simple app will send a message every 3 seconds, but where?

That is late binding in action. Where and which `binder` (which messaging implementation) can be defined later on. In this case, we can do that by changing the applications.properties file with:

`application.properties`

spring.cloud.stream.kafka.binder.brokers=my-kafka spring.cloud.stream.kafka.binder.defaultBrokerPort=9092 spring.cloud.stream.bindings.myProducer.destination=knative-topic

But because we are working with Docker, we can easily do that with Environment Variables as well. Meaning that our container will not have these details hard coded and we will be able to reuse the same docker image in different environments with different Kafka installations and different topics.

To build the project you can run:

> mvn clean package

You will need to build this docker image with:

> docker build -t /knative-spring-cloud-event-producer .

And then you can define your Knative Service:

`knative.yaml`

apiVersion: serving.knative.dev/v1 kind: Service metadata: name: knative-spring-cloud-event-producer spec: template: metadata: annotations: autoscaling.knative.dev/minScale: "1" spec: containers: - image: salaboy/knative-spring-cloud-event-producer

![Null](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/02/null-4.png)
> Notice: that our application doesn’t expect any HTTP request. By default, Knative autoscaler will downscale the application based on traffic. For this particular scenario, we don’t want our application to get downscaled, for that reason we use the annotation: `autoscaling.knative.dev/minScale: "1"`. This will keep at least one instance of our service running at all times.

You can create this Knative service by applying this file into your cluster:

> kubectl apply -f kservice.yaml

If you log the output of the knative-hello-world pod you will see that every 3 seconds you will receive a Cloud Event.

> kubectl logs -f knative-hello-world-

You can try removing the `autoscaling.knative.dev/minScale: "1"` and see how after 90 seconds your pod is scaled down to zero, as there is no traffic going to your event producer.

## Sum Up

There you have it, an example that uses Knative Serving + Knative Eventing + HTTP Transport Cloud Events + Knative Kafka Source + Spring Cloud Streams.

This is quite a mouthful, but this blog post covered all the pieces that you will need to build highly distributed applications that can scale using Knative and Kafka. As we have seen in this blog post, Knative provides a programming model on top of Kubernetes concepts which allows us to concentrate on our applications instead of how Kubernetes will deploy our application, or how it will route requests to it. Knative will automatically downscale to zero our service if it is not being used, something that cannot be achieved with plain Kubernetes. We have also experimented with Cloud Events and Knative Eventing, to demonstrate a powerful and robust approach to communicate between our services while using messaging and late binding.

In future blog posts, I will be sharing some details about how Knative and Zeebe ( <http://zeebe.io> ) integration is being built to provide features such as:

- Long-lived and highly scalable orchestration Service and functions orchestration leveraging late binding
- Cloud Events orchestration, sequencing, and monitoring
- A framework for application development built on top of Knative which provides business visibility and business insights to non-technical people

If you have comments, suggestions or questions feel free to reach out as I will be evolving the examples.
