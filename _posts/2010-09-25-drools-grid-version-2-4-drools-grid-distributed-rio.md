---
title: "Drools Grid (version 2) - #4 Drools Grid Distributed Rio"
date: 2010-09-25 20:42:42 +0000
permalink: /2010/09/25/drools-grid-version-2-4-drools-grid-distributed-rio/
description: "Hi there! I'm back with news about the Drools Grid Distributed Rio implementation. We will see during this post how to set up the Rio environment to run…"
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "distributed"
  - "Drools"
  - "knowledge"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/09/25/drools-grid-version-2-4-drools-grid-distributed-rio/
---

Hi there! I'm back with news about the Drools Grid Distributed [Rio](http://www.rio-project.org/) implementation. We will see during this post how to set up the [Rio](http://www.rio-project.org/) environment to run the example that I shown for [Local](/2010/08/09/drools-grid-version-2-2-drools-grid-services-intro/) and [Remote](/2010/08/17/drools-grid-version-2-3-drools-grid-remote-services/) distribution environments. For this reason this post will be divided in two main sections: Setting Up the Environment and Running and Configuring the Example.

## **Setting up Rio Environment**

First of all we need to download a couple of things:

- **[JDK 1.6](http://www.oracle.com/technetwork/java/javase/downloads/index.html)**
- [Maven 2](http://maven.apache.org/)
- **Rio Distribution:** it will contain all the Rio binaries that will be used to host our OAR files, that will contain our services. [Download it here!](http://www.rio-project.org/maven2/org/rioproject/distribution/4.1-SNAPSHOT/distribution-4.1-20100811.022908-1.zip) (if the download link doesn't work check the following URL <http://www.rio-project.org/maven2/org/rioproject/distribution/4.1-SNAPSHOT/>)
- **OAR Files:** contains all the services that will be deployed inside the Rio runtime. In this case, we will deploy two different services: DirectoryNodeService and ExecutionNodeService. You must download both OAR files, [this](http://www.plugtree.com/downloads/drools-grid/drools-grid-distributed-rio-5.2.0.SNAPSHOT.oar) and [this one](http://www.plugtree.com/downloads/drools-grid/drools-grid-distributed-dir-rio-5.2.0.SNAPSHOT.oar).
- **Demo Application:** it's the same application that we was using during the previous posts, but now it's configured to run using the Distributed Rio Environment. (This is an updated version of the one provided in older posts. This version includes the configurations for running with distributed environments). You can [download it here!](http://www.plugtree.com/downloads/drools-grid/drools-grid-mini-demo-v3-distribtued.zip)
- **Extra Maven deps**: because I built both OAR files from the Drools trunk, and Rio resolve services dependencies using maven, you need to have all services dependencies inside your Maven repo. [Download this zip file](http://www.plugtree.com/downloads/drools-grid/drools-grid-distributed-rio_deps.zip) and uncompress it inside ***&lt;user home&gt;/.m2/repository/org/drools/. * During the following months these files will be included in the JBoss Drools Maven repo, so they will be automatically downloaded when you need them.***

First uncompress the Rio binary distribution file. Once you get that, you can go to your terminal and export the ***RIO_HOME*** env variable. This variable must be pointing to the directory where you uncompress the binaries. In my case: export RIO_HOME=/Users/salaboy/Downloads/rio-4.1-SNAPSHOT/Now you are ready to start Rio, but before that we will copy our OAR files that contains our services to the deploy directory.

If the deploy directory (***rio-4.1-SNAPSHOT/deplo******y***) doesn't exist you must create it. When you have this directory you should copy the following two OAR files inside it:

drools-grid-distributed-dir-rio-5.2.0.SNAPSHOT.oardrools-grid-distributed-rio-5.2.0.SNAPSHOT.oar

Now you have your services ready to be started. The last thing that you need to do is to add the dependencies from our domain classes to the Rio runtime environment. For doing this, we will copy the demo jar file into the ***lib***directory **(rio-4.1-SNAPSHOT/lib**).

Once you get the demo app jar inside the lib directory, you need to add it to the platform configurations to be loaded by the Rio Runtime. This will make available the domain classes for the rules that will be deployed into the remote/distributed services inside Rio. Note that in real situations, the only thing that you will add into the platform configuration will be your model jar files, not all the application classes. For adding the jar to the platform configurations you need to edit the common-platform.groovy file, located at ***rio-4.1-SNAPSHOT/config/platform*** directory.

You must add the following snippet of configuration:

```java
configs << new PlatformCapabilityConfig("ExampleModel",
                                        "1.0",
                                        "Example Model",
                                        "Model",
                                        libDir+"drools-grid-mini-demo-1.0-SNAPSHOT.jar")
```

Now we are ready to start the Rio Environment. Let's see how we can execute the demo app against the deployed services. We will also take a look at some of the tools provided by Rio.

## **Running the Example**

With everything set up, now it's time to run the example.

First of all we need to start Rio. For that we need to go to  **rio-4.1-SNAPSHOT/bin** in our terminal/console (with the RIO_HOME variable set) and run:

**./startall**

You should see something like this:

![Screen shot 2010 09 26 at 1 10 54 pm](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/09/screen-shot-2010-09-26-at-1-10-54-pm.png "Start All script output")

If you want to see in a graphical way how your services are deployed or how many services instances do you have right now, you can use Rio UI. For starting Rio UI, in a new console (also with the RIO_HOME variable set) run:

**./rio-ui**

You should see something like this:

![Screen shot 2010 09 26 at 1 21 18 pm](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/09/screen-shot-2010-09-26-at-1-21-18-pm.png "Rio UI")

For the client side, you need to open this simple demo that create a knowledge session, insert a new fact and then fire all the activated rules.

For running the example you should open the Maven project called drools-grid-mini-demo and the find the ***DistributedTopologyTest*** class.

The only change that you will notice in this class is that now we are using RioProviders to describe our grid topology:

```java
private static GridTopologyConfiguration initializeGridConfiguration() {
GridTopologyConfiguration gridTopologyConfiguration = new GridTopologyConfiguration("MyTopology");
gridTopologyConfiguration.addExecutionEnvironment(new ExecutionEnvironmentConfiguration("MyRioEnv", new RioProvider()));
gridTopologyConfiguration.addDirectoryInstance(new DirectoryInstanceConfiguration("MyRioDir", new RioProvider()));
return gridTopologyConfiguration;
}
```

One important thing to notice is that the ***RioProviders*** doesn't contains configurations. The underlaying implementation will lookup and discover Rio services in the network.

The following figure describe the behavior of the underlaying mechanism:

![Drools grid rio](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/09/drools-grid-rio.png "Drools-Grid-Rio")

As you can see in the previous figure three steps are executed in order to be able to interact with distributed knowledge sessions.

## **Advantages of Using Distributed Environments**

In contrast with the other environments (Local and Remote), Distributed Environments have the advantage of being more dynamic and scalable. In this case with the Rio implementation we can take advantage of features like:

**1) Dynamic process forking**: with Rio we can configure that new instances of the same services must be executed in a different OS process. Rio will automatically create a new OS process on demand each time that it's required.

**2) Dynamic resources allocation**: Based on resources, nodes, and machines Rio can decide to scale up or down services instances.

**3) Rule Based Services Monitoring**: a new Rio services called Gnostic was designed to monitor all the services running inside the Rio Grid. Of course, it uses Drools to define the SLA that needs to be maintained for each services.

I will dedicate another blog post to describe these features, the advantages and one of the multiple approaches that we can use to design our applications using this mix of Distributed Knowledge Sessions across multiple grid services.

## **Summing up**

During this post we saw how to test the Drools Grid Distributed Rio implementation. This simple example show us the main components inside the infrastructure. As you can see, these set of posts execute the same mini application using different underlaying implementations. I'm still working on details so during following posts I will go deep into more advanced configurations. Would be nice to receive feedback and questions about the proposed architecture, at the end this is community work!

I will be presenting a more complete example and writing all the official documentation based on that example, so once again feedback is highly appreciated!
