---
title: "Drools - Use Case: Emergency Service - Scenario Definition (Part 1)"
date: 2010-03-19 13:39:40 +0000
permalink: /2010/03/19/drools-use-case-emergency-service/
description: ". This post will describe the Emergency Service Use Case that we will implement using Drools. We will discuss the main points needed to implement…"
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "bpmn"
  - "Drools"
  - "events"
  - "rules"
original_url: https://www.salaboy.com/2010/03/19/drools-use-case-emergency-service/
---

. This post will describe the **Emergency Service** Use Case that we will implement using Drools. We will discuss the main points needed to implement different business processes, business rules and events to fulfill the **Emergency Service** Scenario.

[Please read the disclaimer first](/disclaimer/)

## Use Case: Emergency Service

Imagine a city where an emergency happen. We don't know anything until someone calls to the Central Departments of the Emergency Service. When someone calls we answer the phone and ask a specific set of questions to get:

- The emergency location
- The emergency type
- The number of persons involved
- The approximate time when the emergency happened

When we get this information we prepare and send an ambulance to the emergency location. Based on the type of emergency we can equip differently each ambulance and select the type of doctors that will be on board.

Once we send the ambulance to the emergency location, the central department waits until it receives a notification from the ambulance that it pick up the patient. At this point, a new medical report is created and sent to the central offices. This new report causes an automatic selection of the nearest hospital available to treat those specific injuries. Based on the location and traffic information an automatic routine is triggered to calculate best route to the hospital.

From the emergency location to the selected hospital, the ambulance sends in real-time the patient vital information (heart-beat, pulse, etc) plus information about the location of the ambulance.

Once the patient is left in the hospital, the central receive a notification to start calculating statistics about the service for later analysis.

## Participants

We can say that following list of participants will interact in the previously described scenario:

- Call Attendant: is the one that answer the phone, this person has a computer software that guide him/her to ask the correct questions.
- Doctor: a specific doctor selected based on the type of accident.
- Patient: the one harmed in the accident.
- Ambulance: one ambulance is sent for each accident to the location where the patient is.
- Hospitals: for each accident we need to decide between a list of available hospitals based on proximity, beds available at that moment, etc.

## Sequence of Activities

Here I will describe a possible set of activities that will happen inside the proposed situation. This is not the only way to describe this situation, but for this example I've simplified things to describe the scenario from a high level perspective.

The first action that will trigger an activity in the Emergency Service Central Offices will be a new Emergency Call. When someone calls, a new activity will be created to take notes about the information of that particular emergency. Once we get this information another activity is required, we need to prepare and dispatch an ambulance to the emergency location.

When the patient is picked up, a new activity inside the central offices is generated. This activity will decide, based on the patient picked up notification the best hospital available, this activity will be automatically executed in central offices and the selection will be notified to the ambulance with the route that it needs to make to reach the hospital.

At this point, the central offices just wait that the ambulance reach the selected hospital to calculate all the statistics about the service given to that patient.

![Uc emergencyservice 07 businessprocess3](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/uc-emergencyservice-07-businessprocess3.png "UC-EmergencyService-07-BusinessProcess")

## Business Logic

The business logic for this scenario is distributed across all the activities previously described. We will use business rules that helps us to express our business logic in a simple and declarative way. We will describe how to select the best hospital, how we equip an ambulance and how to select the best questions to ask  based on the information dynamically provided by each emergency call.

Our business rules will be described using natural language, this will allow to non technical people understand them and change them. Some of the examples will be:

```java
rule "Add questions about fire emergencies"
when
The emergency include fire situation
then
Add burn injuries set of questions

end
rule "Fire emergency"
when
The emergency has a patient with burn injuries

then
Send a burn specialist to the ambulance

end
```

## Environmental changes

It is important to recognize all the changes that happen in the emergency service domain. All these changes in state can be recognized and we can react on them or not. Based in our interest in these events we can do calculations to helps to decide between multiple actions based on runtime information.

Events like "patient pick up", "patient vital signs" and "patient at the hospital" helps us to define the most dynamic aspects in our environment. We need to be listening to these events in order to react if some of them happens or not. For example, if we receive the "patient pick up" event notification, we know that some calculations needs to be triggered. But, if we never gets the "patient pick up" notification event, something is wrong and we need to do something to correct the situation.

In this case we will represent the dynamic knowledge about how to react to temporal based events using temporal constrained rules. For example, we will have rules like the following:

```java
rule "Ambulance don't pick up the patient after 10 minutes"
when
The ambulance don't pick up the patient 10 minutes after we receive the call

then
Call the ambulance for report

end
```

## Conclusions

We already define the scenario, so let's implement it using Drools! I will separate the implementations details into the following posts:

1. [Drools - Use Case: Emergency Service - Business Process Implementation  (Part 2)](/2010/03/23/drools-%E2%80%93-use-case-emergency-service-%E2%80%93-business-process-implementation-part-2/) (Updated!)
2. [Drools - Use Case: Emergency Service -  Business Logic Implementation  (Part 3)](/2010/03/29/drools-%E2%80%93-use-case-emergency-service-business-logic-implementation-part-3/) (Updated!)
3. Drools - Use Case: Emergency Service - Events handling and correlation  (Part 4)

**Update:**

I will also include some extra posts about how all will work together plus a list of details needed to understand the implementation.

**General Topics**

1. [Emergency Service Domain Model](/2010/03/26/drools-%E2%80%93-use-case-emergency-service-%E2%80%93-domain-data-model/) (Updated!)
2. Analyzing the project (how all these pieces work together)
3. Spring configurations

**Business Processes related topics**

1. User Tasks /  Human Task interaction (how to build a mini task list client)
2. Sending events to processes

**Business Rules related topics**

&lt;soon&gt;

**CEP related topics**

1. Wii  Remote event detection and correlations using Drools Fusion
