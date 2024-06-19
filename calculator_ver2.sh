#!/bin/bash

echo -n "Input A: "
read A

echo -n "Input OP: "
read OP

echo -n "Input B: "
read B

case $OP in
    '+') expr "$A + $B = $(expr $A + $B)" ;;
    '-') expr "$A - $B = $(expr $A - $B)" ;;
    '*') expr "$A * $B = $(expr $A \* $B)" ;;
    '/') expr "$A / $B = $(expr $A / $B)" ;;
    *) echo "[ FAIL ] 잘못된 입력입니다."
    exit 1
esac
