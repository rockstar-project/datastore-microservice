#!/bin/bash

#ACCESS_TOKEN=$(curl --silent -X POST -H 'Accept: application/json' -H 'Content-Type: application/json; charset=UTF-8' -d '{"username":"'"$USER"'", "password":"'"$PASSWORD"'", "client_id":"'"$CLIENT_ID"'", "client_secret":"'"$CLIENT_SECRET"'", "audience":"https://api.rock-star.io/", "grant_type":"password" }' https://rockstar.auth0.com/oauth/token | jq -r .access_token)

SCHEMA_FILES=data/schemas/*.json
echo "uploading schemas"
for file in $SCHEMA_FILES
do
  curl --silent -X POST $API_ENDPOINT_URL/microservices/schemas --data @$file --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8" | jq .
done

RUNTIME_FILES=data/runtimes/*.json
echo "uploading runtimes"
for file in $RUNTIME_FILES
do
  curl --silent -X POST $API_ENDPOINT_URL/microservices/runtimes --data @$file --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8" | jq .
done

ARCHITECTURE_FILES=data/architectures/*.json
echo "uploading architectures"
for file in $ARCHITECTURE_FILES
do
  curl --silent -X POST $API_ENDPOINT_URL/microservices/architectures --data @$file --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8" | jq .
done

FEATURE_FILES=data/features/*.json
echo "uploading features"
for file in $FEATURE_FILES
do
  curl --silent -X POST $API_ENDPOINT_URL/microservices/features --data @$file --header "Accept:application/json" --header "Content-Type:application/json; charset=UTF-8" | jq .
done


######## CORE CAPABILITIES #########

echo "create core capabilities..."

FILES=data/capabilities/core/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

######## SUPPORTING CAPABILITIES #########

echo "create supporting capabilities..."

FILES=data/capabilities/supporting/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

######## INFRASTRUCTURE CAPABILITIES #########

echo "create infrastructure capabilities..."

FILES=data/capabilities/infrastructure/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

######## PROCESS GOVERNANCE CAPABILITIES #########

echo "create process governance capabilities..."

FILES=data/capabilities/process_governance/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done
