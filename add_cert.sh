certutil -d sql:$HOME/.pki/nssdb -A -t "P,," -n $1 -i $1
