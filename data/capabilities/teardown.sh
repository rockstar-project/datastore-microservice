#!/bin/bash

echo "deleting capabilities"
CAPABILITY_RESOURCE_URLS=$(curl -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/capabilities | jq -r ._embedded.capabilities[]._links.self.href)
if [ -n "$CAPABILITY_RESOURCE_URLS" ]; then
  for current_url in $CAPABILITY_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi
