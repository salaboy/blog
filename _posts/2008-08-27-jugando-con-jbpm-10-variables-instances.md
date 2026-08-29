---
title: "Jugando con jBPM #10 - Variables Instances"
date: 2008-08-27 17:22:22 +0000
permalink: /2008/08/27/jugando-con-jbpm-10-variables-instances/
description: "Este post tiene como objetivo profundizar sobre la customizacion de almacenamiento de variables de procesos."
tags:
  - "Java"
  - "JBoss JBPM"
  - "JBoss"
  - "jBPM"
original_url: https://www.salaboy.com/2008/08/27/jugando-con-jbpm-10-variables-instances/
---

Este post tiene como objetivo profundizar sobre la customizacion de almacenamiento de variables de procesos.

(Documentación oficial: <http://docs.jboss.com/jbpm/v3.2/userguide/html/context.html#customizingvariablepersistence>)

La primer pregunta que nos surge es, **cuando necesitamos customizar como se almancenan las variables en jBPM?**

A decir verdad, es una buena pregunta. Vamos a empezar haciendo referencia a la documentación oficial en cuanto a las variables que dicen estar soportadas por jBPM para su almacenamiento automático:

- java.lang.String
- java.lang.Boolean
- java.lang.Character
- java.lang.Float
- java.lang.Double
- java.lang.Long
- java.lang.Byte
- java.lang.Short
- java.lang.Integer
- java.util.Date
- byte[]
- java.io.Serializable
- classes that are persistable with hibernate

Supuestamente estos tipos de variable son fácilmente persistibles por jBPM y no debemos cambiar ninguna configuración para que las variables simplemente se persistan.De los tipos basicos de datos (String, Boolean, Float, Double, Long, Byte, Short, Integer, Date y byte[]) podemos pensar que hibernate los resuelve directamente fijandose en los mapeos de los tipos de datos especificos para cada base de datos en particular. Y de los dos ultimos tipos (java.io.Serializable y hibernate classes) podemos pensar que vamos a necesitar alguna configuracion especial.Pero no, ya que el motor de jBPM  para todos los tipos de variable va a revisar el archivo jbpm.varmappings.xml y transformara los objetos de usuario (todos los de la lista anterior) a objetos de tipo VariableInstance, que son objetos que actualmente se encuentran mapeados con Hibernate (mediante un hbm).Para esta transformación se necesitan dos cosas importantes, los matchers y los converters. (JbpmTypeMatcher, Converter dos interfaces importantes en el paquete: org.jbpm.context.exe)Estas dos interfaces (JbpmTypeMatcher, Converter) deben ser implementadas en el caso que necesitemos algun tipo nuevo de VariableInstance para nuestro caso particular. Como vemos en la documentacion oficial, los tipos de VariableInstance que tenemos por defecto son los siguientes:

- DateInstance (with one java.lang.Date field that is mapped to a Types.TIMESTAMP in the database)
- DoubleInstance (with one java.lang.Double field that is mapped to a Types.DOUBLE in the database)
- StringInstance (with one java.lang.String field that is mapped to a Types.VARCHAR in the database)
- LongInstance (with one java.lang.Long field that is mapped to a Types.BIGINT in the database)
- HibernateLongInstance (this is used for hibernatable types with a long id field. One java.lang.Object field is mapped as a reference to a hibernate entity in the database)
- HibernateStringInstance (this is used for hibernatable types with a string id field. One java.lang.Object field is mapped as a reference to a hibernate entity in the database)
- ByteArrayInstance que misteriosamente no aparece en la documentacion

Por lo tanto si empezamos a ver como es la secuencia de funcionamiento, llegamos a la conclusion de que cuando llamamos al metodo **setVariable**, el objeto de usuario va a ser opcionalmente convertido con el converter apropiado segun el matcher que coincida en el archivo jbpm.varmappings.xml. Cuando nostros estemos customizando este archivo, tenemos que tener cuidado porque el mismo se revisa en orden secuencial, por lo tanto, hay que ver que nuestro tipo custom no matchee con ningun otro matcher antes que el nuestro.Toda esta interaccion de matchers y converters ocurre dentro de la clase VariableInstance y el metodo createVariableInstance que es invocado cada vez que se llama el metodo **setVariable** mensionado anteriormente.public static VariableInstance createVariableInstance(Object value) { VariableInstance variableInstance = null;

Iterator iter = JbpmType.getJbpmTypes().iterator(); while ( (iter.hasNext()) && (variableInstance==null) ){ JbpmType jbpmType = (JbpmType) iter.next();

if (jbpmType.matches(value)) { variableInstance = jbpmType.newVariableInstance(); } }

if (variableInstance==null) { variableInstance = new UnpersistableInstance(); }

return variableInstance; }

Otro clase que juega un papel importante aca es JbpmType:public JbpmType(JbpmTypeMatcher jbpmTypeMatcher, Converter converter, Class variableInstanceClass) { this.jbpmTypeMatcher = jbpmTypeMatcher; this.converter = converter; this.variableInstanceClass = variableInstanceClass; }Ya que podemos observar como se crea engloba al matcher, al converter y al tipo de la clase que estamos por crear el VariableInstance.Para no extender mucho mas el post, termino dando tres aclaraciones que considero importantes:

- Vamos a tener que crear un nuevo VariableInstance cuando necesitemos persistir algun objeto de dominio (negocio) con algun mapeo poco comun. Espero tener tiempo y poder postear un ejemplo de eso, asi queda claro que seria un mapeo poco comun.
- Para nuestros objetos de dominio que tengamos o decidamos mapear con hibernate de la forma mas comun (hbms), siempre y cuando agreguemos los hbms al archivo hibernate.cfg.xml, los objetos seran automaticamente persistidos por hibernate.
- Para nuestros objetos que no esten mapeados con hibernate pero esten marcados como serializables, estos seran transformados como indica el matcher en jbpm.varmappings.xml a ByteArrayInstance y se guardaran en forma binaria en la base de datos.
