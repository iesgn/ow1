---
layout: blog
tittle: Introduccióna a swift
menu:
  - Unidades
---

Swift es el componente de OpenStack que nos permite la gestión de objetos. Un objeto es el elemento que se almacena, suele estar relacionado con un fichero o archivo, pero además incluye una serie de metadatos. Los objetos se guardan en contenedores. 

1. Creando y trabajando con un contenedor

		$ swift upload contenedor index.md
		$ swift upload contenedor/carpeta README.md

Para listar todos los contenedores:

		$ swift list
		contenedor

Para listar los objetos de un contenedor

		$ swift list contenedor
		carpeta
		carpeta/README.md
		index.md

Puede obtener información de un contenedor o un objeto:

		$ swift stat contenedor
         		Account: AUTH_1a0b324cc09c40c79286fc1bc63c5833
		       Container: contenedor
		         Objects: 3
		           Bytes: 3618
		        Read ACL:
		       Write ACL:
		         Sync To:
		        Sync Key:
		   Accept-Ranges: bytes
		X-Storage-Policy: Policy-0
		     X-Timestamp: 1433843722.27624
		      X-Trans-Id: tx3a942288b55f4c3f9e97c-005576babf
		    Content-Type: text/plain; charset=utf-8

		    $ swift stat contenedor index.md
		           Account: AUTH_1a0b324cc09c40c79286fc1bc63c5833
		         Container: contenedor
		            Object: index.md
		      Content Type: application/octet-stream
		    Content Length: 3550
		     Last Modified: Tue, 09 Jun 2015 09:55:34 GMT
		              ETag: 371eb5a56b50a25a534903970de5416e
		        Meta Mtime: 1433838649.101051
		     Accept-Ranges: bytes
		       X-Timestamp: 1433843733.91442
		        X-Trans-Id: txcfb4dd594dad4cdcaaa8a-005576baed


2. Descargar un objeto

		swift download contenedor index.md
		index.md [auth 0.393s, headers 0.570s, total 0.570s, 0.020 MB/s]

3. Acceder a un objeto

Por ejemplo si subimos una imagen:

		$ swift upload contenedor entrada.png 

Podemos acceder desde un navegador a dicha imagen, utilizando el endpoint de swift, e indicando contenedor t objeto, en este caso sería:

		https://swift-mm1.mascloud.es/v1.0/AUTH_1a0b324cc09c40c79286fc1bc63c5833/contenedor/entrada.png

Para que se accesible la imagen tenemos que dar permiso de lectura al contenedor, por medio de una ACL:

		$ ift post -r '.r:*' contenedor


4. Borrar un conetenedor

		$ swift delete contenedor
