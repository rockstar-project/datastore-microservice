#!/bin/bash

CORE_CAPABILITY_FILES=core/*.json
echo "uploading capabilities..."

curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @core.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @supporting.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @infrastructure.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @process_governance.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .

CORE_CAPABILITY_FILES=core/*.json
for file in $CORE_CAPABILITY_FILES
do
  echo "creating $file core capability..."
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/core/items --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

SUPPORTING_CAPABILITY_FILES=supporting/*.json
for file in $SUPPORTING_CAPABILITY_FILES
do
  echo "creating $file supporiting capability..."
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/supporting/items --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done


echo "creating process governance capabilities..."

curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/process-governance/items --data @process_governance/apidoc.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/process-governance/items --data @process_governance/test.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .

curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/process-governance/items --data @process_governance/repository.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .

curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/process-governance/items --data @process_governance/devops.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/devops/items --data @process_governance/ci.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/devops/items --data @process_governance/cd.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/ci/items --data @process_governance/build.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/ci/items --data @process_governance/test.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities/ci/items --data @process_governance/package.json --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
