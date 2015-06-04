---
layout: blog
tittle: Gestión de volúmenes con nova
menu:
  - Unidades
---

### Asociación de un volumen a una instancia

En esta demostración vamos a crear un volumen y lo vamos a asociar a
la instancia que hemos creado en la demostración anterior. Veamos los
pasos: 

1. Vamos a crear un volumen de 1 GiB:

        nova volume-create 1 --display-name disco1
		+---------------------+--------------------------------------+
		| Property            | Value                                |
		+---------------------+--------------------------------------+
		| attachments         | []                                   |
		| availability_zone   | nova                                 |
		| bootable            | false                                |
		| created_at          | 2015-04-22T12:24:01.861077           |
		| display_description | -                                    |
		| display_name        | disco1                               |
		| id                  | b4da8031-6748-49ee-a02a-47df9980d6b7 |
		| metadata            | {}                                   |
		| size                | 1                                    |
		| snapshot_id         | -                                    |
		| source_volid        | -                                    |
		| status              | creating                             |
		| volume_type         | None                                 |
		+---------------------+--------------------------------------+

    Es curioso observar que desde la aplicación web sólo se permiten crear
	volúmenes mayores de 16 GiB, mientras que desde la línea de comandos
	podemos elegir cualquier tamaño mayor de 1 GiB, por tanto la
	restricción no viene impuesta por el sistema de volúmenes de
	Cirrusflex, sino por la propia aplicación web.

2. A continuación vamos a asociarlo a nuestra instancia:

        nova volume-attach instancia_nova \
		b4da8031-6748-49ee-a02a-47df9980d6b7 /dev/vdb
		+----------+--------------------------------------+
		| Property | Value                                |
		+----------+--------------------------------------+
		| device   | /dev/vdb                             |
		| id       | b4da8031-6748-49ee-a02a-47df9980d6b7 |
		| serverId | b6fc4b18-8c24-4099-b97e-8d5e799982a8 |
		| volumeId | b4da8031-6748-49ee-a02a-47df9980d6b7 |
		+----------+--------------------------------------+

3. Comprobamos que el volumen aparece asociado a la instancia:

        nova volume-list
		+--------------------------------------+--------+--------------+------+-------------+--------------------------------------+
		| ID                                   | Status | Display Name | Size | Volume Type | Attached to                          |
		+--------------------------------------+--------+--------------+------+-------------+--------------------------------------+
		| b4da8031-6748-49ee-a02a-47df9980d6b7 | in-use | disco1       | 1    | None        | b6fc4b18-8c24-4099-b97e-8d5e799982a8 |
		+--------------------------------------+--------+--------------+------+-------------+--------------------------------------+

    Y podemos acceder a la instancia y comprobarlo con lsblk o fdisk.
    
### Creación de una instancia con el disco raíz sobre un volumen.

1. Visualizamos la lista de imágenes y de sabores que tenemos en 
nuestro sistema: 

    nova image-list
    nova flavor-list

2. Creamos un volumen *arrancable* de 8 GiB que contenga la imagen:

        nova volume-create 8 \
		--image-id 44288012-b805-455f-a21f-74ab36c46362 \
		--display-name mi_disco
		+---------------------+--------------------------------------+
		| Property            | Value                                |
		+---------------------+--------------------------------------+
		| attachments         | []                                   |
		| availability_zone   | nova                                 |
		| bootable            | false                                |
		| created_at          | 2015-04-20T10:40:57.964980           |
		| display_description | -                                    |
		| display_name        | mi_disco                             |
		| id                  | 45f71394-2699-4c86-80da-cf8490f5a6c5 |
		| image_id            | 44288012-b805-455f-a21f-74ab36c46362 |
		| metadata            | {}                                   |
		| size                | 8                                    |
		| snapshot_id         | -                                    |
		| source_volid        | -                                    |
		| status              | creating                             |
		| volume_type         | None                                 |
		+---------------------+--------------------------------------+

    Aunque inicialmente al crearse el volumen nos muestra el parámetro *booteable* con el valor *false*, una vez se ha terminado de crear podemos comprobar que OpenStack reconoce el volumen como arrancable al contener un sistema operativo:

        nova volume-show 45f71394-2699-4c86-80da-cf8490f5a6c5
		+-----------------------+----------------------------------------+
		| Property              | Value                                  |
		+-----------------------+----------------------------------------+
		| attachments           | []                                     |
		| availability_zone     | nova                                   |
		| bootable              | true                                   |
		...
		+-----------------------+----------------------------------------+
      
