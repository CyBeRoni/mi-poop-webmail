#!/bin/sh

test -d /srv/ssl/haproxy || mkdir -p /srv/ssl/haproxy

/usr/sbin/svcadm enable svc:/pkgsrc/haproxy:default
