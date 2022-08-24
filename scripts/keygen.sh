openssl genrsa -out service.pem 1024
openssl rsa -in service.pem -pubout > service.pub
chmod 600 service.pem
mv service* ../configs/secrets
