---
title: "LDD 3: #8 Allocacion de memoria"
date: 2008-03-10 20:02:41 +0000
permalink: /2008/03/10/ldd-3-8-allocacion-de-memoria/
description: "Hasta ahora solo hemos usado kmalloc y kfree para la allocacion y liberacion de memoria. Sin embargo el kernel ofrece un set completo de primitivvas para…"
tags:
  - "Linux"
original_url: https://www.salaboy.com/2008/03/10/ldd-3-8-allocacion-de-memoria/
---

Hasta ahora solo hemos usado kmalloc y kfree para la allocacion y liberacion de memoria. Sin embargo el kernel ofrece un set completo de primitivvas para la allocacion de memoria.

LA HISTORIA REAL DE KMALLOC: El motor de allocacion Kmalloc es una herramienta poderosa y facil de aprender ya que es similar a malloc. Esta funcion es rapida (pero bloquea) y no limpia la memoria que obtiene.

EL ARGUMENTO FLAG: si recordamos el prototipo de kmalloc: #include<linux/slab.h> void *kmalloc(size_t size, int flags) El primer argumento es el tamanio del bloque a allocar. El segundo argumento son las flags de allocacion, que son muy interesantes porque controlan el comportamiento de kmallloc. La flag mas utilizada es GFP_KERNEL., que significa que la allocacion *internamente realizada por la llamada a __get_free_pages) es realizada en medio de un proceso corriendo en el kernel. En otras palabras esto significa que la funcion llamante ejecuta un syscall en el medio de un proceso. Usar GFP_KERNEL significa que kmalloc pone al proceso actual a dormir a la espera de una pagina cuando es llamado en situaciones donde ha poca memoria disponible. Por lo tanto una funcion que alloca memoria debe ser reentrante y no debe estar corriendo en un contexto atomico.

Mientras el proceso duerme, el kernel realiza las acciones necesarias para encontrar memoria libre, y esto lo logra flusheando los buffers a disco o swapeando memoria de algun proceso de usuario.

A persar de todo esto GFP_KERNEL no siempre es la flag mas adecuada. Puede pasar que el proceso actual este corriendo en un contexto atomico y no pueda ponerse a dormir, entonces debemos usar GFP_ATOMIC. Con lo cual el kernel trata siempre de tener algunas paginas libres en orden de poder satisfacer las allocaciones atomicas.

ZONAS DE MEMORIA:

El kernel de linux conoce como minimo 3 zonas de memoria • Memoria DMA-capable • Memoria Normal • High Memory

Cuando las allocaciones suceden por lo general en la memoria normal, seteando alguna flag podemos cambiar a una zona diferente.

La memoria en la zona DMA-capable (direct memory access) es memoria que vive en un rango preferencial donde los perifericos puede realizar dma access.

High memory es un mecanismo usado para permitir el acceso a (relativamente) grandes cantidades de memoria en sistemas de 32 bits.

Cuando una nueva pagina es allocada para completar un request de allocacion de memoria, el kernel construye una lista de las zonas que puede usar para buscar paginas libres. Esta busqueda se limita dependiendo de las flags (__GPF_DMA o __GPF_HIGHMEM)

EL ARGUMENTO SIZE:

El kernel administra la memoria fisica del sistema, que esta disponible solo en chucks de tamanio de paginas. Como resultado kmalloc a la hora de implementacion luce diferente a malloc. Ya que el kernel usa una tecnica de allocacion orientada a paginas para obtener el mejor uso de la ram del sistema. Linux maneja la allocacion de memoria creando un pool de objetos de memoria de un tamanio fijo. Entonces los request de allicacion son manejados yendo al pool que tiene suficientes objetos, agarrando todo un chunk y devolviendoselo a que lo habia pedido. Una cosa que hay que tener en cuenta es que el kernel puede allocar solo ciertos bytes array de tamanio fijo predefinidos. POr esto si nosotros pedimos una cantidad arbitraria de memoria probablemente obtengamos mas (hasta casi 2 veces mas es posible)

