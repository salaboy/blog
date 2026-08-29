---
title: "Streams and Rest Endpoints"
date: 2017-07-26 13:54:21 +0000
permalink: /2017/07/26/streams-and-rest-endpoints/
description: "This blog post is about working with Spring Cloud Streams and Rest Endpoints using Spring Boot 2."
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "spring cloud"
  - "tutorial"
  - "example"
  - "microservices"
  - "open source"
original_url: https://www.salaboy.com/2017/07/26/streams-and-rest-endpoints/
---

This blog post is about working with Spring Cloud Streams and Rest Endpoints using Spring Boot 2. I'm writing this article to show how simple it is to create and test reactive components that expose both Rest and Message Based endpoints. This will two communication protocols will be the pillars of the new Activiti Services. It will allow our components to be reactive  easy to integrate with and consume.

## Example Project

I've created a small project to demonstrate how to work with Streams and Rest Endpoints and how to test both using @SpringBootTests. You can find the source code of this example here:

<https://github.com/Salaboy/test-spring-cloud-streams>

Feel free to clone the repo and run the example in your local environment.

This example uses Spring Cloud Streams ( Rabbit MQ Binder),  Spring Boot and Spring HATEOAS.

## Spring HATEOAS and RestTemplates

Spring HATEOAS makes it really easy to create HAL styled endpoints. In the example I'm just creating a controller and exposing a method:

```java
@RestController
@RequestMapping(value = "/api/", produces = MediaTypes.HAL_JSON_VALUE)
```

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/main/java/org/salaboy/streams/SampleApplication.java#L27

and

```java
@RequestMapping(value = "/messages", method = RequestMethod.GET)
public Resources&lt;String&gt; getMessages()
```

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/main/java/org/salaboy/streams/SampleApplication.java#L53

Until here nothing that you cannot find in a spring tutorial. In the same way, let's take a look at Spring Cloud Streams.

## Spring Cloud Streams

Spring Cloud Streams provides an high level abstraction to deal with streams of data, providing several binders that use different technologies to move information from one place to another. In the example I'm using the RabbitMQ Binder, but you can choose from Kafka and ActiveMQ seems to be supported as well.

In order to use Streams, as you might find also online in several tutorials you need to create an interface where you define your MessageChannels (@Outpus) and SubscribableChannels (@Inputs):

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/main/java/org/salaboy/streams/MyChannels.java

```java
public interface MyChannels {
  String MY_CONSUMER = "myConsumer";
@Input(MY_CONSUMER)
SubscribableChannel myConsumer();
String MY_PRODUCER = "myProducer";
@Output(MY_PRODUCER)
MessageChannel myProducer();
}
```

As soon as you have a Binder in the classpath, Spring will create the underlaying configuration required for you to have those channels available and ready to use. Spring Cloud Stream deals with each of the Binders differently, so it will make sure that the correct configuration is created based on the Binder that you have in the classpath.

Notice that if we have chosen the RabbitMQ Binder we need to have RabbitMQ running in our environment (Look at the readme to see how to start Rabbit MQ using docker-compose)

The only thing that we need to do in our application is to make sure that we

```java
@EnableBinding(MyChannels.class)
```

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/main/java/org/salaboy/streams/SampleApplication.java#L25

As soon a we have this in place we will be able to:

```java
@Autowired
  private MessageChannel myProducer;
```

To send messages and:

```java
@StreamListener(MyChannels.MY_CONSUMER)
  public void consumeMessages(String message)
```

To listen/consume messages.

The last, but not least piece in the puzzle are the properties defined in the application.properties file:

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/main/resources/application.properties

```xml
spring.cloud.stream.bindings.myConsumer.destination=messages
spring.cloud.stream.bindings.myConsumer.contentType=application/json
spring.cloud.stream.bindings.myProducer.destination=notifications
spring.cloud.stream.bindings.myProducer.contentType=application/json
```

Here we are just configuring the destination of both the consumer and the producer as well as the content type for the interactions. Notice that Spring Cloud Stream is also dealing with the data type coercion here as well as it does with the Resources in our Rest Endpoints. In other words, Spring Cloud Stream will try to convert/serialize our Message payloads using the defined content type, for this case application/json.

Now if you configured the spring boot plugin for maven you should be able to start the application by calling from a terminal:

```xml
mvn spring-boot:run
```

or

```xml
java -jar target/test-spring-cloud-streams-1.0-SNAPSHOT.jar
```

Now you can write client applications that interacts with the REST and Message based endpoints. But it will be better to have some tests to validate the logic of our services before even writing our clients. The next section shows how to test both endpoints in the same test.

## Testing all together

Now the real win here, is that you can test both Streams and Rest Endpoints in the same integration test against an instance of the real application.

In order to test our Rest Endpoints you can use the TestRestTemplate class

In your tests you can @Autowire an instance of TestRestTemplate class:

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/test/java/org/salaboy/streams/MyAppStreamsTest.java#L57

And then you can start executing exchanges with your endpoint like this:

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/test/java/org/salaboy/streams/MyAppStreamsTest.java#L74

It is important to understand that if you are writing a client application you should use the RestTemplate class to exchange data with your remote endpoints. The TestRestTemplate add some magic and inject some specific Headers for testing.

