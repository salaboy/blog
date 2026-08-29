---
title: "How To PHP + APACHE + MySQL = WebPage"
date: 2008-03-16 22:40:17 +0000
permalink: /2008/03/16/how-to-php-apache-mysql-webpage/
description: "Vamos a ver como levantar una pagina web que utiliza una base de datos en MySQL y Utiliza el lenguaje de scripting PHP para generar paginas dinamicas."
original_url: https://www.salaboy.com/2008/03/16/how-to-php-apache-mysql-webpage/
---

Vamos a ver como levantar una pagina web que utiliza una base de datos en MySQL y Utiliza el lenguaje de scripting PHP para generar paginas dinamicas. Todo esto en Window$ XP con la ayuda de EasyPHP.

Comenzamos bajando EasyPhp de la pagina oficial EasyPhp.org

[![EasyPhp.org](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/easyphporg.jpg)](http://www.easyphp.org)

Una vez que bajamos EasyPhp lo instalamos y luego dirigimos nuestro navegador hacia:

http://localhost/mysql/    Notar la ultima barra.. totalmente importante!

[![URL](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/phpmyadminurl.jpg)](/2008/03/16/how-to-php-apache-mysql-webpage/)

Para ir directamente al administrador de MySQL y  crear la base de datos que utilizara nuestra pagina.

</content/images/2008/03/phpmyadmin.jpg>

En este caso levantaremos un backup de una base de datos ya creada, por esto accedemos al icono de SQL en el menu de la izquierda.

![Levantar Backup](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/crearbase.jpg)

Buscamos el archivo .sql que queremos restaurar y le damos al boton continuar.

Una vez hecho esto ya tenemos la base de datos creada. Ahora lo unico que falta es crear un usuario que  luego usaremos en Php para acceder a la misma.

Para esto vamos Home (icono en el menu de la izquierda) , luego en la pantalla principal vamos a base de datos.

Escogemos la base de datos MySQL y luego en el menu izquiero elegimos la tabla User. Una vez ahi en la pantalla principal hacemos click en la solapa de insertar y completamos con los datos del usuario y los permisos como se muestra en la siguiente pantalla. En este caso el usuario y la contrasenia son "tkd" y no estamos utilizando ninguna funcion para encriptar la contrasenia.

![Creacion de Usuarios](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/03/usuario.jpg)

Con esto ya tenemos la base de datos y el usuario para acceder desde una aplicacion Web a la base de datos.

Lo unico que falta por aclarar es que nuestra pagina web debera ubicarse en el directorio www dentro de la carpeta de instalacion de EasyPhP, esto no es obligatorio pero si es la configuracion por defecto. Luego para acceder a cualquier pagina que tengamos en el webroot (la carpeta www) tenemos que dirigir nuestro navegador a http://localhost/[nombre de la carpeta de la pagina web dentro de www]
