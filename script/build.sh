#!/bin/bash

clear

docker compose -f ./docker/docker-compose-database.yaml up --build --always-recreate-deps --force-recreate --remove-orphans --wait -d

./mvnw clean install -Dmaven.test.skip=true