---
title: "Spring I/O, Dapr, and Spring Boot"
date: 2024-06-03 09:28:47 +0000
permalink: /2024/06/03/spring-i-o-dapr-and-spring-boot/
description: "Last week, I enjoyed attending, presenting, and sharing extraordinary times with the Spring community at Spring I/O Barcelona."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/barcelona.png
tags:
  - "spring boot,"
  - "dapr,"
  - "cloud-native"
  - "kubernetes"
  - "spring"
  - "barcelona"
  - "conference"
original_url: https://www.salaboy.com/2024/06/03/spring-i-o-dapr-and-spring-boot/
---

Last week, I enjoyed attending, presenting, and sharing extraordinary times with the Spring community. I made many new friends and learned a lot from the fantastic people presenting at the conference, and I can say that this is an event optimized for meeting and learning from the best minds in the Java industry.

Big shoutout to [Sergi Almar](https://x.com/sergialmar) for setting up this amazing event! I can confidently say that the amount of preparation and details to make Spring I/O an incredible experience for everyone involved cannot happen without a mastermind like Sergi.

If you are a Spring, Spring Boot, or Spring Cloud user, I strongly recommend investing in attending Spring I/O in 2025; the amount of knowledge that you can acquire and the amount of time that you will save makes this conference a must for all Spring enthusiasts.

On my side, I had the pleasure of presenting with [Thomas Vitale](https://x.com/vitalethomas) from [Systematic (Denmark)](https://systematic.com/en-gb/) about the latest integration we worked on for the past few months between [Dapr](https://dapr.io) and Spring Boot. As we explained in the presentation, these are just the first steps, but we got great feedback and a room packed with developers!

If you want to learn more about what we presented, check out this other blog post when we dive deep into the current integration and next steps.

**[- Diagrid Blog](https://www.diagrid.io/blog/dapr-for-spring-boot)**

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/dc68befff9084bb1aff20e018bc114d6" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Spring I/O 2024 - Dapr for Spring Boot Developers"></iframe></div>

Check the example that we presented in this GitHub repository:

Example Voting App with Java, Spring Boot 3.3, and Dapr:

**[example-voting-app/java at main · salaboy/example-voting-app](https://github.com/salaboy/example-voting-app/tree/main/java)**  
Example distributed app composed of multiple containers for Docker, Compose, Swarm, and Kubernetes - salaboy/example-voting-app

### The Spring Community

The Spring community is thriving, and while Spring AI was a big topic at the conference, I was happy to see that performance-related optimizations and better compatibility for cloud runtimes are being introduced.

Unfortunately, we can't create multiplatform containers with [Packeto](https://paketo.io/), check this other blog post when we dive deep yet, but we can finally produce arm64 images.

GraalVM keeps pushing hard, and the support has increased quite a lot. CDS ([Class Data Sharing](https://docs.spring.io/spring-framework/reference/integration/cds.html)) had a lot of mentions, and I am happy to see this because all these improvements contribute to a better experience when working with containers.

There were also a lot of Testcontainers sprinkled all over the sessions at the workshop on Friday, which was quite a big success! Congrats to the [Testcontainers](https://testcontainers.com/) team, and special thanks to [Eddu](https://x.com/EdduMelendez) for all his support.

I wasn't surprised by seeing mentions of Spring Cloud on Azure, but I was surprised by the mention of Java and Spring in relationship with AI on Azure and GCP.

![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/IMG_1606.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/IMG_1605.jpeg)

Thanks a lot, Thomas, for the mention of the presentation in the livestream with Josh Long 🙏💪!

[![Screenshot 2024 05 31 at 16.54.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/Screenshot-2024-05-31-at-16.54.27.png)](https://x.com/i/broadcasts/1mrGmywmmVWGy)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/IMG_1599.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/IMG_1594.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/IMG_1598.JPG)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/05/IMG_1584.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1646.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1638.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1639.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1642.jpeg)![<div class="kg-bookmark-title">example-voting-app/java at main · salaboy/example-voting-app</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1620.jpeg)
