# Remove-Variable -Force HOME
# Set-Variable HOME (Get-Location)
$STACK_NAME='local-dsc'
$HOSTIP=ipconfig | Select-String -Pattern "IPv4"
$HOSTIP=($HOSTIP[0] -Split ":")[1].Trim()
echo "Host IP: $HOSTIP"
mkdir -Force -p ./data/logs 
mkdir -Force -p ./data/redis 
mkdir -Force -p ./data/mongodb
if (Test-Path -Path ./data/logs/hls.log) {
  rm -Force ./data/logs/hls.log
}
docker stack deploy --compose-file base-cluster-compose.yml $STACK_NAME
sleep 10
docker stack deploy --compose-file stack-compose.yml --with-registry-auth $STACK_NAME
echo "HydraRouter available at: http://localhost:5353"
