$STACK_NAME='local-dsc'

$REDIS_ID=$(docker ps -aqf "name=redis")
docker exec -it $REDIS_ID /usr/bin/redis-cli -n 0 save > $null

sleep 5
docker stack rm $STACK_NAME

#d=`date +%Y%m%d-%H%M%S`
#tar czPf ~/data/${STACK_NAME}/redis/backup-$d.tgz ~/data/${STACK_NAME}/redis/dump.rdb
#echo "Shut down of ${STACK_NAME} complete."