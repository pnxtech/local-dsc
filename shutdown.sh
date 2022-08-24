source ./scripts/stack_name.sh
echo "Preparing to stop ${STACK_NAME}..."

REDIS_ID=$(docker ps -aqf "name=redis")
docker exec -it ${REDIS_ID} /usr/bin/redis-cli -n 0 save > /dev/null 2>&1

sleep 5
docker stack rm ${STACK_NAME}

echo "Shutting down ${STACK_NAME}..."
while [ "$(docker ps | grep ${STACK_NAME})" ]; do
  printf "."  && sleep 2
done;

d=`date +%Y%m%d-%H%M%S`
tar czPf ~/data/${STACK_NAME}/redis/backup-$d.tgz ~/data/${STACK_NAME}/redis/dump.rdb

echo "Shut down of ${STACK_NAME} complete."
