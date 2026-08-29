---
title: "Consulta de resolucion de DNS"
date: 2008-03-11 14:06:05 +0000
permalink: /2008/03/11/consulta-de-resolucion-de-dns/
description: "Cuando quieran saber si tienen algun problema de DNS Para consultar como resuleve una direccion un servidor de DNS utilicen el siguiente comando: host…"
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/03/11/consulta-de-resolucion-de-dns/
---

Cuando quieran saber si tienen algun problema de DNS

Para consultar como resuleve una direccion un servidor de DNS utilicen el siguiente comando:

host &lt;direccion&gt; &lt;servidor de DNS&gt;

eJ: host www.google.com 200.69.193.1

Lo que les devuelve algo como lo siguiente:

Using domain server: Name: 200.69.193.1 Address: 200.69.193.1#53 Aliases:

www.google.com is an alias for www.l.google.com. www.l.google.com has address 64.233.161.103 www.l.google.com has address 64.233.161.104 www.l.google.com has address 64.233.161.147 www.l.google.com has address 64.233.161.99

Tambien poseemos el comando dig que nos brinda mucha mas informacion sobre la resolucion de dominios
