echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
source stack_name.sh
mkdir -p ../logs ~/data/${STACK_NAME} ~/data/${STACK_NAME}/redis ~/data/${STACK_NAME}/mongodb
rm ../configs/secrets/.env
echo "TEST=test" >> ../configs/secrets/.env
echo "IMPORTANT: Make sure to update the ../configs/secrets/.env file with provider entries"
source keygen.sh
