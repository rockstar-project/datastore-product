## Product Datastore

#### Build Docker Image

```
$ docker build -t $DOCKER_REGISTRY/$DOCKER_NAMESPACE/datastore-product:latest .
```

#### Push Docker Image

```
$ docker push $DOCKER_REGISTRY/$DOCKER_NAMESPACE/datastore-product:latest
```

#### Run Docker Container

```
$ docker run --detach --env MYSQL_ROOT_PASSWORD=rockstar123 --env MYSQL_USER=rockstar --env MYSQL_PASSWORD=rockstar123 --env MYSQL_DATABASE=rockstar_db_product --name productmysql $DOCKER_REGISTRY/$DOCKER_NAMESPACE/datastore-product
$ docker exec -i -t productmysql /bin/bash
```

#### Install Product Schema

```
$ mysql --user=rockstar --password=rockstar123 --database=rockstar_db_product
```

#### Install Seed Data

```
$ mysql --user=rockstar --password=rockstar123 --database=rockstar_db_product < product/seed.sql
```


#### To rebuild image

```
docker stop productmysql && docker rm productmysql
docker rmi $DOCKER_NAMESPACE/datastore-product
```
