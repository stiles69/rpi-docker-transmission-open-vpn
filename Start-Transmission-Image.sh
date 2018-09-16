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
StartProxy ()
{
	docker run -d stiles/rpi-docker-transmission-openvpn-proxy
}	# end

StartTransmission()
{
	
	docker run -it --name rogue-rpi-docker -p 9091:9091 stiles/rpi-docker-transmission-openvpn:latest /bin/bash 
}	# end

function Main ()
{
	StartTransmission
	#StartProxy
}	# end Main

Main

#===EXIT===
exit 0

