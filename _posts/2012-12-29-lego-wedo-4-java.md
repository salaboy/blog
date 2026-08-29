---
title: "Lego WeDo 4 Java"
date: 2012-12-29 12:05:09 +0000
permalink: /2012/12/29/lego-wedo-4-java/
description: "Just for the sake of indexation and for the only purpose of sharing almost a week of reverse engineering, I'm writing this post about a small project…"
tags:
  - "English"
  - "Java"
  - "Salaboy"
original_url: https://www.salaboy.com/2012/12/29/lego-wedo-4-java/
---

Just for the sake of indexation and for the only purpose of sharing almost a week of reverse engineering, I'm writing this post about a small project which allows you to interact with [Lego WEDO Kits](http://www.legoeducation.us/eng/product/lego_education_wedo_robotics_construction_set/2096) Motors and Sensors using Java. When I've started with the Rolo The Robot project, I've first look into the Lego WeDo kits, because they looked simple and modular. After finding out their limitations, I've decided to at least write a small lib in java to interact with those motors and sensors. Based on [Ian Daniher's WeDoMore](https://github.com/itdaniher/WeDoMore) project for Python, I've did a similar version in Java. The Java version allows you to read the sensors and interact with the motors at the same time, which I believe that it was a limitation from the Python version of the library.

This lib is in a very initial but usable version, and I don't see too many reasons to continue improving it, but I know that it can be very helpful for people which is looking forward to create simple applications for educational purposes. In order to use it you will need to have the following items:

<http://www.active-robots.com/legor-wedotm-robotics-usb-hub.html>

As you can see it is not a cheap thing to buy, but if you have a couple of those, you can build a small robot with two motors and two sensors, which for kids this could be very handy.

I've provided support for Distance and Tilt sensor as well as for the Medium Motor.

Medium Lego Motor: <http://shop.lego.com/en-GB/LEGO-Power-Functions-M-Motor-8883>

Motion/Distance Sensor: <http://www.active-robots.com/legor-wedotm-robotics-motion-sensor.html>

Tilt Sensor: <http://www.active-robots.com/legor-wedotm-robotics-tilt-sensor.html>

Feel free to fork the project  and drop me a line if you are interested in using the project, I can quickly extend it for your particular needs if its necessary. All the source code is under the Apache License V2, so there is no restriction to use it or distribute it. You can find all the source code here: <https://github.com/Salaboy/lego-wedo4j.git>
