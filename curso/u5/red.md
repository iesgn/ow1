---
layout: blog
tittle: Gestión de redes con neutron
menu:
  - Unidades
---

En la última demostración vamos a crear una nueva red, un nuevo router
y una instancia conectada a esta nueva red. Será necesario tener
instalado el cliente *python-neutronclient* como se explica en la
sección de conceptos previos. Veamos los pasos que tenemos que seguir: 

1. Vemos las redes, subredes y routers que tenemos en nuestro
proyecto:

        neutron net-list
		+--------------------------------------+--------------+-----------------------------------------------------+
		| id                                   | name         | subnets                                             |
		+--------------------------------------+--------------+-----------------------------------------------------+
		| d15e0eb6-c892-4717-8be1-b3e85795e8c9 | ext-net      | c80b173f-c203-4e63-956a-ed7351a5a073 185.45.72.0/23 |
		| d5d686b5-32fb-4e45-8809-98df3ee5ef3e | 00000061-net | 4751dc7e-6b54-4284-ba02-6c1a44deb076 10.0.15.64/26  |
		+--------------------------------------+--------------+-----------------------------------------------------+

        neutron subnet-list
		+--------------------------------------+-----------------+----------------+---------------------------------------------------+
		| id                                   | name            | cidr           | allocation_pools                                  |
		+--------------------------------------+-----------------+----------------+---------------------------------------------------+
		| 4751dc7e-6b54-4284-ba02-6c1a44deb076 | 00000061-subnet | 10.0.15.64/26  | {"start": "10.0.15.66", "end": "10.0.15.126"}     |
		| c80b173f-c203-4e63-956a-ed7351a5a073 | ext-net         | 185.45.72.0/23 | {"start": "185.45.72.17", "end": "185.45.73.254"} |
		+--------------------------------------+-----------------+----------------+---------------------------------------------------+

        neutron router-list
		+--------------------------------------+---------------------+-----------------------------------------------------------------------------+
		| id                                   | name                | external_gateway_info                                                       |
		+--------------------------------------+---------------------+-----------------------------------------------------------------------------+
		| d377a1cf-e78b-472f-8235-197c107b9e5d | 00000061-ext-router | {"network_id": "d15e0eb6-c892-4717-8be1-b3e85795e8c9", "enable_snat": true} |
		+--------------------------------------+---------------------+-----------------------------------------------------------------------------+

2. Creamos una red de nombre *mi_red* con una subred asociada con el direccionamiento 192.168.0.0/24:

        neutron net-create mi_red
		Created a new network:
		+----------------+--------------------------------------+
		| Field          | Value                                |
		+----------------+--------------------------------------+
		| admin_state_up | True                                 |
		| id             | 44925468-3181-490e-8d81-6c1012aba2e8 |
		| name           | mi_red                               |
		| shared         | False                                |
		| status         | ACTIVE                               |
		| subnets        |                                      |
		| tenant_id      | 44f5cb63ad34481aab5cc9c2809e4a76     |
		+----------------+--------------------------------------+

        neutron subnet-create mi_red 192.168.0.0/24 --name mi_subred
		Created a new subnet:
		+------------------+--------------------------------------------------+
		| Field            | Value                                            |
		+------------------+--------------------------------------------------+
		| allocation_pools | {"start": "192.168.0.2", "end": "192.168.0.254"} |
		| cidr             | 192.168.0.0/24                                   |
		| dns_nameservers  |                                                  |
		| enable_dhcp      | True                                             |
		| gateway_ip       | 192.168.0.1                                      |
		| host_routes      |                                                  |
		| id               | e0e4b108-ac13-4827-86fd-a8ea325057cc             |
		| ip_version       | 4                                                |
		| name             |                                                  |
		| network_id       | 44925468-3181-490e-8d81-6c1012aba2e8             |
		| tenant_id        | 44f5cb63ad34481aab5cc9c2809e4a76                 |
		+------------------+--------------------------------------------------+

3. Creamos un nuevo router (*mi_router*), que vamos a conectar con la
red externa y con la subred anteriormente creada:

        neutron router-create mi_router
		Created a new router:
		+-----------------------+--------------------------------------+
		| Field                 | Value                                |
		+-----------------------+--------------------------------------+
		| admin_state_up        | True                                 |
		| external_gateway_info |                                      |
		| id                    | 4e179266-06b1-46d4-a0f7-f3e2f06bc7d3 |
		| name                  | mi_router                            |
		| status                | ACTIVE                               |
		| tenant_id             | 44f5cb63ad34481aab5cc9c2809e4a76     |
		+-----------------------+--------------------------------------+

	Coenctamos el router a la red externa:

        neutron router-gateway-set mi_router ext-net
		
    Conectamos el router a la red:

        neutron router-interface-add mi_router mi_subred

    Para listar los puertos:

		neutron port-list

