<?php

$config['mime_types'] = '/opt/local/etc/nginx/mime.types';
$config['db_dsnw'] = 'sqlite:////srv/roundcube/data/roundcube.sqlite?mode=0646';
$config['log_driver'] = 'syslog';
$config['syslog_facility'] = LOG_MAIL;
$config['product_name'] = 'Mail';

$config['plugins'] = array('acl', 'managesieve', 'enigma');
$config['spellcheck_engine'] = 'atd';
$config['htmleditor'] = 2;
$config['mdn_requests'] = 2;

$config['enigma_pgp_homedir'] = "/srv/roundcube/data";
$config['enigma_password_time'] = 15;

@include("/opt/local/roundcube/config/config.local.inc.php");
@include("/srv/roundcube/config/config.local.inc.php");


