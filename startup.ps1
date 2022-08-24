$STACK_NAME='local-dsc'
$HOSTIP=ipconfig | Select-String -Pattern "IPv4"
$HOSTIP=($HOSTIP[0] -Split ":")[1].Trim()
echo "Host IP: $HOSTIP"
docker stack deploy --compose-file base-cluster-compose.yml $STACK_NAME
sleep 10
docker stack deploy --compose-file stack-compose.yml --with-registry-auth $STACK_NAME
echo "HydraRouter available at: http://localhost:5353"