4. Creamos una nueva instancia conectada a la nueva red y le asignamos
una ip pública.

        nova boot --flavor ssd.XXXS \
		--image 44288012-b805-455f-a21f-74ab36c46362 \
		--security-groups gr_seguridad \
		--key-name clave_acceso \
		--nic net-id=44925468-3181-490e-8d81-6c1012aba2e8 \
		otra_instancia
		+--------------------------------------+---------------------------------------------------------------------------------+
		| Property                             | Value                                                                           |
		+--------------------------------------+---------------------------------------------------------------------------------+
		| OS-DCF:diskConfig                    | MANUAL                                                                          |
		| OS-EXT-AZ:availability_zone          | nova                                                                            |
		| OS-EXT-STS:power_state               | 0                                                                               |
		| OS-EXT-STS:task_state                | scheduling                                                                      |
		| OS-EXT-STS:vm_state                  | building                                                                        |
		| OS-SRV-USG:launched_at               | -                                                                               |
		| OS-SRV-USG:terminated_at             | -                                                                               |
		| accessIPv4                           |                                                                                 |
		| accessIPv6                           |                                                                                 |
		| adminPass                            | iwWBVxtYcv4R                                                                    |
		| config_drive                         |                                                                                 |
		| created                              | 2014-10-23T08:15:15Z                                                            |
		| flavor                               | ssd.XXXS (20)                                                                   |
		| hostId                               |                                                                                 |
		| id                                   | ae5a8cea-2c6c-4666-a02b-1d246d97caa5                                            |
		| image                                | Ubuntu 14.04 LTS - Trusty Tahr - 64 bits (44288012-b805-455f-a21f-74ab36c46362) |
		| key_name                             | clave_acceso                                                                    |
		| metadata                             | {}                                                                              |
		| name                                 | otra_instancia                                                                  |
		| os-extended-volumes:volumes_attached | []                                                                              |
		| progress                             | 0                                                                               |
		| security_groups                      | gr_seguridad                                                                    |
		| status                               | BUILD                                                                           |
		| tenant_id                            | 44f5cb63ad34481aab5cc9c2809e4a76                                                |
		| updated                              | 2014-10-23T08:15:16Z                                                            |
		| user_id                              | 7a15970a225d41babb750da8a6f5e8d2                                                |
		+--------------------------------------+---------------------------------------------------------------------------------+

        nova show otra_instancia
		+--------------------------------------+---------------------------------------------------------------------------------+
		| Property                             | Value                                                                           |
		+--------------------------------------+---------------------------------------------------------------------------------+
		| OS-DCF:diskConfig                    | MANUAL                                                                          |
		| OS-EXT-AZ:availability_zone          | nova                                                                            |
		| OS-EXT-STS:power_state               | 1                                                                               |
		| OS-EXT-STS:task_state                | -                                                                               |
		| OS-EXT-STS:vm_state                  | active                                                                          |
		| OS-SRV-USG:launched_at               | 2014-10-23T08:15:25.000000                                                      |
		| OS-SRV-USG:terminated_at             | -                                                                               |
		| accessIPv4                           |                                                                                 |
		| accessIPv6                           |                                                                                 |
		| config_drive                         |                                                                                 |
		| created                              | 2014-10-23T08:15:15Z                                                            |
		| flavor                               | ssd.XXXS (20)                                                                   |
		| hostId                               | 962db8c7b201499f39eeea5cb2c88d73cae9931aa8703e1d3e2c8027                        |
		| id                                   | ae5a8cea-2c6c-4666-a02b-1d246d97caa5                                            |
		| image                                | Ubuntu 14.04 LTS - Trusty Tahr - 64 bits (44288012-b805-455f-a21f-74ab36c46362) |
		| key_name                             | clave_acceso                                                                    |
		| metadata                             | {}                                                                              |
		| mi_red network                       | 192.168.0.2                                                                     |
		| name                                 | otra_instancia                                                                  |
		| os-extended-volumes:volumes_attached | []                                                                              |
		| progress                             | 0                                                                               |
		| security_groups                      | gr_seguridad                                                                    |
		| status                               | ACTIVE                                                                          |
		| tenant_id                            | 44f5cb63ad34481aab5cc9c2809e4a76                                                |
		| updated                              | 2014-10-23T08:15:25Z                                                            |
		| user_id                              | 7a15970a225d41babb750da8a6f5e8d2                                                |
		+--------------------------------------+---------------------------------------------------------------------------------+

        nova floating-ip-create ext-net
		+-------------+-----------+----------+---------+
		| Ip          | Server Id | Fixed Ip | Pool    |
		+-------------+-----------+----------+---------+
		| 185.45.73.4 | -         | -        | ext-net |
		+-------------+-----------+----------+---------+
 
        nova floating-ip-associate otra_instancia 185.45.73.4
