---
title: "jBPM + Designer - Install HowTo"
date: 2008-03-04 00:16:12 +0000
permalink: /2008/03/04/jbpm-designer-install-howto/
description: "Requisitos Sun JDK 1.5 (JDK 5.0 Update 16) http://java.sun.com/javase/downloads/index_jdk5.jsp jBPM jPDL Suite 3.2.x…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "Argentina"
  - "JBoss"
  - "jBPM"
  - "jPDL"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/03/04/jbpm-designer-install-howto/
---

### **Requisitos**

**Sun JDK 1.5 (JDK 5.0 Update 16)**

<http://java.sun.com/javase/downloads/index_jdk5.jsp>

**jBPM jPDL Suite 3.2.x**

<http://www.jboss.org/jbossjbpm/jpdl_downloads/>

**Eclipse (Ganymede)**

<http://www.eclipse.org/downloads/>

**Apache Ant 1.7**

<http://ant.apache.org/bindownload.cgi>

**Apache Commons Fileupload**

<http://commons.apache.org/fileupload/>

**Apache Jackrabbit** **(jackrabbit-core-1.4.5.jar)**

<http://jackrabbit.apache.org/downloads.html>

**JTA.jar (de la distribucion de Hibernate)**

### **Pasos**

Crear el directorio /jbpm/  en algun lugar (el directorio jbpm va a ser nuestra raiz de trabajo)

Copiar JDK de sun a  a /jbpm/

Necesitamos darles permiso de ejecucion:

chmod 777 JDK-xx.bin

Luego podemos ejecutarlo con:

./JDK-xx.bin  -> con espacio (space) pasamos de hoja en hoja la licencia y cuando nos pregunte si  aceptamos debemos escribir la palabra "yes"

A continuacion seteamos dos variables de entorno que vamos a necesitar para correr eclipse:

export JAVA_HOME= /jbpm/JDK-xx

export PATH=.... /jbpm/JDK-xx/bin/:$PATH

Una vez que tenemos el JDK de Java disponible en nuestro Sistema Operativo podemos proceder a instalar jBPM-jPDL-Suite. Esta suite contiene varios componentes que nos ayudaran a tener todo el entorno para desarrollo listo. Para mas informacion sobre el contenido de la suite ir al siguiente post.

Crear el directorio /jbpm/software/

Copiar jbpm-jpdl-3.2.x.zip a  /jbpm/software/ Unzip jbpm-jpdl-3.2.x.zip en  /jbpm/software/

Copiar a  /jbpm/software/  eclipse-xxx.tar.gz

Unzip eclipse-xxx.tar.gz sobre  /jbpm/software/bpm-jpdl-3.2.x/designer/eclipse, esto en ubuntu 8.04 hace un merge, sino hay que hacerlo a mano. Es decir, copiar cada cosa a su lugar, ya que el directorio eclipse tiene cosas dentro. Luego le damos permiso al archivo designer.sh para poder ejecutarlo:

chmod 777 /jbpm/software/ jbpm-jpdl/designer/designer.sh Hay que tener cuidado porque el script de arranque designer.sh puede contener espacios que no dejen ejecutar correctamente las instrucciones. Por esto necesitamos editar el archivo y borrar los espacios manualmente con:

gedit designer.sh -> borrar los espacios

Ahora ya podemos ejecutar el script designer.sh que nos abrira una instancia de eclipse, con algunos plugins para poder manejar todo lo relacionado a jBPM.

Hasta este punto, ya podemos empezar a trabajar con jBPM, pero el siguiente paso es bastante recomendado ya que vamos a tener los fuentes disponibles dentro del eclipse, y con esto obtenemos la ventaja de poder debuggear y tener los fuentes a mano a la hora del desarrollo.

Para obtener esto lo unico que tenemos que hacer es crear un nuevo proyecto Java partiendo de los funetes que se encuentran dentro de la suite (java project with existing sources), al cual vamos a  nombrar jbpm3 y usar las fuentes de se encuentran dentro del directorio src de la suite:

/jbpm/software/jbpm-jpdl-3.2.x/src/ Cuando el proyecto se cree va a mostrar errores ya que faltan agregar varias bibliotecas necesarias para que el codigo compile. Para esto vamos a agregar todas las libs de /jbpm/software/jbpm-jpdl-3.2.x/lib al proyecto. Esto lo hacemos de la siguiente manera:

Con boton derecho sobre el proyecto vamos a la opcion que dice Builth Path del proyecto, luego a la pestania que dice Libraries y ahi creamos una nueva User Library llamada jbpm3 y le agregamos todos los jars que hay en todas las libs del /jbpm/software/jbpm-jpdl-3.2.x/lib.

A estas libs nos van a faltar agregarle las siguientes para que el proyecto compile correctamente:

Para esto creamos un directorio /libs en /jbpm/software/ y copiamos: jta.jar -> viene con al distribucion de hibernate por lo general conviene sacarlo de ahi. (no se de donde bajarlo solo) jackrabbit-core-1.4.5.jar apache-ant-1.7.0/lib/ant.jar commons-fileupload-1.x/lib/common-fileupload.jar

Una vez hecho esto tenemos que editar desde el Build Path, en la User Library que creamos, llamada jbpm3 y agregarle estos 4 nuevos jars que acabamos de copiar.

Llegado a esta instancia el proyecto jbpm3 solamente deberia mostrar 100 warnings y no mas errores. en el tab de problems del eclipse ("designer"). Fijense que todos estos warnings son por el uso de ArrayList sin generics.

Cada vez que necesitemos correr designer vamos a tener que exportar JAVA_HOME y el PATH

export JAVA_HOME=.... /jbpm.training/jdk... export PATH=.... /jbpm.training/jdk.../bin/:$PATH

esto podemos automatizarlo poniendolo en el archivo .bashrc o .bash_profile de el usuario que estemos utilzando. Una vez que hicimos esto para que estos parametros tomen efecto en la sesion actual, debemos ejecutar en la consola el comando bash, para que la sesion de consola se reinicie y retome todos los valores.

Espero que haya quedado claro el proceso de instalacion, cualquier duda no duden en comentar.
