---
title: "Playing with Drools Server (Updated with Spring Configurations)"
date: 2010-03-25 14:29:41 +0000
permalink: /2010/03/25/playing-with-drools-server/
description: "Hi All!, I'm here playing with the new version of the Drools Server created by my friend Lucaz."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "Drools"
  - "knowledge"
  - "rules"
  - "Salaboy"
  - "spring"
original_url: https://www.salaboy.com/2010/03/25/playing-with-drools-server/
---

Hi All!, I'm here playing with the new version of the Drools Server created by my friend [Lucaz](http://twitter.com/lucazamador). In this post I will show how we can use this Drools Server that will allow us to decouple the execution of the Drools Sessions into this server that can be hosted in every Servlet Container.

[Please read  the disclaimer  first](/disclaimer/)

NOTE: These features will be merged to the Drools Trunk during the next few weeks so, it is still experimental and probably some problems will probably emerge. Feedback is appreciated. This post is only to show the new features of the new Drools Server version.

## Drools Server? what is that?

The main idea behind the Drools Server is to host Knowledge Sessions to decouple the runtime execution to an external server. This will help our applications to scale transparently, letting us have multiple servers that can host different sessions with different loads, instead of having a lot of sessions inside our application. The idea of this post is to explain the main configurations and components that will interact to achieve remote interactions between our applications and the Knowledge Sessions hosted inside the Drools Server.

## Getting the latest snapshots

