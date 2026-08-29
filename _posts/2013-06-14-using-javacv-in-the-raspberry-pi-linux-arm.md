---
title: "Using JavaCV in the Raspberry Pi (linux-arm)"
date: 2013-06-14 10:20:55 +0000
permalink: /2013/06/14/using-javacv-in-the-raspberry-pi-linux-arm/
description: "Hi everyone, last week we (my friend linux hacker beer fps master Esteban and I) were playing in my free time with the Raspberry Pi Camera Module, trying…"
tags:
  - "community"
  - "Java"
  - "Linux"
original_url: https://www.salaboy.com/2013/06/14/using-javacv-in-the-raspberry-pi-linux-arm/
---

Hi everyone, last week we (my friend linux hacker beer fps master [Esteban](http://twitter.com/ilesteban) and I) were  playing in my free time with the Raspberry Pi Camera Module, trying to use it via JavaCV which is the Java wrapper for OpenCV. Right now JavaCV distribution don't provide the Linux-Arm native libraries, so we decided to compile them. After going to all the process of trying to get things working in the Raspberry Pi, we arrive to a dead end. The Raspberry Pi Camera Module doesn't provide a V4L driver yet, which makes it impossible to use with JavaCV, but having the latest JavaCV compiled for the Raspberry Pi will allow you to use any other USB web cam, and in the future, when the Raspberry Pi Foundation provides the appropriate V4L driver JavaCV will be ready to use it. On this post I will also mention some other alternatives that you have, some workarounds if you really want to use the Raspberry Camera Module in one way or another.

## Introduction

Before staring with the compilation procedure, I would like to recommend you things that you shouldn't do in your Raspberry Pi. If you are planning to use the Face Recognition features of OpenCV/JavaCV don't install Opencv 2.3 that comes in the Raspbian repositories (meaning apt-get install opencv*). Don't do this, because this will add all the system links to libraries that JavaCV will need. We spend at least 3hs removing OpenCv-2.3, so we don't recommend that at all. We will be compiling OpenCV 2.4.5, which is the one supported by JavaCV 0.5 here and we need to keep our native libraries as clean as possible to avoid system links pointing to the wrong versions.

If you are not familiar with OpenCV and JavaCV, as I was a week ago, you maybe find the following figure helpful to understand the context:

![JavaCV -&gt; WebCam](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2013/06/javacv.png)

*JavaCV -> WebCam*

Where JavaCV is a just a Java Archive (jar) that we will need to add to our application as a dependency. JavaCPP is a transitive dependency of JavaCV and it contains all the Native bindings via JNI. JavaCV and JavaCPP are separate projects (at source level) and we need to compile them both. The JavaCV project also generates the JavaCV-Linux-Arm.jar file that contains the CPP (C++) compiled libraries (.so), the ones that are accessed via the JavaCPP code. This .so libraries are compiled and linked against OpenCV, and for that reason we need to make sure that we link those libraries with the correct version of OpenCV.

## Let's do some compilation!

Our journey starts with OpenCV 2.4.5, you need to get the sources and then follow very similar steps that the ones mentioned in this post for OpenCV 2.3 (<http://www.cedricve.me/2013/02/24/install-opencv-on-raspberry-pi/>) and the official OpenCV documentation (<http://docs.opencv.org/doc/tutorials/introduction/linux_install/linux_install.html>). To summarize we did something like this:

-1) login via ssh to your Raspberry Pi

0. get all the compiler tools and video libs:

```bash
sudo apt-get update
sudo apt-get install build-essential cmake pkg-config libpng12-0 libpng12-dev libpng++-dev libpng3 \n
libpnglite-dev libpngwriter0-dev libpngwriter0c2 zlib1g-dbg zlib1g zlib1g-dev pngtools libtiff4-dev \n
libtiff4 libtiffxx0c2 libtiff-tools libjpeg8 libjpeg8-dev libjpeg8-dbg libjpeg-progs ffmpeg libavcodec-dev \n
libavcodec52 libavformat52 libavformat-dev libgstreamer0.10-0-dbg libgstreamer0.10-0  libgstreamer0.10-dev \n
libxine1-ffmpeg  libxine-dev libxine1-bin libunicap2 libunicap2-dev libdc1394-22-dev libdc1394-22 libdc1394-utils \n
swig libv4l-0 libv4l-dev
```

(Note: if some of this libs fails to be downloaded try to look using apt-cache search a different version, some of those libs are not in the raspbian repo anymore or newer versions are being provided. If the library is not in the raspbian repository just remove the dep from the line and try to install as much as you can)

```bash
wget http://netcologne.dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.5/opencv-2.4.5.tar.gz<a href="http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.5/opencv-2.4.5.tar.gz/download">
 </a>
tar -xvzf OpenCV-2.4.5.tar.gz
cd OpenCV-2.4.5
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_PYTHON_SUPPORT=OFF -D BUILD_EXAMPLES=OFF ..
make
sudo make install
```

(This compilation process could take around 3/5hs.. so go for a walk or watch a couple of movies) Notice that we have disabled the Python support and the examples, so it should take less if you are not interested in those features.

```bash
sudo ldconfig
```

This should add all the system links to the .so files installed in our system.

## JavaCV compilation

Now that we have compiled and installed OpenCV 2.4.5 in our Raspberry Pi, we can compile JavaCV and JavaCPP. In order to do that, you need to have Java, Maven and git installed in the Raspberry Pi. I will not go through the installation of these tools here.

First of all you need to get the JavaCV and JavaCPP sources:

```bash
git clone https://code.google.com/p/javacv/
```

And

```bash
git clone https://code.google.com/p/javacpp/
```

In order to compile the JavaCV lib for the linux-arm platform you need to (* see note):

```bash
cd javacv
mvn clean install -Dplatform.name=linux-arm
```

Please continue reading before compiling this, because I've introduced some modifications.

This also can take some time, about 40 minutes in my Rasbperry Pi.

- Note:

I've introduced a modification to the JavaCV classes related with TBB which is a module that JavaCV and OpenCV uses on Intel MultiCore machines.

If you need to add the same modification, which I believe you will need to, you will need to manually change the opencv_core.java class, located here:

```bash
javacv/src/main/java/com/googlecode/javacv/cpp/opencv_core.java
```

Line 124:

```java
@Platform(includepath=genericIncludepath, linkpath=genericLinkpath,
 include={"<opencv2/core/core.hpp>", "opencv_adapters.h"}, link="opencv_core@.2.4", preload="tbb"),
```

for:

```java
@Platform(includepath=genericIncludepath, linkpath=genericLinkpath,
 include={"<opencv2/core/core.hpp>", "opencv_adapters.h"}, link="opencv_core@.2.4"),
```

and then recompile JavaCV with the previous mentioned command:

```bash
mvn clean install -Dplatform.name=linux-arm
```

Obviously, you can use the same procedure to compile the JavaCV project for other platforms just changing the platform name. If you want to do it for linux you will need to do something like:

```bash
mvn clean install -Dplatform.name=linux-x86 or linux-x86_64
```

This will compile and install all the artifacts in your maven repository. If you don't want to do all these compilation steps you can just download the jars from here:<https://drive.google.com/folderview?id=0B0lFIImWo61bc3pTTHdZN3NmNkE&usp=sharing>

You can see my comments complaining about this with Samuel and Jeremy from the JavaCV project here: <http://code.google.com/p/javacv/issues/detail?id=184>

Notice in the issues webpage that the stacktrace that we were getting mention two things:

1)

Exception in thread "main" java.lang.UnsatisfiedLinkError: /tmp/javacpp2077159407095/libjniopencv_core.so: libjvm.so.0: cannot open

In order solve this issue you need to create a soft system link, we had the libjvm.so lib in our system, but for some reason javacv requires to have the libjvm.so.0 file to link. You can solve this by doing:

```bash
sudo ln -s /usr/lib/jvm/java-6-openjdk-armhf/jre/lib/arm/server/libjvm.so libjvm.so.0
```

from inside the /usr/lib/ directory

2)

