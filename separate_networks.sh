#! /bin/bash

# docker networks
docker network create mysql-network
docker network create mysql-network2

# first enviroment
docker run -d -p 3307:3306 \
    -e MYSQL_ROOT_PASSWORD=password \
    --name mysqldb \
    --net mysql-network \
    mysql

docker run -d -p 8082:80 \
    -e PMA_HOST=mysqldb \
    --name phpmyadmin \
    --net mysql-network \
    phpmyadmin:5.1-apache

# second enviroment
docker run -d -p 3308:3306 \
    -e MYSQL_ROOT_PASSWORD=notroot \
    --name mysqldb2 \
    --net mysql-network2 \
    mysql

docker run -d -p 8083:80 \
    -e PMA_HOST=mysqldb2 \
    --name phpmyadmin2 \
    --net mysql-network2 \
    phpmyadmin:5.1-apache

# interactive mode
docker exec -it phpmyadmin sh
docker exec -it mysqldb mysql -uroot -ppassword