First of all we need to get the latest snapshots of the Drools Server WAR application. We can get this war application from [here](http://hudson.jboss.org/hudson/job/drools/lastSuccessfulBuild/artifact/trunk/target/). When the Drools Team release the M2 version of the platform you will find the Drools Server WAR application in the official [downloads page](http://www.jboss.org/drools/downloads.html).

Once we get the Drools Server WAR we need to deploy it to be able to interact with it.

(Because this code is not merged yet, you can go to the end of the post to download a sneak preview of the new Drools Server)

## Deploying Drools Server in JBoss 5.x

**Note:** at this point Drools-Server is ready to be deployed out-of-the-box in JBoss AS 5.x, but it can also be deployed in JBoss AS 4.x removing some conflicted jars. More testing is needed in order to be able to deploy drools-server in Tomcat.

Note 2: Due JAXB incompatibilities between JDK 1.5 and JDK 1.6, this new version of the drools-server works fine in JDK 1.5

You just need to place the WAR file inside the **/server/default/deploy** directory and explode it (uncompress it) to be able to configure it. Once you get the exploded WAR into a directory (probably **/server/default/deploy/drools-server.war/**) you need to go to the **/drools-server.war/WEB-INF/classes/** to add the configuration files needed to start using remote hosted knowledge sessions.

## Configuring your Knowledge Sessions

Now that you get the server in place, you need to configure the session that will be spawned in the server side based on your business requirements. You can define multiple sessions (stateless and stateful) to interact in the server side, so let's see what we need to define a session.

### Defining Services (UPDATED using Spring)

We deprecate profiles to use a simple and spring fashion configuration. If you download the drools-server.war file at the end of this post you will find all the configuration files inside the WEB-INF directory. Right now we use 4 files to define all the configurations needed by the Drools Server to host Knowledge Sessions and expose them as services.

You can find how to configure a new Services, containing a set of Knowledge Sessions in [lucaz blog](http://lucazamador.wordpress.com/2010/04/03/drools-server-spring-configuration/).

### Including Knowledge into our Sessions

Inside the **change-set.xml** file we will find the following structure:

```xml
<change-set xmlns='http://drools.org/drools-5.0/change-set'
 xmlns:xs='http://www.w3.org/2001/XMLSchema-instance'
 xs:schemaLocation='http://drools.org/drools-5.0/change-set.xsd'>
   <add>
     <resource source='classpath:rules.drl' type='DRL' />
   </add>
</change-set>
```

We are using here the same structure that the Knowledge Agent normally uses, you can read about how to define these files in the [Drools official documentation page.](http://downloads.jboss.com/drools/docs/5.0.1.26597.FINAL/drools-expert/html_single/index.html#d0e933) Just for you to know here we are including a DRL file that is located in the classpath and it's called **rules.drl**. It's important to know that we can include Rules files, Business Process Files (DRF), and also compiled knowledge packages (PKG) that can be locally in the classpath or hosted remotely in Guvnor or in a remote File/Web server.

### Rule Definitions, Process Definitions, etc

As I mentioned before, you can include any type of Knowledge inside a **change-set.xml** file, and all these resources will be included inside an automatically created session based on the profiles that you define.

In this case my rules.drl file looks like:

```java
package org.plugtree.examples;
import org.plugtree.drools.server.model.Person;
import org.plugtree.drools.server.model.Pet;
import org.plugtree.drools.server.model.Pet.PetType;
rule "Print cat from a person"
when
$p: Person($pets: pets)
$cat: Pet(type == PetType.CAT) from $pets
then
System.out.println($p.getName() +" has a cat called "+$cat.getName());
end
```

## Testing our Remote Knowledge Sessions

Once we configure all the profiles that we want to use, we can start an instance of our Application/Web Server, and we can start creating clients to interact with those remote sessions.

As I mentioned before, we can access to the Knowledge Session hosted inside the Drools Server using the REST or the SOAP protocol. Here I will show how to configure a client that will access to our defined Stateful Knowledge Session called "ksession1". But I will also provide a SOAP UI project that will contain a call to a SOAP service using the same command that we will see here.

Take a look at the following test case (please, pay attention at the comments inside the code):

```java
/**
 * Testing the Drools Server
 */
public void testDroolsServer() throws JAXBException, IOException, ClassNotFoundException {
  List<String> myDomainClasses = new ArrayList<String>();
  myDomainClasses.add("org.plugtree.drools.server.model.Person");
  myDomainClasses.add("org.plugtree.drools.server.model.Pet");
// I need to create a JAXB context including my domain classes
// to be able to create a JAXB representation to send to the server
jaxbContext = DroolsJaxbContextHelper.createDroolsJaxbContext(myDomainClasses, null);
Person myself = new Person("salaboy");
Pet dog = new Pet("fufu", Pet.PetType.DOG);
Pet cat = new Pet("fifi", Pet.PetType.CAT);
myself.addPet(dog);
myself.addPet(cat);
// Once I get my object I need to create
// some commands to execute on the server
BatchExecutionCommand cmd = new BatchExecutionCommand();
// Here I include a reference to the session that
// I define in my Knowledge Context Profile
cmd.setLookup("ksession1");
cmd.getCommands().add(new InsertObjectCommand(myself, "person1"));
cmd.getCommands().add(new FireAllRulesCommand());
// Once I get all I need to send to the server,
// I need to use the JAXB context
// to obtain the JAXB representation.
StringWriter xmlReq = new StringWriter();
Marshaller marshaller = jaxbContext.createMarshaller();
marshaller.setProperty("jaxb.formatted.output", true);
marshaller.marshal(cmd, xmlReq);
// I create a HTTPClient to interact with the
// server via REST (HTTP POST)
httpClient = new HttpClient();
httpClient.getHostConfiguration().setHost("localhost", 8080, "http");
//Print the JAXB xml that we will send to the server
System.out.println(xmlReq.toString());
// Send the Commands JAXB representation to the server for execution
PostMethod postMethod = new PostMethod("/drools-server/services/rest/execute");
postMethod.addParameter("command", xmlReq.toString());
httpClient.executeMethod(postMethod);
// Everything was fine?
assertEquals(200, postMethod.getStatusCode());
// Get the response from the server
String response = postMethod.getResponseBodyAsString();
System.out.println(response);
// We can transform the response that is in JAXB to a ExecutionResults object using the JAXB unmarshaller
ExecutionResults resp = (ExecutionResults) jaxbContext.createUnmarshaller()
.unmarshal(new ByteArrayInputStream(response.getBytes()));
// Check if the response is OK
assertNotNull(resp.getFactHandle("person1"));
assertNotNull(resp.getValue("person1"));
Person person = (Person) resp.getValue("person1");
assertEquals(2, person.getPets().size());
}
```

## In Brief

We delegate the execution to the Drools Server hosted Sessions. This offers a huge advantage for scenarios that need to handle multiple sessions with big load. Instead of having a single application that spawn multiple sessions locally, we can delegate different sessions to different instances of Drools Server hosted in different machines.

### Download Section (Updated Using Spring Configurations)

Just for playing purpose, you can download here a sneak preview of the [drools-server.war](http://www.plugtree.com/downloads/drools-server-sneakpreview/drools-server.war), containing the previously described files and configurations. Here is the [project](http://www.plugtree.com/downloads/drools-server-sneakpreview/DroolsServerPost.zip) that I used to test the Drools Server WAR that also contains a SOAP UI project to test the SOAP capabilities of the Drools Server. I've also include [here](http://www.plugtree.com/downloads/drools-server-sneakpreview/DroolsServerExampleModelPost-1.0-SNAPSHOT.jar) a jar containing my domain classes needed to be available inside the **server/lib/** directory inside JBoss. These classes are used to be able to compile your rules resources, that's why you need to make it available for the runtime context in your Application Server.

Remember this will be merged soon into the trunk and will be available for you to play in the next few weeks. Feedback is appreciated at this time!For more technical and detailed information, visit lucaz's blog: 

[<http://lucazamador.wordpress.com/2010/04/03/drools-server-spring-configuration/>](http://lucazamador.wordpress.com/2010/04/03/drools-server-spring-configuration/)
