#!/bin/bash

case "$1" in
    "deploy_challenge")
        ;;
    "clean_challenge")
        ;;
    "deploy_cert" | "unchanged_cert" )
    # Given arguments: deploy_cert domain path/to/privkey.pem path/to/cert.pem path/to/fullchain.pem
        cat $3 $5 > /srv/ssl/haproxy/$2.pem
        ;;
    "startup_hook")
        ;;
    "exit_hook")
        svcadm restart haproxy
        ;;
    *)
    exit 0
    ;;
esac