Caused by: java.lang.UnsatisfiedLinkError: no tbb in java.library.path

This was the main reason to remove the preload=tbb from the opencv_core.java class.

## Final Comments

If you own one of the Raspberry Pi camera module you will need to deal with the two commands provided called: raspistill and raspivid. In order to use these commands you will need to enable the camera module using the raspi-config command. You can find more information about how to update your system to use the camera module here: <http://thepihut.com/pages/how-to-install-the-raspberry-pi-camera>

Notice that you can also stream video to another computer that can pick up the video stream with JavaCV and it will work. For doing that you can use the raspivid command like this for sending the stream via rtsp:

```bash
raspivid -o - -t 9999999 |cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/}' :demux=h264
```

or for sending the stream over http stream:

```bash
raspivid -o - -t 9999999 |cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8554}' :demux=h264
```

Then using the OpenCVFrameGrabber class you can pick up that stream:

```java
OpenCVFrameGrabber grabber = new OpenCVFrameGrabber("rtsp://192.168.2.104:8554");
```

or

```java
OpenCVFrameGrabber grabber = new OpenCVFrameGrabber("http://192.168.2.104:8554");
```

After reading for a while I found out that both commands are hardly criticized to be both slow and non performant, and I guess that this was an attempt to provide something quick to use the new camera module. I'm looking forward for a proper V4L driver that enables us to access the camera as a regular cam.

As I previously mention you can use this instructions to use JavaCV with any other USB webcam.

Here you can find a Maven project that you can run inside the Raspberry Pi to recognise faces. Notice that this is using the jars compiled for linux-arm so you need to make sure that you have them in your local maven repo.

<https://github.com/Salaboy/misc/tree/master/camera-opencv-test>

If you find any problems following these instructions, please write a comment. I would like to keep this as updated as possible until we get it working.

Enjoy!
