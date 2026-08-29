---
title: "Drools as a Service using Camel and VSM"
date: 2009-12-17 13:11:52 +0000
permalink: /2009/12/17/drools-as-a-service-using-camel-and-vsm/
description: "In this post I will show just one example about how to interact with Drools using the drools-camel project."
tags:
  - "English"
  - "Java"
  - "JBoss Drools"
  - "jbug"
  - "PlugTree"
  - "Drools"
  - "JBoss"
  - "Salaboy"
original_url: https://www.salaboy.com/2009/12/17/drools-as-a-service-using-camel-and-vsm/
---

In this post I will show just one example about how to interact with Drools using the drools-camel project. This project is still experimental, so it probably will change. We continue adding new features every day so stay tuned!

Disclaimer: 

this is not the best way to interact using [Apache Camel](http://camel.apache.org/), it's just a simple example that expose Drools as a web service.This post will show the first version of the integration that is currently changing to a better version, but this example will show the main component interactions.

The first thing that we need to see are the business rules that we will use:

```
rule "Update Ranking for persons between 21 and 30"
when
 $p: Person(age >= 21 && < 30, ranking == 0)
then
 modify($p){
   setRanking(10);
 };
end
rule "Update Person Ranking for persons over 30"
when
$p: Person(age >= 30, ranking == 0)
then
modify($p){
setRanking(20);
};
end
```

This rules will only rank a person based on his/her age. Very simple stuff. The second thing that we need to see is the camel route that we configure in the Spring applicationContext.xml file:

```
<camel:camelContext id="MyCamelContext">
 <camel:route>
   <camel:from uri="direct:start"/>
   <camel:process ref="droolsContextInitProcessor"/>
   <camel:process ref="xmlNodeTransformer" />
   <camel:to uri="direct:xstreamTransformer" />
 </camel:route>
 <camel:route>
   <camel:from uri="direct:xstreamTransformer" />
   <camel:process ref="camelXStreamFromXmlVsmTransformer" />
   <camel:to uri="direct:executor" />
 </camel:route>
 <camel:route>
   <camel:from uri="direct:executor" />
   <camel:process ref="batchExecutorProcessor" />
   <camel:to uri="direct:xstreamTransformerResult" />
 </camel:route>
 <camel:route>
   <camel:from uri="direct:xstreamTransformerResult" />
   <camel:process ref="camelXStreamToXmlVsmTransformer" />
   <camel:to uri="direct:finalResult" />
 </camel:route>
 <camel:route>
   <camel:from uri="direct:finalResult" />
   <camel:process ref="assignResultProcessor" />
   <camel:to uri="direct:executeResult" />
 </camel:route>
 <camel:route>
   <camel:from uri="direct:executeResult" />
   <camel:process ref="executeResultProcessor" />
   <camel:to uri="log:org.apache.camel.example.result?level=INFO" />
 </camel:route>
 </camel:camelContext>
```

This camel route will be improved in the next version, that is currently being developed. Basically this route takes an XML String transform the content into Drools Commands using XStream, execute the commands and transform the results back to XML to send the response to the client. In this case the web service call will be the action that will trigger the start of this route. Obviously with Apache Camel we can do this in multiple ways.

The next step that we need to see is how we expose Drools as a Web Service using any stack of webservices that you want:

```
@WebService
public class DroolsPipelineWS {
static ClassPathXmlApplicationContext ctx;
static{
ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
}
public DroolsPipelineWS() {
}
@WebMethod
public String execute(String inXml) {
System.out.println("XML:" + inXml);
String outXml = "";
try {
CamelContext camel = (CamelContext) ctx.getBean("MyCamelContext");
ProducerTemplate template;
template = camel.createProducerTemplate();
template.start();
template.sendBody("direct:start",inXml);
 ResultHandlerImpl resultHandler = (ResultHandlerImpl) ctx.getBean(&quot;resultHandler&quot;);
 for (int count = 0; resultHandler.getObject() == null &amp;&amp; count &lt; 10; count++) {
    System.out.println(&quot;Waiting for results...&quot;);
    Thread.sleep(500);

 }

if (resultHandler.getObject() == null) {
  throw new IllegalStateException(&quot;Taking too much time to process&quot;);
}

outXml = (String) resultHandler.getObject();

} catch (Exception ex) {
  Logger.getLogger(DroolsPipelineWS.class.getName()).log(Level.SEVERE, null, ex);
}
return outXml;

}
}
```

Once again, this is not the best way, we are working in the best practicies for the version two of the integration that will be ready in the next weeks. You may ask here, and where is Drools here? and the answer is drools-spring (bauna magic!), a Stateful ksession was created by Spring (applicationContext.xml) using the project Drools VSM to interact.

The last thing that you need to know before start playing with this, is that you need to choose a Web Service stack, and deploy the project provided at the end of this post. I choose JBoss 4.2.3. Once you get the project deployed, you can access the WSDL at: http://localhost:8080/PlayingWithDroolsPipelinesWS/?WSDL

![Picture](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2009/12/picture-1.png "WSDL")

Then you can open [SOAP UI](http://www.soapui.org/) to interact with the service. I create a new Project, choose the WSDL and I'm ready to start using Drools as a Service. Take a look at my [SOAP UI](http://www.soapui.org/) (I also provide my SOAP UI project, so you basically don't need to work):

![Picture](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2009/12/picture-2.png "SOAPUI")

In the previous screen I show how to assert a fact into a session called **ksession1**, and then call the fireAllRules method. It's important for you to notice that the session status is maintained in the server side, and you can continue executing actions to that session. The other requests that I have configured in the SOAP UI project are: Modify the fact that you previously insert, get some object, and retract the fact.

Please note, that you will need to copy the factHandle id, to be able to make reference to that object (it's the same thing as in the Drools API's, you need the fact handle to update or retract a fact, in this case is just the id/external form).

So, that's it. The next post will be about the second version of the integration that will show a Camel friendly way of doing things, but at this point I'm not and advanced Camel user, so I need to learn a lot.

[Soap UI](http://www.soapui.org/) Project:

<http://www.plugtree.com/downloads/Drools-Pipelines-VSM-soapui-project.xml>

Maven 2 Project:

<http://www.plugtree.com/downloads/PlayingWithDroolsPipelinesAndWS.zip>
