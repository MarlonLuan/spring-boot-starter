#!/bin/bash

./mvnw sortpom:sort

./mvnw impsort:sort

./mvnw spring-javaformat:apply
