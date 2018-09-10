#!/bin/bash
#====================================================
#
#          FILE: Start-Transmission-OpenVPN.sh
# 
#         USAGE: ./Start-Transmission-OpenVPN.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/02/2018 16:04
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
		-e OPENVPN_PROVIDER=PIA \
		-e OPENVPN_CONFIG=CA\ Toronto \
		-e OPENVPN_USERNAME=user \
		-e OPENVPN_PASSWORD=pass \
		-e WEBPROXY_ENABLED=false \
		-e LOCAL_NETWORK=10.0.0.1/24 \
		--log-driver json-file \
		--log-opt max-size=10m \
		-p 9091:9091 \
		haugene/transmission-openvpn
}	# end Main

Main

#===EXIT===
exit 0

