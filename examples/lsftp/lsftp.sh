#!/usr/bin/env sh
set -x
set -e
host="$1"
port="$2"
user="anonymous"
pass="anonymous"
ftp -n $host <<! # | grep -E "inc(|oming)|pub(|lic)"
quote USER $user
quote PASS $pass
ls -lR
quit
!
