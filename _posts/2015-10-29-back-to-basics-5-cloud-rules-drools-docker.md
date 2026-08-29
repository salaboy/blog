---
title: "Back to Basics #5: Cloud Rules (Drools & Docker)"
date: 2015-10-29 16:41:24 +0000
permalink: /2015/10/29/back-to-basics-5-cloud-rules-drools-docker/
description: "On this blog post we are going to take the microservice created in my previous post and we are going to use Docker bundle it and run it."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/kie.png
tags:
  - "community"
  - "Drools"
  - "engine"
  - "English"
  - "Java"
  - "tutorial"
  - "basic"
  - "docker"
  - "JBoss"
  - "rules"
original_url: https://www.salaboy.com/2015/10/29/back-to-basics-5-cloud-rules-drools-docker/
---

On this blog post we are going to take the microservice created in my previous post and we are going to use Docker bundle it and run it. As you might know already, this is not Drools Specific, but we are going to use all these infrastructure to build our Rule Enabled Microservices in future posts, so having a very basic example on how to use Drools surrounded by all these new technologies will help to set the stage for more complex Drools Examples.

The main goal of this post is to show how, by using Docker, we can share Drools enabled application reducing the amount of components to install to get our Rule Engine instances up and running. Basically by the end of this post you will see Docker in action, and how you can run the same micro service in your environment by just having Docker installed.

## Introduction

As defined in their website Docker is:

> "... an open platform for building, shipping and running distributed applications. It gives programmers, development teams and operations engineers the common toolbox they need to take advantage of the distributed and networked nature of modern applications."

