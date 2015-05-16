---
layout: blog
tittle: Sesiones online
---

|Fecha|Puntos a tratar|Ponente|
|:---:|----------|--------|
|21 de Mayo| 0,1,2 |Alberto |
|26 de Mayo| 3,4,5,6,7,8,9 |José Domingo  |
|28 de Mayo| 10,11,12,13,14, |  |
|2 de Junio|  |  |
|9 de Junio|  |  |
|11 de Junio|  |  |
|16 de Junio|  |  |
|18 de Junio|  |  |
|23 de Junio|  |  |
|25 de Junio|  |  |

# Puntos

##Cloud Computing y OpenStack

* Punto 0: Presentación y explicación de los objetivos del curso, las secciones en que está dividido y que la dificultad irá creciendo poco a poco.
* Punto 1: Contenidos: Introducción al Cloud Computing
* Punto 2: Contenidos: Introducción a OpenStack

## OpenStack con Cirrusflex

* Punto 3: Contenidos: Introducción a StackOps Cirrusflex
* Punto 4: Contenidos: Conceptos previos
* Punto 5: Ejercicio: Trabajo con claves ssh
	* Explicación de cómo funciona la autentificación ssh con claves ssh
	* Crear un par de claves con frase de paso y utilizar ssh-add
	* Putty?
* Punto 6: Ejercicio: Pasos previos
	* Exportar la clave pública a Cirrusflex
	* Crear una clave en Cirrusflex y guardar la clave privada
	* Introducción a los grupos de seguridad
	* Introducción a la gestión de IP flotantes
* Punto 7: Ejercicio: Crear una instancia desde una imagen Linux y acceder desde fuera
	* Acceso con clave ssh, indicar que una vez que se ha accedido se pueden dar contraseñas a los usuarios y acceder con ellas, aunque es mejor acostumbrarse a utilizar claves RSA y aún mejor si tienen frase de paso.
	* Mientras hacemos la instancia Windows actualizamos los paquetes 
* Punto 8: Ejercicio: Crear una instancia desde una imagen Windows y acceder desde fuera
* Punto 9: Ejercicio: Instalación de Wordpress. Crear dos instancias, montar en una una BBDD y en la otra el servidor web. Abrir sólo el servidor web.
	* Utilizar dos grupos de seguridad, una para cada instancia y abrir sólo los puertos necesarios para cada uno.
	* Acceso a la instancia de BD desde la instancia del servidor web
* Punto 10: Ejercicio: Operaciones sobre la instancia
* Punto 11: Contenidos: Administración de imágenes. Explicar lo que es una imagen, dónde se pueden obtener y las implicaciones de utilizarlas desde un punto de vista de seguridad (si se utilizan imágenes de sistemas para cloud, boxes de vagrant o contenedores docker de imágenes que no podamos verificar que no han sido manipuladas estamos asumiendo un importante riesgo. Todas las distros linux proporcionan imágenes y el mecanismo de creación para que se pueda verificar que el binario no contiene ningún tipo de software añadido).
* Punto 12: Ejercicio: Subir una imagen de Debian Jessie stable
	* Subirla y lanzar una instancia
	* Explicar que es necesario instalar dbus para que funcione el ACPI (es un bug que ya está solucionado pero la imagen oficial todavía no está actualizada). Esto nos dará pie a crear luego una instantánea de esta instancia
* Punto 13: Ejercicio: Instantáneas
	* Explicación de lo que es una instantánea y los tipos que hay
	* Instalar alguna aplicación más en la instancia de jessie
	* Crear una instantánea de la instancia de debian jessie
	* Crear una o varias nuevas instancias a partir de la instantánea con otro sabor
* Punto 14: Ejercicio: Creación de instantaneas con sistemas actualizados (por ejemplo Ubuntu 14.04) (tarde varios minútos)
	* Actualizar los paquetes en una instancia y crear una instantanea
	* Utilizar esa instantánea para crear instancias con los paquetes actualizados
	* Debian 8 actualizado no vuelve a reiniciar!!!!!!!!!!!!!!!!! (hay que repetirlo, para comprobarlo)
* Punto 15: Redimensión
  	* Explicar lo que es la redimensión (escalado vertical) y explicar por qué no se reduce el sistema de ficheros
  	* Ejercicio: Redimensionar una instancia (escalado vertical) hacia arriba y hacia abajo
* Punto 16: Ejercicio: Copias de seguridad (instantáneas programadas)
* Punto 17: Ejercicio: Rescate de instancias
	* Borrar el archivo authorized_keys, no podemos acceder a la instancia.
	* Recuperar la instancia y crear un nuevo fichero authorized_keys
* Punto 18: Ejercicio: Instalación de un servidor cache de paquete con approx

