---
title: "Jboss Portal for dummies Part #1: Simple HelloWorldPortlet (de mi blog en www.jugmza.com.ar - 20/11/07)"
date: 2008-03-02 23:03:14 +0000
permalink: /2008/03/02/jboss-portal-for-dummies-part-1-simple-helloworldportlet-de-mi-blog-en-wwwjugmzacomar-201107/
description: "Conceptos generales: Donde tenemos 3 modos de visualizacion para los portlets.. (Estos modos puede ser extendidos por cada implementacion): VIEW, EDIT y…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/02/jboss-portal-for-dummies-part-1-simple-helloworldportlet-de-mi-blog-en-wwwjugmzacomar-201107/
---

**Conceptos generales:**

![Jboss Portal for dummies Part #1: Simple HelloWorldPortlet (de mi blog en www.jugmza.com.ar - 20/11/07) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/tutorials/SpecPortalDef.png)

Donde tenemos 3 modos de visualizacion para los portlets.. (Estos modos puede ser extendidos por cada implementacion):

VIEW, EDIT y HELP.

Tambien tenemos un estado asociado para las Windows: NORMAL, MINIMIZED y MAXIMIZED.

Segun la especificacion solo deberiamos tener un archivo llamado portlet.xml en nuestra carpeta WEB-INF de nuestro .war.

El cual deberia ser similar a:

**portlet.xml:**

<?xml version="1.0" encoding="UTF-8"?> <portlet-app xmlns="<http://java.sun.com/xml/ns/portlet/portlet-app_1_0.xsd>" xmlns:xsi="<http://www.w3.org/2001/XMLSchema-instance>" xsi:schemaLocation="<http://java.sun.com/xml/ns/portlet/portlet-app_1_0.xsd>

<http://java.sun.com/xml/ns/portlet/portlet-app_1_0.xsd>" version="1.0"> &lt;portlet&gt; &lt;portlet-name&gt;HelloWorldPortlet&lt;/portlet-name&gt; &lt;portlet-class&gt;org.jboss.portlet.hello.HelloWorldPortlet&lt;/portlet-class&gt; &lt;supports&gt; &lt;mime-type&gt;text/html&lt;/mime-type&gt; &lt;portlet-mode&gt;VIEW&lt;/portlet-mode&gt; &lt;/supports&gt; &lt;portlet-info&gt; &lt;title&gt;HelloWorld Portlet&lt;/title&gt; &lt;/portlet-info&gt; &lt;/portlet&gt; &lt;/portlet-app&gt;

Pero para jboss portal podemos agregar un par de descriptores mas con el fin de customizar la visualizacion de nuestros portlets.. ya que si deployamos el portlet siguiendo la especificion. El portal no lo mostrara hasta que no creemos una instancia del mismo desde la seccion de administracion del mismo.

entonces agregamos los siguientes descriptores a nuestro directorio WEB-INF en nuestro .war: **portlet-instances.xml**

<?xml version="1.0" standalone="yes"?> <!DOCTYPE deployments PUBLIC "-//JBoss Portal//DTD Portlet Instances 2.6//EN" "<http://www.jboss.org/portal/dtd/portlet-instances_2_6.dtd>"> &lt;deployments&gt; &lt;deployment&gt; &lt;instance&gt; &lt;instance-id&gt;HelloWorldPortletInstance&lt;/instance-id&gt; &lt;portlet-ref&gt;HelloWorldPortlet&lt;/portlet-ref&gt; &lt;/instance&gt; &lt;/deployment&gt; &lt;/deployments&gt;

***-object.xml**

<?xml version="1.0" encoding="UTF-8"?> <!DOCTYPE deployments PUBLIC "-//JBoss Portal//DTD Portal Object 2.6//EN" "<http://www.jboss.org/portal/dtd/portal-object_2_6.dtd>"> &lt;deployments&gt; &lt;deployment&gt; &lt;parent-ref&gt;default.default&lt;/parent-ref&gt; &lt;if-exists&gt;overwrite&lt;/if-exists&gt; &lt;window&gt; &lt;window-name&gt;HelloWorldPortletWindow&lt;/window-name&gt; &lt;instance-ref&gt;HelloWorldPortletInstance&lt;/instance-ref&gt; &lt;region&gt;center&lt;/region&gt; &lt;height&gt;1&lt;/height&gt; &lt;/window&gt; &lt;/deployment&gt; &lt;/deployments&gt;

**La relacion entre estos descriptores es la siguiente:**

![Jboss Portal for dummies Part #1: Simple HelloWorldPortlet (de mi blog en www.jugmza.com.ar - 20/11/07) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/tutorials/first_portlet/desc_relationship.gif)

Ahora lo unico que resta es tener una clase java dentro de nuestro proyecto que extienda de GenericPortlet:

package org.jboss.portlet.hello;

import javax.portlet.GenericPortlet; import javax.portlet.PortletException; import javax.portlet.RenderRequest; import javax.portlet.RenderResponse; import javax.portlet.UnavailableException; import java.io.IOException; import java.io.PrintWriter;

public class HelloWorldPortlet extends GenericPortlet { protected void doView(RenderRequest rRequest, RenderResponse rResponse) throws PortletException, IOException, UnavailableException { rResponse.setContentType("text/html"); PrintWriter writer = rResponse.getWriter(); writer.write("Hello World!"); writer.close(); } }

Espero que les sirva.. se vienen mas posts sobre portlets!
