---
title: "Drools Server + Drools Grid Demo"
date: 2010-11-24 22:17:05 +0000
permalink: /2010/11/24/drools-server-drools-grid-demo/
description: "Hi there, in this post I will show you the tips and tricks to configure and interact with remote sessions hosted in Drools Server."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "distributed"
  - "Drools"
  - "events"
  - "rules"
original_url: https://www.salaboy.com/2010/11/24/drools-server-drools-grid-demo/
---

Hi there, in this post I will show you the tips and tricks to configure and interact with remote sessions hosted in Drools Server. We will also see how to create and interact with dynamically created session using a Drools Grid client application. Let's get started with the initial configurations!

## Drools Server Configurations

First of all we need to deploy the drools-server.war into a servlet container. In the video I'm using a**pache-tomcat-6.0.29**. You can download the latest build from: <https://hudson.jboss.org/hudson/job/drools/lastSuccessfulBuild/artifact/target/>

Once you get it there you can start the container in order to see if everything works as expected.

**Hack one:**

One little hack that I need to apply here is to change the location of one xml schema file that validates the spring configurations. In the knowledge-services-grid.xml I've changed the location of one of the schemas to:

[http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-container/drools-spring/src/main/resources/org/drools/container/spring/drools-spring-1.2.0.xsd](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-container/drools-spring/src/main/resources/org/drools/container/spring/drools-spring-1.2.0.xsd﻿)

**Configuration one:**

I've also change the default configuration to use the provided grid configuration.  My **bean.xml** file looks like this:

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:context="http://www.springframework.org/schema/context"
xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd
http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-2.5.xsd"
default-autowire="byName">
<!-- loads the kbases and ksessions into the ApplicationContext -->
<import resource="classpath:knowledge-services-grid.xml" />
<!-- Builds the routes that makes the ksessesions available as services -->
<import resource="classpath:camel-server-grid.xml" />
</beans>
```

**Configuration two:**

From the knowledge-services-grid.xml file I remove the grid2 definition. We won't need it here. We will need a grid configuration in our client.

So I remove the following lines:

```xml
<drools:grid id="grid2">
  <drools:core-services ref="shared-map" />
</drools:grid>
```

## Checking that everything is OK

Now you can start Drools Server starting your servlet container. In my case **./catalina.sh start**

Once the server is started (you can check the server logs in /logs/catalina.out) you can access to the drools server using your browser <http://localhost:8080/drools-server/>

**"Execution server is running"**

Once you have the Drools Server working it's time to interact and create new Knowledge Sessions.

For interacting we will use Soap UI to send SOAP messages to the SOAP endpoint inside the Drools Server.

## Using SOAP to interact with Drools Server

[HERE](http://www.plugtree.com/downloads/drools-server-grid-test-soapui-project.xml) you can [DOWNLOAD](http://www.plugtree.com/downloads/drools-server-grid-test-soapui-project.xml) the project that I was using to interact with the running drools server. The current configuration create automatically a knowledge Session called ksession3. After you start Drools Server and create a project inside Soap UI you can start sending commands to the already created session.

Trick One for Soap UI project: 

you can create a new project from the scratch. In my case the WSDL file it's located under the following address

 <http://localhost:8080/drools-server/kservice/soap?WSDL>. 

If you are running the drools server locally the URL will be the same. To be sure that the WSDL it's there you can open the previous URL in your browser. At least in safari it display a blank page, but if you take a look at the source of the blank page you will find the WSDL document content

.Trick Two for Soap UI interactions: 

the WSDL file doesn't contain the endpoint definition. So when you access to a request you will see that you cannot execute it (because there is no endpoint defined, so the play button is grey). To fix this situation you can add the endpoint manually in the endpoint selection list (combo box). The endpoint address is:

 <http://localhost:8080/drools-server/kservice/soap>

## Drools Grid Client

With the Drools Grid client we will be able to create and interact with new knowledge sessions. I've created a simple application that configure everything that you need in order to interact with the exposed Grid Node inside Drools Server. This simple application creates only a local grid that knows how to contact the Remote WhitePages that contains the services registered inside the Drools Server. Using the WhitePages information we can get the Grid Node and create a new Knowledge Session inside it.

You can [DOWNLOAD](http://www.plugtree.com/downloads/drools-server-client-test.zip) the client application [HERE](http://www.plugtree.com/downloads/drools-server-client-test.zip).

It just contain a simple Main class with the following code:

```java
Map<String, GridServiceDescription> coreServicesMap = new HashMap<String, GridServiceDescription>();
GridServiceDescriptionImpl gsd = new GridServiceDescriptionImpl(WhitePages.class.getName());
Address addr = gsd.addAddress("socket");
addr.setObject(new InetSocketAddress[]{new InetSocketAddress("localhost", 8000)});
coreServicesMap.put(WhitePages.class.getCanonicalName(), gsd);
GridImpl grid2 = new GridImpl(new ConcurrentHashMap<String, Object>());
GridPeerConfiguration conf = new GridPeerConfiguration();
GridPeerServiceConfiguration coreSeviceConf = new CoreServicesLookupConfiguration( coreServicesMap );
conf.addConfiguration( coreSeviceConf );
GridPeerServiceConfiguration wprConf = new WhitePagesRemoteConfiguration( );
conf.addConfiguration( wprConf );
conf.configure( grid2 );
GridServiceDescription<GridNode> n1Gsd = grid2.get( WhitePages.class ).lookup( "node1" );
GridConnection<GridNode> conn = grid2.get( ConnectionFactoryService.class ).createConnection( n1Gsd );
GridNode remoteN1 = conn.connect();
KnowledgeBuilder kbuilder = remoteN1.get( KnowledgeBuilderFactoryService.class ).newKnowledgeBuilder();
String rule = "package  org.grid.test\n"                +
                      "declare Message2\n"                +
                            "text : String\n"                +
                       "end\n"                +
                       "rule \"echo2\" \n"                +
                         "dialect \"mvel\"\n"                +
                          "when\n"                +
                          "     $m : Message2()\n"                +
                          "then\n"                +
                          "$m.text = \"echo2:\" + $m.text;\n"                +
                       "end\n";
