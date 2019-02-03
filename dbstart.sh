#!/bin/bash

docker run -d -p 5432:5432 \
  -e POSTGRES_USER="postgres" \
  -e POSTGRES_PASSWORD="postgres" \
  -e POSTGRES_DB="habbot_dev" \
  postgres
