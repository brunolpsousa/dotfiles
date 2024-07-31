## Configure nameserver adresses

# Get correct nameserver
Get-DnsClientServerAddress -AddressFamily ipv4 | Select-Object -ExpandProperty ServerAddresses

# Place them in /etc/resolv.conf


## Install certificates in WSL

for i in *; do openssl x509 -inform PEM -in $i -out $i.crt; done

openssl x509 -inform PEM -in <filepath>/myproxy.cer -out myproxy.crt

sudo cp *.crt /etc/ssl/certs

sudo update-ca-certificates