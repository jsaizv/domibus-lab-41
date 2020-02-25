# Laboratorio de Domibus 4.1

Este laboratorio consta de 2 máquinas virtuales de CentOS 8:

 - origen - Se encargara de simular el envío de los datos. 
 - destino - Se encargará de la recepción.

## Pre-requisitos 📋

 - VirtualBox.
 - Vagrant.

## Despliegue 🔧

### Ejecución

Desde la CMD:

```
$ cd (carpeta del laboratorio)
$ vagrant up
```

### origen

Se desplegará un box de CentOS 8 y se le asignará la IP 10.0.0.2 de la red interna. Una vez arrancado el servidor se ejecutará el script de provisión.

Dicho script instalará la versión completa del Domibus para Tomcat, el Oracle JRE 8 update 241, el MySQL 8.0.17, el connector Java para MySQL y el almacén de certificados.

### destino

Se desplegará un box de CentOS 8 y se le asignará la IP 10.0.0.3 de la red interna. Una vez arrancado el servidor se ejecutará el script de provisión.

Dicho script instalará la versión completa del Domibus para Tomcat, el Oracle JRE 8 update 241, el MySQL 8.0.17, el connector Java para MySQL y el almacén de certificados.

## Tests ⚙️

Para conectarnos a los servidores desde la CMD:

```
$ cd (carpeta del laboratorio)
$ vagrant ssh (nombre del servidor)
```

Para la comprobación del funcionamiento, nos conectaremos a los Domibus de los servidores. Para ello nos conectaremos a las siguientes URL:

http://localhost:8081/domibus/ - Para origen.
http://localhost:8082/domibus/ - Para destino.

Las credenciales son "admin:123456".

## Referencias 📄

https://ec.europa.eu/cefdigital/wiki/download/attachments/195692047/%28CEFeDelivery%29.%28AccessPoint%29.%28Test%20Guide%29.%28v1.06%29.pdf?version=1&modificationDate=1580895146053&api=v2

## Autores ✒️

* **Javier Saiz Villares** - [EDNON S.L](javier.saiz@ednon.es)