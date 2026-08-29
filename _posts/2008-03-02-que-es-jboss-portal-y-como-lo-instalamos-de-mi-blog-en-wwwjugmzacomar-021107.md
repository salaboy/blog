---
title: "Que es JBoss Portal? y como lo instalamos... (de mi blog en www.jugmza.com.ar - 02/11/07)"
date: 2008-03-02 23:00:22 +0000
permalink: /2008/03/02/que-es-jboss-portal-y-como-lo-instalamos-de-mi-blog-en-wwwjugmzacomar-021107/
description: "Que es JBoss Portal? Vamos a ver como instalar JBoss portal en Linux Ubuntu 7.10 Gusty Gibbons Hay 3 tipos de instalaciones: Podemos elegir bajar una…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/02/que-es-jboss-portal-y-como-lo-instalamos-de-mi-blog-en-wwwjugmzacomar-021107/
---

**Que es JBoss Portal?**

Vamos a ver como instalar JBoss portal en Linux Ubuntu 7.10 Gusty Gibbons Hay 3 tipos de instalaciones:

Podemos elegir bajar una instalacion que ya vienen  con un JBoss 4.2.1 Server bundled Una instalacion donde ya bajamos un binario de JBoss Portal, para esta debemos tener un JBoss 4.2.1 Y por ultimo podemos bajar los fuentes de JBoss Portal y compilarlos.

En este caso elegi descargar los fuentes y compilarlos. Para esto realice los siguientes pasos:

Seteamos el JBOSS_HOME=/home/user/jboss4.2.1 Seteamos el JAVA_HOME=/home/user/jdk1.5.0 seteamos el PATH = $JAVA_HOME/bin:$PATH

Descomprimimos JBoss Portal Source y nos dirigimos al directorio build donde ejecutamos la siguiente linea

./build.sh deploy (Obtenemos el portal en su mas puro estado.. sin ningun portlet) ./build.sh deploy-all (Obtenemos el portal mas algunos portlets basicos (Como por ejemplo, Manejo de usuarios, seguridad, Wheather Portlet, etc))

Nota: para realizar el deploy tenemos que estar conectados a internet, ya que se descargan varias bibliotecas. Si la conexion a internet disponible se encuentra a travez de un proxy. Hay que especificar algunos parametros extra a la linea de ejecucion anterior. Para ver estas propiedades recurrir a la documentacion de JBoss Portal, que se encuentra en el directorio /doc que descargamos.

Una vez finalizado el deploy el archivo construido jboss-portal.sar es copiado a JBOSS_HOME/server/default/deploy automaticamente.

Luego debemos configurar el datasource donde JBoss portal va a almacenar sus datos.

Para esto seguimos los siguientes pasos:

nos diregimos al directorio /core/ de los fuentes de JBoss Portal y ejecutamos:

./build.sh datasource

Esto crea templates de configuracion para los distintos tipos de datasource que soporta JBoss Portal (por medio de Hibernate3) : /home/user/jboss-portal-2.6.2.GA-src/core/output/resources/setup/

Dependiendo del motor de base de datos que optemos por usar, es el template que escogemos. En esta ocacion vamos a utilizar  PostgreSQL como motor de base de datos y por lo tanto vamos a modificar el template llamado portal-postgresql-ds.xml ( /home/user/jboss-portal-2.6.2.GA-src/core/output/resources/setup/) Editamos y cambiamos la configuracion para poder acceder a la base de datos donde queremos que jboss-portal tenga sus tablas.

Paso seguido (o paso anterior)  creamos y damos permisos sobre una base de datos en postgreSQL.

Una vez terminado esto tenemos que incluir el driver de PostgreSQL a JBoss. Para esto copiamos el JDBC connector de PostgreSQL al siguiente directorio:

cp /home/user/postgresql-8.1-408.jdbc3.jar /home/user/jboss-4.2.1.GA/server/default/lib/

A esta altura ya estamos listos para arrancar el servidor y ver si se distribuye adecuadamente JBoss-Portal

para esto vamos a JBOSS_HOME/bin y ejecutamos run.sh

./run.sh

probablmente veamos algo de los siguientes errores que tranquilamente podemos obviar...

16:43:39,234 WARN [JDBCExceptionReporter] SQL Error: -22, SQLState: S0002 16:43:39,234 ERROR [JDBCExceptionReporter] Table not found in statement ...

Para ir terminando probamos que todo ando bien

http://localhost:8080/portal

Aqui debemos encontrarnos con el portal vacio (si hicimos un build.sh deploy) o con algunos portlets de ejemplo (si hicimos build.sh deploy-all)
