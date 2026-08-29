---
title: "My thoughts on BPM, CM, DM, Rules, Knowledge Formalization and Automation"
date: 2017-01-01 10:52:54 +0000
permalink: /2017/01/01/my-thoughts-on-bpm-cm-dm-rules-knowledge-formalization-and-automation/
description: "For this article, I’ve tried to summarize what I’ve learned in the last 9+ years working on Open Source projects."
tags:
  - "basic"
  - "bpmn2"
  - "case management"
  - "engine"
  - "English"
  - "Java"
  - "process"
  - "rule engine"
  - "workflow"
  - "BPM"
  - "BPMS"
  - "microservices"
  - "open source"
  - "rules"
original_url: https://www.salaboy.com/2017/01/01/my-thoughts-on-bpm-cm-dm-rules-knowledge-formalization-and-automation/
---

For this article, I’ve tried to summarize what I’ve learned in the last 9+ years working on Open Source projects. BPM, Process Engines, Case Management, Rule Engines and Decision Management.  They are all related to the fact that they promote Knowledge Formalisation and Automation with the sole purpose of making sure that we, as developers, don’t hide what is really important for the business/organization in the software that we build.  These technologies and methodologies also build up on the idea of making sure that we can start small and iteratively cover more and more scenarios.  For these reasons, I thought that it would be good to create a blog post with my opinions on the technology, the outstanding issues, and some thoughts on what I believe it is going to be a very interesting future. I welcome any comments or additions that you might have and am open to new opinions and debate on the subject!

## Good Old #BPM

Based on my experience, BPM is good on paper, not so good on the implementation phase. BPM can be strong as soon as you have some processes up and running where you can clearly see what is going on, but to reach that point you require a huge investment.

The investment that you need in order to get a BPM project running is huge and it comes from different angles and each is critical to success:

