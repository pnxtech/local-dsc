param([string]$p1)
$REDIS_ID=$(docker ps -qf "name=redis")
docker exec -it ${REDIS_ID} /usr/bin/redis-cli --ldb --eval $p1
