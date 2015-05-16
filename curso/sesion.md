---
layout: blog
tittle: Sesiónes online
---

|Fecha|Ejercicios|Ponenete|
|:---:|----------|--------|
|21 de Mayo| 1,2 |Alberto |
|26 de Mayo| 3,4,5,6,7,8,9 |José Domingo  |
|28 de Mayo| 10,11,12,13,14, |  |
|2 de Junio|  |  |
|9 de Junio|  |  |
|11 de Junio|  |  |
|16 de Junio|  |  |
|18 de Junio|  |  |
|23 de Junio|  |  |
|25 de Junio|  |  |

#Ejercicios

##Cloud Computing y OpenStack

* Ej1: Contenidos: Introducción al Cloud Computing
* Ej2: Contenidos: Introducción a OpenStac

## OpenStack con Cirrusflex

* Ej3: Contenidos: Introducción a StackOps Cirrusflex
* Ej4: Contenidos: Conceptos previos
* Ej5: Ejercicio: Trabajo con claves ssh
	* Explicación de cómo funciona la autentificación ssh con claves ssh
	* Crear un par de claves con frase de paso y utilizar ssh-add
	* Putty?
* Ej6: Ejercicio: Pasos previos
	* Exportar la clave pública a Cirrusflex
	* Crear una clave en Cirrusflex y guardar la clave privada
	* Introducción a los grupos de seguridad
	* Introducción a la gestión de IP flotantes
* Ej7: Ejercicio: Crear una instancia desde una imagen Linux y acceder desde fuera
	* Acceso con clave ssh, pero indicar que se podría crear contraseñas para los usuarios (menor seguridad)
	* Mientras hacemos la instancia Windows actualizamos los paquetes 
* Ej8: Ejercicio: Crear una instancia desde una imagen Windows y acceder desde fuera
* Ej9: Ejercicio: Intalación de Wordpress. Crear dos instancias, montar en una una BBDD y en la otra el servidor web. Abrir sólo el servidor web.
	* Utilizar dos grupos de seguridad, una para cada instancia y abrir sólo los puertos necesarios para cada uno.
	* Acceso a la instancia de BD desde la instancia del servidor web
* Ej10: Ejercicio: Operaciones sobre la instancia
* Ej11: Contenidos: Administración de imágenes
* Ej12: Ejercicio: Subir una imagen de Debian Jessie stable
	* He hecho la prueba y no funciona !!!!!!!!!!!!!!!!!
* Ej13: Ejercicio: Instantáneas
	* Lanzar una instancia e instalarle varios programas (Servidor web??)
	* Crear una instantánea de la instancia
	* Crear una o varias nuevas instancias a partir de la instantánea con otro sabor
* Ej14: Ejercicio: Creación de instantaneas con sistemas actualizados (por ejemplo Ubuntu 14.04) (tarde varios minútos)
	* Actualizar los paquetes en una instancia y crear una instantanea
	* Utilizar esa instantánea para crear instancias con los paquetes actualizados
	* Debian 8 actualizado no vuelve a reiniciar!!!!!!!!!!!!!!!!! (hay que repetirlo, para comprobarlo)
* Ej15: Ejercicio: Redimensionar una instancia (escalado vertical) hacia arriba y hacia abajo
* Ej16: Ejercicio: Copias de seguridad (instantáneas programadas)
* Ej17: Ejercicio: Rescate de instancias
	* Borrar el archivo authorized_keys, no podemos acceder a la instancia.
	* Recuperar la instancia y crear un nuevo fichero authorized_keys
* Ej18: Ejercicio: Instalación de un servidor cache de paquete con approx

