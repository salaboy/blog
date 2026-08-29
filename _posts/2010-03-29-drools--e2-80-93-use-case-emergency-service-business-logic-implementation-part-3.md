---
title: "Drools – Use Case: Emergency Service -  Business Logic Implementation  (Part 3)"
date: 2010-03-29 21:57:18 +0000
permalink: /2010/03/29/drools--e2-80-93-use-case-emergency-service-business-logic-implementation-part-3/
description: "This post will be about how we create and use Business Rules to define our complex business logic."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "business"
  - "Drools"
  - "rules"
original_url: https://www.salaboy.com/2010/03/29/drools--e2-80-93-use-case-emergency-service-business-logic-implementation-part-3/
---

This post will be about how we create and use Business Rules to define our complex business logic. We will analyze how these rules are authored using the [previously defined model](/2010/03/26/drools-%E2%80%93-use-case-emergency-service-%E2%80%93-domain-data-model/). The main idea to use rules is to keep separated all the application code that probably wouldn't change (screens, security, etc) from the business logic that tends to change often.

[Please read  the disclaimer  first](/disclaimer/)

## Defining our Business Rules

Business rules define complex logic that we have in our scenario in a simple and declarative way. We will define first, the logic that we are interested to express in the form of Business Rules, and then we will see how these rules are authored in order to represent each specific situation.

The following figure, represent the [previously defined Business Process](/2010/03/23/drools-%E2%80%93-use-case-emergency-service-%E2%80%93-business-process-implementation-part-2/):

![Emergencyservicebpmn2droolsflow](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/emergencyservicebpmn2droolsflow.png)

As you can see, once we get the Emergency Information based on the phone call we need to "Dispatch an Ambulance" to the Emergency Location. We can equip differently the ambulance based on the emergency information and this logic can be defined using Business Rules.

The process graph shows the Dispatch Ambulance as a Human/User Task. In this case the user will be responsible to check if the ambulance contains everything needed for that specific situation. The ambulance will be automatically equipped using a set of rules that will analyze the Emergency information to decide which medical kits to include, which doctor will be on board, etc.

We can define very simple rules for this situation. Take a look at the following proposed rules:

#### **Rule 1:** Fire Emergency

**When** The Emergency includes a fire situation

**Then** equip the ambulance with: a Medic trained for attend burns injuries and add the Fire Medical Kit

#### **Rule 2**: Car Crash Emergency

**When** The Emergency includes a car crash situation

**Then** equip the ambulance with: a Medic trained in bone injuries and add the Bones Medical Kit

#### **Rule 3**: Heart Attack Emergency

**When** The Emergency includes a Heart Attack situation

**Then** equip the ambulance with: a Medic trained in reanimation and add the Heart Attack Medical Kit

If we want to write these rules using the Drools Rule Language (DRL), you will get something like:

```java
rule "Fire Emergency"
 when
   $emergency: Emergency(type == EmergencyType.FIRE)
 then
   Medic medic = new Medic(MedicSpeciality.BURNS);
   MedicalKit kit = new MedicalKit("Fire Medical Kit");
   Ambulance ambulance = new Ambulance();
   ambulance.addKit(kit);
   ambulance.setMedicOnBoard(medic);
   $emergency.setAmbulance(ambulance);
end
rule "Car Crash Emergency"
when
$emergency: Emergency(type == EmergencyType.CAR_CRASH)
then
Medic medic = new Medic(MedicSpeciality.BONES);
MedicalKit kit = new MedicalKit("Bones Medical Kit");
Ambulance ambulance = new Ambulance();
ambulance.addKit(kit);
ambulance.setMedicOnBoard(medic);
$emergency.setAmbulance(ambulance);
end
rule "Heart Attack Emergency"
when
$emergency: Emergency(type == EmergencyType.HEART_ATTACK)
then
Medic medic = new Medic(MedicSpeciality.REANIMATION);
MedicalKit kit = new MedicalKit("Heart Attack Medical Kit");
Ambulance ambulance = new Ambulance();
ambulance.addKit(kit);
ambulance.setMedicOnBoard(medic);
$emergency.setAmbulance(ambulance);
end
```

Notice that the previous rules are pretty simple, and will be evaluated based on the Emergency Type. For this example, we keep things very simple. Let's see the following use case for Business Rules in the **Select Hospital** Business Rule Task.

## Scoring hospitals using Business Rules

Based on the Patient Pick Up Event, that the central offices receive when the ambulance reach the emergency location, we will decide dynamically the best hospital for the current patient. This decision will use the Status report provided by the Medic that pick up the patient, the current number of available beds in the each hospital and the each hospital speciality.

Let's define the following rules:

#### Rule 1: Rank the hospital based on Emergency Type

**When:** The Emergency Type matches with one of the Hospital Specialities

**Then:** Rank that hospital with 10 points

#### Rule 2: Rank with 5 points the hospitals that at least have 1 available bed

**When:** a hospital has at least 1 available bed

**Then:** Rank this hospital with 5 points

#### Rule 3: Reset Ranking if the hospital has no available beds

**When:** the hospital has zero available beds

**Then:** Reset the hospital Ranking (set the rank to zero)

If you want to see how this looks like in the DRL language, take a look at the following rules definitions:

```java
rule "Rank Hospital Speciality that matches EmergencyType"
 lock-on-active true
 ruleflow-group "select_hospital"
 when
   $emergency: Emergency($type: type.name)
   $hospital: Hospital($specialities: specialities)
   EmergencyType(name == $type) from $specialities
 then
   $hospital.setRank($hospital.getRank() + 10);
   update($hospital);
end
rule "Rank with 5 Hospital without the Emergency Speciality but with available beds"
salience -500
lock-on-active true
ruleflow-group "select_hospital"
when
$hospital: Hospital(availableBeds >= 0)
then
$hospital.setRank($hospital.getRank() + 5);
update($hospital);
end
rule "Rank with 0 Hospital without available beds"
salience -999
lock-on-active true
ruleflow-group "select_hospital"
when
$hospital: Hospital(availableBeds == 0)
then
$hospital.setRank(0);
update($hospital);
end
```

## In Brief

You can see how easy is to represent your business logic in a declarative and understandable way. In the following posts I will be writing about how to create more rules that interact with your business processes. So, stay tuned, this is just the beginning!
