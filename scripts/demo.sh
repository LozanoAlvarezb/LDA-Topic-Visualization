#!/bin/bash

./scripts/setup.sh > /dev/null 2>&1

docker-compose up -d 

trap "docker-compose down && exit" SIGINT

PORT=9200
URL="http://localhost:$PORT"

# Check that Elasticsearch is running
curl -s $URL 2>&1 > /dev/null
while [ $? != 0 ]
do
    sleep 2
    curl -s $URL 2>&1 > /dev/null
done

echo "Waiting for Elasticsearch to be ready "


response=$(curl -s localhost:9200/_cluster/health)
while [[ ! "$response" =~ "yellow" && ! "$response" =~ "green" ]]
do
	sleep 2s
	response=$(curl -s localhost:9200/_cluster/health) 2>&1 > /dev/null
done

cd spring

java -jar springApp.jar