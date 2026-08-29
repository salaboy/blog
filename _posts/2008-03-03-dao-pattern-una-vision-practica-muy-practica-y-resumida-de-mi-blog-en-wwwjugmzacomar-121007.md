---
title: "DAO Pattern una vision practica (muy practica y resumida)"
date: 2008-03-03 00:03:03 +0000
permalink: /2008/03/03/dao-pattern-una-vision-practica-muy-practica-y-resumida-de-mi-blog-en-wwwjugmzacomar-121007/
description: "En nuestras aplicacion normalmente utilizamos las API JDBC (API: Application Programing Interface)(JDBC: Java Database connectivity) para acceder a los…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/03/dao-pattern-una-vision-practica-muy-practica-y-resumida-de-mi-blog-en-wwwjugmzacomar-121007/
---

En nuestras aplicacion normalmente utilizamos las API JDBC (API: [Application Programing Interface](http://es.wikipedia.org/wiki/API))(JDBC: [Java Database connectivity](http://es.wikipedia.org/wiki/JDBC)) para acceder a los datos en una base de datos relacional. Esta API nos provee una forma estandar para el acceso y manipulacion de los datos independientemente del proveedor de base de datos que estemos usando.

Muy comunmente nuestras aplicaciones prensentan muchas fuentes de datos distintas y reglas de negocios complejas que causan una fuerte dependencia entre el codigo de las reglas de negocio y el acceso a datos. Esto en la mayoria de las situaciones es poco conveniente, poco flexible y muy dificilmente mantenible. Esto causaria que si en algun punto del desarrollo deseamos cambiar el tipo o la fuente de datos (pasar de un almacenaje en archivos planos a una base de datos relacional o viceversa) debamos cambiar el codigo de los componentes que representan la logica del negocio.

Entonces usamos el patron DAO para encapsular y abstraer todo el acceso a las fuentes de datos. El patron DAO se encarga de administrar la conexion con la fuente de datos para obtener y guardar datos. Dependiendo de la variedad de fuentes de datos que tengamos el patron DAO implementara la logica el mecanismo de acceso para cada una de ellas. Los componentes de negocio accederan al DAO utilizando interfaces simples que encapsulan los mecanismos de obtencion y recuperacion de datos. Debido a esto si las fuentes de datos cambian tanto de proveedor como de tipo, los componentes de negocios siguen utilizando las mismas interfaces y no deben ser cambiados, ya que lo unico que se cambiara es la implementacion respectiva a la fuente de datos nueva.

En la siguiente imagen se ve reflejado el diagrama de clases que representa las relaciones en el patron DAO y sus elementos.

![Diagrama de clases DAO PATTERN](http://java.sun.com/blueprints/corej2eepatterns/Patterns/images09/figure09_01.gif)

En esta imagen vemos un diagrama de secuencia que describe la interaccion entre los participantes del patron. Luego veremos como se mapean estos participantes en el ejemplo concreto.

![Diagrama de secuencia](http://java.sun.com/blueprints/corej2eepatterns/Patterns/images09/figure09_02.gif)

Escencialmente el patron DAO actua como adaptador entre los componentes de negocio y las fuentes de datos.

Tambien les dejo el link en el cual me base para escribir esta pequenia introduccion, como podran ver en el link se realizan cosas mas avanzadas como DAOFactories y cosas muy utilies a la hora de programar. En un principio con lo del ejemplo es suficiente como para aislar de manera clara la fuente de datos (En este caso una base de datos relacional) y los componentes de negocio (Clases donde se describen las reglas de negocios de nuestra aplicacion). Por lo tanto nos ayudara a organizar y flexibilizar nuestra aplicacion frente a cambios.

LINK: <http://java.sun.com/blueprints/corej2eepatterns/Patterns/DataAccessObject.html>

El proximo post sera un ejemplo hecho en netbeans 6 beta 1 (http://www.netbeans.org) para que puedan ver como implementar el patron en un caso real. Esperare comentarios al respecto.
