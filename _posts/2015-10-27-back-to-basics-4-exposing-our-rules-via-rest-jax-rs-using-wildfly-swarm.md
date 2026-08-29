---
title: "Back To Basics #4: Exposing our Rules via REST (JAX-RS) using Wildfly Swarm"
date: 2015-10-27 22:18:15 +0000
permalink: /2015/10/27/back-to-basics-4-exposing-our-rules-via-rest-jax-rs-using-wildfly-swarm/
description: "It is a common requirement nowadays to access to our Rule Engine Instances as REST services. On this blog post I will show an extremely simple example on…"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/kie.png
tags:
  - "community"
  - "Drools"
  - "English"
  - "Java"
  - "tutorial"
  - "basic"
  - "rules"
original_url: https://www.salaboy.com/2015/10/27/back-to-basics-4-exposing-our-rules-via-rest-jax-rs-using-wildfly-swarm/
---

It is a common requirement nowadays to access to our Rule Engine Instances as REST services. On this blog post I will show an extremely simple example on how you can expose your domain specific interfaces that you can use to encapsulate KieSessions. This post builds up on my previous three posts: [first](/2015/10/20/back-to-the-basics-getting-started-with-drools-6-3-0-final/), [second](/2015/10/21/back-to-the-basics-2-testing-rules-with-arquillian-basics/), [third](/2015/10/23/back-to-basics-3-using-drools-kie-ci-continuous-integration/).

