#!/bin/bash

clear

sudo docker compose -f ./docker/docker-compose-api-native.yaml up --build --always-recreate-deps --force-recreate --remove-orphans --wait
