
### query products with `kafka` option

```
select p.name from PRODUCT p, OPTION_ITEM o where p.id = o.product_id and o.name='messaging' and o.value='kafka';
```

### query `eventdriven` featured microservices  

```
select p.name from PRODUCT p, ATTRIBUTE a where p.id = a.product_id and a.name='architecture' and a.value='eventdriven' and p.featured=true;
```

### make `datastore` option featured for featured products
```
 update PRODUCT p, OPTION_ITEM o set o.featured=true where p.id = o.product_id and p.featured=true and o.name='datastore'
 ```
### select `featured` products

```mysql
select p.name from PRODUCT p where p.featured=true
```

### select product options

```
select  p.name, o.name, o.value from PRODUCT p, OPTION_ITEM o where p.id=o.product_id and p.name='restapi-java-springboot-mysql'
```
