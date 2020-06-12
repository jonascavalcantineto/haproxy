#!/bin/bash

email=$1
domain=$2

if [[ $# -lt 2 ]] ; then
    echo "Using: $0 <email> <url>" 
    exit 1
fi


/opt/certbot/certbot-auto certonly \
        --manual \
        --preferred-challenges=dns \
        --email ${email} \
        --server https://acme-v02.api.letsencrypt.org/directory \
        --agree-tos \
        -d ${domain}