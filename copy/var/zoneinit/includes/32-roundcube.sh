#!/bin/bash

productname=$(mdata-get roundcube:product_name || echo "$(mdata-get sdc:dns_domain) Webmail")
imapserver=$(mdata-get roundcube:imap_server || echo "mail.$(mdata-get sdc:dns_domain)")
qualifydomain=$(mdata-get roundcube:qualify_domain || mdata-get sdc:dns_domain)

cat <<EOF > /opt/local/roundcube/config/config.local.inc.php
<?php

\$config['default_host'] = 'tls://${imapserver}';
\$config['username_domain'] = array(
  '${imapserver}' => '${qualifydomain}',
);
\$config['product_name'] = '${productname}';
EOF

