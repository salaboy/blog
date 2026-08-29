---
title: "Drools In Real Life: Drools/jBPM5 Server (first steps)"
date: 2011-04-05 22:25:54 +0000
permalink: /2011/04/05/drools-in-real-life-droolsjbpm5-server-first-steps/
description: "This post is targeted to people that wants to build real life applications and solutions using Drools."
tags:
  - "Drools"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jbug"
  - "PlugTree"
  - "jBPM"
  - "jBPM5"
  - "knowledge"
  - "rules"
  - "Salaboy"
  - "tutorial"
original_url: https://www.salaboy.com/2011/04/05/drools-in-real-life-droolsjbpm5-server-first-steps/
---

This post is targeted to people that wants to build real life applications and solutions using Drools. Most of the times that we create applications that use Drools  we need about how to create applications that require multiple Knowledge Sessions to host different knowledge resources that solves different problems at different points in time. This post introduces the very first steps to use Drools Server that can host multiple knowledge sessions to run Rules and jBPM5 business processes.

## Introduction

Drools Server (drools-camel-server) allow us to decouple from our application the responsibility of creating and hosting Knowledge Sessions required to interact with our business knowledge (rules, processes, events).  Most of the time we don't want to embed drools inside our applications and we want to have an external service that will host our processes and rules runtime. When we have stateless session we can create a homebrew service that creates a new stateless session per request and we solve the problem, but when we have stateful scenarios we need more advanced mechanism to interact and define the knowledge that will be related with each session.

This post will include a very basic description about the configuration that are required to work with drools server, because the examples uses the default configuration. Future post will dive deep in more advanced configurations.

During this post we will follow these steps:

- Building the Server. This is a web application that must be deployed inside a servlet container.
- Deploying on Tomcat 6/7 and/or Jetty 6
- Create a client project using SOAP UI to test that everything is working properly

The main idea of this post is to reduce the discovery phase that each user needs to do in order to get everything working. This post will be referenced by future posts that will introduce drools-grid.

## Building the server

UPDATE: now you can download the latest build from here: <https://hudson.jboss.org/hudson/view/Drools%20jBPM/job/droolsjbpm-integration/lastSuccessfulBuild/artifact/droolsjbpm-integration-distribution/target/> -> Inside the target directory you will find a zip file called: [droolsjbpm-integration-distribution-5.XXX-SNAPSHOT.zip](https://hudson.jboss.org/hudson/view/Drools%20jBPM/job/droolsjbpm-integration/lastSuccessfulBuild/artifact/droolsjbpm-integration-distribution/target/droolsjbpm-integration-distribution-5.3.0-SNAPSHOT.zip) . Download that file unzip it and you will find a directory called ***binary*** and inside it **drools-camel-server-5.2.0-SNAPSHOT.war**

As soon as the master branch of the project became stable I will add the link for download the latest snapshot. In the meantime you need to build the sources that you can get cloning the repository from:

<https://github.com/droolsjbpm/droolsjbpm-integration>

For downloading the source you need to do in your terminal or with your IDE:

git clone git://github.com/droolsjbpm/droolsjbpm-integration.git

After that you can run:

mvn clean install -DskipTests

to build it.

Drools Server WAR file will be located at:

droolsjbpm-integration/drools-camel-server/target

## Deploying  Drools Server on Tomcat 6/7 & Jetty 6

Now that we have the WAR file we can deploy it to a servlet container like Tomcat. I'm using [apache-tomcat-6.0.32](http://mirrors.dedipower.com/ftp.apache.org/tomcat/tomcat-6/v6.0.32/bin/apache-tomcat-6.0.32.tar.gz) and [jetty 6.1.3](http://dist.codehaus.org/jetty/jetty-6.1.x/jetty-6.1.3.zip), I strongly recommend you to work with a newly downloaded container to avoid clashing applications and libraries. Obviously that you can use the same container to host multiple applications, but this tutorial only shows the things that needs to be modifed to work with drools server.

Once we download and uncompress Apache Tomcat or/and Jetty we can place a copy of the drools-server.war file inside the webapps directory inside the servlet container that we choose.

After that we just need to start the server in order to check that drools-server is being deployed correctly:

Tomcat:

cd bin/ ./startup.sh

Jetty:

java -jar start.jar

After that you can check if everything is ok using your browser. Pointing it to:

<http://localhost:8080/drools-server/>

Accessing to this url must show you in the browser something like this:

![Screen shot 2011 04 05 at 6 38 35 pm](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/04/screen-shot-2011-04-05-at-6-38-35-pm.png "Screen shot 2011-04-05 at 6.38.35 PM")

Creating a Simple ClientThe final step is to create a simple client in order to interact with the server. We will use SOAPUI to interact with the exposed services using the SOAP interfaces. Drools Server comes with a very simple rule that let us test that everything is working. The simple configuration files create a knowledge session that will contain the following rule:

```java
package  org.test
declare Message
text : String
end
rule "echo" dialect "mvel"
when
$m : Message()
then
$m.text = "echo:" + $m.text;
end
```

As you can see, this very simple drl file defines a new entity called Message and a rule that per each Message it will change the value of the text field.

You can review the configurations files that creates a new stateless session, the knowledge base and the inclusion of the test.drl file using spring here:

<https://github.com/droolsjbpm/droolsjbpm-integration/blob/master/drools-camel-server/src/main/resources/knowledge-services.xml>

Obviously this is just a sample configuration to get you started quickly with something working. You should change/adapt the configuration files, the knowledge resources files and everything that you need to solve your situation or design your service.

Now that we know what we have inside Drools Server, we will create a simple project using SOAPUI to interact with the rule previously introduced.

First of all you must download [SOAPUI (here)](http://www.soapui.org/). After that you can create a simple project using the WSDL exposed by drools server in the following URL:

<http://localhost:8080/drools-server/kservice/soap?WSDL>

After creating the project you can see that SOAPUI will create a sample request to the service that you can run against the service. For this test I've just add to the default request some parameters in order to insert a new Message Object inside the knowledge session and then fire all the rules. This will change the value of the text inside the message and return the content of the new message to SOAP UI.

Take a look at the following screenshot:

![Screen shot 2011 04 05 at 7 04 42 pm](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/04/screen-shot-2011-04-05-at-7-04-42-pm.png "Screen shot 2011-04-05 at 7.04.42 PM")

I'm calling the service with the following XML content inside the common SOAP envelope:

```xml
<batch-execution lookup="ksession1">
   <insert out-identifier="person1">
      <org.test.Message>
        <text>salaboy</text>
      </org.test.Message>
    </insert>
   <fire-all-rules max="-1"/>
 </batch-execution>
```

You can see in the screenshot that I'm getting from the server ***echo:salaboy*** inside the server answer:

```xml
<execution-results>
   <result identifier="person1">
     <org.test.Message>
       <text>echo:salaboy</text>
     </org.test.Message>
   </result>
   <fact-handle identifier="person1" external-form="0:2:232003191:1:2:DEFAULT"/>
 </execution-results>
```

Notice that we are getting this results because we are setting the ***out-identifier="person1"*** inside the insert command that we are sending.

## Sum up

Now that we know how to download, build and check that a very simple example is working with drools server we can jump to more advanced configurations and usages. We will see in following posts how to create stateful sessions, configure some knowledge agents to get remotely hosted knowledge resources and plays a little bit with drools-grid.

Stay tuned for more posts about this, because I'm doing heavy work around these topics to make them easy to use. Please feel free to write me some comments here with feedback about these topics or feature requests. If you find some troubles with Drools Server or Drools Grid don't hesitate to write me back!
