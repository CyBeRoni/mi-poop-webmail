mi-poop-webmail
===============

Please refer to https://github.com/joyent/mibe for use of this repo.

Use with base-64 image from Joyent; tested with 15.3.0.

When built, this image provides a Roundcube webmail client served by nginx with HAProxy for SSL. Enabled plugins are acl and managesieve.

Metadata
---------
The following customer_metadata is used:

* roundcube:qualify_domain - Domain to use as the client's e-mail domain if the client presents none (default: none)
* roundcube:product_name - Minimal branding for roundcube (default: '<domain name> Webmail')
* roundcube:imap_server - IMAP server to connect to, TLS enabled. (Default: 'mail.<domain name>')
* php:timezone - Fed to the "date.timezone" setting of PHP (default: UTC)
* system:ssh_disabled - Whether or not to disable the ssh daemon (default: false)
* system:timezone - What timezone to use (no default)

Services
--------
When running, the following services are exposed to the network on both IPv4 and IPv6:

* 80, 443: Webmail client (80 redirects to 443)
* 22: SSH (if not disabled)


Data
----
SSL certificates can go into /srv/ssl. They are used with HAProxy so they should have the key, CA chain and certificate in a single file (PEM format).

Multiple PEM files can be added in this directory and HAProxy will figure out the right one to use with SNI. (This, if you were wondering, is why
HAProxy is used for SSL rather than letting nginx do it; nginx requires configuration per certificate.)

Example JSON
------------

    {
      "brand": "joyent",
      "image_uuid": "",
      "alias": "poopwebmail",
      "hostname": "poopwebmail",
      "max_physical_memory": 512,
      "cpu_shares": 100,
      "quota": 5,
      "delegate_dataset": "true",
      "nics": [
        {
          "nic_tag": "admin",
          "ips": ["1.2.3.4/24", "2001::1/64"],
          "gateways": ["1.2.3.1"],
          "primary": "true"
        }
      ],
      "resolvers": [
        "8.8.8.8",
        "8.8.4.4"
      ],
      "customer_metadata": {
        "system:ssh_disabled": "true",
        "system:timezone": "Europe/Amsterdam",
        "php:timezone": "Europe/Amsterdam",
        "roundcube:product_name": "Poop Webmail",
        "roundcube:imap_server": "mail.poop.nl",
        "roundcube:qualify_domain": "cyberhq.nl"
      }
    }
