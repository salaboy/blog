---
title: "Como encaja jBPM en el mercado? (Introducción)"
date: 2008-06-21 23:39:34 +0000
permalink: /2008/06/21/como-encaja-jbpm-en-el-mercado/
description: "Que tema complicado para escribir, ya que conozco poco de estrategias de marketing y mucho menos sobre la política por parte de JBoss para vender…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "jbug"
  - "api"
  - "Argentina"
  - "JBoss"
  - "jBPM"
  - "jPDL"
original_url: https://www.salaboy.com/2008/06/21/como-encaja-jbpm-en-el-mercado/
---

Que tema complicado para escribir, ya que conozco poco de estrategias de marketing y mucho menos sobre la política por parte de JBoss para vender servicios sobre el producto jBPM.

La idea de este post es comentar algunas ideas que se me han venido a la cabeza al darme cuenta de que la competencia directa de JBoss y jBPM , tiene algunas estrategias de entrada al mercado que actualmente no he visto por parte de Red Hat/JBoss.

El planteo general es tratar de encontrar una manera real aca en la Argentina (por nombrar un pais donde  la situación del mercado es bastante especial) de poder acercar jBPM a los clientes finales o por lo menos que las empresas en el mercado empiecen a conocer el producto.

Para todo esto creo que hay dos cosas que hay que tener en claro:

1. Limitaciones del producto
2. Estrategias de venta

**Limitaciones del Producto:**

jBPM ([www.jbpm.org](http://www.jbpm.org)) es un producto que nos permite tecnicamente resolver un gran rango de situaciones que involucren cualquier tipo de proceso que pueda ser representado por un grafo dirigido. Esto es, representar un proceso de negocio empresarial, orquestación de servicios, workflows de documentos, o cualquier caso donde tengamos que representar un proceso a cualquier escala en cualquier rubro de la industria.

A nivel técnico el producto ya tiene una madurez bastante importante y estan bien delimitadas las funcionalidades que se pueden obtener del mismo. Y creo que ahi es donde empiezan algunos de los problemas y los puntos que debemos analizar.

Las funcionalidades y alcances que propone jBPM están perfectas a nivel técnico ya que los problemas que nos permite solucionar presentan grandes ventajas con los métodos normales de programación se utilizan actualmente en el mercado.

El problema principal viene dado a otro nivel, y es un nivel mucho menos técnico y de apreciación mas "marketinera", a lo que me refiero exactamente es que jBPM al ser un producto Open Source, guiado por la comunidad, no esta pensado para satisfacer la parte mas visible para un usuario final o un cliente que pueda llegar a verse interesado. El planteo de JBoss y la comunidad en general es mas que nada proveer a los desarrolladores una biblioteca de clases que nos permita programar cumpliendo la disciplina de BPM y dándonos un motor de ejecución bastante maduro (se encuentra en la versión 3.2.2 actualmente y la versión 4.0 ya tiene fecha aproximada de salida) que nos permite ejecutar nuestros procesos en entornos de producción.

Y entonces porque lo nombre como problema? porque en realidad esta visión, en gran parte dada por la comunidad, deja al producto afuera de toda apreciación comercial, ya que lo visible para los clientes es bastante técnico y carece de herramientas de facil uso por personas que no se encuentran altamente capacitadas para utilizar herramientas de desarrollo.

Para citar algunos ejemplos de esto, basta con decir que cuando queremos empezar a usar jBPM de la pagina oficial bajamos un jar (archivo de bibliotecas Java) y que el único diseniador gráfico de procesos es un plug in para una herramienta de desarrollo.

Cómo solucionamos esto? es la pregunta que surge a simple vista. Y la respuesta no es para nada alegre, ya que la solución seria dedicar horas de desarrollo (de la comunidad, o de los mismos empleados de JBoss) de estas herramientas que cumplan con la funcionalidad de simplificar la interacción de los usuarios finales (analistas de negocio en gran parte) con la herramienta. Tema que es complicado ya que por lo general en este tipo de proyectos son las partes que mas cuestan, ya que la mayoría de los desarrolladores que están al nivel para desarrollar herramientas complejas no están entrenados para el desarrollo de aplicaciones orientadas a usuarios finales y menos aun se cuenta con gente especializada en estos temas.

Cabe también destacar que jPDL, el lenguaje de descripción de procesos que utiliza por "defecto" el motor de jBPM (me refiero a jPDL - JBoss/Java Process Definition Language), si bien es extensible, carece de extensiones básicas para el momento donde necesitamos representar procesos de negocios donde por lo general necesitamos poder representar tiempos asociados a cada tarea dentro del proceso y costos asociados al mismo(O asociado a los recursos que realizan ciertas tareas) . Estos dos detalles (falta de tiempos y costos) producen que nos veamos obligados a extender el lenguaje y tener que programar una extensión para administrar estos cálculos.

**Estrategias de venta**:

Parte oscura si las hay..., al parecer no existe una estrategia específicamente dedicada a implementaciones de BPM por parte de JBoss / Red Hat, ya que las estrategias o productos que actualmente ofrece JBoss son distintas plataformas que incluyen a BPM como es la SOA Platform que además de BPM incluye productos como JBoss Rules (Drools), JBoss ESB, y los clásicos (JBoss AS, Hibernate, etc).

**Conclusión:**

Teniendo en cuenta estos dos puntos, seguiré posteando algunas de las cosas que tiene que ver con jBPM y la apreciación del mercado Argentino sobre este tipo de productos (apreciación personal). También tratare de definir las herramientas que actualmente faltan y algún proceso (serie de tareas) que pueda ayudar a involucrar mas a los clientes con jBPM.

Espero un poco de feedback para poder tener post mas elaborados.. sientanse comodos de aportar..de criticar y de dejar sus ideas..
