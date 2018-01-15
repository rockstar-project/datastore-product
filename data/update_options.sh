#!/bin/bash

declare -a NODE_FOLDERS=(
  "restapi-nodejs-express-cassandra"
  "restapi-nodejs-express-elasticsearch"
  "restapi-nodejs-express-kafka"
  "restapi-nodejs-express-mongodb"
  "restapi-nodejs-express-mysql"
  "restapi-nodejs-hapi-cassandra"
  "restapi-nodejs-hapi-mongodb"
  "restapi-nodejs-hapi-neo4j"
  "restapi-nodejs-hapi-redis"
  "restapi-nodejs-restify-mysql"
  "restapi-nodejs-restify-nats"
)

declare -a PYTHON_FOLDERS=(
  "restapi-python-django-mysql"
  "restapi-python-flash-mysql"
)

declare -a FOLDERS=(
  "restapi-java8-springboot159-cassandra"
  "restapi-java8-springboot159-elasticsearch"
  "restapi-java8-springboot159-kafka"
  "restapi-java8-springboot159-mongodb"
  "restapi-java8-springboot159-mysql"
  "restapi-java8-springboot159-nats"
  "restapi-java8-springboot159-neo4j"
  "restapi-java8-springboot159-redis"
)

for product_folder in "${FOLDERS[@]}"
do
  echo "updating $product_folder"
  OPTION_FOLDERS=$product_folder/options


  declare -a TOOLS_OPTION_FILES=("build.json" "test.json")
  for option_file in "${TOOLS_OPTION_FILES[@]}"
  do
    cat $OPTION_FOLDERS/$option_file | jq '.tags = [ "tools" ]' > temporary.json
    mv temporary.json $OPTION_FOLDERS/$option_file
  done

  declare -a DEVOPS_OPTION_FILES=("scm.json" "ci.json" "cd.json" "registry.json")
  for option_file in "${DEVOPS_OPTION_FILES[@]}"
  do
    cat $OPTION_FOLDERS/$option_file | jq '.tags = [ "devops" ]' > temporary.json
    mv temporary.json $OPTION_FOLDERS/$option_file
  done

  declare -a PLATFORM_OPTION_FILES=("datastore.json" "discovery.json" "http.json" "messaging.json" "monitoring.json" "security.json" "tracing.json")
  for option_file in "${PLATFORM_OPTION_FILES[@]}"
  do
    cat $OPTION_FOLDERS/$option_file | jq '.tags = [ "platform" ]' > temporary.json
    mv temporary.json $OPTION_FOLDERS/$option_file
  done
done
