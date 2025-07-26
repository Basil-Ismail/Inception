#!/bin/bash


set -e 

CERT_FILE="server.crt"
KEY_FILE="server.key"
DAYS_VALID=365
KEY_SIZE=2048


if [ -f "./certs/$CERT_FILE" ] && [ -f "./certs/$KEY_FILE" ]; then
    echo "Certificate are already generated."
    exit 0
fi

echo "Generating Certificate and Key..."
openssl req -x509 -nodes -days $DAYS_VALID -newkey rsa:$KEY_SIZE -keyout $KEY_FILE -out $CERT_FILE -subj "/C=JO/ST=Amman/L=Amman/O=42/OU=Inception/CN=bismail.42.fr"
echo "Certificate and Key generated successfully."
mkdir ./src/nginx/certs/
mv   $CERT_FILE $KEY_FILE ./src/nginx/certs/