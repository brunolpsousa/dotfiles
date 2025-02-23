## Configure nameserver adresses

# Get correct nameserver
Get-DnsClientServerAddress -AddressFamily ipv4 | Select-Object -ExpandProperty ServerAddresses

# Place them in /etc/resolv.conf

## Install certificates in WSL

## Convert a DER file (.crt .cer .der) to PEM
#openssl x509 -inform der -in certificate.cer -out certificate.pem
## Convert a PEM file to DER
#openssl x509 -outform der -in certificate.pem -out certificate.der

# PEM certificate has BEGIN ~ key ~ END

for i in *; do openssl x509 -inform PEM -in $i -out $i.crt; done

# Arch
cp *.pem /etc/ca-certificates/trust-source/anchors
update-ca-trust extract

# Ubuntu
cp *.crt /etc/ssl/certs
update-ca-certificates

# Install java certificates

cd /etc/ssl/certs/java

for i in *.pem; do sudo keytool -import -cacerts -trustcacerts -alias "$i" -file "$i"; done

Default password: changeit
