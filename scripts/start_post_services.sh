source ./stack_name.sh
docker stack deploy --compose-file ./post-services/post-services-compose.yml --with-registry-auth ${STACK_NAME}
