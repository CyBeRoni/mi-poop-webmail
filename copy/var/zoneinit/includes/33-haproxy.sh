#!/bin/sh

test -d /srv/ssl/haproxy || mkdir /srv/ssl/haproxy

/usr/sbin/svcadm enable svc:/pkgsrc/haproxy:default
