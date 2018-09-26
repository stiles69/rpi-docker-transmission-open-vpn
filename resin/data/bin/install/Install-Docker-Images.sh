#!/bin/bash 
#====================================================
#
#          FILE: Install-Docker-Images.sh
# 
#         USAGE: ./Install-Docker-Images.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/30/2018 21:02
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker pull haugene/transmission-openvpn
	docker pull trnape/rpi-samba
}	# end Main

Main

#===EXIT===
exit 0

