#!/bin/bash

clear

sudo docker compose -f ./docker/docker-compose-database.yaml up --build --always-recreate-deps --force-recreate --remove-orphans --wait
