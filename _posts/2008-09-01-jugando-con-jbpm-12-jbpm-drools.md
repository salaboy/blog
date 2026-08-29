---
title: "Jugando con jBPM #12 - jBPM + Drools"
date: 2008-09-01 01:03:15 +0000
permalink: /2008/09/01/jugando-con-jbpm-12-jbpm-drools/
description: "Bueno como siempre, la idea del post es tratar de mostrar alguna funcionalidad de jBPM. Pero en este caso nos vamos a fusionar con otro framework muy…"
tags:
  - "Java"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "Drools"
  - "JBoss"
  - "jBPM"
original_url: https://www.salaboy.com/2008/09/01/jugando-con-jbpm-12-jbpm-drools/
---

Bueno como siempre, la idea del post es tratar de mostrar alguna funcionalidad de jBPM. Pero en este caso nos vamos a fusionar con otro framework muy importante dentro de la suite de productos de JBoss. Estamos hablando de JBoss Drools, este framework pretende cumplir todas las funcionalidades de un BRMS (Business Rule Management System - Sistema de administración de Reglas de Negocio).

En este caso vamos a ver un ejemplo sencillo de como podemos usar a Drools dentro de un ActionHandler de jBPM.

Para empezar con el ejemplo vamos a ver el gráfico del proceso del negocio que vamos a utilizar:

![Drools + jBPM](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/08/droolsjbpm.png)

Este proceso básicamente se encargara de obtener los datos de una persona (de algún modo, podría ser una tarea humana cargar los datos de la persona) y con estos datos automáticamente se categorizara la persona teniendo en cuenta su edad, su sueldo, su categoría de trabajo, si posee vehículos, etc. Este es un proceso muy común en los análisis de riesgo crediticio, o también podría ser parte de la decisión para dar un seguro. La idea es que esta categorización se haga de manera automática con el motor de inferencias que nos provee Drools y de paso aprovechar de separar esta lógica de categorización dejándola afuera del código Java compilado, haciendo que esta sea mucho mas flexible a cambios. Sin dejar de lado la ventaja de que con los DSL (Domain Specific Language - Lenguajes Específicos de Dominio) podemos enmascarar las reglas definidas en lenguaje de Drools a algo muy parecido al lenguaje natural. (Mas de esto en un futuro post)

Entonces pasamos directamente a ver código y los pre-requisitos que necesitamos para que todo esto ande.

Como ya explique en post anteriores para que jBPM ande necesitamos sus dependencias, de la misma manera Drools tiene las suyas. Para obtener estas dependencias nos dirigimos a la pagina oficial de Drools y descargamos los binarios (Aprox. 50 megas)

Bajamos los binarios de Drools (**Drools 4.0.7 Binaries**):

<http://www.jboss.org/drools/downloads.html>

También recomiendo bajar el plug-in para eclipse, el cual nos hará las cosas mucho mas fáciles a la hora de escribir las reglas y sus correspondientes DSLs.

**Drools 4.0.7 Eclipse Europa 3.3 Workbench (funciona para Ganymede también)**

Una vez que tengamos esto descargado, necesitaremos descomprimirlos por ahí y luego crear una User Library en eclipse con los jars de Drools y sus correspondientes dependencias (que se encuentran en el directorio /lib).

(Para los que les interese Drools, recomiendo los ejemplos que hay en la pagina de downloads y la documentación oficial)

Una vez que tenemos los plug-ins instalados (jBPM y Drools) y las dependencias de ambos en nuestro proyecto, ya estamos listos para ver el codigo del proceso mostrado anteriormente.

Primero vamos al nodo (de tipo node) Obtener Persona, el cual tiene un ActionHandler asociado que posee el siguiente código:

public void execute(ExecutionContext context) throws Exception { Persona persona=new Persona(); persona.setEdad(45); Trabajo trabajo = new Trabajo(); trabajo.setPuesto(Puesto.GERENTE); trabajo.setSueldo(50000); persona.setTrabajo(trabajo); ArrayList&lt;Vehiculo&gt; vehiculos = new ArrayList&lt;Vehiculo&gt;(); Vehiculo vehiculo=new Vehiculo(); vehiculo.setValor(130000); vehiculo.setModelo("Audi A3"); vehiculos.add(vehiculo); persona.setVehiculos(vehiculos); context.setVariable("persona", persona); context.leaveNode(); }

Como se puede observar en este ActionHandler solo armamos un objeto persona, la idea en la realidad seria que sacáramos de algún lado (como por ejemplo de una base de datos, o un servicio) este objeto. Una vez que tenemos este objeto Persona, lo asignamos a una variable de contexto y continuamos la ejecución del proceso.

Al continuar la ejecución, el proceso llega al nodo llamado Categorizar, el cual también tiene un ActionHandler asociado, el cual se encarga de levantar una Sesion de Drools para ejecutar las reglas que vamos a ver mas adelante. Vemos el codigo de este ActionHandler:

