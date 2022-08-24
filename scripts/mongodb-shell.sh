source ./stack_name.sh
MONGODB_ID=$(docker ps -qf "name=${STACK_NAME}_mongo")
docker exec -it ${MONGODB_ID} /usr/bin/mongo