- You need to have a Business Sponsor promoting the use of BPM, a Stake Holder that understand and believe the advantages of adopting BPM
- Developers needs to learn about:
  - Process Engines,
  - BPMN (specification [BPMN 2.0.2](http://www.omg.org/spec/BPMN/2.0.2/) ),
  - how to version and keep track of the processes,
  - how to migrate from different process versions,
  - how these process engines will play with their infrastructure,
  - etc.
- Business experts needs to understand BPMN
- Business Experts and developers needs to collaborate to understand each other and the models that they create

Besides the investment, you need to be realistic with the ambition of the projects that you choose to start with BPM.  Most of the time, companies decide to adopt BPM as some kind of silver bullet approach. I’ve seen some real life stories where companies started small, one process at a time, in order to see quick results to promote BPM adoption, while this is a good approach to start, it is not enough.

Not all about BPM is wrong or impossible to achieve and the rewards of making a BPM project successful really pays off all the investments. But we need to make sure that we help companies on the adoption phase and that we don’t oversell impossible projects.

Once you get a very small process up and running the list of goodies never ends:

- Traceability of your business activities
- Real-time data about your business operations
- Self Documented models that will guide daily operations
- Integration points for system to system integrations
- And the list go on forever

From the technical perspective, we need to make sure that we keep all these good features as part of our solutions.

### Case Management (#CM)

Case Management arrived with the promise of supporting more dynamic and flexible cases, to adapt to real life situations, but still, it requires a huge amount of investment in order to start seeing the benefits.

Case Management adds on top of BPM, and complicates things further, by allowing you to create more flexible processes, now people spends hours discussing if a process is flexible enough to be applied or not. As any new trend, companies seems to just jump on the new technology and try to do everything with it. I do believe that Case Management (the spec: <http://www.omg.org/spec/CMMN/1.1/Beta/>) provides some valuable concepts, but it doesn’t add or fix any of the implementation issues that we had with BPM in general.

Case Management is just a small addition on top of what we know about BPM. From the technical and methodological perspective, it doesn’t add any new or complicated requirement.  We still need to deal with a process engines and all the complexity that this mean.

## #Rule #Engines

Rule Engines, on the other hand, because of the flexibility that they provide, have been implemented in completely different contexts.  I’ve seen so many successful implementations, and I believe that this is because the scope of the projects are a lot smaller than the ones that BPM tries to solve.  Rules Use Cases are focused on tackling real-life problems, and the more the technology evolves, these scenarios tend to be stateful by nature, bringing with them some technical challenges.  However, this doesn’t stop people finding new architectural patterns to implement them in real life scenarios.

The main problem that I see around Rule Engines, is the learning curve and the inherent complexity of their implementation. You really need to invest time in learning and understanding how the Rule Engine works in order to start thinking about how you are going to solve the problem at hand. I haven’t seen yet a more guided approach where with the Rule Engine you get a pre-baked solution for your type of problem. In my opinion, this will be a huge step forward into simplifying the adoption of these technologies.

### Decision Management (#DM)

It is good to see that some kind of standardization is reaching the Decision Management space. With DMN ( [DMN 1.1](http://www.omg.org/spec/DMN/1.1/)) a set of standard models that can be produced to represent how decisions can be represented and then automated. One way, but not the only way, of implementing and automating the execution of these decisions is by using a Rule Engine.But again, Rule Engines are complex beasts, and while you can use a Rule Engine for simple decision making, sometimes you need to ask yourself if you are not adding too much overhead to your architecture.Having said that, I believe that DMN bring some of that pre-baked flavour to the Rule Engines space, by unifying the execution semantic of these decisions, the Rule Engines will need to follow the specification and by that, a lot of what you need to know in order to use a Rule Engine will be reduced, because now you just need to understand the DMN specification :)

## #Processes & #Rules

I’m a true believer of the fact that Rules and Processes (and any other form of knowledge representation) should coexist, along with our applications to separate the business definitions from the technology stack (and development methodologies).  I do recognize that the integration of these technologies is not quite there yet.  This is in part because our technology landscape is changing.  Cloud platforms are changing the way that we develop and architect software solutions and this is pushing technologies such as Process Engines & Rule Engines to change their roles.  With the uprising of trends like MicroServices, we are moving away from centralized orchestrations, such as the one provided by ESBs and Process Engines to a more distributed approach.

I would love to see that we push ourselves in order to bring more technologies into the mix. In the same way that Rules are leveraging the BPM methodologies & life cycle, I see also some other Artificial Intelligence algorithms following the same approach.

## Processes, Decisions & Artificial Intelligence (#AI) together

Processes are simple enough to be understood by non-technical people, that’s why it is usually the first step.  Rule Engines, on the other hand, are more complex.  They preach simplicity for decision making, but the runtime behavior of that logic is much more complicated and technically Rule Engines are a more difficult tool for developers to handle.

Rule Engines, similarly to AI algorithms (such as supervised learning, neural networks, and other categorizations algorithms) share the same characteristic of being implemented only for solving very particular problems.  Usually in a very narrow domain. In order to make all these technologies work together, we need to find the right balance between the generality of the solution and the complexity inherited from the technology that we choose.

We will need to build better tools to deal with all these technologies and to include them in same methodology pipeline.

## A look into the future

What I would expect from the next couple of years is to see out there tools a little bit less focused on the standards (but using them in the back) and more agile in the approach that they take to engage new users. In other words, I’m expecting to see clever tooling that hides all the standards, engines, and algorithms complexity from the end user which is only interested in defining what the software should do for them.

I envision tools tied to domain specific activities (verticals, such as healthcare, finance, gov.) which can generate a set of models based on declarative metaphors defined specifically for those scenarios.  Unfortunately, these tools much more tied to specific domains are rare topics in Open Source projects, but with the progress that we have seen in the last 6 years on standardization, we shouldn’t be too far away from having a common marketplace to exchange knowledge models and standard practices.

What I would love NOT to see in the next couple of years are Open Source projects fighting (or being forked) about what is the best BPM engine or the best technology out there.  My point here goes back to a blog that I wrote several years ago ( [jBPM5 vs Activiti5? dumb question? \| .Salaboy](/2011/01/19/jbpm5-vs-activiti5-dumb-question/) ) (and it became quite popular). This post was about the fact that it doesn’t really matter which Process Engine is better, a Process Engine engine is a Process Engine.  We as developers needs to know how to use them and what they are good for, but that’s it. A Process Engine is just a tool, we need to know how to use it, but more importantly we need to know how it will play with all the other components that we have around it.  We need to focus on building around Process and Rule Engines for the sake of the end users. We need to close the gap between authoring of the models and the execution to maximize the value that these tools can bring to the organizations that adopt them. We need to make sure that usability and simplicity come first.

With the “Cloud” and the decentralization proposed by approaches like MicroServices and methodologies like Domain Driven Design (DDD) practices, I can see Process Engines & Rule Engines being a small (but key) part of our MicroServices.  For that to happen, Engines will need to change, they will need to become smaller, have less footprint, both in memory and dependencies.  At the same time, they need to provide tools easier to use and to adapt to more specific cases. I see DDD and Business Automation converging in the near future.  The software development practices are moving towards how the business is organized and this means that business automation techniques will make much more sense to developers.

I would love to hear your thoughts about these topics, feel free to drop me a line here or in twitter if you want to share your thoughts. See you all out there, Happy new year!
