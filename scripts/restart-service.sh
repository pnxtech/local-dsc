source stack_name.sh
SERVICE=`docker stack services ${STACK_NAME} | grep $1 | awk '{print $1}'`
docker service update --force ${SERVICE}

