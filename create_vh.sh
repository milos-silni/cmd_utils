#!/bin/bash
username=`whoami`
if [ $username != "root" ]; then
  echo "================= moras da izvrsis skriptu sa [sudo create_vh] ."
  exit 0
fi

clear

servername="";

while [ -z "$servername" ]; do
  echo -e "ServerName: \c "
  read servername
done

def="/home/milos/work/$servername"
echo -e "DocumentRoot [$def]: \c "
read doc_root

if [ -z "$doc_root" ]; then
  doc_root=$def
fi

# napravi virtual host fajl
echo "
<VirtualHost *:80>
  ServerName $servername.localhost
  DocumentRoot \"$doc_root\"
  DirectoryIndex index.php
  <Directory \"$doc_root\">
    AllowOverride All
    Allow from All
  </Directory>
</VirtualHost>" > /etc/apache2/sites-available/$servername

echo "================= /etc/apache2/sites-available/$servername"

ln -s /etc/apache2/sites-available/$STRING /etc/apache2/sites-enabled/$servername

echo "================= /etc/apache2/sites-enabled/$servername"

# napravi hostname
echo "127.0.0.1	$servername.localhost" >> /etc/hosts
echo "================= 127.0.0.1	$servername.localhost"

service apache2 restart

echo "================= Virtaul host [$servername.localhost] napravljen uspesno."