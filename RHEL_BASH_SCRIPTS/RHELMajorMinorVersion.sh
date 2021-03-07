#!/usr/bin/env bash
# 03/07/2021
# khurram.subhani@live.com
# This demonstrates several bash features:
# 1) global variables
# 2) local variables
# 3) setting global variables from within function
# 4) if else and nested if else statements

RHEL_RELEASE=""
major_version=""
minor_version=""

checkRHELVersion() {
    RHEL_RELEASE="$(cat /etc/redhat-release | grep -Eo '?[0-9]+[.]+[0-9]?')"
    if [ $? != 0 ]; then
        RHEL_RELEASE=1
    fi
    major_version="$(cat $RHEL_RELEASE | awk -F'.' '{print $1}')"
    minor_version="$(cat $RHEL_RELEASE | awk -F'.' '{print $2}')"
}

main() {
    checkRHELVersion
    if [ $RHEL_RELEASE -eq 1 ]; then
        echo This is not a RHEL system...
    else
        if [ $major_version -ge 7 ]; then
            echo This is RHEL version $major_version, which is greater than or equal to 7
        fi

        if [ $major_version -lt 7 ]; then
            echo This RHEL version $major_version is less than version 7
        fi
    fi 
}

main