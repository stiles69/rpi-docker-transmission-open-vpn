#!/bin/bash  
#======================================================
#
#          FILE: Install-OpenVPN-PIA.sh
# 
#         USAGE: ./Install-OpenVPN-PIA.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/14/18 21:07
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function InstallOpenVPN ()
{
	sudo apt-get update -y && sudo apt-get upgrade -y
	sudo apt-get install openvpn
}	# end function

function InstallPIA ()
{
	cd /etc/openvpn
	sudo wget https://www.privateinternetaccess.com/openvpn/openvpn.zip
	sudo unzip openvpn.zip	
}	# end function

function Main ()
{
	InstallOpenVPN
	InstallPIA
}	# end Main

Main

#===EXIT===
exit 0

