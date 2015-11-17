#!/bin/sh

test -d /srv/ssl || mkdir /srv/ssl

cat <<EOF > /srv/ssl/haproxy.pem
-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAoMsZLZGAM6HwfNcIIt9tSA/uMROdrJf3KC3I4pZGY9vELMUmr2wq
1B2K8bcg5637vF5BRqOJ9yR60ZwDhsSgWc09rOCgjPsE0+PWrAXq2V6MYDdQuO4e
954lfGAKRcDqyTxf7G+i7d12BDuLS0AeRONu4MrFXsbr7CDfkX5AqrLZRG4t6Bxq
4IywNADEFxzxwr8Cp5zjj08/uMV382f6FNPaVDF0y+Eoqtu3pTxHbKBvrvFFUWeo
Gfjt54EVqABUXpyV6zDcgTBtirLzeMJqVMa661REQh6F/9EqYa4n9MStL15lf7Wa
aYEV4qB3Co3Q1hB4HvmRDX57u/OiAI/umwIBAg==
-----END DH PARAMETERS-----
-----BEGIN PRIVATE KEY-----
MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMSJb59XIsTXHYOB
Bt9wroSSLzKhi+UL0Znim5xefFjSuu2QvwvQfT9XmVOfqE9iXApJ25NR6Mv2m9VC
wGm2tRY9FRl4Oq3/Wioyn2ywn00uwHX4sQmp+no/bgqh/f8N2PuxDjv/Z42dT6uh
CjYgfSpxR+L6Zkp/xuCx7zWFZsetAgMBAAECgYBisJTRkYLPDyot18Oovb+UqId0
yDQkXuvwdx8mxTdxrtfY5V9ZwmayQP2oRTrSKhUHwZC2CGJ60SntS+is7Oc/EctW
z3tL1x5uBlxGWVHMWJIf8Ap6e3G2rHsi+kYLJ39cSO6A95PKqhN6rpFO0xWAVvSp
seipylkwID66HSW8LQJBAPuCUxV8o5YRZSxab+szV4H/OgoifEWlJcZu1UFHPb7c
bL8GOxTpnCQwEzxSACTb5AO63fBdRgrH9ygBHIUJLnMCQQDIC9PUSr7FxlhoVlw3
GHJWsRixC3q7C2unEtTYOw62o1mmKAHdSPlWuTOrlCzk27U2mYvwSqi//lc4Pl/a
kYlfAkBZ1QK3+fyz7SKl5Od0qrHmzLJ+TDL27TXA2nVxC3ESasissh0IKyiKBGHa
ea9zetbGPkhnQelykFnHAB6fpdfhAkBgGJ5naoh+BSvO4z1lEg9K6cPMuJD6bSAH
oBoyzRviTFHyaWGL5VQxfsH9eC6guZIxak043wR1Rj6ru/rbyfHNAkBLzalpLBPL
yb59Tfa2bQoYhMmOLS0QvaqhdlsNOIq+HfNXtl5OM1ukJwGfIDP8wM7L56IZuCwX
mXeb0TpNb9VR
-----END PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIICQzCCAaygAwIBAgIJAI2NfjCWvg0IMA0GCSqGSIb3DQEBCwUAMFgxFDASBgNV
BAsMC0lNQVAgc2VydmVyMRkwFwYDVQQDDBBpbWFwLmV4YW1wbGUuY29tMSUwIwYJ
KoZIhvcNAQkBFhZwb3N0bWFzdGVyQGV4YW1wbGUuY29tMB4XDTE1MTEwNDE1NTEz
NloXDTE2MTEwMzE1NTEzNlowWDEUMBIGA1UECwwLSU1BUCBzZXJ2ZXIxGTAXBgNV
BAMMEGltYXAuZXhhbXBsZS5jb20xJTAjBgkqhkiG9w0BCQEWFnBvc3RtYXN0ZXJA
ZXhhbXBsZS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMSJb59XIsTX
HYOBBt9wroSSLzKhi+UL0Znim5xefFjSuu2QvwvQfT9XmVOfqE9iXApJ25NR6Mv2
m9VCwGm2tRY9FRl4Oq3/Wioyn2ywn00uwHX4sQmp+no/bgqh/f8N2PuxDjv/Z42d
T6uhCjYgfSpxR+L6Zkp/xuCx7zWFZsetAgMBAAGjFTATMBEGCWCGSAGG+EIBAQQE
AwIGQDANBgkqhkiG9w0BAQsFAAOBgQABBp5GYIQovi89jBrRUCEF1WOXLMbP2iAO
RthxUrjOTXlJ3Zrw417xB5gPm/ExYnPQmADanyF80Xe6oGFmEni7uOGNjWbO1Frm
1KKRXxAXmglmCACf2SWk9YI02yxaVGbS5L1RSwKEATW3UAdNAhSbMjYJ8Hug1xUn
VgN1QFWq+g==
-----END CERTIFICATE-----
EOF


/usr/sbin/svcadm enable svc:/pkgsrc/haproxy:default
