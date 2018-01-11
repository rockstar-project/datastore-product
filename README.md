## Product Datastore

#### Build Docker Image

```
docker build -t $DOCKER_NAMESPACE/datastore-product:latest .
```

#### Push Docker Image

```
docker push $DOCKER_NAMESPACE/datastore-product:latest
```

#### Run Docker Container

```
docker-compose up -d productmysql
```

#### Login Product Database

```
docker-compose exec productmysql /bin/bash
mysql --user=rockstar --password=rockstar123 --database=rockstar_db_product
```

#### Upload Product data

```
cd data
```

#### To rebuild image

```
docker-compose stop productmysql && docker-compose rm productmysql
docker rmi $DOCKER_NAMESPACE/datastore-product
```
