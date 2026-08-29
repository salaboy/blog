---
title: "Dump (Backup) De una DB en PostgreSQL desde la linea de Comandos"
date: 2008-03-17 13:25:14 +0000
permalink: /2008/03/17/dump-backup-de-una-db-en-postgresql-desde-la-linea-de-comandos/
description: "Con el siguiente comando creamos un backup de la base de datos especificada en el archivo especificado en la line."
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/03/17/dump-backup-de-una-db-en-postgresql-desde-la-linea-de-comandos/
---

Con el siguiente comando creamos un backup de la base de datos especificada en el archivo especificado en la line. /usr/bin/pg_dump -i -h &lt;host&gt; -p &lt;port&gt; -U &lt;user&gt; -F c -b -D -v -f "&lt;filename&gt;.backup" "&lt;database&gt;"
