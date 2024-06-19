#!/bin/bash

# 원격 접속 & 백업 수행(tar CMD)
SERVER=192.168.10.201
UNAME=root
UPASS=centos

Cmd() {
    sleep 2; echo "$UNAME"
    sleep 0.5; echo "$UPASS"
    sleep 0.5; echo 'mkdir -p /backup'
    sleep 0.5; echo 'tar cf /backup/homt.tar.gz /home'
    sleep 0.5; echo 'exit'
}
Cmd | telnet $SERVER 23
 
# 파일전송
ftp -n $SERVER 21 << EOF
user root centos
cd /backup 
lcd /tmp
bin
hash
prompt
mget hom.tar.gz
bye
EOF

ls -lh /tmp/home.*

