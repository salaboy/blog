---
title: "Explorador de Hypersonic"
date: 2008-03-05 15:21:11 +0000
permalink: /2008/03/05/explorador-de-hypersonic/
description: "Para el novato que empieza con JBoss una de las primeras cosas que llama la atencion es la fuente de datos que trae por defecto JBoss."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/05/explorador-de-hypersonic/
---

Para el novato que empieza con JBoss una de las primeras cosas que llama la atencion es la fuente de datos que trae por defecto JBoss. Esta se llama Hypersonic y esta orientada a satisfacer la necesidades minimas para el desarrollo y testeo de aplicaciones.

El gran problema de esta fuente de datos, es que a **simple vista** no existe aplicacion alguna para realizar consultas o crear tablas en la misma.

Pero luego de estar un rato usando Hypersonic se hace indispensable poder "navegar" la base de datos. Para esto hacemos lo siguiente:

con JBoss corriendo, apuntamos nuestro navegador a:

http://localhost:8080/jmx-console

![JMX-CONSOLE](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/jmx-console.png)

Como podemos notar en la imagen, dos fuentes de datos se encuentran disponibles actualmente en Hypersonic. Para poder navegar su contenido, ingresamos a alguno de los dos links y llegamos a la siguiente pantalla.

![Start DB Manager](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/startdatabasemanager.png)

Podemos ver que hay un metodo para invocar llamado startDatabaseManager()  que cuando lo invocamos  se nos abre un applet con la siguiente apariencia:

![HSQL Manager!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/hsqldbmanager.png)

y voila!  ya tenemos un pequenio cliente para Hypersonic!
