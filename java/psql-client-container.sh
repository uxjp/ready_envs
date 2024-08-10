#!/bin/bash

# Script to test the database connection using a container as client
#
#
docker run -it --rm --network  postgres -e PGPASSWORD=mysecretpassword postgres psql -h postgres-db -U postgres