3. Creamos una nueva instancia con este volumen

        nova boot --flavor ssd.XXXS \
		--boot-volume 45f71394-2699-4c86-80da-cf8490f5a6c5 \
		--security-groups default \
		--key-name mi_clave \
		--nic net-id=d5d686b5-32fb-4e45-8809-98df3ee5ef3e \
		instancia_nova
		+--------------------------------------+----------------------------------------------------------+
		| Property                             | Value                                                    |
		+--------------------------------------+----------------------------------------------------------+
		| OS-DCF:diskConfig                    | MANUAL                                                   |
		| OS-EXT-AZ:availability_zone          | nova                                                     |
		| OS-EXT-STS:power_state               | 0                                                        |
		| OS-EXT-STS:task_state                | spawning                                                 |
		| OS-EXT-STS:vm_state                  | building                                                 |
		| OS-SRV-USG:launched_at               | -                                                        |
		| OS-SRV-USG:terminated_at             | -                                                        |
		| accessIPv4                           |                                                          |
		| accessIPv6                           |                                                          |
		| adminPass                            | 2zdcUn4oCCKJ                                             |
		| config_drive                         |                                                          |
		| created                              | 2015-04-20T10:45:46Z                                     |
		| flavor                               | ssd.XXXS (20)                                            |
		| hostId                               | 962db8c7b201499f39eeea5cb2c88d73cae9931aa8703e1d3e2c8027 |
		| id                                   | c2b2c650-2f83-4c3e-b964-ebb916bf7e88                     |
		| image                                | Attempt to boot from volume - no image supplied          |
		| key_name                             | mi_clave                                                 |
		| metadata                             | {}                                                       |
		| name                                 | instancia_nova                                           |
		| os-extended-volumes:volumes_attached | [{"id": "45f71394-2699-4c86-80da-cf8490f5a6c5"}]         |
		| progress                             | 0                                                        |
		| security_groups                      | default                                                  |
		| status                               | BUILD                                                    |
		| tenant_id                            | 44f5cb63ad34481aab5cc9c2809e4a76                         |
		| updated                              | 2015-04-20T10:45:49Z                                     |
		| user_id                              | 7a15970a225d41babb750da8a6f5e8d2                         |
		+--------------------------------------+----------------------------------------------------------+

### Resumen de comandos

    # Listar volúmenes
    nova volume-list		

    # Crear un volumen
    nova volume-create SIZE --display-name NOMBRE 

    # Asociar un volumen a una instancia
    nova volume-attach SERVIDOR_ID VOLUMEN_ID DISPOSITIVO		

    # Desasociar un volumen de una instancia
    nova volume-detach SERVIDOR_ID VOLUMEN_ID		

    # Crear un volumen a partir de una imagen
    nova volume-create SIZE --image-id IMAGEN_ID --display-name NOMBRE

    # Crear una instantánea de volumen
	nova volume-snapshot-create --display-name SNAPSHOT_NAME VOLUMEN_NAME


### Utilizando del cliente cinder

	# Listar volúmenes
	cinder list

	# Crear un volumen
    cinder create SIZE --display-name NOMBRE 

    # Información sobre el volumen
    cinder show NOMBRE

    # Crear un volumen a partir de una imagen
    cinder create SIZE --image-id IMAGEN_ID --display-name NOMBRE

    # Crear una instantánea de volumen
	cinder snapshot-create --display-name SNAPSHOT_NAME VOLUMEN_NAME

	# Extender el tamaño del volumen
	cinder extend ID_VOLUME NEW_SIZE