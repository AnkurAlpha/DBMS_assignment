#!/bin/bash
# for compose
docker compose up -d --build
# for starting the docker
docker exec -it mongodb_dbms_da2 mongosh
