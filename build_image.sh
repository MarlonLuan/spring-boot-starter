#!/bin/bash

clear

docker compose -f ./docker-compose-api.yaml up --build --always-recreate-deps --force-recreate --remove-orphans