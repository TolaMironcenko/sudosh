#!/bin/sh

iterator=0
while [ $iterator -lt 3 ]; do
    printf "password: "
    read -s pass
    echo
    echo $pass | su -c "$*" 2> /dev/null
    if [ $? = 0 ]; then
        exit 0
    fi
    printf "ERROR: password is not correct\n"
    ((iterator++))
done

