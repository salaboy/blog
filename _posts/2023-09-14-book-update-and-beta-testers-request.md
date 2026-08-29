---
title: "Book updates and beta testers request"
date: 2023-09-14 08:23:15 +0000
permalink: /2023/09/14/book-update-and-beta-testers-request/
description: "I have been quiet lately because I've been focused on finishing my book Platform Engineering on Kubernetes."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/09/unnamed-1.jpg
tags:
  - "book"
  - "cloud-native"
  - "kubernetes"
  - "platforms"
  - "open-source"
  - "k8s"
  - "platform engineering"
  - "tutorials"
  - "free"
  - "translations"
  - "cncf"
original_url: https://www.salaboy.com/2023/09/14/book-update-and-beta-testers-request/
---

I have been quiet lately because I've been focused on finishing my book [Platform Engineering on Kubernetes](/book/). Hopefully, the printed version will see the light closer to November this year. I needed to focus on finishing the content that will be printed, plus the free step-by-step tutorials and examples that are hosted in this GitHub repository: <https://github.com/salaboy/platforms-on-k8s/>.

I received some big news a month ago, but I wanted to finish the content before sharing that a Chinese publisher partnered with Manning and will translate the book into Chinese. I am excited because I will visit China for [KubeCon Shanghai](https://sched.co/1PTHH) at the end of this month.

🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳

I am pretty happy with the content, the examples, the tutorials, and the entire team at Manning pushing to get this book done, but I need your help.

### Beta testing and contributing

The examples referenced in the book can all be found in this repository that is free for everyone to use, modify, and extend: <https://github.com/salaboy/platforms-on-k8s/> (please give it a star ⭐️)

After several iterations of having tutorials, examples, and configurations in separate repositories (and the old and very messy [from-monolith-to-k8s](https://github.com/salaboy/from-monolith-to-k8s/) repository), I've decided to condense all the artifacts into a single repository. This includes tutorials, configuration files, and the source code to build the different applications demonstrated in the book.

Because these tutorials are all standalone and ordered as they appear in the book (one directory per chapter), they can be tested individually.

In this blog post, I want to invite everyone to help me test and validate these tutorials. The only requirement for these tutorials to work is a laptop with enough resources to run [KinD](https://kind.sigs.k8s.io/).

I know there is much room for improvement, both in the tutorials and the demo applications' source code. All the services are written in Go, and the frontend uses Next/React. All the application's services can be built from source, extended, and improved, but after working on this for a while, I need an extra pair of eyes to improve these apps, tutorials, and examples.

Here is how you can test the tutorials:

- Clone the repository: <https://github.com/salaboy/platforms-on-k8s/>
- Install the pre-requisites listed in Chapter 1: <https://github.com/salaboy/platforms-on-k8s/tree/main/chapter-1#pre-requisites-for-the-other-chapters>
- Go to [chapter 2](https://github.com/salaboy/platforms-on-k8s/blob/main/chapter-2/README.md) and follow the steps listed in the [README.md](https://github.com/salaboy/platforms-on-k8s/blob/main/chapter-2/README.md) file. If you find a typo, an issue with the tutorial, or something unclear, please [create an issue here](https://github.com/salaboy/platforms-on-k8s/issues), or if you are feeling in the mood, send a Pull Request with the suggested change.
- Follow the same approach for the remaining chapters. If you get stuck or find an error **please please please** report it back.

More advanced users might want to extend the Helm Charts, publish their images, and include extra unit or integration tests. All these experiments are more than welcome. While all these examples were designed to work on KinD (local Kubernetes Cluster), most examples should work on any other Kubernetes cluster. Testing these examples on a Cloud Provider will be highly appreciated. If you find issues when running the examples in a Cloud Provider, please specify which Cloud Provider you used when creating an issue.

In the meantime, there is a lot of room for automation, and if you think that creating scripts to automate the cluster creation, clean up, and even installing some of the tools is worth it, it will help people to have a better experience I am all up for that too.

In my dream world, because I am a developer, I would love to see all the application services implemented in different programming languages so we can compare frameworks and other options to build services. If you are passionate about this idea, please get in touch, and we can coordinate some of that work.

### Translations

Because the tutorials hosted in GitHub are independent of the printed book, I want to ensure that people from different backgrounds can consume the tutorials in their native language. While this is not an easy task, if you are already testing the tutorials, creating a file in your native speaking language shouldn't be too hard.

You will notice that most tutorials are instructions and explanations about what happens when you install a tool or when you run certain command.  In the same way as testing each chapter tutorial, translations shouldn't require you to translate all the tutorials; any contribution is highly appreciated, no matter how small.

I will start with the Spanish translation once the book is sent to the printers. Help to translate these tutorials into Chinese 🇨🇳 will be highly appreciated.

### What's in it for me?

You might wonder, what do I get if I spend If time reviewing, fixing and/or translating these tutorials? If you are new to Open Source and you have never contributed to an Open Source project, this is an excellent and safe environment to start. You will be automatically added to the [Contributors](https://github.com/salaboy/platforms-on-k8s/graphs/contributors) page, and depending on your level of contributions, you will be added to the About page in the demo applications.

![Screenshot 2023 09 13 at 10.12.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/09/Screenshot-2023-09-13-at-10.12.56.png)

I firmly believe that these tutorials should be hosted publically in a foundation or a different GitHub organization that is community-maintained. If you contribute to making these tutorials better for everyone, you will not only gain experience for larger projects, but you will be kept in the loop about where these tutorials are being used, presented, or extended.

If you are into public speaking, these tutorials are great starting points for submitting presentations to international conferences and workshops. What better way to start your public speaking journey than contributing to examples you can use in your local meetups to spread the word about the tools you are learning?

Finally, if you go to KubeCon NA or Europe, the coffee/beer is on me. ☕️🍺🎩

If you have any comments, suggestions or you don't know where to start, please reach out!
