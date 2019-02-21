# Despliegue de Nginx, Php-fpm y Mysql
## Mysql
Para la implementación de Mysql utilizaremos el siguiente script:

```bash
#!/bin/bash
#######################################################################
#                         RUN MYSQL CONTAINER                         #
#######################################################################

MYSQL_INSTANCE_NAME=mysql57

mkdir /var/containers/${MYSQL_INSTANCE_NAME}/{var/log/mysql,var/lib/mysql,var/backups/ejecucionesscript,etc/mysql,tmp} -p
chmod 777 -R /var/containers/${MYSQL_INSTANCE_NAME}/tmp
docker run -td  -v /var/containers/${MYSQL_INSTANCE_NAME}/var/log/mysql/:/var/log/mysql/:z \
                -v /var/containers/${MYSQL_INSTANCE_NAME}/var/lib/mysql/:/var/lib/mysql/:z \
                -v /var/containers/${MYSQL_INSTANCE_NAME}/etc/mysql/:/etc/mysql/:z \
                -v /var/containers/${MYSQL_INSTANCE_NAME}/var/backups/ejecucionesscript/:/var/backups/ejecucionesscript/:z \
                -v /var/containers/${MYSQL_INSTANCE_NAME}/tmp:/tmp/:z \
                --hostname=${MYSQL_INSTANCE_NAME}.service \
                --ulimit nofile=10240:10240 \
                --ulimit nproc=2000:2000 \
                -e TZ=America/Mexico_City \
                -v /etc/localtime:/etc/localtime:ro \
                -e 'MYSQL_ROOT_PASSWORD=3KfIhp3UDC' \
                --name=${MYSQL_INSTANCE_NAME} \
                mysql:5.7
```
En el script anterior es importante especificar la contraseña del usuario root de Mysql con la variable de entorno **MYSQL_ROOT_PASSWORD**.

## Php-fpm
A continuación haremos el despliegue del contenedor con Php-fpm, para ello ejecutamos el siguiente comando:

```bash
docker run -d --name php-fpm --link mysql57:mysql57\
    -v /var/containers/nginx/etc/nginx/vhosts/php:/var/www/html:z \
    php:7-fpm
```
Para llevar acabo la integración con Mysql, dentro del contenedor de PHP necesitamos añadir los paquetes **pdo_mysql** y **pdo**.

Para ello ejecutamos **(dentro del contenedor)**:

```bash
apt-get update && \
apt-get install -y libmcrypt-dev mysql-client && \
docker-php-ext-install json && \
docker-php-ext-install pdo_mysql && \
docker-php-ext-install pdo
```
Para hacer efectivos los cambios, reiniciamos el contenedor de Php con la siguiente instrucción:

```bash
docker restart php-fpm
```

## Nginx
Una vez desplegado el contendor de Php-fmp procedemos a desplegar el contenedor de Nginx a tráves de:

```bash
docker run -td --name=nginx --privileged=false -p 80:80 -p 443:443 \
    --link php-fpm:php-fpm \
    --volume=/var/containers/shared/var/www/sites:/var/www/sites:z \
    --volume=/var/containers/nginx/var/log/nginx:/var/log/nginx:z \
    --volume=/var/containers/nginx/etc/nginx/vhosts:/etc/nginx/vhosts:z \
    --volume=/var/containers/nginx/etc/nginx/keys:/etc/nginx/keys:z \
    --volume=/var/containers/nginx/etc/nginx/conf.d:/etc/nginx/conf.d:z \
    --volume=/var/containers/nginx/var/cache/nginx:/var/cache/nginx:z  \
    --volume=/var/containers/nginx/var/backups:/var/backups:z \
    --volume=/etc/localtime:/etc/localtime:ro \
    --hostname=nginx.service \
    docker.io/berryrreb/nginxmodsec
```
La conexión entre ambos contenedores se lleva a tráves del archivo de configuración con el cual se exponen tanto páginas como servicios en Nginx.
Para el despliegue anterior el archivo de configuración que expone una página php es el siguiente:

*Las siguientes configuraciones son desarrolladas desde el host, **NO** dentro del contenedor.*

**/var/containers/nginx/etc/nginx/vhosts/example.conf**

```conf
server {
    listen 80;
    index index.php index.html;
    server_name ejemplo.com;
    root /etc/nginx/vhosts/php;

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php-fpm:9000;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /var/www/html$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
```
**NOTA**: La linea `fastcgi_param SCRIPT_FILENAME /var/www/html$fastcgi_script_name;` especifica la ruta donde estarán almacenados los archivos php (dentro del contenedor).

Tras cada cambio hecho en archivos de configuración correspondientes a Nginx es necesario ejecutar el siguiente comando, con la finalidad de hacer dichos cambios efectivos:

```bash
docker exec -it nginx bash -c "nginx -s reload"
```

Es necesario señalar que todos los archivos **.php** deberán ubicarse en **/var/containers/nginx/etc/nginx/vhosts/php**.
Un ejemplo seria el siguiente:

**/var/containers/nginx/etc/nginx/vhosts/php/example.php**
```php
<?php
	echo phpinfo();
?>
```