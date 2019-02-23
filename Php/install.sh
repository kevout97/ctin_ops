#!/bin/bash
echo "Instalación de Mysql....."
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

echo "Instalación de PHP-fpm....."
docker run -d --name php-fpm --link mysql57:mysql57\
    -v /var/containers/nginx/etc/nginx/vhosts/php:/var/www/html:z \
    php:7-fpm

echo "Configuración del PHP-fpm......"
docker exec -d php-fpm bash -c "apt-get update && \
apt-get install -y libmcrypt-dev mysql-client && \
docker-php-ext-install json && \
docker-php-ext-install pdo_mysql && \
docker-php-ext-install pdo"

docker restart php-fpm

echo "Instalación de Nginx...."
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

echo "Instalación Finalizada."