public void execute(ExecutionContext context) throws Exception {  //Creamos un paquete de reglas a partir del archivo categorizar.drl PackageBuilder builder = new PackageBuilder(); builder.addPackageFromDrl(new  InputStreamReader(this.getClass().getResourceAsStream("/categorizar.drl"));  //Con este paquete de reglas creamos un RuleBase RuleBase ruleBase = RuleBaseFactory.newRuleBase(); ruleBase.addPackage(builder.getPackage()); //Con este rule base instanciamos una nueva Session Stateful de reglas. StatefulSession session = ruleBase.newStatefulSession(); //Buscamos en el contexto el objeto persona anteriormente obtenido Persona persona=(Persona)context.getContextInstance().getVariable("persona");  //insertamos este objeto a la Working Memory como un fact session.insert(persona); //Creamos un objeto de tipo Salida que va a contener los resultados de las ejecuciones de la reglas //Y lo agregamos como una variable global Categoria categoria=Categoria.BAJA; Salida salida=new Salida(); salida.setCategoria(categoria); session.setGlobal("salida", salida); //Una vez que tenemos las reglas (en el paquete) y los hechos insertados en la WM //Disparamos las reglas session.fireAllRules(); session.dispose(); //Buscamos los resultados y los guardamos en una variable del contexto del proceso context.getContextInstance().setVariable("categoria", salida.getCategoria()); //Continuamos la ejecucion context.leaveNode();}

Para los que recién comienzan con Drools este código suele ser bastante traumático, ya que se hacen varias cosas bastantes inexplicables a simple vista. Para tratar de explicar un poco lo que estamos haciendo veamos el siguiente gráfico que explica como generamos un paquete de reglas, que nos va a servir para inferir sobre nuestros objetos.

![Generacion de Package](http://downloads.jboss.com/drools/docs/4.0.7.19894.GA/shared/images/Chapter-Rule_Engine/Authoring.png)

Como observamos en el gráfico y en el código vamos a armar un paquete de reglas partiendo de una definición de reglas que en nuestro caso esta en un archivo drl llamado categorizar.drl (también podría estar en una definición en xml de las reglas). Como podemos ver esta tarea la tiene encargada la clase PackageBuilder, la cual compila y genera el código que termina resultando en un paquete de reglas. Una vez que tenemos este paquete de reglas (que no es mas que un resultado binario y optimizado para la ejecución de nuestras reglas) creamos una nueva instancia de la clase RuleBase a la cual le agregamos el paquete que acabamos de generar. Esta clase RuleBase va a ser la encargada de tener todos los paquetes de reglas (por ende todas las reglas que se encuentren en esos paquetes) para que el motor de inferencias pueda ejecutarlas contra los hechos (o facts en ingles, que son nuestros objetos)  que se van a encontrar en la Working Memory (es una memoria especial donde nosotros almacenamos nuestros hechos/objetos)

Con los siguiente gráficos de la documentación oficial espero que se aclara un poco el panorama:

![RuleBase](http://downloads.jboss.com/drools/docs/4.0.7.19894.GA/shared/images/Chapter-Rule_Engine/Runtime.png)![Distribución de reglas y hechos en Drools ](http://downloads.jboss.com/drools/docs/4.0.7.19894.GA/shared/images/Chapter-Rule_Engine/Rule_Engine.png)

Cuando el flujo de ejecución llega a este nodo, vamos a notar que Drools se pone a trabajar, lo que significa que hasta este momento, no se había hecho uso de Drools, por esto vamos a notar una demora en este nodo. Como resultado de este nodo guardamos una variable llamada categoría que decidirá en el siguiente nodo que acción hay que ejecutar.

Lo único importante que nos esta faltando ver es el archivo de reglas llamado categorizar.drl:

package com.sample.rulesimport com.sample.action.dominio.Persona; import com.sample.action.dominio.Persona.Categoria; import com.sample.action.dominio.Vehiculo; import com.sample.action.dominio.Trabajo; import com.sample.action.dominio.Trabajo.Puesto; global com.sample.action.output.Salida salida;rule "Evaluar Categoria Alta"when $persona : Persona ( edad > 35) $trabajo : Trabajo(puesto == Puesto.GERENTE, sueldo > 10000) from $persona.trabajo exists ($vehiculo : Vehiculo(valor > 40000) from $persona.vehiculos) then System.out.println("Categoria Alta"); salida.setCategoria(Categoria.ALTA); endrule "Evaluar Categoria Media"when $persona : Persona ( edad > 21 ) $trabajo : Trabajo(puesto == Puesto.ESCLAVO, sueldo < 6000) from $persona.trabajo exists ($vehiculo : Vehiculo() from $persona.vehiculos) then System.out.println("Categoria Media"); salida.setCategoria(Categoria.MEDIA); endrule "Evaluar Categoria Baja"when $persona : Persona ( edad > 21 , edad < 35) $trabajo : Trabajo(puesto == Puesto.ESCLAVO, sueldo < 6000) from $persona.trabajo not (exists ($vehiculo : Vehiculo() from $persona.vehiculos)) then System.out.println("Categoria Baja"); salida.setCategoria(Categoria.BAJA); end

Como podemos ver son reglas muy sencillas y fáciles de leer. Y lo mejor de todo es que estas reglas las tenemos centralizadas en este archivo drl, lo cual nos hará la vida mucho mas fácil cuando estas cambien y tengamos que adaptarnos a los cambios.

Espero que haya servido de algo el post, me imagino que le falta mucho detalle de como funciona Drools y como es la sintaxis de las reglas y que podemos hacer dentro de ellas. Pero ahondare en siguientes post, la finalidad de este era mostrar rápidamente como podíamos integrar muy desacoplada mente Drools con jBPM.

Espero comentarios, ya que me imagino que hay muchas cosas sobre el post que pueden no quedar claras.
