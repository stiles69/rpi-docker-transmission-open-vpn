#!/bin/bash 
#====================================================
#
#          FILE: Start-Transmission-Image.sh
# 
#         USAGE: ./Start-Transmission-Image.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/05/2018 01:54
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker run --cap-add=NET_ADMIN --device=/dev/net/tun -d \ 
	-v /your/storage/path/:/data \ 
	-v /etc/localtime:/etc/localtime:ro \ 
	--env-file /your/docker/env/file \ 
	-p 9091:9091 \ 
	haugene/transmission-openvpn 
}	# end Main

Main

#===EXIT===
exit 0

