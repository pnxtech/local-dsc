source ./scripts/stack_name.sh
mkdir -p ../logs ~/data/${STACK_NAME} ~/data/${STACK_NAME}/redis ~/data/${STACK_NAME}/mongodb
rm -f logs/hls.log
docker stack deploy --compose-file base-cluster-compose.yml ${STACK_NAME}
sleep 10
docker stack deploy --compose-file stack-compose.yml --with-registry-auth ${STACK_NAME}

echo "Starting HydraRouter"
until $(curl --output /dev/null --silent --head --fail http://localhost:5353/v1/router/clear); do
    printf "."
    sleep 2
done;
echo "HydraRouter available at: http://localhost:5353"