Also notice that by @Autowiring the instance of RestTemplate and TestRestTemplate you might get injected contextual information, so try to avoid creating new instances of these classes by hand.

Notice that the test is starting a new instance of your Spring boot application and then executing the test against that instance:

```java
@RunWith(SpringRunner.class)
  @SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
```

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/test/java/org/salaboy/streams/MyAppStreamsTest.java#L44

This simulates a client executing Rest requests to your application. This is quite a normal REST interaction between a client and the server with the addition of having HAL styled responses which will support typed Resource, Resources and PagedResources. The example is just showing how to deal with a String response but you can start adding complex types in there and Spring will handle all the data type coercion using Jackson.

Now in order to test our streams inside the application we need to @EnableBindings in our test class as well to act as our Client consumer and producer of messages. We will need to create a new interface to define our Client channels in the same way as a client application should do it. You can find the client interface here:

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/test/java/org/salaboy/streams/ClientStreams.java

If the bindings are enabled we can go straight and @Autowire our client Channels in the test class:

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/src/test/java/org/salaboy/streams/MyAppStreamsTest.java#L97

```java
@Autowired
  private MessageChannel myClientProducer;
@Autowired
private SubscribableChannel myClientConsumer;
```

Once we have this in place sending a message is quite simple:

```java
myClientProducer.send(MessageBuilder.withPayload(messageString).build());
```

Listening to messages is as simple as:

```java
myClientConsumer.subscribe(new MessageHandler() {
  @Override
  public void handleMessage(Message&lt;?&gt; message) throws MessagingException {
    System.out.println("&gt;&gt;&gt; Notification Arrived: " + message.getPayload());
  }
});
```

Finally notice the properties used for the client side testing which defines the bindings for the client defined streams. Notice how the clients needs to point to the queue defined in the application.properties "messages" and "notifications".

```xml
spring.application.name=test-streams
spring.cloud.stream.bindings.myClientProducer.destination=messages
spring.cloud.stream.bindings.myClientProducer.contentType=application/json
spring.cloud.stream.bindings.myClientConsumer.destination=notifications
spring.cloud.stream.bindings.myClientConsumer.contentType=application/json
```

Briefing it up, this test is doing the following:

1. Using the RestTemplate to call a Rest Endpoint that add messages to a list in the service (server side)
2. It is subscribing itself to the "notifications" queue to consume notifications when they are available
3. It is sending a message to the "messages" queue using the client producer.
4. It is using the RestTemplate to check that now the server side has 2 messages (it automatically start with 1)
5. It checks also that a notification was received in the notifications queue in the client side

## Details & Pitfalls

First of all look at the pom.xml file to see the dependencies that I'm using: https://github.com/Salaboy/test-spring-cloud-streams/blob/master/pom.xml#L1

Pay special attention to the versions that I'm using:

```xml
&lt;properties&gt;
  &lt;spring.boot.version&gt;2.0.0.M2&lt;/spring.boot.version&gt;
  &lt;spring.cloud.version&gt;Finchley.BUILD-SNAPSHOT&lt;/spring.cloud.version&gt;
  &lt;spring.cloud.stream.version&gt;Elmhurst.
                               BUILD-SNAPSHOT&lt;/spring.cloud.stream.version&gt;
&lt;/properties&gt;
```

Next look at the following dependency:

```xml
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
  &lt;artifactId&gt;spring-cloud-stream-binder-rabbit-test-support&lt;/artifactId&gt;
  &lt;scope&gt;test&lt;/scope&gt;
&lt;/dependency&gt;
```

This enable us to do:

```java
@ClassRule
  public static RabbitTestSupport rabbitTestSupport = new RabbitTestSupport();
```

Which is very handy, the test will not be executed if Rabbit MQ is not running or the test cannot connect to it.

Then notice the docker-compose.yml file inside the docker/ directory:

https://github.com/Salaboy/test-spring-cloud-streams/blob/master/docker/docker-compose.yml

This is just starting Rabbit MQ using a Docker container and making sure the correct ports are forwarded to our host machine. You can start Rabbit MQ in any way you want, no need to use docker for this.

Finally and something that took me several days to find out is that in order to test the RabbitMQ binder you need to make sure that you don't have the Test Binder in your classpath, because if that's the case your messages will go through the test binder and your application will never get the messages in the tests.

You can of course use the Test Binder if you are not interested in testing a specific binder and you don't want to have running RabbitMQ to test that your application is sending the correct messages. Take a look at the spring cloud stream docs for more information about the Test Binder: http://docs.spring.io/spring-cloud-stream/docs/Elmhurst.BUILD-SNAPSHOT/reference/htmlsingle/#_testing

So if your tests are not getting the messages that you are expecting look for this dependency in the classpath and remove it:

```xml
&lt;dependency&gt;
    &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
    &lt;artifactId&gt;spring-cloud-stream-test-support&lt;/artifactId&gt;
    &lt;scope&gt;test&lt;/scope&gt;
  &lt;/dependency&gt;
```

Once again, this is just a simple example, but feel free to send feedback, recommendations or questions about how to improve this simple example.

That's all for now, I hope that this blog post helps someone. If you keep an eye on the Activiti repository you will find that more and more services are going to be tested in this way.
