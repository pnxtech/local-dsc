source ./stack_name.sh
REDIS_ID=$(docker ps -qf "name=${STACK_NAME}_redis")
docker exec -it ${REDIS_ID} /usr/bin/redis-cli
