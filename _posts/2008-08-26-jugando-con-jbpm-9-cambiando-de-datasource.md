---
title: "Jugando con jBPM #9 - Cambiando de DataSource"
date: 2008-08-26 15:12:04 +0000
permalink: /2008/08/26/jugando-con-jbpm-9-cambiando-de-datasource/
description: "La idea del siguiente post es mostrar como cambiamos de fuente de datos de la configuración por defecto de jBPM."
tags:
  - "Java"
  - "JBoss JBPM"
  - "JBoss"
  - "jBPM"
  - "jPDL"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/08/26/jugando-con-jbpm-9-cambiando-de-datasource/
---

La idea del siguiente post es mostrar como cambiamos de fuente de datos de la configuración por defecto de jBPM. Esta tarea es bastante sencilla pero hay que tener un par de cosas en cuenta. Sino podemos pasar un rato largo sin saber que nos esta faltando.

Una de estas cosas básicas a tener en cuenta es que jBPM por defecto utiliza una fuente de datos llamada JbpmDS (por defecto), por lo tanto, la fuente de datos que vamos a crear va a llevar este nombre.

También tenemos que asegurarnos de que no tenemos otra fuente de datos con este nombre ya deployada, este comentario viene porque si estamos usando la suite jBPM, esta usa por defecto una base de datos hypersonic para funcionar. Y la configuración de esta fuente de datos que ya viene configurada en la suite se encuentra en /server/jbpm/deploy/jbpm-ds.xml.

En el caso de que estemos usando la suite jBPM deberemos hacer undeploy de este data source (podemos hacerlo  borrando el archivo o renombrándolo a jbpm-ds.xml.bak). Y luego hacer deploy de nuestra configuración de data source.

Teniendo estas cosas en claro vamos con los pasos necesarios para cambiar la fuente de datos.

Con JBoss Application Server abajo debemos agregar el JDBC driver correspondiente para el vendor de base de datos a la que nos queramos conectar. En este caso estoy usando postgreSQL 8.2 por eso el jar que agrego al directorio /server/jbpm/lib/ es: postgresql-8.2-508.jdbc3.jar que se puede descargar de la pagina oficial de postgreSQL. (<http://jdbc.postgresql.org/download.html>). Esto lamentablemente no lo podemos hacer cuando el server esta corriendo ya que este jar en el directorio lib no seria encontrado hasta que reiniciemos.

Buscamos en los ejemplos de JCA (Java Connector Architecture) un data source apropiado para el vendor que estamos usando. En este caso como el vendor es postgreSQL escogemos el archivo: server/docs/examples/jca/postgres-ds.xml. En este caso el directorio de inicio "server" hace referencia al directorio server de la distribución jBPM suite. En caso de que estemos usando un JBoss Application Server instalado por nosotros el directorio "server" vendría siendo la carpeta raíz del Application Server.

Si analizamos este archivo postgres-ds.xml vemos lo siguiente:

&lt;datasources&gt; &lt;local-tx-datasource&gt; &lt;jndi-name&gt;PostgresDS&lt;/jndi-name&gt; &lt;connection-url&gt;jdbc:postgresql://[servername]:[port]/[database name]&lt;/connection-url&gt; &lt;driver-class&gt;org.postgresql.Driver&lt;/driver-class&gt; &lt;user-name&gt;x&lt;/user-name&gt; &lt;password&gt;y&lt;/password&gt; <!-- sql to call when connection is created.  Can be anything, select 1 is valid for PostgreSQL &lt;new-connection-sql&gt;select 1&lt;/new-connection-sql&gt; --> <!-- sql to call on an existing pooled connection when it is obtained from pool.  Can be anything, select 1 is valid for PostgreSQL &lt;check-valid-connection-sql&gt;select 1&lt;/check-valid-connection-sql&gt; --> <!-- corresponding type-mapping in the standardjbosscmp-jdbc.xml (optional) --> &lt;metadata&gt; &lt;type-mapping&gt;PostgreSQL 7.2&lt;/type-mapping&gt; &lt;/metadata&gt; &lt;/local-tx-datasource&gt; &lt;/datasources&gt;

Como podemos apreciar esto es un template que nosotros vamos a tener que completar con los datos de nuestra fuente de datos. (Recordar cambiar el nombre del data source a JbpmDS, case sensitive)

Algo que llama la atención en este archivo de template es la versión de type mapping que tiene asignada por defecto "PostgreSQL 7.2" y el comentario que aparece arriba de que nos fijemos en el archivo standardjbosscmp-jdbc.xml para ver los mapeos que podemos asignar acá. Este archivo (standardjbosscmp-jdbc.xml) se encuentra en el directorio server/jbpm/conf y en este caso si buscamos dentro de todo este archivo "PostgreSQL" vemos que tenemos 3 mapeos para este vendor de base de datos. Por eso en este caso vamos a cambiar el tipo de mapeo a "PostgreSQL 8.0" para adecuarnos a los mapeos correspondientes a la versión de base de datos que estamos utilizando.

3. Copiamos el archivo postgres-ds.xml al directorio deploy de nuestro JBoss AS y le cambiamos el nombre a jbpm-ds.xml (o a otro nombre que nos guste mas que cumpla con el formato *-ds.xml, para que el DataSource deployer lo reconozca y realise el deploy correspondiente). En este paso llenamos todos los datos correspondientes.
4. Una cosa muy importante a tener en cuenta es que si estamos cambiando de data source el dialecto que va a usar jBPM (en realidad hibernate) para comunicarse con la base de datos va a cambiar y por esto vamos a tener que cambiar las configuraciones de jBPM. Si estamos usando la Suite jBPM esto lo tenemos que hacer en:

server/jbpm/deploy/jbpm-console.war/WEB-INF/classes/hibernate.cfg.xml

como veran para esto (en la Suite jBPM) debemos descomprimir el archivo jbpm-console.war y convertirlo en un directorio (para hacer un exploded package), todo esto para editar ese archivo. En donde cambiamos la siguiente linea:

<!-- hibernate dialect -->&lt;property name="hibernate.dialect"&gt;org.hibernate.dialect.HSQLDialect&lt;/property&gt;

Por:

<!-- hibernate dialect -->&lt;property name="hibernate.dialect"&gt;org.hibernate.dialect.PostgreSQLDialect&lt;/property&gt;

5. No hay que olvidar que antes de hacer deploys de nuestros procesos tenemos que tener creado el schema propio de jBPM, cosa que se puede hacer utilizando los scripts de creación de schemas que vienen con la suite jBPM.
6. Una vez que tenemos todo esto hecho , podemor arrancar el JBoss AS con ./run.sh -c jbpm en el directorio bin del mismo. Y comenzar a deployar nuestros procesos en este nuevo Data Source!

Cualquier comentario sera bienvenido!
