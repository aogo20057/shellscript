#!/bin/bash

SERVERLIST=/root/script/server.txt

for i in `cat /root/script/server.txt`
do
    ftp -n 127.0.0.1 21 << EOF
    user root soldesk1.
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput testfile.txt
    quit
EOF
done