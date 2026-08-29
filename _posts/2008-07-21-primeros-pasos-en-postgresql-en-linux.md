---
title: "Primeros pasos en PostgreSQL en linux"
date: 2008-07-21 01:50:59 +0000
permalink: /2008/07/21/primeros-pasos-en-postgresql-en-linux/
description: "Pasos recomendados luego de instalar PostgreSQL en un sistema operativo linux: Por lo general para empezar a usar un PostreSQL con algun cliente para…"
tags:
  - "Linux"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/07/21/primeros-pasos-en-postgresql-en-linux/
---

Pasos recomendados luego de instalar PostgreSQL en un sistema operativo linux:

Por lo general para empezar a usar un PostreSQL con algun cliente para browsear la base de datos (ej: pgAdmin3) necesitamos crear un usuario para poder autenticarnos contra el motor de base de datos. Esto podemos hacerlo de la siguiente manera:

Desde nuestro usuario hacemos:

salaboy$ su

para ganar acceso de root (administrador del sistema) y luego vamos a necesitar pasarnos al usuario postgre con:

root# su postgre

Y luego para crear usuarios ejecutamos la siguiente linea:

createuser -P -s -e salaboy

Esto nos creara un nuevo usuario de base de datos que tendra las siguientes caracteristicas:

- Sera superusuario (-s)
- Nos pedira la password inmediatamente (-P)

Con esto ya tenemos el usuario y la contrasenia con la que accederemos desde el cliente. Ahora nos falta solo un paso para que la configuracion este completa. Nos falta indicarle al motor en que ip y puerto estara escuchando cuando levante y falta aclararle al motor desde que ips se podran acceder al mismo.

Para esto editamos 2 archivos (en mi Ubuntu Hardy):

$ vi /etc/postgresql/8.3/main/pg_hba.conf

y

$vi /etc/postgresql/8.3/main/postgresql.conf

En el primero pg_hba.conf vamos a especificar que IPs van a poder acceder al motor cambiando la siguiente linea:

## IPv4 local connections:

host    all         all        127.0.0.1/24         md5

por:

## IPv4 local connections:

host    all         all        0.0.0.0/0         md5

eso es si queremos que todos los usuarios del planeta puedan conectarse. Si solo queremos que se conecten los usuarios de nuestra red privada la linea quedaria asi:

## IPv4 local connections:

host    all         all        192.168.0.0/24         md5

Esto es si nos encontraramos en la red 192.168.0.x

En el segundo archivo (postgresql.conf) vamos a indicarle al motor en que IP o IPs va a ponerse a escuchar cuando el mismo levante. Para esto modificamos la siguientes lineas:

listen_addresses = 'localhost'        # what IP address(es) to listen on;

## comma-separated list of addresses;

## defaults to 'localhost', '*' = all

## (change requires restart)

port = 5432                                    # (change requires restart)

por:

listen_addresses = '*'        # what IP address(es) to listen on;

## comma-separated list of addresses;

## defaults to 'localhost', '*' = all

## (change requires restart)

port = 5432                                    # (change requires restart)

En este caso estamos indicando que el motor va a estar escuchando en el puerto 5432 y en todas las IPs que tenga nuestro servidor (esto es localhost, y todas las de las placas o IPs virtuales que tengamos)

Espero que sirva.. mas que nada lo hice para documentar el proceso.. Si alguien tiene algun otro paso recomendado de seguridad o de configuracion mas avanzada. Porfavor postee un comentario! se agredece!
