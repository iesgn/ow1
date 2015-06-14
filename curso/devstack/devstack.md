---
layout: blog
tittle: Entorno de pruebas con DevStack
menu:
  - Unidades
---

<a href="http://devstack.org/">DevStack</a> es un conjunto de script bash que nos permiten instalar OpenStack de forma automática. Vamos a a utilizarlo para instalar en nuestro ordenador la versión de OpenStack Juno.


<h4 id="requisitos-mnimos">Requisitos mínimos</h4>
<ul>
	<li>Equipo necesario: RAM 2Gb y procesador VT-x/AMD-v</li>
	<li>Ubuntu 14.04 instalado, con los paquetes actualizados.</li>
	<li>Git instalado
<pre><code>  $ sudo apt-get upgrade
  $ sudo apt-get install git
</code></pre>
</li>
</ul>
<h4 id="instalacin">Instalación</h4>
<ol>
	<li>Tenemos que clonar el repositorio git de Devstack, la rama de la versión juno:
<pre><code> $ git clone -b stable/juno https://github.com/openstack-dev/devstack.git
 $ cd devstack 
</code></pre>
</li>
	<li>A continuación tenemos que configurar la instalación de OpenStack, para ello creamos un  archivo local.conf y lo guardamos en el directorio devstack, con el siguiente contenido:
<pre><code>[[local|localrc]]
# Default passwords
ADMIN_PASSWORD=devstack
MYSQL_PASSWORD=devstack
RABBIT_PASSWORD=devstack
SERVICE_PASSWORD=devstack
SERVICE_TOKEN=devstack
RECLONE=yes

SCREEN_LOGDIR=/opt/stack/logs
disable_service n-net
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta
enable_service neutron
enable_service q-lbaas
disable_service tempest
enable_service s-proxy s-object s-container s-account
SWIFT_HASH=66a3d6b56c1f479c8b4e70ab5c2000f5
</code></pre>
</li>
	<li>Y ya podemos comenzar la instalación:
<pre><code> ~/devstack$./stack.sh</code></pre>
</li>
	<li>Una vez terminada la instalación, para acceder a la aplicación web Horizon:
<ul>
	<li>Accedemos a la URL <em>http://localhost</em>.</li>
	<li>Usuario de prueba: <strong>demo</strong> con contraseña <strong>devstack</strong>.</li>
	<li>Usuario de administración: <strong>admin</strong> con contraseña <strong>devstack</strong>.</li>
	<li>El usuario <strong>demo</strong> debe trabajar en el proyecto <em>“demo”</em>, no en uno que se llama <em>“invisible_to_admin”</em>.</li>
</ul>
</li>
	<li>Estamos trabajando en un entorno de pruebas, por lo tento si terminamos de trabajar con Openstack y apagamos el ordenador, la próxima vez que queramos trabajar con él los servicios no estarán arrancados. Por lo tanto si queremos seguir trabajando con la sesión anterior, tendremos que ejecutar la siguiente instrucción:
<pre><code> $ cd devstack
 ~/devstack$ ./rejoin-stack.sh
</code></pre>
Si comprobamos que no funciona bien, tendremos que volver a instalar devstack (aunque esta segunda vez la instalación será mucho más rápida) aunque perderemos todos los cambios realizados (instancias, imágenes, grupos de seguridad,…):
<pre><code> $ cd devstack
 ~/devstack$ ./stack.sh
</code></pre>
</li>
</ol>
<h4> Accediendo a OpenStack</h4>
Abrimos un navegador y accedemos a <em>localhost</em>:

<a class="thumbnail" href="http://www.josedomingo.org/pledin/wp-content/uploads/2014/10/intro.png"><img class="aligncenter wp-image-1048 size-medium" src="http://www.josedomingo.org/pledin/wp-content/uploads/2014/10/intro-233x300.png" alt="intro" width="233" height="300" /></a>

En las próximas entradas iremos viendo los distintos conceptos relacionados con OpenStack y algunas prácticas para que veamos cómo funciona.