$REDIS_ID=$(docker ps -qf "name=redis")
docker exec -it ${REDIS_ID} /usr/bin/redis-cli
