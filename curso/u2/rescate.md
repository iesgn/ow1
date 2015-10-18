---
layout: blog
tittle: Rescate de instancias
menu:
  - Unidades
---

Un usuario puede poner una instancia en modo de rescate cuando el
sistema no sea accesible o no esté correctamente configurado, de esta
forma se puede acceder al servidor y corregir los errores que
hubiera.

Cuando se pone una instancia en modo rescate no se puede acceder a
ella hasta que este cambia de ACTIVE a RESCUE, proceso que puede ser
en ocasiones un poco lento.

El proceso que ocurre cuando un usuario pone una instancia en modo
rescate es el siguiente:

* La instancia inicial se apaga.
* Se crea una nueva instancia con dos discos virtuales:
  * El primer disco se crea partiendo de la misma imagen desde la que se había creado la instancia a rescatar.
  * El segundo disco contiene el sistema raíz que se quiere rescatar.


![rescatar](img/rescate1.png)

Podemos acceder a la nueva instancia con nuestra clave privada ssh y arreglar el sistema de archivo de la instancia a rescatar.
 
Después de resolver los problemas de un servidor en modo rescate, se
puede detener este modo. Cuando se detiene el rescate del servidor, la
instancia reparada se vuelve a su estado original.


![rescatar](img/rescate2.png)


### Enlaces de interés

[Tutorial - Cómo rescatar un servidor fallido con las instancias de recuperación de StackOps ](https://www.youtube.com/watch?v=gTQaES8ri-Q)