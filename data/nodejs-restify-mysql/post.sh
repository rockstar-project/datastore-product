#!/bin/bash

ACCESS_TOKEN=$(curl --silent -X POST -H 'Accept: application/json' -H 'Content-Type: application/json; charset=UTF-8' -d '{"username":"'"$APP_USER_NAME"'", "password":"'"$APP_PASSWORD"'", "client_id":"'"$APP_CLIENT_ID"'", "client_secret":"'"$APP_CLIENT_SECRET"'", "audience":"http://api.rock-star.io/v1", "grant_type":"password" }' https://rockstar.auth0.com/oauth/token | jq -r .access_token)

RESPONSE_HEADER=$(curl -i -s -X POST $APP_ENDPOINT_URL/products --data @product.json --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8" --header "Authorization: Bearer $ACCESS_TOKEN")
LOCATION_HEADER=`echo "$RESPONSE_HEADER" | grep Location`
LOCATION_HEADER=$(echo "$LOCATION_HEADER" | tr -d '\r')
PRODUCT_HREF=`echo ${LOCATION_HEADER:9}`

ATTRIBUTE_FILES=attributes/*.json
for attribute_file in $ATTRIBUTE_FILES
do
  curl --silent -X POST -H 'Content-Type: application/json' -H "Authorization: Bearer $ACCESS_TOKEN" --data @$attribute_file $PRODUCT_HREF/attributes
done

OPTION_FILES=options/*.json
for option_file in $OPTION_FILES
do
  curl --silent -X POST -H 'Content-Type: application/json' -H "Authorization: Bearer $ACCESS_TOKEN" --data @$option_file $PRODUCT_HREF/options
done
