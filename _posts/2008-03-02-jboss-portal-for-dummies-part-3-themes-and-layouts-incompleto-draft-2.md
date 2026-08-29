---
title: "Jboss Portal for dummies Part #3: Themes and Layouts (Incompleto - Draft)"
date: 2008-03-02 23:58:23 +0000
permalink: /2008/03/02/jboss-portal-for-dummies-part-3-themes-and-layouts-incompleto-draft-2/
description: "Layouts: son los responsables de renderizar el markup que va a wrappear todo el markup generado por cada portlet individual."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/02/jboss-portal-for-dummies-part-3-themes-and-layouts-incompleto-draft-2/
---

**Layouts:** son los responsables de renderizar el markup que va a wrappear todo el markup generado por cada portlet individual. Themes: son responsables por el estilo del markup.

JBoss portal maneja el cocepto de regiones de pagina. Cuando una pagina es definida y cuando los portlet windows son asignados a una pagina, la reginon y el orden dentro de la region deben ser especificados. Entonecs una region contiene uno a mas portlets. Y la pagina contiene una o mas regiones.

Como los markups que envuelven a cada region, y los markups que envuelven a cada portlet individual son los mismos para todas las paginas del portal, tiene sentido encapsular esta funcionalidad en una entidad propia.

Para implementar esta encapsulacion hay muchas formas:

- JSPs que son incluidos por el layout JSP para cada region/portlet
- un Taglib que permite especificar regiones, windows y decoraciones (mediante tags) dentro de el JSP de layout
- Un taglib que usa una API pluggeable para delegar la generacion de markup a un set de clases.

Lo que encapsula la generacion de markup para cada region/window/portlet en el ultimo aproach es lo que llamamos RenderSet.

Este RenderSet consiste en 4 interfaces que se corresponden con los 4 contenedores de markups que envuelven al markup de los fragmentos de portlets:

- Region
- Window
- Decoration
- Portlet Content

**Como definimos un Layout?**

El portal y la pagina en si misma puede definir que  layout usar. En caso de que esten definidas en los dos lados la de la pagina sobre escribe a la del portal.

Para definir un layout usamos un archivo llamado portal-layouts.xml. Este descriptor debe ser parte de la aplicacion. Un ejemplo:

&lt;layouts&gt; &lt;layout&gt; &lt;name&gt;phalanx&lt;/name&gt; &lt;uri&gt;/phalanx/index.jsp&lt;/uri&gt; &lt;/layout&gt; &lt;layout&gt; &lt;name&gt;industrial&lt;/name&gt; &lt;uri&gt;/industrial/index.jsp&lt;/uri&gt; &lt;uri state="maximized"&gt;/industrial/maximized.jsp&lt;/uri&gt; &lt;/layout&gt; &lt;/layouts&gt;

**Como usamos un layout?**Hay dos formas: **- Declarativa:**Mediate el archivo *-objects.xml linkeamos la pagina con un layout: &lt;portal&gt; &lt;portal-name&gt;default&lt;/portal-name&gt; &lt;properties&gt; <!-- Set the layout for the default portal --> <!-- see also portal-layouts.xml --> &lt;property&gt; &lt;name&gt;layout.id&lt;/name&gt; &lt;value&gt;phalanx&lt;/value&gt; &lt;/property&gt; &lt;/properties&gt; &lt;pages&gt; &lt;page&gt; &lt;page-name&gt;theme test&lt;/page-name&gt; &lt;properties&gt; <!-- set a difference layout for this page --> &lt;property&gt; &lt;name&gt;layout.id&lt;/name&gt; &lt;value&gt;industrial&lt;/value&gt; &lt;/property&gt; &lt;/properties&gt; &lt;/page&gt; &lt;/pages&gt; &lt;/portal&gt;

**-Programatica:**Para acceder del codigo obtenemos una referencia a la interfaz  LayoutService.

Donde ponemos los descriptores?

Ambos descriptores, el del portal y el del theme, van en el directorio WEB-INF/ de la aplicacion. El encargado del portal se encarga de entrar a la carpeta WEB-INF/ para encontrar todos los descriptores especificados. **JSP-tags de Layout:**

El portal ya viene con un cierto conjunto de Tags que nos permiten ir mas rapido. hay 2 taglibs que cumplen con esta funcion.

- portal-layout.tld y theme-basic-lib.tld

portal-layout.tld contiene tags que funcionan asumiendo que el RenderSet se encargara de como se renderizaran las regiones, las portlet window y las portlet decorations. Con esto obtenemos un JSP mucho mas facil de leer y de mantener:

<%@ taglib uri="/WEB-INF/theme/portal-layout.tld" prefix="p" %> <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> &lt;html xmlns="http://www.w3.org/1999/xhtml"&gt; &lt;head&gt; &lt;title&gt;JBoss Portal&lt;/title&gt; &lt;meta http-equiv="Content-Type" content="text/html;" /&gt; &lt;p:theme themeName='renaissance' /&gt; &lt;p:headerContent /&gt; &lt;/head&gt; &lt;body id="body"&gt; <div id="portal-container"> <div id="sizer"> <div id="expander"> <div id="logoName"></div> <table border="0" cellpadding="0" cellspacing="0" id="header-container"> <tr> <td align="center" valign="top" id="header"> <div id="spacer"></div> </td> </tr> </table> <div id="content-container"> &lt;p:region regionName='This-Is-The-Page-Region-To-Query-The-Page' regionID='This-Is-The-Tag-ID-Attribute-To-Match-The-CSS-Selector'/&gt; &lt;p:region regionName='left' regionID='regionA'/&gt; &lt;p:region regionName='center' regionID='regionB'/&gt; <hr class="cleaner" /> <div id="footer-container" class="portal-copyright">Powered by <a class="portal-copyright" href="http://www.jboss.com/products/jbossportal"> JBoss Portal </a> </div> </div> </div> </div> </div> &lt;/body&gt; &lt;/html&gt;

**1 - Theme tag:** selecciona el theme que va a usar la pagina. **2 - headerContent tag: nos permite inyectar contenido en el header 3 - region tag:** renderiza todos los portlets especificados en una region de la pagina actual, usando un determinado renderset para producir el markup que envuelve cada uno de los markup generados por cada portlet. El atributo regionName funciona como un parametro de consulta en la pagina actual. Este determina para que region de la pagina el portlet                          va  ser  renderizado. El parametro regionID es que RenderSet se usa para generar un                         selector css para esta region en particular.
