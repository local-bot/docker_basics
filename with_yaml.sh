#/bin/bash

# start the composer in detached mode
docker-compose up -d

# see status
docker ps

# shut composer down
docker-compose down