What does this means to us? As a Java developer, this means that you will be able to share your application in a self contained bundle that can be executed using Docker. No matter how complex your application set up is, you will define it once and then everybody else will be able to run it. Docker also provide a public registry of Docker Images, meaning that if I build a new image I can push it to the register ([hub.docker.com](https://hub.docker.com/u/salaboy/)) and you can download and run that application without the need of installing anything besides Docker itself. Notice that when I say nothing, I mean, that you don't even need to install Java.

Docker will download the image from the registry and run it. Docker Images are conformed by a image descriptor that contains some very important information:

- **Base Docker Image**: most of the time we will be inheriting an already existing image. In our case because we have a Fat Jar created by Wildfly Swarm, we just need to inherit from a JDK image. If we have a common Web application (WAR file) we can inherit the Wildfly image and deploy our application in that Wildfly instance.
- **Special configurations and Environmental variables:** because an image can be reused, we can define a set of env variables to be set on our application startup. For our example, we might want to provide the KJAR GAV as an env variable, so each instance of our application that we start can use a different version of the KJAR.
- **What to run:** in our case it will be just a command as we type it in our terminal, for our example java -jar &lt;fat jar&gt;.jar

Once we have this descriptor ready we can just run the image locally and then push it to the registry.

I recommend you to go to [docker.com](http://docker.com) and install it in your environment, so you can run the example introduced in my previous post.

Once you have Docker and their tools installed you can look for the [salaboy/drools-jax-rs](https://hub.docker.com/r/salaboy/drools-jax-rs/) image and create a new instance.

From the terminal this can be done by running:

```bash
docker -p8080:8080 run salaboy/drools-jax-rs
```

And then you should be able to access to the service and interact with it to the Docker Image instance IP, in the same way that we did in the previous post.

Here in my local environment I'm using Kinematic UI to create my docker instances and I can see in the access URL under Settings -> Ports

![Docker Image Output](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/screen-shot-2015-10-29-at-15-29-16.png)

*Docker Image Output*

![Settings Ports](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/screen-shot-2015-10-29-at-15-29-08.png)

*Settings -> Port -> ACCESS URL*

Now you are ready to start sending requests to the Docker Image with Postman as we did before.

## Runtime Details

Ok there are a couple of considerations and runtime details that we need to understand what is happening here. We are still using KIE-CI to resolve our KJAR, which means that Drools will look for a ReleaseId to create a new KieSession. In order to do this KIE-CI needs to resolve the artefacts using a library called Aether that provides a way for us to embed what maven does in our applications. In our previous example, because we were executing Wildfly Swarm locally, maven uses our local repository under ***&lt;user_home&gt;/.m2/repository/*** to resolve the available artefacts. Now because the execution happens in an isolated environment inside Docker, the local repository is not available. And for that reason we need to provide a configuration file so KIE-CI know from where to resolve our KJARs.

![Docker - KIE-CI - Maven Repository](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/docker-maven-settings.png)

*Docker - KIE-CI - Maven Repository*

We achieve this by setting an environmental property when we start our Wildfly Swarm instance. The property that you can set to inform KIE-CI to look into some other external repositories is: -Dkie.maven.settings.custom=/opt/wildfly-swarm/settings.xml, which is pointing to a custom [settings.xml](https://github.com/Salaboy/drools-workshop/blob/master/drools-rest-swarm/drools-jax-rs/src/main/docker/settings.xml) that we need to provide.

But now, how do create our Docker Image? Where is the settings.xml pointing to? where is our KJAR stored, do I need a Maven Artefact Repository? The good news is that Maven plugins are here to helps us to do all of these in a breeze!

## Maven Magic

There are two main things that I'm doing in this project with Maven plugins that saved me tons of time.

- Docker Image creation
- Hosting our artefacts in a Github repository

In order to create our Docker Image I'm using the **docker-maven-plugin** which is pretty standard nowadays. You can take a look at the configuration here: <https://github.com/Salaboy/drools-workshop/blob/master/drools-rest-swarm/drools-jax-rs/pom.xml#L110>

This plugins basically create a new Docker Image inheriting: jboss/base-jdk:8 base image, which basically provides us a Centos operating system with the JDK 8 installed.

You an see in the configuration as well, that we are explicitly setting up the entry point for our image which is just running exactly the same as we run in our local environment but now inside the docker container.

```xml
<entryPoint>
  <exec>
    <arg>java</arg>
    <arg>-Dkie.maven.settings.custom=/opt/wildfly-swarm/settings.xml</arg>
    <arg>-jar</arg>
    <arg>/opt/wildfly-swarm/drools-jax-rs.jar</arg>
  </exec>
</entryPoint>
```

Notice also that in our configuration we are asking the plugin to copy the settings.xml file into the docker image so it can be used for runtime. Take a look also to the Port mappings which basically says that Wildfly Swarm is exposing the 8080 port so we will need to make sure that the docker machine instance also expose that port so we can access it from our environment.

By using the **docker-maven-plugin** you can build, start and even deploy your docker images. Take a look at the plugin documentation for more information. You can also build locally your image if you cloned this drools-workshop repository by running mvn clean install docker:build and start the image using mvn clean install docker:start. Notice that you need to run these commands in a terminal which is configured to be used with Docker, so all the environmental variables required are there and the Maven plugin can contact the Docker Deamon.

The second thing that I did by using the Maven Github Site plugin is to host our KJAR into a branch of the [github.com/salaboy/drools-worshop](https://github.com/Salaboy/drools-workshop/tree/mvn-repo) repository called [mvn-repo](https://github.com/Salaboy/drools-workshop/tree/mvn-repo). You can take a look at this stack overflow thread for a more detailed description on how this works: http://stackoverflow.com/questions/14013644/hosting-a-maven-repository-on-github

Also take a look at the configuration in the KJAR ***[pom.xml](https://github.com/Salaboy/drools-workshop/blob/master/drools-rest-swarm/drools-user-kjar/pom.xml#L63)*** file where I configure this plugin which I used to create a branch in my **[drools-workshop](https://github.com/Salaboy/drools-workshop/tree/mvn-repo)** repository to contain our maven artefacts.

## Summary

On this post, we look at how we can use Docker to package our rules inside our micro service into a self contained unit that you can download and run without installing anything besides Docker. You should be able to get the service up and running and even build it from the scratch and publish your own Docker images by following the configurations inside the projects.

At this point you might have noticed that you can create multiple Docker instances based on this image, which means that you have the power of creating a new KieSession with just one click. Each of these instances is an isolated environment that you can start and destroy in a very simple way.

If you have questions please don't hesitate to ask.  On my next post we will discuss how we can scale our microservices by using [Openshift Origin](http://www.openshift.org). This is quite important to make sure that we can provision as many Rule Engine instances as we need for our applications.
