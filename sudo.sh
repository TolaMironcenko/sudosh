#!/bin/sh

RED="\033[1;31m"
RESET="\033[0m"

iterator=0
while [ $iterator -lt 3 ]; do
    printf "password: "
    read -s pass
    echo
    echo $pass | su -c "$*" 2> /dev/null
    res=$?
    if [ $res = 0 ]; then
        exit 0
    fi
    if [ $res = 127 ]; then
        printf "$RED** ERROR:$RESET command not found\n"
        exit $?
    fi
    printf "$RED** ERROR:$RESET password is not correct\n"
    ((iterator++))
done

