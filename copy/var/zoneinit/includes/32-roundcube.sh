#!/bin/bash

productname=$(mdata-get roundcube:product_name || echo "$(mdata-get sdc:dns_domain) Webmail")
imapserver=$(mdata-get roundcube:imap_server || echo "mail.$(mdata-get sdc:dns_domain)")
qualifydomain=$(mdata-get roundcube:qualify_domain || mdata-get sdc:dns_domain)
version=$(mdata-get roundcube:version || echo "1.6.9")

pushd /opt/local
curl -L https://github.com/roundcube/roundcubemail/releases/download/${version}/roundcubemail-${version}-complete.tar.gz | gunzip | tar xvf -
mv roundcubemail-${version} roundcube
chown -R root:root roundcube
chown fpm:www roundcube/temp
popd

test -d /srv/roundcube/data || mkdir -p /srv/roundcube/data
test -d /srv/roundcube/config || mkdir /srv/roundcube/config

chown -R fpm:www /srv/roundcube

cat <<EOF > /opt/local/roundcube/config/config.local.inc.php
<?php

\$config['default_host'] = 'tls://${imapserver}';
\$config['username_domain'] = array(
  '${imapserver}' => '${qualifydomain}',
);
\$config['product_name'] = '${productname}';
EOF

mv /root/config.inc.php /opt/local/roundcube/config/config.inc.php
mv /root/managesieve.config.inc.php /opt/local/roundcube/plugins/managesieve/config.inc.php

if [ ! -f /srv/roundcube/config/des_key.inc.php ]; then
  des_key=$(cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 24 | head -n 1)
  echo "\$config['des_key'] = '${des_key}';" > /srv/roundcube/config/des_key.inc.php
fi


