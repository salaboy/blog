---
title: "Jugando con jBPM #15 - Identity Component"
date: 2008-11-05 12:53:58 +0000
permalink: /2008/11/05/jugando-con-jbpm-15-identity-component/
description: "Primero que nada bienvenidos al post numero #15 de la serie Jugando con jBPM. En este post veremos algunos detalles del componente de identidades."
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "jBPM"
  - "Salaboy"
original_url: https://www.salaboy.com/2008/11/05/jugando-con-jbpm-15-identity-component/
---

Primero que nada bienvenidos al post numero #15 de la serie Jugando con jBPM. En este post veremos algunos detalles del componente de identidades.

Como estamos acostumbrados a ver en la típica imagen de arquitectura (o división lógica del proyecto) de jBPM se diferencia el componente de Identity (Identidades) como un bloque separado del core del framework:

![Componentes de jBPM](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/file-access/default/members/jbossjbpm/images/jbpm_overview_img.png)

Esta separacion le da a jBPM la flexibilidad de poder adaptarse a cualquier modulo de identidades que ya se encuentre en la empresa donde se vaya a realizar una implementación.

Pero entonces, en que consiste este modulo Identity que muestra la figura?

La respuesta es bastante simple, consiste en un modulo muy simple, que funciona out-of-the-box, que cuenta con tres conceptos para administrar nuestras identidades: Usuarios, Grupos y Membresias (User, Group y Membership). La idea es que apenas empezamos a usar jBPM ya tengamos una forma fácil y sencilla de user datos de usuarios, grupos y las relaciones N a N entre ellos con las membresias.

Esto no quiere decir que jBPM esta fuertemente acoplado a este esquema de usuarios, ya que en la mayoría de los casos, tenemos que adaptarnos a implementaciones y estructuras ya existentes de identidades.

Llegado al caso en el que tenemos que remover el componente de identidades que viene con jBPM y adaptar nuestro propio componente, debemos tener en cuenta cuales son los pasos a seguir y que bloques o clases debemos reescribir para adaptarnos.

El primer dato que encontramos si buscamos un poco sobre el tema es que debemos comentar en el archivo hibernate.cfg.xml las siguientes lineas:

Estos mapeos de hibernate se encargan de administrar las entidades que se manejan en este modulo que viene por defecto, cuyo diagrama de clases es el siguiente:

![Modelo de Clases de Identity](http://docs.jboss.com/jbpm/v3.2/userguide/html_single/images/identity.model.gif)

Por lo tanto desactivando estos mapeos desacoplamos totalmente a jBPM de este modulo de identidades que viene por defecto, y estamos listos para insertar nuestro propio (puede ser ya existente) modelo al framework.

jBPM para realizar este desacoplamiento de la forma mas transparente posible, maneja el concepto de actor, que es simplemente un String que representa a nuestros usuarios o grupos de usuarios.

Ahora bien, si en este punto nosotros tenemos un proceso que tiene una tarea y la asignación de esta tarea se realiza mediante una expresion, como por ejemplo:

```

 
 ..
```

Esta expresión lo que hace es resolver el grupo admin y asignarle la tarea a todos los usuarios de este grupo (en este caso admin).

Les recomiendo que vean en la documentación oficial como pueden ser estas expresiones ya que es un tema bastante interesante. (link: <http://docs.jboss.com/jbpm/v3.2/userguide/html_single/#theidentitycomponent>)

Por lo tanto si tratamos de ejecutar nuestro proceso y hemos desactivado los mapeos a las entidades de hibernate, vamos a ver en la consola el siguiente WARN:

**11:10:24,812 [main] WARN  QuerySplitter : no persistent classes found for query class: select g from org.jbpm.identity.Group as g where g.name = :groupName**

Que nos dice exactamente eso, no tiene ninguna clase para consultar los grupos de usuarios y resolver la expresion que habiamos puesto en el tag assigment dentro de nuestra tarea.

Entonces, la pregunta que se hace obvia es: quien se encarga de hacer estas resoluciones de expresiones?

La respuesta tambien es obvia y es una clase llamada: **org.jbpm.identity.assignment.ExpressionAssignmentHandler**

La cual mediante una propiedad **ExpressionSession expressionSession**, se encarga de comunicarse con el esquema de identidades que se encontraba mapeado con hibernate. En este caso del mapeo con hibernate donde nuestro esquema de identidades se encuentra almacenado en la base de datos (es muy comun que el esquema de identidades este en un Arbol LDAP tambien) la clase que implementa la interfaz **ExpressionSession** para esta implementacion del componente de identidades es: **org.jbpm.identity.hibernate.IdentitySession**.

SI analizamos los metodos de esta clase veremos que ellos cumplen con todas las funcionalidades necesarias para resolver usuarios y grupos de la manera mas simple (en este caso realizando consultas con la session de hibernate a las entidades mapeadas).

Algunos metodos de **org.jbpm.identity.hibernate.IdentitySession:**

```
public User getUserByName(String userName) {
    User user = null;
    Query query = session.createQuery(
      "select u " +
      "from org.jbpm.identity.User as u " +
      "where u.name = :userName"
    );
    query.setString("userName", userName);
    List users = query.list();
    if ( (users!=null)
         && (users.size()>0) ) {
      user = (User) users.get(0);
    }
    return user;
  }
public Group getGroupByName(String groupName) {
Group group = null;
Query query = session.createQuery(
"select g " +
"from org.jbpm.identity.Group as g " +
"where g.name = :groupName"
);
query.setString("groupName", groupName);
List groups = query.list();
if ( (groups!=null)
&& (groups.size()>0) ) {
group = (Group) groups.get(0);
}
return group;
}
```

Como ultimo dato agrego que la sugerencia, muy correcta en la documentación, dice que si queremos reutilizar el esquema de acceso a los componentes de identidades que nos propone jBPM debemos extender la clase **ExpressionAssignmentHandler** y sobre escribir el método **getExpressionSession** que en este caso nos devolvería en vez de un **org.jbpm.identity.hibernate.IdentitySession** nuestra propia implementación de acceso a nuestras propias identidades.

Entonces las ideas que me gustaría que quedaran claras en este post son las cosas a tener en cuenta para implementar o acoplar un nuevo esquema de identidades a jBPM.

También espero que les sirva como punta pie inicial para investigar en profundidad estas expresiones de asignación que son muy importantes cuando tenemos tareas y grupos de usuarios complejos.

Cualquier consulta, ya saben que estoy a su disposición.