We will be using [Wildfly Swarm](http://wildfly.org/swarm/) to create a Fat-Jar that we will be able to run without the need of installing a full blown Java EE application Server. This approach is very good when you need full control about the REST interfaces that you want to expose to  your client applications. For a more general use and for an already built in approach you can take a look a the new KIE Server, something that I will cover in future posts as well.

## Introduction

One of the most interesting aspect of Drools is the fact that it can be embedded inside our services without too much overhead or complications. The fact that we can start as many instances as we want gives us the ultimate power to create and destroy KieSessions as we need.

The example that we are looking at here contains most of the pieces that you will find in real applications. And for that reason we have 3 different projects:

1. **drools-user-model**: this module contains our Business Entities, for this example just the User class.
2. **drools-user-kjar**: contains our rules. This package will be resolve by the KIE-CI module.
3. **drools-jax-rs**: provides the JAX-RS REST endpoints for our service.

You can find the sources here: <https://github.com/Salaboy/drools-workshop/tree/master/drools-rest-swarm>

![Dependency between modules](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/drools-jax-rs-example.png)

*Dependency between modules*

As you may notice the Service Layer (drools-jax-rs project) doesn't need to know about the rules, because we are going to use KIE-CI to resolve them in the same way that we did that in my previous post. The Service Layer depends on the Model (drools-user-model) because the methods in the endpoint interface uses the User object as part of the contract of the service that is being provided. The KJAR, has an implicit dependency on the Model, just because the rules will need the Model classes to be compiled and executed, but there is no need to have a direct dependency at the project level.

The boundaries in the previous diagram is the Fat-Jar that we are going to generate with Wildfly Swarm Maven plugin, that will package us a Jar file that we can directly execute, without installing anything else in our environment besides Java.

## Our (Micro)Service

The more I read about MicroServices the more I feel that Drools fits perfectly inside and around these services that we will be defining. There are several ways in which Drools can be used as part of our Services or to coordinate them based on business requirements. We will keep this example ultra simple, and for this reason, in this case, our service contract will look like this:

[UserCategorizationService](https://github.com/Salaboy/drools-workshop/blob/master/drools-rest-swarm/drools-jax-rs/src/main/java/org/drools/workshop/endpoint/api/UserCategorizationService.java)

```java
@Path("users")
public interface UserCategorizationService {
  @POST
  @Consumes("application/json")
  @Produces("application/json")
  @Path("/categorize")
  public User categorizeUser(@NotNull User user);
}
```

Our service will be in charge of categorise our Users based on their properties. From the clients point of view, it doesn't really matter how this categorisation is done, as soon as the user is categorised correctly. Internally from our company, we know that these categories will change from time to time, so we have chosen to use Rules to do these categorisations. We will be able to  update these rules as soon as the company decides to add, remove or even change the way that these categories are applied.

Internally the UserCategorizationServiceImpl delegates to a KieSession the responsibility of categorizing the User.

```java
@Inject
@KReleaseId(groupId = "org.drools.workshop", artifactId = "drools-user-kjar", version = "1.0-SNAPSHOT")
@KSession
private KieSession kSession;
@Override
public User categorizeUser(User user) {
kSession.insert(user);
int fired = kSession.fireAllRules();
return user;
}
```

Until here, nothing new right? Same as in my previous post we are using the @KReleaseId to locate the artefact that contains our Rules Definitions. Remember that to get this working, you need to compile the drools-user-kjar project before trying to access this service instance, so KIE-CI can pick it up from the Maven repository.

The only new thing here is how we are going to package, deploy and run our service. As mentioned in the introduction, we are going to use Wildfly Swarm to create a Fat Jar, and for that reason our drools-jax-rs/pom.xml contains the following extra dependencies:

```xml
<dependency>
<groupId>javax</groupId>
<artifactId>javaee-web-api</artifactId>
<version>7.0</version>
<scope>provided</scope>
</dependency>
<dependency>
<groupId>org.wildfly.swarm</groupId>
<artifactId>wildfly-swarm-jaxrs-weld</artifactId>
<version>${version.wildfly-swarm}</version>
</dependency>
```

and the following plugin:

```xml
<plugin>
  <groupId>org.wildfly.swarm</groupId>
  <artifactId>wildfly-swarm-plugin</artifactId>
  <version>${version.wildfly-swarm}</version>
  <executions>
    <execution>
      <goals>
        <goal>package</goal>
      </goals>
    </execution>
  </executions>
</plugin>
```

and voila! When we package our project the ***wildly-swarm-plugin*** will create a Fat Jar that can be executed.

## Interacting with our Service

Now we need to start our service first in order to start sending user to be categorised. Make you that you compile the three projects by executing mvn clean install from the root directory.

Now inside the **drools-jax-rs** you can go to the target/ directory and you will find the following packaged artifacts:

- drools-jax-rs-1.0-SNAPSHOT-swarm.jar
- drools-jax-rs-1.0-SNAPSHOT.war

We have two options here, deploy the ***drools-jax-rs-1.0-SNAPSHOT.war*** into a wildfly application server or just execute our fat jar ***drools-jax-rs-1.0-SNAPSHOT-swarm.jar*** from the terminal. The main approach of having a Fat Jar is to avoid the need of installing and configuring an Application Server. The Fat Jar is self-contained and it only requires some to start it up.

So in order to start our fat jar we only need to run:

```bash
java -jar drools-jax-rs-1.0-SNAPSHOT-swarm.jar
```

You should be able to see something like this: (Click to Expand)

```bash
salaboy$ <strong>java -jar drools-jax-rs-1.0-SNAPSHOT-swarm.jar&nbsp;</strong>
tmpDir: /var/folders/8j/cb5yh6795kggdy056zbdn5bh0000gn/T/
21:37:00,612 INFO&nbsp; [org.jboss.msc] (main) JBoss MSC version 1.2.6.Final
21:37:00,783 INFO&nbsp; [org.jboss.as] (MSC service thread 1-6) WFLYSRV0049: WildFly Core 2.0.0.Beta1 "Kenny" starting
2015-10-27 21:37:01,742 WARN&nbsp; [org.jboss.as.txn] (ServerService Thread Pool -- 16) WFLYTX0013: Node identifier property is set to the default value. Please make sure it is unique.
2015-10-27 21:37:01,758 INFO&nbsp; [org.wildfly.extension.io] (ServerService Thread Pool -- 18) WFLYIO001: Worker 'default' has auto-configured to 8 core threads with 64 task threads based on your 4 available processors
2015-10-27 21:37:01,770 INFO&nbsp; [org.jboss.as.naming] (ServerService Thread Pool -- 19) WFLYNAM0001: Activating Naming Subsystem
2015-10-27 21:37:01,777 INFO&nbsp; [org.jboss.as.security] (ServerService Thread Pool -- 17) WFLYSEC0002: Activating Security Subsystem
2015-10-27 21:37:01,780 INFO&nbsp; [org.jboss.as.security] (MSC service thread 1-7) WFLYSEC0001: Current PicketBox version=4.9.2.Final
2015-10-27 21:37:01,834 INFO&nbsp; [org.wildfly.extension.undertow] (ServerService Thread Pool -- 14) WFLYUT0003: Undertow 1.3.0.Beta6 starting
2015-10-27 21:37:01,834 INFO&nbsp; [org.wildfly.extension.undertow] (MSC service thread 1-5) WFLYUT0003: Undertow 1.3.0.Beta6 starting
2015-10-27 21:37:01,853 INFO&nbsp; [org.jboss.as.naming] (MSC service thread 1-3) WFLYNAM0003: Starting Naming Service
2015-10-27 21:37:01,909 INFO&nbsp; [org.xnio] (MSC service thread 1-8) XNIO version 3.3.1.Final
2015-10-27 21:37:01,919 INFO&nbsp; [org.xnio.nio] (MSC service thread 1-8) XNIO NIO Implementation Version 3.3.1.Final
2015-10-27 21:37:01,989 INFO&nbsp; [org.wildfly.extension.undertow] (MSC service thread 1-4) WFLYUT0012: Started server default-server.
2015-10-27 21:37:02,062 INFO&nbsp; [org.wildfly.extension.undertow] (MSC service thread 1-4) WFLYUT0006: Undertow HTTP listener default listening on /0:0:0:0:0:0:0:0:8080
2015-10-27 21:37:02,206 INFO&nbsp; [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: WildFly Core 2.0.0.Beta1 "Kenny" started in 1658ms - Started 83 of 91 services (17 services are lazy, passive or on-demand)
2015-10-27 21:37:03,592 INFO&nbsp; [org.jboss.as.server.deployment] (MSC service thread 1-3) WFLYSRV0027: Starting deployment of "drools-jax-rs-1.0-SNAPSHOT.war" (runtime-name: "drools-jax-rs-1.0-SNAPSHOT.war")
2015-10-27 21:37:05,791 INFO&nbsp; [org.jboss.weld.deployer] (MSC service thread 1-6) WFLYWELD0003: Processing weld deployment drools-jax-rs-1.0-SNAPSHOT.war
2015-10-27 21:37:06,036 INFO&nbsp; [org.hibernate.validator.internal.util.Version] (MSC service thread 1-6) HV000001: Hibernate Validator 5.2.1.Final
2015-10-27 21:37:06,210 INFO&nbsp; [org.jboss.weld.deployer] (MSC service thread 1-4) WFLYWELD0006: Starting Services for CDI deployment: drools-jax-rs-1.0-SNAPSHOT.war
2015-10-27 21:37:06,256 INFO&nbsp; [org.jboss.weld.Version] (MSC service thread 1-4) WELD-000900: 2.3.0 (Beta3)
2015-10-27 21:37:06,284 INFO&nbsp; [org.wildfly.extension.undertow] (MSC service thread 1-7) WFLYUT0018: Host default-host starting
2015-10-27 21:37:06,290 INFO&nbsp; [org.jboss.weld.deployer] (MSC service thread 1-4) WFLYWELD0009: Starting weld service for deployment drools-jax-rs-1.0-SNAPSHOT.war
2015-10-27 21:37:06,788 WARN&nbsp; [org.kie.scanner.embedder.MavenSettings] (MSC service thread 1-8) Environment variable M2_HOME is not set
2015-10-27 21:37:07,151 INFO&nbsp; [org.kie.scanner.embedder.MavenEmbedderUtils] (MSC service thread 1-8) Not in OSGi: using plexus based maven parser
2015-10-27 21:37:08,679 INFO&nbsp; [org.drools.compiler.kie.builder.impl.KieRepositoryImpl] (MSC service thread 1-8) KieModule was added: ZipKieModule[releaseId=org.drools.workshop:drools-user-kjar:1.0-SNAPSHOT,file=/Users/salaboy/.m2/repository/org/drools/workshop/drools-user-kjar/1.0-SNAPSHOT/drools-user-kjar-1.0-SNAPSHOT.jar]
2015-10-27 21:37:08,752 WARN&nbsp; [org.jboss.weld.Validator] (Weld Thread Pool -- 3) WELD-001473: javax.enterprise.inject.spi.Bean implementation org.drools.compiler.cdi.KieCDIExtension$StatefulKSessionBean@3833f06d declared a normal scope but does not implement javax.enterprise.inject.spi.PassivationCapable. It won't be possible to inject this bean into a bean with a passivating scope (@SessionScoped, @ConversationScoped). This can be fixed by assigning the Bean implementation a unique id by implementing the PassivationCapable interface.
2015-10-27 21:37:09,040 INFO&nbsp; [org.jboss.resteasy.spi.ResteasyDeployment] (ServerService Thread Pool -- 14) Deploying javax.ws.rs.core.Application: class org.drools.workshop.config.ApplicationConfig$Proxy$_$_WeldClientProxy
2015-10-27 21:37:09,045 INFO&nbsp; [org.jboss.resteasy.spi.ResteasyDeployment] (ServerService Thread Pool -- 14) Adding class resource org.drools.workshop.endpoint.impl.UserCategorizationServiceImpl from Application class org.drools.workshop.config.ApplicationConfig$Proxy$_$_WeldClientProxy
2015-10-27 21:37:09,082 INFO&nbsp; [org.wildfly.extension.undertow] (ServerService Thread Pool -- 14) WFLYUT0021: Registered web context: /
<strong>2015-10-27 21:37:09,118 INFO&nbsp; [org.jboss.as.server] (main) WFLYSRV0010: Deployed "drools-jax-rs-1.0-SNAPSHOT.war" (runtime-name : "drools-jax-rs-1.0-SNAPSHOT.war")</strong>
```

Now your service is up and running and you can start interacting with it.

In order to do that, you can write a JavaScript client, a Java Client, or even an Android Client to call the rest services that we just exposed. Here for testing purposes I'm using [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en), a Google Chrome Extension that allows you to build HTTP requests.

![creating a request with Postman](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/screen-shot-2015-10-27-at-21-42-12.png)

*creating a request with Postman*

Here you can see that I'm sending a User object (in JSON) using a POST HTTP request to the <http://localhost:8080/api/users/categorize> endpoint and the service is returning the same object but now with the category field set to "Adult".

## Summary

On this blog post, we saw how to put all the pieces together to get our rules bundled inside our micro-service. For this kind of scenarios we want to abstract the end user for the implementation details of our service, even hiding the underlaying technology that we are using and enabling the client to be written in any programming language that supports the creation of HTTP calls.

We saw how to use [Wildfly Swarm](http://wildfly.org/swarm/) to create a self contained package that can be executed without previously installing anything else but Java. In my next post I will go one step further and we will be using [Docker](https://www.docker.com) to remove the need of installing Java and to make our micro service one step forward to be cloud enabled.

PS: I know that these posts looks a little bit rough and unpolished, so feel free to ask questions if there is something that is not explained in detail.
