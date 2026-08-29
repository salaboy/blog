---
title: "Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168)"
date: 2008-03-02 23:04:44 +0000
permalink: /2008/03/02/jboss-portal-for-dummies-part-2-portal-api-jboss-propietary-de-mi-blog-en-wwwjugmzacomar-201107/
description: "Las api especificadas por la JSR-168 definen 2 clases que representan una porcion del estado visual de un portlet: javax.portlet.PortletMode y…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/02/jboss-portal-for-dummies-part-2-portal-api-jboss-propietary-de-mi-blog-en-wwwjugmzacomar-201107/
---

Las api especificadas por la JSR-168 definen 2 clases que representan una porcion del estado visual de un portlet: javax.portlet.PortletMode y javax.portlet.WindowState

Jboss por su parte define las siguientes clases que proveen algunas funcionalidades extras:

org.jboss.portal.Mode y org.jboss.portal.WindowState

Las diferencias entre estos pares de clases son pocas y son las siguientes:

- Las de jboss se acceden mediante Factories
- Las de jboss implementan la interfaz java.io.Serializable

![Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/portalapi/Mode.png)![Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/portalapi/WindowState.png)

Jboss tambien define la interfaz org.jboss.portal.api.PortalURL que representa una URL administrada por el contenedor.

![Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/portalapi/PortalURL.png)![Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/portalapi/PortalURL.png)

jboss tambien brinda la implementacion de dos clases importantes org.jboss.portal.api.session

.PortalSession y org.jboss.portal.api.PortalRuntimeContext

Ahora si vamos a lo importante: "Portal Nodes" !

La estructura del portal esta formada por nodos. Es posible programaticamente acceder al arbol del portal con el fin de:

- Descubrir la estructura del portal
- Crear una URL que renderizara diferentes nodos del portal
- Acceder a propiedades especificas de cada Nodo

![Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/portalapi/PortalNode.png)![Jboss Portal for dummies Part #2: Portal API (Jboss Propietary sobre el estandar JSR 168) ](http://docs.jboss.com/jbportal/v2.6.2/referenceGuide/html/images/portalapi/PortalNode.png)

Esta interface nos permite navegar toda la estructura y obtener informacion de ella.. pero no nos permite cambiar la estructura del portal.. ya que no es una interfaz de administracion.

Los tipos de nodos que nos podemos encontrar son los siguientes:

- PortalNode.TYPE_PORTAL: representa al portal directamente
- PortalNode.TYPE_PAGE: representa a una pagina dentro del portal
- PortalNode.TYPE_WINDOW: representa a una ventana (que es el protlet fragment + los controles )

Aca encontramos una interface que extension de org.jboss.portal.api.PortalURL y que nos permite realizar algunas cosas interesantes como por ejemplo recorrer la jerarquia de los nodos.. La interface se llama: org.jboss.portal.api.node.PortalNodeURL

Otra cosa interesante son los navigational states:

que son estados manejados por el portal que asocian a cada usuario un estado con respecto a su navegacion realizada.

Vamos a seguir con un poco mas de teoria y despues vamos a los post de ejemplos.!
