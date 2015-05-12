#!/bin/sh

IP_FLOTANTE=$(nova list|grep pc1|awk '{print $13}')

# Borramos los tres servidores

nova delete pc1
nova delete pc2
nova delete pc3

# Eliminamos las rutas estáticas entre la red2 y a la red3.
neutron subnet-update subred1 --host_routes action=clear
neutron subnet-update subred2 --host_routes action=clear
neutron router-update r2 --routes action=clear
neutron router-update r3 --routes action=clear

# Desconectamos el router r1 de las dos subredes

neutron router-gateway-clear r1
neutron router-interface-delete r1 subred1

# Desconectamos el router r2 de las dos subredes

PORT_ID1=$(neutron port-list |grep 192.168.10.254|awk '{print $2}')
neutron router-interface-delete r2 port=$PORT_ID1
neutron router-interface-delete r2 subred2

# Desconectamos r3 de la red2 y de la red3

PORT_ID2=$(neutron port-list |grep 192.168.20.254|awk '{print $2}')
neutron router-interface-delete r3 port=$PORT_ID2
neutron router-interface-delete r3 subred3

# Borramos los tres routers

neutron router-delete r1
neutron router-delete r2
neutron router-delete r3

# Eliminamos las subredes

neutron subnet-delete subred3
neutron subnet-delete subred2
neutron subnet-delete subred1

# Eliminamos las redes

neutron net-delete red3
neutron net-delete red2
neutron net-delete red1

# Eliminamos la clav e pública

nova keypair-delete clave_demo

# Liberamos la IP flotante

nova floating-ip-delete $IP_FLOTANTE

