#!/usr/bin/env bash
# Demonstrates grabbing major and minor version of RHEL

RHEL_RELEASE="$(cat /etc/redhat-release | grep -Eo '?[0-9]+[.]+[0-9]?')"
major_version="$(cat $RHEL_RELEASE | awk -F'.' '{print $1}')"
minor_version="$(cat $RHEL_RELEASE | awk -F'.' '{print $2}')"

if [ $major_version -ge 7 ]; then
    echo This version of RHEL is $major_version
elif [ $major_version -le 7 ]; then
    echo This version of RHEL is $major_version
else
    echo couldn\'t find $major_version
fi
