#!/bin/bash

echo "deleting architecture resources"
ARCHITECTURE_RESOURCE_URLS=$(curl -s -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/architectures | jq -r ._embedded.architectures[]._links.self.href)
if [ -n "$ARCHITECTURE_RESOURCE_URLS" ]; then
  for current_url in $ARCHITECTURE_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi

ARCHITECTURE_FILES=*.json
echo "creating architecture resources"
for file in $ARCHITECTURE_FILES
do
  curl --silent -X POST $API_ENDPOINT_URL/microservices/architectures --data @$file --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
done
