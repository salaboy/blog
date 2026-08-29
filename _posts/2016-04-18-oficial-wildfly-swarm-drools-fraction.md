---
title: "Oficial Wildfly Swarm #Drools Fraction"
date: 2016-04-18 13:17:09 +0000
permalink: /2016/04/18/oficial-wildfly-swarm-drools-fraction/
description: "Oficial what? Long title for a quite small but useful contribution. Wildfly Swarm allows us to create rather small and self contained application…"
tags:
  - "community"
  - "Drools"
  - "drools training"
  - "engine"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "rule engine"
  - "tutorial"
  - "workshop"
  - "rules"
  - "services"
original_url: https://www.salaboy.com/2016/04/18/oficial-wildfly-swarm-drools-fraction/
---

Oficial what? Long title for a quite small but useful contribution. [Wildfly Swarm](http://wildfly-swarm.io) allows us to create rather small and self contained application including just what we need from the Wildfly Application Server. On this post we will be looking at the [Drools Fraction](https://github.com/wildfly-swarm/wildfly-swarm-drools) provided to work with [Wildfly Swarm](http://wildfly-swarm.io). The main idea behind this fraction is to provide a quick way to bundle the Drools Server among with your own services inside a jar file that you can run anywhere.

## Microservices World

Nowadays, while micro services are a trending topic we need to make sure that we can bundle our services as decoupled from other software as possible. For such a task, we can use Wildfly Swarm that allows us to create our services using a set of fractions instead of a whole JEE container. It also saves us a lot of time by allowing us to run our application without the need of downloading or installing a JEE container. With Swarm we will be able to just run java -jar &lt;our services.jar&gt; and we are ready to go.

In the particular case of Drools, the project provides a Web Application called Kie-Server (Drools Server) which offers a set of REST/SOAP/JMS endpoints to use as a service. You can load your domain specific rules inside this server and create new containers to use your different set of rules. But again, if we want to use it, we will need to worry about how to install it in Tomcat, Wildfly, Jetty, WebSphere, WebLogic, or any other Servlet Container. Each of these containers represent a different challenge while it comes to configurations, so instead of that we can start using the Wildfly Swarm Drools Fraction, which basically enables the Drools Server inside your Wildfly Swarm application. In a way you are bundling the Drools Server with your own custom services. By doing this, you can start the Drools Server by doing java -jar &lt;your.jar&gt; and you ready to go.

Imagine the other situation of dealing with several instances of Servlet Containers and deploying the WAR file to each of those containers. It gets worst if those containers are not all the same "brand" and version.

So let's take a quick look at an example of how you can get started using the Wildfly Swarm Drools Fraction.

## Example

I recommend you to take a look at the [Wildfly Swarm Documentation](https://wildfly-swarm.gitbooks.io/wildfly-swarm-users-guide/content/) first, to get you started on using Wildfly Swarm. If you know the basics, then you can include the Drools Fraction.

I've created an example using this fraction here: <https://github.com/Salaboy/drools-workshop/tree/master/drools-server-swarm>

The main goal of this example is to show how simple is to get you started with the Drools Fraction, and for that reason I'm not including any other service in this project. You are not restricted by that, and you can expose your own endpoints.

Notice in the pom.xml file two things:

1. The Drools Server Fraction: <https://github.com/Salaboy/drools-workshop/blob/master/drools-server-swarm/pom.xml#L18> By adding this dependency, the fraction is going to be activated while Wildfly Swarm bootstrap.
2. The wildfly-swarm plugin: <https://github.com/Salaboy/drools-workshop/blob/master/drools-server-swarm/pom.xml#L25>. Notice in the plugin configuration that we are pointing to the App class which basically just start the container. (This can be avoided, but I wanted to show that if you want to start your own services or do your own deployments you can do that inside that class)

If you compile and package this project by doing mvn clean install, you will find in the target/ directory a file called:

**drools-server-swarm-1.0-SNAPSHOT-swarm.jar** which you can start by doing

```
java -jar drools-server-swarm-1.0-SNAPSHOT-swarm.jar
```

For this example, we will include one more flag when we start our project to make sure that our Drools Server can resolve the artefacts that I'm going to use later on, so it will be like this:

```
java -Dkie.maven.settings.custom=../src/main/resources/settings.xml -jar drools-server-swarm-1.0-SNAPSHOT-swarm.jar
```

By adding the "**kie.maven.setting.custom"** flag here we are letting the Drools Server know that we had configured an external maven repository to be used to resolve our artefacts. You can find the custom [settings.xml file here](https://github.com/Salaboy/drools-workshop/blob/master/drools-server-swarm/src/main/resources/settings.xml).

Once you start this project and everything boots up (less than 2 seconds to start wildfly-swarm core + less than 14 to boot up the drools server) you are ready to start creating your KIE Containers with your domain specific rules.

You can find the output of [running this app here](http://pastebin.com/FMcbwC3r). Notice the binding address for the http port:

**WFLYUT0006: Undertow HTTP listener default listening on [0:0:0:0:0:0:0:0]:8083**

Now you can start sending requests to <http://localhost:8083/drools> to interact with the server.

I've included in this project also a Chrome's [Postman project](https://github.com/Salaboy/drools-workshop/blob/master/drools-server-swarm/swarm-drools-example.json.postman_collection) for you to test some very simple request like:

- Getting All the registered Containers -> GET http://localhost:8083/drools/server/containers
- Creating a new container - > PUT http://localhost:8083/drools/server/containers/sample
- Sending some commands like Insert Fact + Fire All Rules -> POST http://localhost:8083/drools/server/containers/instances/sample

You can import this file to [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en) and fire the requests against your newly created Drools Server. Besides knowing to which URLs to PUT,POST or GET data, you also need to know about the required headers and Authentication details:

**Headers**

[![Headers](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2016/04/screen-shot-2016-04-18-at-14-11-21.png)](/2016/04/18/oficial-wildfly-swarm-drools-fraction/screen-shot-2016-04-18-at-14-11-21/)

**Authentication** -> Basic

**User:** kieserver

**Password:** kieserver1!

Finally, you can find the source code of the Fraction here: <https://github.com/wildfly-swarm/wildfly-swarm-drools>

There are tons of things that can be improved, helpers to be provided, bugs to be fixed, so if you are up to the task, get in touch and let's the Drools fraction better for everyone.

## Summing up

While I'm still writing the documentation for this fraction, you can start using it right away. Remember that the main goal of these Wildfly Swarm extensions is to make your life easier and save you some time when  you need to get something like the Drools Server in a small bundle and isolated package that doesn't require a server to be installed and configured.

If you have any questions about the Drools Fraction don't hesitate to write a comment here.
