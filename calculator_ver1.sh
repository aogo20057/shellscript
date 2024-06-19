#!/bin/bash

echo -n "Input A: "
read A

echo -n "Input B: "
read B

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF
echo -n "Enter your OP?: "
read OP

case $OP in
    1) expr $A + $B
    1) expr $A + $B
    2) : ;;
esac

