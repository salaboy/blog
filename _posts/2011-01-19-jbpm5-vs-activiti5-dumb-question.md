---
title: "jBPM5 vs Activiti5? dumb question?"
date: 2011-01-19 20:22:42 +0000
permalink: /2011/01/19/jbpm5-vs-activiti5-dumb-question/
description: "Come on guys/girls/CTOs/CEO/Architects/Developers! there is no battle between jBPM5 and Activiti5."
tags:
  - "English"
  - "Java"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jbug"
  - "PlugTree"
  - "activiti"
  - "BPM"
  - "bpmn2"
  - "BPMS"
  - "Drools"
  - "engine"
  - "hat"
  - "JBoss"
  - "jBPM"
  - "jBPM5"
  - "process"
  - "red"
  - "Salaboy"
original_url: https://www.salaboy.com/2011/01/19/jbpm5-vs-activiti5-dumb-question/
---

Come on guys/girls/CTOs/CEO/Architects/Developers! there is no battle between [jBPM5](http://www.jbpm.org) and [Activiti5](http://www.activiti.org). If you are here because you are looking for the right option, I will give you some recommendations to choose one rather than the other. I will not make a detailed comparison between features, instead I will make a more project to project overall comparison (Write me back if you want a feature to feature comparison). I'm not a [Red Hat](http://www.redhat.com) / [JBoss](http://www.jboss.org/) or [Alfresco](http://www.alfresco.com/) employee, so I will express my personal opinion about these two projects and why I decide to write and participate in jBPM5/Drools as a community member.

In this post I will highlight some points about these two projects. However the conclusion is that you can choose either [jBPM5](http://www.jbpm.org) or [Activiti5](http://www.activiti.org) and they will improve and change the way that you are used to developing applications.

### **The main similarities between this two projects are:**

- BPMN2 process modeling and execution environment
- They are both BPM Systems (implementing the BPM discipline)
- Open Source - ASL ([Apache](http://www.apache.org) Software Licence)ed
- Both were originally developed by JBoss (it’s not a secret that Activiti5 is jBPM4 design and jBPM5 is Drools Flow code base)
- Maturity, both were written from the scratch and both started about 2 years and a half ago.
- Human Task Life Cycle Management. The only difference between jBPM5 and Activiti5 is that jBPM5 implements the WebService-HumanTask standard to describe the Human Task Management Life Cycle. If you are interested to know about this standard and the advantages of adopting it, you can read the introduction chapter of the [WS-HT specification here](http://incubator.apache.org/hise/WS-HumanTask_v1.pdf).
- Both projects uses different flavors of the  [Oryx](http://code.google.com/p/oryx-editor/) editor for modeling BPMN2 processes. jBPM 5 uses a fork for the Open Source project maintained by [Intalio](http://www.intalio.com). Activiti5 used a different branch maintained by [Signavio](http://www.signavio.com).

### Now, which are the main differences between them?

- The companies / The business model
- The project leaders / Community
- The goals of the projects
- Future / which one should I choose?

Based on these four points and on your personal/company requirements, you can make a long-term decision about which is the best project for you to adopt.

Disclaimer: if you are a java developer learning new technologies, doing your first applications or trying to understand a BPMS, you can take advantage of this comparison. It’s important to notice that knowing both projects will help you to improve your skills, learn best practices, architectural designs, a new way of developing applications, a cool discipline and a bunch of cool stuff. Go ahead and pick one, when you learn the concepts behind one of them, in order to adopt the other, you have to learn a new API, adapt some concepts and learn wider ones.

### The companies / the business behind the projects

Both projects are distributed under the ASL (Apache Software License), from the licensing perspective it is exactly the same. You can use both of them without restrictions. Once again, if you are a developer learning something new, both of them will fit perfectly. If you don’t have too much BPM expertise, both of them will look alike.

My community perception about Red Hat and, as far as I know, the Red Hat/JBoss business is about services, the money comes from selling services and support. If you are thinking about spending your money on Red Hat, you can buy support for the SOA Platform Stack. However, until now you cannot buy support strictly for jBPM. This is probably a great advantage, which means that if you buy support from Red Hat, you will get support for the full stack of middleware. Red Hat is specialized in providing that service.

I worked with Alfresco’s CMS and understood how its community works and the business around CMS, but I’m still confused about their business plans for Activiti5. As a company, they can embed the Activiti5 runtime inside the CMS project as they did with jBPM3, or they can sell services about the BPM System solution.  In the official web page(www.activiti.org), they don’t mention anything about Alfresco selling Activiti5 services. I’m not sure if Alfresco is planning to provide them in the near future.

### The project leaders and the community

It’s well known that all the community members who know JBPM4.x history move to Activiti5 based on the similarity of the code base and configurations. So the jBPM 4.x community is the same as in Activiti5.

New adopters are asking a lot of questions about jBPM5 and Activiti5.

The jBPM5 community will be probably populated by jBPM 3.x users that want to have the official support from Red Hat/JBoss plus the new ones that understand the great advantages of using a BPM System on top of a Rule Engine. The Drools Flow community and those who use  it, can easily migrate their application to use the new jBPM5 dependencies. Community migration efforts are already being done and a tool for migration is being developed for those jBPM 3.x users.

You can find some useful links about jBPM5 here:

<http://blog.athico.com/2011/01/recent-jbpm-5-blogs-articles-videos-and.html>

Please feel free to write me back if you have a specific topic or a set of topics that you want to read about. I really enjoy writing about jBPM5 and Drools, but comparisons are fun too!

Right now, jBPM5 is an independent project separated from Drools but highly integrated with the rule engine. The project leader, [Kris Verlaenen](http://kverlaen.blogspot.com/), is doing a great job trying to get a first stable release at the end of this month. On the Activiti5 side both [Tom Baeyens](http://processdevelopments.blogspot.com/) and [Joram Barrez](http://www.jorambarrez.be/blog/) are doing an excellent job trying to get attention and adoption from their re-branded BPMS.

*add whatever you want here :)

### Project’s Goals

As far as I know, they have very different perspectives and goals. The Activiti5 team is fighting for adoption, while the jBPM5 team is struggling for improving concepts, giving us a new twist, great features and flexibility.

There is no way to say that one is better than the other when they have different goals in their roadmaps. If you are fighting for adoption, you will focus on conferences, tooling and integration. The project roadmap for adoption has short period releases and stable deliverables.

If your project roadmap includes features that were never developed, long period releases will probably be required. From my point of view Drools Flow was an innovative project built from the scratch to show that the interaction between a rule engine with a BPMS gives richer features and a great degree of flexibility to model real situations.

Right now, jBPM5 is a more ordinary project. A lot of the work that is being done now is about  tooling and demos to show common usage. jBPM5 will look very good in the next few months, after the first stable release.

### Future / Which one should I choose?

There is no simple answer. If you are looking for a simple lightweight BPMS both are good. If this is your first experience with a BPMS, no matter what you choose, you will be happy and you will have trouble with both.

If you want to join a community to contribute to these projects both are good. I can’t give an opinion about the Alfresco community, because I’m not so involved but it looks like an active community. From the jBPM5 perspective you will find a pretty active community as well. Right now, as a result of mixing Drools and jBPM3 communities, you will see strong activity in the Forums and in the IRC channel.

#### The important question here that you may ask to yourself is:

**Am I choosing a BPMS for the next couple of years or is it just for a little project?**If the answer of this question is:

- I’m just starting **OR** I will create a simple web app that shows the basic features **OR** the application will not be used by a large amount of users **OR** the application will not be critical for the organization **OR** we don’t have complex business processes and we don’t have complex business situations, **both projects will work well**.
- I need to build a middle-sized application that uses business process extensively, this business processes are not so complex (no more than 20 activities each, without too much exceptional branches) and the application is not critical for the company, **both projects will work well**.
- I need to build a new architecture that gives me the ultimate flexibility to express complex/ real life business scenarios **AND** I understand the power of a Rule Engine **AND** I understand the advantages of using it in conjunction with a BPMS (handling in an unified way my business logic and my business processes, using the same APIs, being as declarative as possible), you really need to try jBPM5!  This is not the common case, usually only advanced users that already developed more than one BPM application, notice this kind of advantages. If you don’t know how to leverage the power of a rule engine, both projects will give you the same amount of features. If you analyze the common features of a BPMS, there is no clear advantage between both projects. When you start to understand the power and advantages of the Rule Engine or when you really need a Rule Engine working together with a BPMS,x you clearly know what to choose for the next two years.

### Conclusion

As I mention in the post introduction: **You can choose jBPM5 or Activiti5, both will teach you and let you implement the BPM discipline main stages. Both are Open Source and ASL licenced.**If you are not only thinking in adopting a new technology and you already face some BPM implementation with jBPM3/jBPM4 or the old OSWorkflow you probably notice and know the advantages of using a **Rule Engine** in conjunction with the **BPMS**. If you are at that point please take a look at jBPM5 and the [Drools](http://www.drools.org) integration, you will probably be amazed. If you want to take a look at a running application designed using the concept of Rule Engine and BPMS together you can take a look at the following posts. Notice that Drools + jBPM5 offers you a full platform for declarative application programming.  Adding important features like the advantages of a CEP engine(Drools Fusion) and a Centralized Repository for all your business assets (Drools Guvnor).