LOOK ASIDE CACHE: (en vez de usar kmalloc)

Por lo general un device driver termina allocando muchos objetos del mismo tamanio una y otra vez. Dado que el kernel ya mantiene un set de pools de objetos del mismo tamanio, por que no agregamos un pool para estos objetos del device driver? En realidad el kernel ya implementa una solucion que nos permite crear este tipo de pool que son llamados look aside cache.

El administrador de cache en el kernel de linux se suele llamar "SLAB ALLOCATOR" por esta razon las funciones y los types se encuentran declaradas en <linux/slab.h>. El slab allocator implementa caches de tipo kmen_cache_t, que son creadas con la funcion:

kmem_cache_t *kmem_cache_create(const char *name, size_t size, size_t offset, unsigned long flags, void (*constructor) (void*,kmem_cache_t *, unsigned long flags), void (*destructor)(..));

Esta funcion crea nuevos objetos de cache que puede contener cualquier numero de areas de memoria todas del mismo tamanio, especificado por el argumento size.

UNa vez que creamos el cache de objetos, podemos allocar objetos en el llamando:

void *kmem_cache_alloc(kmem_cache_t *cache,int flags) cache es el creado anteriormente y flags son las mismas que a kmalloc.

Cuando queremos liberar a un objeto de la cache: void kmem_cache_free(kmem_cache_t *cache, const void *obj);

y cuando queremos destruir la cache: int kmem_cache_destroy(kmem_cache_t *cache);

POOLS DE MEMORIA:

Hay lugares en el kernel donde la allocacion de memoria no puede falla. Una manera de garantizar las allocacion en ess sitauciones son los mempools. Un mempool es un look aside cache que trata de mantener siempre una lista de memoria libre para usar en casos de emergencia. Los mempools son de tipo mempool_t (<linux/mempool.h>) y creamos uno con:

mempool_t *mempool_create(int min_nr, mempool_alloc_t *alloc_fn, mempool_free_t *free_fn, void *pool_data); donde min_nr es el numero minimo que siempre tiene que tratar de tener libre. y las fn son las que realmente se encargan de la allocacion. Donde los prototipos de estas son: typedef void *(mempool_alloc_t)(int gfp_mask, void *pool_data)  donde pool_data es el mismo puntero que se le pasa a mempool_create

typedef void *(mempool_free_t)(void *element, void *pool_dada);

Si necesitamos algun comportamiento especial para la allocacion de memoria escribimos estas funciones, pero por lo general dejamos al slab allocator del kernel que haga esta tarea por nosotros. Ya hay 2 funciones que cumplen con el prototipo de mempool_alloc_t y mempool_free_t que se llaman mempool_alloc_slab y mempool_free_slab:

EJ: cache=kmem_cache_create(....); pool=mempool_create(my_pool_minimun, mempool_alloc_slab, mempool_free_slab, cache);

Una vez que el pool se creo los objetos se allocan y liberan con:

void *mempool_alloc(mempool_t *pool, int gfp_mask) void mempool_free(void *element, mempool_t *pool)

Lo bueno de los memory pools es que podemos resizearlos con: int mempool_resize(mempool_t *pool, int new_min_nr, int gfp_mask);

GET_FREE_PAGES Y SU PANDILLA:

Si nuestro modulo necesita allocar grandes chunks de memoria, es mejor usar una tecnica orientada a paginas. Para allocar paginas tenemos las siguientes funciones: get_zeroed_page(unsigned int flags) -> nos devuelve un puntero a una nueva pagina llena de 0s __get_free_page(unisigned int flags) -> igual pero no limpia la memoria __get_free_pages(flags, unsigned int order) -> cantidad de paginas que pedimos order=0 => 1 pag, order = 3 => 8 pag, nos devuelve paginas contiguas

VMALLOC Y SU PANDILLA -> demasiado loco
