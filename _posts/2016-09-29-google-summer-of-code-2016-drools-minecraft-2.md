---
title: "Google Summer of Code 2016: Drools & Minecraft"
date: 2016-09-29 11:43:57 +0000
permalink: /2016/09/29/google-summer-of-code-2016-drools-minecraft-2/
description: "Another successful Google Summer of Code program took place this year. We worked together with Samuel Richardson from the USA to get the first integration…"
tags:
  - "basic"
  - "community"
  - "Drools"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "tutorial"
  - "engine"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2016/09/29/google-summer-of-code-2016-drools-minecraft-2/
---

Another successful Google Summer of Code program took place this year. We worked together with [Samuel Richardson](https://github.com/youthfulIdealism) from the USA to get the first integration between the [Drools](http://www.drools.org) Engine and the popular game engine [Minecraft](https://minecraft.net/en/). The scope of the project was to experiment how Drools can be used to declaratively define a game's logic. I initially thought about modelling point & click games such as Escape The Room, Monkey Island, Maniac Mansion, etc but after looking at how to work with Minecraft I've opened the concept to wider game definitions.

[![gsoc](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2016/09/gsoc.jpg)](/2016/09/29/google-summer-of-code-2016-drools-minecraft-2/gsoc/)

We worked with Sam into creating a generic game engine that will take the Rules Definitions and drive the game (the Minecraft Mods) . Sam created a couple of Minecraft MODs that provides a scenario for the game which interacts and delegate to Drools the game's logic.

You can find the work for the Drools Game Engine here: https://github.com/salaboy/drools-game-engine

And the two mods projects here: <https://github.com/youthfulIdealism/minecraft-horse-race-mod> and

<https://github.com/youthfulIdealism/minecraft-capture-flag-mod>

These two games are using the rules described here:

<https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-capture-flag-kjar/src/main/resources/rules/game/game-rules.drl>

and here:

<https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-horserace-kjar/src/main/resources/rules/game/gamerules.drl>

We spent a lot of time in trying to get the separation right, so now you can consume the game server itself indepentendly of the UI. This opens up the doors so you can use the engine withoug Minecraft. For that reason we have created also a set of services that exposes the Game Engine via rest in case that you want to interact with it remotely.

You can take a look at the main GameSession interface which is in charge of defining how to create new game sessions and enables the UI to register callbacks so actions can be executed when the logic of the game says so.

<https://github.com/Salaboy/drools-game-engine/blob/master/drools-game-engine-core-api/src/main/java/org/drools/game/core/api/GameSession.java>

Because of this separation you will see that each game has its own test suite where both, the Rules and the GameSession API is tested to make sure that new games can be created and the rules are behaving as expected.

There is a lot of things to improve still, both in the Game Engine and in the MODs, so feel free to get in touch with us if you want to participate on the project. Hopefully we can build enough features to include it in the Drools Project.
