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

```

delete from PRODUCT;
delete from MEDIA_ITEM;
delete from OPTION_ITEM;
delete from ATTRIBUTE;

select id from PRODUCT where featured=true and state="publish";

delete from PRODUCT where id="2b5fc0d0-01d2-43e9-8397-f3a1a50d80b9";
delete from OPTION_ITEM where product_id="2b5fc0d0-01d2-43e9-8397-f3a1a50d80b9";
delete from ATTRIBUTE where product_id="2b5fc0d0-01d2-43e9-8397-f3a1a50d80b9";
delete from MEDIA_ITEM where product_id="2b5fc0d0-01d2-43e9-8397-f3a1a50d80b9";

delete from PRODUCT where id="";
delete from OPTION_ITEM where product_id="";
delete from ATTRIBUTE where product_id="";
delete from MEDIA_ITEM where product_id="";

delete from PRODUCT where id="";
delete from OPTION_ITEM where product_id="";
delete from ATTRIBUTE where product_id="";
delete from MEDIA_ITEM where product_id="";

delete from PRODUCT where id="";
delete from OPTION_ITEM where product_id="";
delete from ATTRIBUTE where product_id="";
delete from MEDIA_ITEM where product_id="";

delete from PRODUCT where id="";
delete from OPTION_ITEM where product_id="";
delete from ATTRIBUTE where product_id="";
delete from MEDIA_ITEM where product_id="";
```
