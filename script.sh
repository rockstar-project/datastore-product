#!/bin/bash

ACCESS_TOKEN=$(curl --silent -X POST -H 'Accept: application/json' -H 'Content-Type: application/json; charset=UTF-8' -d '{"username":"'"$USER"'", "password":"'"$PASSWORD"'", "client_id":"'"$CLIENT_ID"'", "client_secret":"'"$CLIENT_SECRET"'", "audience":"https://api.rock-star.io/", "grant_type":"password" }' https://rockstar.auth0.com/oauth/token | jq -r .access_token)

FOLDERS=data/*
for product_folder in $FOLDERS
do
  echo "uploading $product_folder"
  RESPONSE_HEADER=$(curl -i -s -X POST $API_ENDPOINT_URL/products --data @$product_folder/product.json --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8" --header "Authorization: Bearer $ACCESS_TOKEN")
  LOCATION_HEADER=`echo "$RESPONSE_HEADER" | grep Location`
  LOCATION_HEADER=$(echo "$LOCATION_HEADER" | tr -d '\r')
  PRODUCT_HREF=`echo ${LOCATION_HEADER:9}`

  ATTRIBUTE_FILES=$product_folder/attributes/*.json
  for attribute_file in $ATTRIBUTE_FILES
  do
    curl --silent -X POST -H 'Content-Type: application/json' -H "Authorization: Bearer $ACCESS_TOKEN" --data @$attribute_file $PRODUCT_HREF/attributes
  done

  OPTION_FILES=$product_folder/options/*.json
  for option_file in $OPTION_FILES
  do
    curl --silent -X POST -H 'Content-Type: application/json' -H "Authorization: Bearer $ACCESS_TOKEN" --data @$option_file $PRODUCT_HREF/options
  done
done
