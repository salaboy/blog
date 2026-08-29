---
title: "Drools Workshop @JBCNConf - Rules Explained & Slides"
date: 2016-06-20 12:27:34 +0000
permalink: /2016/06/20/drools-workshop-jbcnconf-rules-explained-slides/
description: "During my Drools workshop in Barcelona, I've provide the audience with 3 incomplete DRL files for them to implement."
tags:
  - "Drools"
  - "drools training"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "rule engine"
  - "tutorial"
  - "engine"
  - "knowledge"
  - "rules"
  - "workshop"
original_url: https://www.salaboy.com/2016/06/20/drools-workshop-jbcnconf-rules-explained-slides/
---

During my Drools workshop in Barcelona, I've provide the audience with 3 incomplete DRL files for them to implement. The DRL rules were quite challanging, and for that reason, on this post I will be explaining how to get all the rules working and the tests green. The main reason why I didn't provide the solutions right away, was to push the attendees to provide their own solutions, which might include changing the model, changing the rules and how they were defined. When working with Rule Engines and Knowledge Based formalization, it is quite important to understand there is always multiple solutions available for the same problem, take this blog post as one of those solutions. If we try to make the game more complex, the rules will change and probably also gain more complexity, without more introduction, here are the slides and the final complete rules.

## Slides & Resources

http://www.slideshare.net/salaboy/drools-workshop-jbcnconf-2016

Source code repository: <https://github.com/salaboy/drools-game-engine>

Drools official documentation: <http://docs.jboss.org/drools/release/6.4.0.Final/drools-docs/html/ch08.html> (Rule Language Reference Chapter)

## Rules & Tests explanation

