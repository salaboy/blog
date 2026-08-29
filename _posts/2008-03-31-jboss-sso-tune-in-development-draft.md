---
title: "JBoss SSO - tune in development"
date: 2008-03-31 17:38:51 +0000
permalink: /2008/03/31/jboss-sso-tune-in-development-draft/
description: "Pasos armados a partir de la wiki http://labs.jboss.com/wiki?windowstate=maximized pero con los fuentes del proyecto y no con la distribucion binaria.."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/31/jboss-sso-tune-in-development-draft/
---

Pasos armados a partir de la wiki http://labs.jboss.com/wiki?windowstate=maximized

pero con los fuentes del proyecto y no con la distribucion binaria.. ademas no usamos el CR1 sino que el trunk. Para usar el CR1 cambiamos el repositorio a  http://anonsvn.jboss.org/repos/jboss-sso/dev/tags/jboss-sso-1.0CR1/

Primero :

svn co http://anonsvn.jboss.org/repos/jboss-sso/dev/trunk/

Luego:

vi local.properties

y modificamos lo siguiente:

deploy.dir=default jboss.home=/home/&lt;user&gt;/&lt;jboss-4.2.2.GA&gt;

Luego debemos tener instalado ant.. y todas sus librerias en /usr/share/ant/lib/

sino bajamos <http://www.apache.org/dist/ant/binaries/apache-ant-1.7.0-bin.zip> y copiamos todo el directorio lib a /usr/share/ant/lib/ y listo.

Tenemos que revisar que no tengamos una variable de entorno llamada JBOSS_HOME que apunte a otro jboss que no sea el que estamos usando

Con esto hecho ya podemos hacer..

en el directorio &lt;jboss-sso&gt;/components/build/

ant installSSO

Luego en el directorio ../jboss_federation_server/

ant deploy-exploded

y ahora debemos meternos con las configuraciones de red:

editamos el archivo /etc/hosts

nos deberia quedar algo asi

127.0.0.1       localhost node1.jboss.com 127.0.1.1       salaboy-desktop node1.jboss.org 127.0.2.1       node2.jboss.com

Una vez que tenemos esto.. debemos activar el ssl en el tomcat de jboss y generar un keystore local para que se use en la comunicacion ssl.

vamos a  /home/salaboy/programas/jboss-4.2.2.GA/server/default/deploy/jboss-web.deployer/

y editamos el archivo  server.xml

Descomentamos

&lt;Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true" maxThreads="150" scheme="https" secure="true" clientAuth="false" sslProtocol="TLS" /&gt;

y agregamos la siguiente propiedad:

keystorePass="&lt;password&gt;"

Las &lt;password&gt; que pongamos aca debera ser la misma usada al generar el keystore.

para generar el keystore vamos a nuestro home y hacemos lo siguiente:

salaboy@salaboy-desktop:~$ keytool -genkey -keyalg "RSA" -keystore keystore Enter keystore password:  jboss-sso What is your first and last name? [Unknown]:  jboss What is the name of your organizational unit? [Unknown]:  jboss What is the name of your organization? [Unknown]:  jboss What is the name of your City or Locality? [Unknown]:  baires What is the name of your State or Province? [Unknown]:  capfed What is the two-letter country code for this unit? [Unknown]:  AR Is CN=jboss, OU=jboss, O=jboss, L=baires, ST=capfed, C=AR correct? [no]:  yes

Enter key password for &lt;mykey&gt; (RETURN if same as keystore password):

Como podemos ver esto nos deja generado un archivo llamado keystore en nuestro home..

al que debemos renombrar a .keystore para ser encontrado por las configuraciones por defecto de "tomcat". si queremos cambiar de nombre o de lugar este archivo de keystore debemos especificarlo en una propiedad del sever.xml llamada `keystoreFile=`

"<path al keysotre>"

Y ahora si.. ya podemos correr un jboss con:

./run.sh -c default -b node1.jboss.com

Y deberiamos copiar el default y correr otro similar bindeado a  node1.jboss.org

y probar que funcione el ejemplo situado en http://node1.jboss.org:8080/test
