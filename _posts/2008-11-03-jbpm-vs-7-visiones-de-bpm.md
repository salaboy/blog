---
title: "jBPM vs 7 visiones de BPM"
date: 2008-11-03 18:54:11 +0000
permalink: /2008/11/03/jbpm-vs-7-visiones-de-bpm/
description: "Pocas veces hago un review sobre algún articulo que publica alguien mas, ya por lo general me gusta expresar mi visión sobre los distintos frameworks con…"
tags:
  - "Java"
  - "JBoss JBPM"
  - "BPM"
  - "business"
  - "JBoss"
  - "jBPM"
  - "jPDL"
  - "management"
  - "process"
original_url: https://www.salaboy.com/2008/11/03/jbpm-vs-7-visiones-de-bpm/
---

Pocas veces hago un review sobre algún articulo que publica alguien mas, ya por lo general me gusta expresar mi visión sobre los distintos frameworks con los que suelo jugar todos los dias.

En este caso me dedico a comentar un articulo escrito nada mas y nada menos que por el senior Tom Baeyens (Leader y Core Developer del desarrollo de jBPM), tambien agregándole mi vision y no tanto traduciendo el articulo.

En este articulo, lleno de experiencia, Tom comenta 7 formas distintas de ver a BPM, ya que actualmente BPM es un termino muy sobrecargado y por esto es muy importante  distinguir entre los distintos significados a la hora de abordar el tema no solo tecnológica mente sino en todos los aspectos que el termino califica.

A continuación vemos estas 7 visiones de BPM resumidas del articulo original:

1. BPM como una disciplina:

Siempre debemos recordar que Business Process Management surge como una disciplina que se enfoca en el análisis, la documentación y la mejora de procesos que dictan como las personas y los sistemas trabajan dentro de una organización.

En esta disciplina se hace un esfuerzo para, primero que nada detectar y visualizar como trabajan las personas, como se comunican entre ellas, como se mueve la información que administra la organización, etc. Una vez que tenemos un estudio inicial se formalizan estos procesos en algún lenguaje como BPMN (Business Process Management Notation) y al mismo tiempo se trata de mejorar estos procesos para ahorrar tiempos y recursos dentro de la organización.

Como podran ver (y si leen un poco de BPMN) nos damos cuenta que en esta disciplina hay una distancia bastante considerable con el aspecto tecnológico. Ya que por lo general el resultado de esta disciplina, son los procesos optimizados presentados como una extensa documentación.

Por lo tanto, como menciona Tom en su articulo, jPDL (jBPM Process Definition Language) trata de ser el vinculo entre este análisis y formalización que se realiza en la disciplina con el aspecto tecnológico de un proyecto de software.

2. Combinando administración de tareas basadas en templates y tareas ad-hoc

Las cosas importantes que me parece que hay que destacar en este punto del articulo es que por lo general en los procesos de la vida real se termina haciendo una orquestación de las tareas humanas que se definen formalmente. Y por lo general, no es un tema al que se le preste mucha atención ya que por lo general estas orquestaciones, para que funcionen bien hay que ser muy rigurosos en cuanto al modelado y cubrir todas las posibles excepciones que puedan llegar a presentarse en la ejecución de las mismas.

Esto presenta situaciones donde la complejidad del análisis es alta y el costo de estabilizar estos procesos es alto.

Para esto en jBPM 4 van a aparecer las tareas ad-hoc que nos permiten definir tareas dentro de tareas, es decir que dentro de una tarea podamos crear sub tareas y asignarlas para modelar situaciones complejas donde las tareas humanas juegan un rol mas que importante en nuestros procesos.

3. Arquitecturas asíncronas transaccionales:

Como ya nos imaginamos con el nombre de este caso de uso, esta perspectiva esta fuertemente asociada a conceptos técnicos y de implementación de BPM, y por lo tanto esta en gran contraste con el caso de uso numero uno (BPM como disciplina).

En este caso, el proceso que vamos a implementar, por lo general no tiene relación con ningún proceso de nivel de negocio real. Sino que nuestro proceso nos va a permitir reflejar una implementación limpia y transparente para una solución compleja de comunicación entre varios puntos de manera transaccional (esto quiere decir, que en todo momento podremos saber en que estado estamos y tenemos la posibilidad de deshacer todo lo que hemos hecho, por conocer el estado en el que estamos y los estados por donde fuimos pasando)

4. Orquestacion de servicios

Esta es otra de las frases mas escuchadas cuandos se habla de jBPM, y este caso de uso es un caso particular del mensionado en el punto 3, ya que tambien esta fuertemente basado en la comunicaciones asincronicas entre varios interesados, pero en este caso la implementación de la comunicación suele darse por medio de un ESB (Enterprise Service Bus). "En estos casos es donde BPEL cobra un sentido fuerte, ya que se caracteriza por darnos un lenguaje de comunicación común y standard para nuestras comunicaciones".

5. Programación Visual

La programación visual, como menciona Tom en el articulo, es importante ya que brinda a los analistas y a desarrolladores que no estan tan acostumbrados a entornos Java, a empezar fácilmente dibujando los procesos de manera bastante simple.

Si bien esto es mucho menos flexible que la programación en Java, esto presenta varias ventajas entre las cuales se incluyen: una curva mucho mas baja de aprendizaje, un alto impacto visual y fácil comprendimiento.

6. Lenguaje de Control de ejecuciones multi hilo

Es importante notar un caso particular de esta programación visual que mencionábamos en el punto anterior, ya que el lenguaje que utilizamos cuando programamos visualmente (con designer / plug in para eclipse de jBPM) nos permite, usando nodos Fork/Join, modelar situaciones donde concurrentemente deben ejecutarse varias ramas del mismo proceso.

7)  Fácil creación de DSLs (Data Definition Languages)

Uno de los pilares de jBPM es reconocer que cada entorno de los procesos en la vida real es distinto. Por lo tanto una sola nomenclatura para definir los nodos de nuestros procesos no basta. Por esto mismo jBPM presenta jPDL, BPEL y PageFlow (de Seam) como tres lenguajes propuestos para tres entornos distintos.

Pero la idea real detras de todo esto es que sobre la Process Virtual Machine (PVM, el nucleo de jBPM) pueda escribirse/definirse cualquier lenguaje que se adapte correctamente al entorno del proceso que vamos a modelar.

Como menciona Tom en su conclusión, la mayoría de las personas que han leido poco de BPM y jBPM piensan que BPM es un software donde podemos dibujar un flujo de acciones y ya estamos listos para ejecutarlo y ponerlo en producción. Esta es una idea que escapa mucho a la realidad del framework jBPM y a la teoría de BPM en general, por esto mismo deben tenerse en cuenta estos puntos planteados.

Les dejo el link del articulo original para que lean la experiencia de Tom y los links que deja ya que son muy interesantes, porque amplían en detalle el tema.

<http://java.dzone.com/print/5585>
