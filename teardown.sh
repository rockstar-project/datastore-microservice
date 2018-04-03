#!/bin/bash

echo "deleting schema resources"
SCHEMA_RESOURCE_URLS=$(curl -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/schemas | jq -r ._embedded.schemas[]._links.self.href)
if [ -n "$SCHEMA_RESOURCE_URLS" ]; then
  for current_url in $SCHEMA_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi

echo "deleting runtime resources"
RUNTIME_RESOURCE_URLS=$(curl -s -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/runtimes | jq -r ._embedded.runtimes[]._links.self.href)
if [ -n "$RUNTIME_RESOURCE_URLS" ]; then
  for current_url in $RUNTIME_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi

echo "deleting tool resources"
TOOL_RESOURCE_URLS=$(curl -s -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/tools | jq -r ._embedded.tools[]._links.self.href)
if [ -n "$TOOL_RESOURCE_URLS" ]; then
  for current_url in $TOOL_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi

echo "deleting architecture resources"
ARCHITECTURE_RESOURCE_URLS=$(curl -s -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/architectures | jq -r ._embedded.architectures[]._links.self.href)
if [ -n "$ARCHITECTURE_RESOURCE_URLS" ]; then
  for current_url in $ARCHITECTURE_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi

echo "deleting features resources"
FEATURE_RESOURCE_URLS=$(curl -s -X GET --header "Accept:application/hal+json" --header "Content-Type:application/json;" $API_ENDPOINT_URL/microservices/features | jq -r ._embedded.features[]._links.self.href)
if [ -n "$FEATURE_RESOURCE_URLS" ]; then
for current_url in $FEATURE_RESOURCE_URLS
  do
    curl -s -X DELETE $current_url --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8"
  done
fi
