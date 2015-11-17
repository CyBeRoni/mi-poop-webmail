#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/$UUID/data

if ! zfs list $DDS > /dev/null; then
        # No delegated dataset configured
        exit 0
fi

zfs set mountpoint=/srv $DDS
zfs set compression=lz4 $DDS

test -d /srv/roundcube/data || mkdir -p /srv/roundcube/data
test -d /srv/ssl || mkdir /srv/ssl

chown www:www /srv/roundcube/data

