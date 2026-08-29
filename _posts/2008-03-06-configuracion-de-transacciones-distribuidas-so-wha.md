---
title: "Configuracion de transacciones distribuidas. so wha?"
date: 2008-03-06 19:59:04 +0000
permalink: /2008/03/06/configuracion-de-transacciones-distribuidas-so-wha/
description: "Vamos a ver como conformamos el archivo de DataSource para JBoss en el caso en el que necesitemos usar transacciones ditribuidas."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/06/configuracion-de-transacciones-distribuidas-so-wha/
---

Vamos a ver como conformamos el archivo de DataSource para JBoss en el caso en el que necesitemos usar transacciones ditribuidas. Un caso normal para esta necesidad es cuando estamos usando dos fuentes de datos en una misma transaccion de JTA, ya que si no configuramos que la transaccion utilice XA no podriamos hacer un commit distribuido. Para esto debemos asegurarnos de que el driver  jdbc soporte XA. En el caso de PostgreSQL no tenemos ningun problema

Con el driver de PostgreSQL

postgre-ds.xml

&lt;datasources&gt;

&lt;xa-datasource&gt; &lt;jndi-name&gt;somethingDS&lt;/jndi-name&gt; &lt;xa-datasource-class&gt;org.postgresql.xa.PGXADataSource&lt;/xa-datasource-class&gt; &lt;xa-datasource-property name="ServerName"&gt;[hostname]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="PortNumber"&gt;[port]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="DatabaseName"&gt;[db]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="User"&gt;[user]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="Password"&gt;[password]&lt;/xa-datasource-property&gt; &lt;track-connection-by-tx/&gt; &lt;/xa-datasource&gt;

&lt;xa-datasource&gt; &lt;jndi-name&gt;somethingDS2&lt;/jndi-name&gt; &lt;xa-datasource-class&gt;org.postgresql.xa.PGXADataSource&lt;/xa-datasource-class&gt; &lt;xa-datasource-property name="ServerName"&gt;[hostname]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="PortNumber"&gt;[port]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="DatabaseName"&gt;[db]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="User"&gt;[user]&lt;/xa-datasource-property&gt; &lt;xa-datasource-property name="Password"&gt;[password]&lt;/xa-datasource-property&gt; &lt;track-connection-by-tx/&gt; &lt;/xa-datasource&gt;

&lt;/datasources&gt;