kbuilder.add( new ByteArrayResource( rule.getBytes() ), ResourceType.DRL );
KnowledgeBuilderErrors errors = kbuilder.getErrors();
if ( errors != null && errors.size() > 0 ) {
      for ( KnowledgeBuilderError error : errors ) {
             System.out.println( "Error: " + error.getMessage() );
      }
      return;
}
KnowledgeBase kbase = remoteN1.get( KnowledgeBaseFactoryService.class ).newKnowledgeBase();
kbase.addKnowledgePackages( kbuilder.getKnowledgePackages() );
StatefulKnowledgeSession session = kbase.newStatefulKnowledgeSession();
remoteN1.set("ksession2", session);
remoteN1.dispose();
}
```

And the only dependencies that we need in the client side are:

 
```xml
<dependency>
  <groupId>org.drools</groupId>
  <artifactId>drools-grid-impl</artifactId>
  <version>5.2.0.SNAPSHOT</version>
</dependency>
<dependency>
  <groupId>org.drools</groupId>
  <artifactId>drools-spring</artifactId>
  <version>5.2.0.SNAPSHOT</version>
</dependency>
```

## Test Commands

Just for completeness the commands that I send to **ksession3** and **ksession2** are: 
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soap="http://soap.jax.drools.org/">   <soapenv:Header/>   <soapenv:Body>      <soap:execute>         <!--Optional:-->         <soap:arg0>&lt;batch-execution lookup="ksession3"&gt;  &lt;insert out-identifier="message"&gt;      &lt;org.test.Message&gt;         &lt;text&gt;Helllo Worldksession3&lt;/text&gt;      &lt;/org.test.Message&gt;   &lt;/insert&gt;   &lt;fire-all-rules/&gt;&lt;/batch-execution&gt;</soap:arg0>      </soap:execute>   </soapenv:Body></soapenv:Envelope>
```

 
```
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"><SOAP-ENV:Header/><SOAP-ENV:Body><ns1:execute xmlns:ns1="http://soap.jax.drools.org"/>&lt;batch-execution lookup="ksession2"&gt;  &lt;insert out-identifier="message"&gt;      &lt;org.grid.test.Message2&gt;         &lt;text&gt;Helllo Worldksession2&lt;/text&gt;      &lt;/org.grid.test.Message2&gt;   &lt;/insert&gt;   &lt;fire-all-rules/&gt;&lt;/batch-execution&gt;</SOAP-ENV:Body></SOAP-ENV:Envelope>
```

Note: you can use "&gt;" and "&lt;" or you can use CDATA tags to wrap the command xml content inside the argument.
