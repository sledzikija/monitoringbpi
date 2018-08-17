#!/bin/bash
old_back=`date +%Y-%m-%d --date '3 days ago'`
plik=cos
nazwa=$(echo $plik$old_back$roz)
echo $nazwa
HOST=ftp.example.com
USER=ftpuser
PASSWORD=`echo UEBzc3cwcmQK | base64 --decode`

ftp -inv $HOST <<EOF
user $USER $PASSWORD
cd /path/to/file
mput *.html
bye
EOF
