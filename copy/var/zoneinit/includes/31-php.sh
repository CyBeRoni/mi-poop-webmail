#!/bin/bash

timezone=$(mdata-get php:timezone || echo "UTC")
cat <<EOF > /opt/local/etc/php.d/20-timezone.ini
[PHP]
date.timezone="${timezone}"
EOF

/usr/sbin/svcadm enable svc:/pkgsrc/php-fpm:default
