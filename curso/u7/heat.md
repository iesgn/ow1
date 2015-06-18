---
layout: blog
tittle: Introducción a heat
menu:
  - Unidades
---

Heat es el componente de Openstack encargado de la orquestación. Mediante un template podemos automatizar el despliegue de un escenario formado por distintos recursos (instancias, volúmenes, redes, routers, ...) y establecer las realciones entre ellos.

La sintaxis estándar de los templates llamada HOT usa el lenguaje YAML, aunque también podríamos utilizar la sintaxis en JSON. 

### Estructura de un template

Pongamos un ejemplo sencillo:

		heat_template_version: 2013-05-23		

		description: Simple template to deploy a single compute instance
		parameters:
		  network:
		    type: string
		    description: Nombre de la red a utilizar
		    default: red_por_defecto		

		resources:
		  my_instance:
		    type: OS::Nova::Server
		    properties:
		      key_name: clave_ssh
		      image: Debian Jessie (stable)
		      flavor: m1.small
		      networks: [{get_param: network}]		

		outputs:
		  instance_ip:
			  description: IP address of the instance
			  value: { get_attr: [my_instance, first_address] }




* Versión del template: Aquí se indica la versión del template utilizado. Por ejemplo la 2013-05-23, corresponde a un template para ejecutarse en la versión OpenStack Icehouse o superiores, 2014-10-16, son templates que se pueden ejecutar en la versión OpenStack Juno o superior y , por último, 2015-04-30, sólo se pueden ejecutar en la versión OpenStack Kilo.
* Se indica la descripción del template.
* Parámetros (parameters): En esta sección declaramos los parámetros de entrada para el template, que serán proporcionados al lanzar el mismo. Estos parámetros pueden ser por ejemplo el sabor de una instancia, el nombre de la misma o cualquier parámetro que vayamos a usar en la construcción del escenario.
* Recursos (resources): En esta sección declaramos los recursos que vamos a crear, como por ejemplo una instancia, una ip, un volumen.... Puedes ver la lista de recursos en [http://docs.openstack.org/developer/heat/template_guide/openstack.html](http://docs.openstack.org/developer/heat/template_guide/openstack.html).
* Salida (outputs):Una vez que el template ha sido ejecutado, en esta sección indicamos la información que queremos mostrar al usuario. Esta sección es opcional.

En el ejemplo anterior el usuario tiene que indicar como parámetro la red a la que se va a conectar la instancia. Vamos a crear un recurso que es una instancia con unas características indicadas en el template y por último vamos a mostrar al usuario la dirección IP de la instancia.

