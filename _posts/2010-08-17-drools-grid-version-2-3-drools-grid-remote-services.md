---
title: "Drools Grid (version 2) - #3 Drools Grid Remote Services"
date: 2010-08-17 20:37:43 +0000
permalink: /2010/08/17/drools-grid-version-2-3-drools-grid-remote-services/
description: "Now it's time to jump to a more interesting environment, the Remote Environment. During this post I will try to show the components that will interact in…"
tags:
  - "English"
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "PlugTree"
  - "Drools"
  - "JBoss"
  - "knowledge"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/08/17/drools-grid-version-2-3-drools-grid-remote-services/
---

Now it's time to jump to a more interesting environment, the *Remote* Environment. During this post I will try to show the components that will interact in a remote environment. We will continue using the Drools Grid Services APIs but we will change the underlying implementation from *LocalProviders* to *RemoteProviders*.

## Remote Providers

We will continue using the previous examples ([*Local Providers* from the previous post](/2010/08/09/drools-grid-version-2-2-drools-grid-services-intro/)) and we will only change the *GridTopology* configuration.

```java
GridTopologyConfiguration gridTopologyConfiguration =
                                       new GridTopologyConfiguration("MyTopology");
gridTopologyConfiguration.addExecutionEnvironment(
                             new ExecutionEnvironmentConfiguration(
                                 "MyMinaEnv",
                                  new MinaProvider("127.0.0.1",9123)));
gridTopologyConfiguration.addDirectoryInstance(
                             new DirectoryInstanceConfiguration(
                                  "MyMinaDir",
                                  new MinaProvider("127.0.0.1",9124)));
return gridTopologyConfiguration;
```

As you can see the only thing that change are the providers for both the *ExecutionEnvironment* and the *DirectoryInstance*.

*MinaProvider* is a Remote Provider that uses [Apache Mina](http://mina.apache.org/) for transport. This Remote Provider gives us the possibility to create, host and execute our knowledge in remote locations.

## Characteristics of Remote Executions

As you may know, when you are dealing with *Remote Environments* you need to have some considerations to be able to distribute your knowledge and some considerations to execute and interact with the remote sessions.

All your interactions will go to the wire in different ways depending the chosen underlying implementation. So you need to be careful with the information that you send over the wire. Basically you will need to implement "*Serializable*" or some mechanism to share information between your apps and the remote provider. You will see in the demo project that all the domain classes has been marked as *Serializable*.

Your knowledge will be executed remotely and your rules should be designed with that restriction in mind. If the rules call a service, this service must be also accessible from the *RemoteProvider* location.

You must distribute your domain model with your rules. This is pretty related with 2. The environment that will actually execute the rules will need to have all the classes loaded in the server classloader to be able to compile and run the rules/knowledge.

Following these considerations for every environment (*Local/Remote/Distributed*) will let you to switch from one to the other without any problem.

## Setting Up the Environment

Once you mark the domain classes to be **Serializable** and check that your rules can be executed in a remote environment you need to set up the living topology. As we describe in the ***GridTopologyConfiguration*** we have two servers one listening in **127.0.0.1:9123 (localhost)** and the other in **127.0.0.1:9124.**

For that reason we need to start up both servers. I can simulate the servers in a test scenario, but for practical reasons I prefer to show how to distribute and run each server instance.

The **first** step is to **download** both servers: The *Execution Environment* Server:  [**drools-grid-remote-mina-distro.zip**](http://www.plugtree.com/downloads/drools-5.2.0.SNAPSHOT-drools-grid-remote-mina-distro.zip) and the Directory Instance server: [**drools-grid-remote-dir-mina-distro.zip**](http://www.plugtree.com/downloads/drools-5.2.0.SNAPSHOT-drools-grid-remote-dir-mina-distro.zip). You need to unzip the content from both files in different directories. Inside each of them you will find the start.sh script. Running this script (in unix machines, I'm working in bat files for window$) will start each of the servers. The script contains the information about the host and the ports (I will work on customization for these parameters later).

When you uncompress these files you will see that there is a **lib** directory. Inside this lib directory you will find all the dependencies required to run the execution node. One important thing to understand here is that you will probably need to include all the rules **dependencies** here in the **lib** directory. So as a **second** step, you will need to clean and build the **drools-grid-mini-demo** project and copy the jar to the Execution Environment server lib's directory(*drools-grid-remote-mina/lib/*). You will need to have the domain classes (and all the required dependencies) that are being used inside the rules inside the *Execution Environment* lib directory in order to execute the rules/knowledge remotely.

The **third** step is to start both the *Execution Environment* and the *Directory Instance* Server. You can do that running the  **./start.sh** script in the console. (take a look inside the script. If you want to change the host or the port where the server is started).

*Note:* Usually you wont need to copy dependencies to the Directory Instance lib project.

## Analyzing the Remote Topology Knowledge Execution

![Droolsgrid remoteexecution](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/08/droolsgrid-remoteexecution.png "DroolsGrid Remote Executions")

As you can see in the previous figure, three steps are executed by the application. Using Drools Grid Services, the application queries the available directories to find a running execution environment. The Directory Instance return the registered Execution Environment (Remote) to the application to start working. Once we get an Execution Environment we can create a Knowledge Builder, a Knowledge Base and a Knowledge Session. After we have the session we can start inserting facts and firing all the activated rules.

From the application perspective will be transparent where the rules are executed, but in the background you can check that the current execution is happening in the remote server. The example project that you can download, uses a rule that only prints out the the console that the rule was activated. In this case and just to show that the execution happens in the remote server, you can see that the output is being printed in the server console. In real scenarios you will probably want to send a response or some results to the client application. We will see how to achieve that in following posts.

## In Brief

During this post we have seen how we can move our application that was constructed using Local Providers to Remote Providers. You can download a new version of the [drools-grid-mini-demo v2 here](http://www.plugtree.com/downloads/drools-grid-mini-demo-v2-remote.zip). You will find a new class to execute called: ***RemoteTopologyTest*** that contains the ***GridTopologyConfiguration*** that uses the ***RemoteProviders***.

It would be nice to pick the old project from the previous post, download it and then try to migrate to use the Remote Providers. Try to extend the example and let me know if you have any problems.

The next post will be about *Distributed Environment*, and there is when this stuff begins to make really sense.
