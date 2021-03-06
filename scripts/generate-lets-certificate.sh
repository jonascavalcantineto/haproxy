#!/bin/bash

email=$1
domain=$2

if [[ $# -lt 2 ]] ; then
    echo "Using: $0 <email> <url>" 
    exit 1
fi


certbot certonly \
        --manual \
        --preferred-challenges=dns \
        --email ${email} \
        --server https://acme-v02.api.letsencrypt.org/directory \
        --agree-tos \
        -d ${domain}