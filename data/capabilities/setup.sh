#!/bin/bash

######## CORE CAPABILITIES #########

echo "create core capabilities..."

FILES=core/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

######## SUPPORTING CAPABILITIES #########

echo "create supporting capabilities..."

FILES=supporting/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

######## INFRASTRUCTURE CAPABILITIES #########

echo "create infrastructure capabilities..."

FILES=infrastructure/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done

######## PROCESS GOVERNANCE CAPABILITIES #########

echo "create process governance capabilities..."

FILES=process_governance/*
for file in $FILES
do
  curl -s -X POST $API_ENDPOINT_URL/microservices/capabilities --data @$file --header "Accept:application/json" --header "Content-Type:application/json;charset=UTF-8" | jq .
done
