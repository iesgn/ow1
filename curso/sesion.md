---
layout: blog
tittle: Sesiones online
---

|Fecha|Puntos a tratar|Ponente|
|:---:|----------|--------|
|21 de Mayo| 0,1,2 |Alberto |
|26 de Mayo| 3,4,5,6,7,8,9 |José Domingo  |
|28 de Mayo| 10,11,12,13,14 | Alberto |
|2 de Junio| 15,16,17,18,19 | Alberto |
|9 de Junio| 20,21,22,23 | José Domingo |
|11 de Junio|24,25,26,27,28,29,30,31  | José Domingo |
|16 de Junio|32,33,34,35,36,37,38 | Alberto |
|18 de Junio|39,40,41  | José Domingo |
|23 de Junio|42,43,44  | José Domingo |
|25 de Junio|45,46,47  | Alberto |

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
	* Actualizar
	* Crear una instantánea de la instancia de debian jessie
	* Crear una o varias nuevas instancias a partir de la instantánea con otro sabor
* Punto 14: Ejercicio: Modificar el control de acceso de una instantánea dando acceso a todos los proyectos del curso
* Punto 15: Redimensión
	* Explicar lo que es la redimensión (escalado vertical) y explicar por qué no se reduce el sistema de ficheros
	* Ejercicio: Redimensionar una instancia (escalado vertical) hacia arriba y hacia abajo
	* Explicar que al utilizar un sabor más pequeño el disco no se reduce
* Punto 16: Ejercicio: Copias de seguridad (instantáneas programadas)
* Punto 17: Ejercicio: Rescate de instancias
	* Borrar el archivo authorized_keys, no podemos acceder a la instancia.
	* Recuperar la instancia y crear un nuevo fichero authorized_keys
* Punto 18: Contenidos: Conceptos previos de volúmenes
* Punto 19: Ejercicio: Crear un volumen y asociación a una instancia
	* Formateo y particionado en XFS. Instalar xfsprogs
	* Formateo y particionado en NTFS
	* Desasociar el volumen NTFS y asociarlo a una instancia windows
	* Desasociar el volumen XFS y asociarlo a una instancia linux
* Punto 20: Ejercicio: Puntos de montaje permanentes y montaje en el arranque definiendo el fstab
* Punto 21: Ejercicio: Crear una instancia con el sistema raiz en un volumen
	* Terminar la instancia e instanciar una nueva
* Punto 22: Ejercicio: Crear una nueva imagen desde un volumen con sistema operativo
* Punto 23: Ejercicio: Instalación de owncloud

* Punto 24: Contenidos: Conceptos previos de redes
* Punto 25: Ejercicio: Estudiar la configuración de la red por defecto de nuestro proyecto
	* Ver la red y subred definidas
	* Ver el router que tiene nuestro proyecto
	* Ver los puertos
* Punto 26: Ejercicio 1 de red: dos redes privadas con dos routers:
	* Creación de dos redes internas y sus subredes
	* Creación de dos routers conectandos a la red externa
	* Creación de dos instancias en cada una de lass redes
	* Asignación de ip flotantes
	* Comprobación de que no hay conectividad entre las instancias usando las ip fijas.
* Punto 27: Ejercicio: Eliminación de la infraestructura de red creada
* Punto 28: Ejercicio: Instancias con varias interfaces de red
* Punto 29: Ejercicio 2 de red: dos redes privadas conectadas a un sólo router.
* Punto 30: Ejercicio: Instalador de un DNS local
* Punto 31: Ejercicio: Balanceador de carga
  	* Explicar lo que es un balanceador de carga y la implementación en OpenStack
* Punto 32: Ejercicio: Creación de un servidor VPN

* Punto 33: Contenido: Concepto previo de CLI
* Punto 34: Ejercicio: Instalación de los clientes
* Punto 35: Ejercicio: Gestión de instancias con nova
* Punto 36: Ejercicio: Gestión de volúmenes con nova
* Punto 37: Ejercicio: Gestión de redes con neutron

* Punto 38: Contenido: Introducción a la virtualización de redes
* Punto 39: Ejercicio: Ejercicio avanzado con redes: Dos redes internas conectar por un router intermedio
	* Creación de la red y el router
	* Añadir una nueva interfaz al router
	* Añadir las rutas de encaminamiento
	* Creación de instancias en las redes
	* Asignación de IP flotante a la segunda instancia
	* Accediendo a la segunda instancia
	* Añadir reglas de encaminamiento al router
* Punto 40: Ejercicio: Utilizar una máquina Linux como router
* Punto 41: Balanceador con CLI
* Punto 42: Ejercicios:
  	* Creación de un entorno con bash paso a paso
	* Mostrar el ejemplo demo.sh
	* Mostrar el demo-inv.sh
* Punto 43: Ejercicios:
  	* Python
* Punto 44: Ejercicio de ansible

* Punto 45: Repaso de OpenStack. Arquitectura
* Punto 46: Uso de OpenStack
* Punto 47: Modos de instalación



