---
title: "DAO Pattern un ejemplo concreto.."
date: 2008-03-03 00:01:32 +0000
permalink: /2008/03/03/dao-pattern-un-ejemplo-concreto-de-mi-blog-en-wwwjugmzacomar-121007/
description: "En este post vamos a ver un ejemplo de patron DAO presentado en el post anterior . En este ejemplo vamos a encontrar solamente 2 bibliotecas de clases que…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/03/dao-pattern-un-ejemplo-concreto-de-mi-blog-en-wwwjugmzacomar-121007/
---

En este post vamos a ver un ejemplo de patron DAO presentado en el [post anterior .](http://www.jugmza.com.ar/roller/salaboy/entry/dao_pattern_una_vision_practica)

En este ejemplo vamos a encontrar solamente 2 bibliotecas de clases que son las implementaciones de un Data Access Object en concreto (ClienteDAO en la biblioteca DAO) y la implementacion de un Transfer Object (Cliente en la biblioteca DOMAIN).

Como podemos ver tambien en la biblioteca DAO encontraremos una clase llamada Connector, que es la encargada de realizar la conexion contra la fuende de datos(Data source en el post anterior) que nosotros deseemos para la aplicacion. En este caso la conexion se realiza directamente contra una base de datos MySQL, esto por motivos de simplificar el ejemplo viene bien, pero en una aplicacion web, donde utilicemos Tomcat u otro servidor web, deberiamos configurar y utilizar un pool de conexiones provisto por nuestro servidor. Otro detalle a destacar de esta clase es que los datos de conexion se encuentran en un archivos de propiedades (dbconf.properties).

Si analizamos la clase ClienteDAO en la biblioteca DAO veremos que esta se encarga de implementar el metodo save, delete y findAll (en este caso en particular) y estos metodos hacen uso de las clases en la biblioteca DOMAIN para envolver los resultados obtenidos de la fuente de datos.

Si analizamos la clase Cliente de la biblioteca DOMAIN veremos que es una simple clase (POJO: plain old java object) que posee propiedades privadas y metodos que set y get que publican estas propiedades privadas. Como se puede observar a simple vista, la funcion de esta clase es mapear a nivel de objetos una tabla llamada cliente en la base de datos. La idea principal de realizar este mapeo  es manejar objetos y solamente objetos que representen conceptos de la realidad en nuestra aplicacion y no Resultset y otros objetos que representen especificamente a una fuente de datos en particular.

Aca les dejo el link del [ejemplo](http://www.jugmza.com.ar/roller/salaboy/resource/DAO.rar).

Para poder usar estas bibliotecas deberan crear una aplicacion Java o una aplicacion web y luego agregar referencias a las dos bibliotecas como archivos JAR o como proyectos al proyecto. Tambien deberan incluir la referencia al [Driver JDBC de MySQL (se recomienda bajar la version 3.1 )](http://www.mysql.com/products/connector/)

Por ultimo les dejo un ejemplo de codigo de como deberian usar estas bibliotecas:

ClienteDAO cDao=new ClienteDAO(); Collection&lt;Cliente&gt; clientes=cDao.findAll(); Iterator&lt;Cliente&gt; it=clientes.iterator(); while(it.hasNext()){ System.out.println("Cliente nombre:" +it.next().getNombre()); }
