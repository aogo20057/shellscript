#!/bin/bash


if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <ext1> <ext2>"
    exit 1
fi

[ -d "$1" ] && BASEDIR=$1 || exit 2
TMP1=/tmp/tmp1
SRC_EXT=$2
DST_EXT=$3

ls -l $BASEDIR | grep ".${STC_EXT}$" > $TMP1
for i in $(cat $TMP1)
do
    SRC=$BASEDIR/$i
    DST=$(echo "$BASEDIR/$i" | sed "s/.${SRC_EXT}$/.${DST_EXT}/")
    mv $SRC $DST
done 


