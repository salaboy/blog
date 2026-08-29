---
title: "Drools and jBPM5 @ InfoQ Brazil (English Version)"
date: 2011-07-14 22:39:20 +0000
permalink: /2011/07/14/drools-and-jbpm5-infoq-brazil-english-version/
description: "Hi there, I just want to share with you the English version of the interview that was published by InfoQ Brazil a couple of days ago about the latest…"
tags:
  - "Drools"
  - "English"
  - "Java"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jBPM5"
  - "jbug"
  - "PlugTree"
  - "JBoss"
  - "jBPM"
  - "release"
  - "Salaboy"
original_url: https://www.salaboy.com/2011/07/14/drools-and-jbpm5-infoq-brazil-english-version/
---

Hi there, I just want to share with you the English version of the  interview that was published by InfoQ Brazil a couple of days ago about the latest releases of the Drools and jBPM5 projects. You can find the [original article here in Portuguese](http://www.infoq.com/br/news/2011/07/drools-jbpm-salatino).  With no more introductions here is the interview.

![Drools and jBPM5 @ InfoQ Brazil (English Version)](http://cdn3.infoq.com/styles/br/i/logo.gif;jsessionid=A34A502D3326DF24CDF59D77FCF6258E)

## Interview

### **Q: What are you currently working on and what is your relationship with the JBPM and Drools projects?** **A:**

I have been a  community member/contributor since 2008 and I’m also the JBoss Community Award 2011 winner for bug fixing and adding new features to both projects. I’m currently working on some extensions inside Drools & jBPM integration project that is related to how people can distribute and interact with remote knowledge sessions that allow us to run business processes and business rules. I’m fixing bugs in drools core and also suggesting and adding new features to jBPM5. I’m also finishing my second book about jBPM that will be published this year.

### **Q: What is the motivation behind JBPM and how is it different from other BPM offerings?** **A:**

First of all jBPM is a solid, light-weight, open-source BPM engine that can be embedded anywhere and supports native execution of the BPMN 2.0 specification. But it's more than just that -- what makes it different from other BPM Systems is the integration of the Rule Engine (Drools Expert) and the Complex Event Processing(Drools Fusion) capabilities. These days BPM is not enough by itself. We need to have smarter mechanisms to deal with different business situations and using Drools + jBPM5 helps us to deliver declarative solutions that can help us solve complex scenarios. We can solve extremely complicated business situations using a declarative way that will allow us to share our solution with non technical people, who can validate and understand how the software that they are using is working. BPM Systems these days are focused on providing nice and integrated tooling to get started, but if you miss the fact that real business situations are complex, you will end up with extremely complicated business processes. If you take advantage of the declarative approach proposed by business rules, it will simplify your designs and to expose how the company knowledge impact the daily work.

### **Q: What is new and noteworthy in this new release?** **A:**

jBPM 5.1 includes a lot of small bug fixes and feature enhancements based on the feedback from the community. Most importantly, new features are the improved web-based designer for creating your business processes, which supports full round-tripping between the web-based tooling for business users and the Eclipse-based tooling for developers.  This version also includes a new examples module that shows most of the features in action, and the documentation has been updated and extended significantly.  Finally, there's junit test support for your processes, improved synchronization with the process repository, multi-threading support, etc.

### **Q: What are the current challenges of the project?** **A:**

I’m personally fighting to reduce the learning curve of these technologies. There are not many people who are familiar with the jargon of process and/or rule engines and its internal way of working. I’m spending a lot of time trying to create material and examples about how people can use these technologies. The Emergency Services application was built to show some common patterns about how to architect and use all these technologies together. Most of the time you need to understand the background behind the technology before using it in the way that is supposed to be used.

### **Q: How do you see the evolution in maturity of BPM deployments? Do you think companies are seeing BPM as a change of culture in IT or the focus is still limited to the technical aspect?** **A:**

One of the main goals of the BPMN 2.0 specification (Business Process and Modeling Notation) is to reduce the gap between technical people and business analysts that describe how the company work using flow charts. jBPM5 was designed with this concept in mind. We are working to create new tooling that helps towards the adoption of these technologies to people that really understand the business and not just the technical audience. During these last three years I have noticed that BPM is finally reaching the development arena. With this I mean that usually BPM is required and well understood by managers who want to gain visibility about what’s happening in their companies, but nowadays with platforms like jBPM5, the IT department will be able to deliver valuable solutions that gather all the information required by business people.

### **Q: How does JBPM fits in Service Oriented Architectures?  Can I plug it in my Enterprise Service Bus, for example?** **A:**

Totally!, jBPM is about system integrations also. That means that you can coordinate and orchestrate your services exposed by your service oriented architecture and access them in a unified way. My only warning here is that you need to remember that, to achieve the goals of true BPM and the collaboration of business users, BPM is more than service orchestration.  You could use jBPM to do low-level service orchestration, but BPM is more about human and system interactions, where we try to avoid low-level implementation details in the processes themselves.

### **Q: Do you have any advice for those considering or starting the implementation of BPM solutions in their companies?** **A:**

Before starting with BPM, you need to understand the main concepts behind the discipline. It’s extremely important to understand how you will apply BPM in your company before starting to code with the available tools. There are tons of books about how to apply the BPM discipline to different business scenarios and how to avoid common mistakes during these implementations. Once you get used to the BPM mindset, you will notice that a Rule Engine is the next step towards having a robust and unified solution to build enterprise solutions.

### **Q: Are you looking for contributions?** **A:**

All the time! There are tons of things to do and to improve. If you are interested in participating in the project or learning about these technologies, you can join me in some of my initiatives like: [Emergency Services Application](/2011/05/28/emergency-services-v2-jbpm5-and-drools-blueprint/) and Community Trainings ([Drools5 Community Traning](/2011/02/23/drools-5-community-training-announced-roadmap/)  & [jBPM5 Community Training](/2011/01/24/announcing-jbpm5-community-training/) ) as well as the jBPM5 and Drools project to fix bugs or add new features. The first step in community involvement is to be a user, so we encourage everybody to have a Jira account and to let us know when something is not working well. If you can provide a simple test that shows the problem or how a new feature can help to simplify the solutions, we can quickly fix that problem or guide you to implement that feature with our assistance. The jBPM and Drools projects are always looking for contributions as well, from simply testing, improving the documentation or reporting bugs, all the way to bug fixing and implementing new features.

### **Q: Where can one learn more about drools and jbpm, beyond the official documentation?** **A:**

I’m blogging a lot about these technologies and I’m publishing community training materials to help people to adopt these technologies. Take a look at the following links to find more information about the Drools and jBPM5 Community trainings. I encourage the whole community to give us feedback about these training materials, because as every community effort gets better when people use it and collaborate with it.  We encourage everybody in the community to write their own blogs about their experiences with open source projects. The following blog post was published by [Kris Verlaenen](http://kverlaen.blogspot.com/) (jBPM5 project lead) about some very interesting reading about jBPM5.

<http://kverlaen.blogspot.com/2011/03/some-interesting-reads.html>

jBPM comes with an installer that sets you up with a working environment so you can start playing with the tools.  And the new jbpm-examples module is a great starting point to see working examples for common use cases like human task management, etc.
