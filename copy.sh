#!/bin/bash

USAGE() {
    echo "Usage: $0 <send|recv> <src_file> <dest_dir>"
    echo "Example: $0 send file.txt /tmp"
}

# 인자 개수가 정확히 3개가 아니면 오류 출력
if [ $# -ne 3 ]; then
    USAGE
    exit 1
fi

ACTION=$1
SRC_FILE=$2
DST_DIR=$3

SendFile() {
    for i in $(seq 200 202)
    do
        ping -c 1 -W 1 $NET.$i >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "------ [ OK ] $NET.$i -------"
            scp "$SRC_FILE" "${NET}.${i}:${DST_DIR}"
            echo
        else
            echo "------ [ FAIL ] $NET.$i -------"
            echo
        fi
    done
}

RecvFile() {
    for i in $(seq 200 202)
    do
        ping -c 1 -W 1 $NET.$i >/dev/null 2>&1
        if [ $? -eq 0 ]; then
        HNAME=$(ssh $NET.$i hostname)
            echo "------ [ OK ] $NET.$i -------"
            DST_FILE=$(basename $SRC_FILE)
            scp "${NET}.${i}:$SRC_FILE" "${DST_DIR}/$DST_FILE.$HNAME"
            echo
        else
            echo "------ [ FAIL ] $NET.$i -------"
            echo
        fi
    done
}

NET=192.168.10
case $ACTION in
    'send') SendFile ;;
    'recv') RecvFile ;;
    *) USAGE ; exit 2 ;;
esac
