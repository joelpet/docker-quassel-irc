#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <privkey> <fullchain>"
    exit 1
fi

privkey="$1"
[ -s "$privkey" ] || { echo "Empty private key at: $privkey"; exit 1; }
fullchain="$2"
[ -s "$fullchain" ] || { echo "Empty full chain at: $fullchain"; exit 1; }


quassel_volume="quasselirc_quassel"
quassel_cert_path=$(docker volume inspect -f "{{.Mountpoint}}" $quassel_volume)/quasselCert.pem
cat "$privkey" "$fullchain" | tee "$quassel_cert_path" > /dev/null
