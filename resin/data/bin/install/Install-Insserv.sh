#!/bin/bash
#====================================================
#
#          FILE: Install-Insserv.sh
# 
#         USAGE: ./Install-Insserv.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/02/2018 08:35
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Install ()
{
	sudo adduser insserver
	sudo passwd insserver
	su - insserver
	wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh insserver
	./insserver install
}	# end

function Main ()
{
	Install
}	# end Main

Main

#===EXIT===
exit 0
