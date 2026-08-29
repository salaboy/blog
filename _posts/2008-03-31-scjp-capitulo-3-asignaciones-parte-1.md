---
title: "SCJP - Capitulo 3:  Asignaciones (Parte #1)"
date: 2008-03-31 01:37:01 +0000
permalink: /2008/03/31/scjp-capitulo-3-asignaciones-parte-1/
description: "Stack y Heap Entender los conceptos basicos de Stack y Heap hace mas facil entender temas como paso de argumentos, polimorfismo, hilos, exceptions, y…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/03/31/scjp-capitulo-3-asignaciones-parte-1/
---

**Stack y Heap**

Entender los conceptos basicos de Stack y Heap hace mas facil entender temas como paso de argumentos, polimorfismo, hilos, exceptions, y garbage collection. Los metodos, variables, y objetos viven en 2 partes de la memoria, el Stack y el Heap. Por ahora nos vamos a preocupar solo en 3 tipos de cosas> variables de instancia, variables locales y objetos:

- Variables de instancia y objetos viven en el Heap
- Variables locales viven en el Stack

(Copiar figura pagina 175)

**Literales, asignaciones y variables:**

- Valores literales para todos los tipos de primitivos:
  - Literales Enteros:
    Hay 3 formas de representar numeros enteros en Java: decimal (base 10), octal (base 8) y hexadecimal (base 16)
    - Decimal: int lenght=342;
    - Octal: solo de 0 a 7 y anteponemos un 0: int nueve=011; podemos tener 21 digitos sin contar el 0
    - Hex: no es case-sensitive! 0 a F, lo indicamos con 0x: int z=0xDEADCAFE;Los literales enteros son definidos como int por defecto pero pueden ser especificados como long agregando una L al final: long so=0xFFFFL -> la L tampoco es case-sensitive y puede ser "l" ojo que confunde con el 1 (uno)
  - Literales de punto flotante:
    Son definidos como un numero, el simbolo de decimal y mas numeros representando la fraccion:
    double d=111.3245;
    Estos son definidos por defecto como doubles (64 bits), pero si queremos asignar un literal de punto flotante a una variable de tipo float(32 bits) debemos agregar el sufijo F al final. EJ:
    float f=23.4543; // Mal perdida de presicion!!!
    float f=23.4543F; // Todo OK!Ojo si vemos literales con coma ej: int x=2,321; no compila por la coma!
  - Literales Booleanos:
    Son true o false, nada mas. boolean f=0; // Error! ; int x=1; if (x) -> no compila no es como C
  - Literales caracter:
    Son representado como un solo caracter entre comillas simples: char a='a';
    Tambien podemos poner valores unicode con el prefijo \u. ej: char n='\u004E';
    Recordemos que los caracteres son solo enteros sin signo de 16 bits po lo cual podemos asignar cualquier valor numerico que este en el rago de 0 a 65535. char a=0x892; char c=(char) 70000 -> esta fuera de rango por eso hay que castear.
    Tambien podemos representar los caracteres que no se pueden tipear como por ejemplo: linefeed, new line, horizontal tab, backspace y comillas simples. Ej: char a='\"'; para las comillas dobles o char n='\n'; para new line.
  - Valores literales para Strings:
    Son las representacion de un valor como un objeto string: String s="hola mundo!";

**Operadores de Asignacion:**Es bastante sencillo con el operador igual (=) y asignamos el valor de la izquiera a la variable en la derecha. x=6; Las variables son solo contenedores de bits, con un tipo designado. Dentro de este contenedor tenemos un conjunto de bits que representan un valor. Por ejemplo, si tenemos un byte con valor 6, significa que tenemos el patron binario 00000110 dentro del contenedor de tipo byte. Pero que pasa cuando tenemos un contenedor de tipo Objeto? Button b=new Button(); Que hay dentro del contenedor de tipo Button?  esta el objeto Button? NO!!!! es solamente una variable de referencia. Y una variable de referencia contiene los bits que representan la manera de llevar a un objeto.

**Asignacion de primitivas:**

Podemos asignar a una variable primitiva un literal o el resultado de una expresio. Ej: int x=7; int y=x+2; int z=x*y; Que pasa si estamos tratando de asginar una variable byte? despues de todo un contenedor de tamanio byte no puede contener tantos bits como un contener int. Aca es donde se vuelve extranio!! Lo siguiente es legal: byte b=27; -> esto se puede porque se hace un casteo automatico. Sabemos que un literal entero siempre es un int, pero mas importante es que el resultado de una expresion que incluye cualquier cosa con tamanio entero o menor, siempre es un int!!! (es decir, que si sumamos 2 bytes obtenemos un int)  Entonces si hacemos byte c=a+b; y a y b son bytes, el codigo no compila, porque el resultado es un int, y si realmente necesitamos que sea un byte el resultado, debemos castearlo con c=(byte)a+b;

**Casteo de primitivas:**

Nos permite convertir de un tipo a otro. Cuando pasamos un valor grande a un contenedor pequenio se llama narrowing y requiere un cast explicito, donde nosotros le decimos al compilador que sabemos lo que estamos haciendo y que nos hacemos cargo por la conversion. Si el valor es mas grande que el contenedor al que estamos casteando, no tenemos un error de runtime, sino que se toman los bits de la drecha que entren y los demas se descartan. Y si el bit de mas a la izquiera es un 1 entonces el valor sera negativo. (ya que es signed)
