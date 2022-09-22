#!/bin/bash

mkdir ../ssh-keys
cd ../ssh-keys

echo "Creating ssh for Virtual machine..."

ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -N '' \
    -f terraform-azure.pem

ls -lrt

mv terraform-azure.pem.pub terraform-azure.pub

echo "Update permissions for private key terraform-azure.pem"
chmod 400 terraform-azure.pem