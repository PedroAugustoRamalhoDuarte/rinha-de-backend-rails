#!/bin/bash -e

docker-compose stop

docker-compose start db

RAILS_ENV=production RINHA_DE_BACKEND_DATABASE_PASSWORD=postgres DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:reset

docker-compose up -d --build

./bin/executar-teste-local.sh