I've just pushed the final version of the rules for the tests to work. I wanted to give you guys a brief explanations about these rules, or at least the most important ones. If you have any questions don't hesitate to ask via comments or via [twitter](http://twitter.com/salaboy).

### Stateless Rules Test

Take a look at the tests: [A_StatelessConformanceTest.java](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/test/java/org/drools/workshop/rules/tests/A_StatelessConformanceTest.java), this was solved by most of the workshop participants, most of the rules are quite straight forward. Look at the [house-conformance-rules.drl](http://house-conformance-rules.drl) file for the actual rules. I want to congratulate [David Cobo](https://github.com/didvae) for sending a Pull Request with the solutions for these rules. If you still have questions about this please get in touch. In that regards I want to congratulate [Zaída de Isidro](https://github.com/tearsakura) for also getting in touch using a PR to send questions about the excersice, that's definitely the way to start contributing with Open Source projects!

### Stateful Scenarios for the Game Rules Tests

Here is where the rules start to get complex or at least more juicy, because we are actually defining the behavior of the world.

The [B_GameRulesTest.java](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/test/java/org/drools/workshop/rules/tests/B_GameRulesTest.java#L74) test case using the Drools Engine APIs to test the world/game behavior rules. This is something that we usually wants to abstract from the end user behind a well defined API. For this reason [C_GameAPITEST.java](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/test/java/org/drools/workshop/rules/tests/C_GameAPITest.java) does exactly the same,  but using the [GameSession](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/main/java/org/drools/workshop/rules/GameSession.java) interface, which abstracts the Rule Engine internals.

But let's take a look at the rules now: [game-rules.drl](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/main/resources/rules/game/game-rules.drl#L137) and let's start with the last rule called: **rule "Out Goal is to go outside"**. This rule defines when the user wins the game:

```java
rule "Out Goal is to go outside"
    when
        $p: Player()
        $o: Outside( peopleInTheRoom contains $p.getName())
    then
        insert( new GameMessage( "Congrats! You manage to escape the Room!" ) );
end
```

Quite straight forward, if the Player is cointained in the Outside room you won! (look at the model, Outside extends Room).

Then we have the rules about Light, which I briefly explain during the workshop:

```java
rule "Light in the room when there is lightbulb and switch on"
    when
        $lb: LightBulb(connected == true, broken == false)
        $ls: LightSwitch(on == true)
        $r:  Room(items contains $lb, items contains $ls)
then
    insertLogical( new Light() );
    insert( new GameMessage( &quot;There is light in the room!&quot; ) );

end
```

This rule defines when we have Light in the room. Notice that I'm using the insertLogical statement, which uses the Truth Maintaince feature of Drools. This means that as soon as any of the conditional clauses becomes false (LightBulb not connected or broken or the LightSwitch becomes false) the Light fact is automatically rectracted, so there are is no more Light.  Notice also the Light() class definition is not inside our Model classes, this is a Declared Type inside Drools and you can find this type definition in the global.drl file. Most of the time we use Declared Types for things that are only important for Rules, if you need to use this concept outside you might need to create the Light class. Look at the Drools Official Documentation for more about Declared Types.

***Note:** this can be improved by also adding the Room to the Light concept, because as it is, there is Light in the whole world. You can add a property to the declared type and to the declared type constructor. You can end up doing something like insertLogical( new Light( $r ) );*

Based on this new type, we can start creating queries that uses this new information to return Visible and Non-Visible Items:

```java
query "getVisibleItems" (String $roomName)
    Light()
    $i: VisibleInDayLightItem()
    $r: Room(name == $roomName, items contains $i)
end
query "getDarkItems" (String $roomName)
not(Light())
$i: ShineInTheDarkItem()
$r: Room(name == $roomName, items contains $i)
end
```

These two queries helps us to know which Items are visible for the Player based on the availablity of the Light fact. As soon as the Light is inserted or automatically retracted these queries will return different items.

Another interesting rule that we can look at is:

```java
rule "If we have a key for a (locked and closed) door in our room then open the door"
    when
        $p: Player( )
        $d: Door( $doorName: name, open == false, locked == true ) 
        $r: Room( peopleInTheRoom contains $p.getName(), doors contains $d )
        Key( name == $doorName ) from $p.getItems()
    then
        modify( $d ){
            setLocked( false ),
            setOpen( true )
        };
        insert( new GameMessage( "Door '" + $doorName + "' Unlocked and Opened!" ) );
end
```

This rule is doing some magic, and again is just to demonstrate what kind of behavior can be defined here. This rule is in charge of checking if the Player picks up a Key for a corresponding Door (based on the name of the key and the door) the Door will be automatically unlocked and open.

The only new thing here is the **FROM** operator, which looks up into the Player().getItems to see if there is a Key corresponding with the Door name.

The **FROM** operator allows you to inspect objects that were not directly inserted as facts by calling the insert() method on the session or from a Rule. In this case, we have inserted the Player, but not the List&lt;Item&gt;s inside it. For that reason we need to use FROM to get the Item references and compare them as if they were Facts.

On the RHS/consequence of this rule, we are modifying the Door state and letting the engine know about this change. Based on this we can write another Rule to react on Open Doors and do something else.

Finally, something worth explaining are these two rules:

```
rule "Items can be picked when you see them (lights off -> shine in the dark)"
    when
        not(Light())
        $p: Pickable()
        $s: ShineInTheDarkItem( this == $p)
    then
        insertLogical( new PickableItem( $p ) );
end
rule "Items can be picked when you see them (lights on -> day light)"
when
Light()
$p: Pickable()
$v: VisibleInDayLightItem( this == $p)
then
insertLogical(new PickableItem($p));
end
```

Once again using insertLogical plus the state of the Light to define which Items can be picked. These rules basically define that if you can see an Item and the Item implements Pickable, we will create a PickableItem with that Pickable object so the user can pick it up. As soon as the user cannot see the Item, the PickableItem object will be retracted.

I will let you to analyze the other rules, if you have questions about them, don't hesitate to ask.

### Stateful Scenarios for Suggestions & Truth Maintainance

The rules here are not complex, but the result is quite advanced in the sense that we can get at all times a set of suggestions matching with the contextual data that we have at any given point. You can take a look at the test which checks which suggestions are being provided based on different states of the game. The test class is called: [D_gameSuggestionRulesTest.java](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/test/java/org/drools/workshop/rules/tests/D_GameSuggestionRulesTest.java) and it uses the rules defined in the file called: [game-suggestions-rules.drl](https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-rules/src/main/resources/rules/suggestions/game-suggestions-rules.drl#L18)

As I mention here the rules are not the most important thing, but they play a fundamental role in how the Suggestions Mechanism work:

```
rule "Suggest: Use Door when there is an open door in the room"
    when
        $p: Player()
        $d: Door( open == true )
        $r: Room( doors contains $d, peopleInTheRoom contains $p.getName())
    then
        insertLogical( new UseDoorCommand( $p, $r, $d ) );
end
```

This rule, basically suggest to the Player to use the UseDoorCommand when there is an open Door in the room where the player is standing. By inserting a new instance of the UserDoorCommand() class we can return the Command instance ready to be executed. In this example, the player can select this command and execute it to use an opened door. The moment that the change the state, this command is retracted and not returned by the getAllSuggestions() query.

## Summing Up

I recommend you to try and experiment with the example to fully understand what can be done with Drools. The next step is to provide a way to expose the GameSession as a service. A good experiment is to expose these mechanism via REST endpoints so we can create multiple GameSessions to simulate a GameServer, where multiple players can be playing games in parallel.

It will be also interesting to create more complex Houses/Buildings and the test associated with those scenarios to see how much the rules that I've (or you) defined work for more complex cases. If you are interested in any of these extensions, feel free to contact me and we can work together on them. Also, if you are interested in Drools & Games integration you can take a look at the [GSoC Program this year where we are integrating Drools with Minecraft](/2016/04/25/google-summer-of-code-2016-drools-minecraft/).
