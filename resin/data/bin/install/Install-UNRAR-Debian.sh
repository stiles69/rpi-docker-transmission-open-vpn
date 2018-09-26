#!/bin/bash
#====================================================
#
#          FILE: Install-UNRAR-Debian.sh
# 
#         USAGE: ./Install-UNRAR-Debian.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/20/2018 02:24
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	sudo dpkg -i $HOME/bin/Packages/unrar_5.3.2-1+deb9u1_armhf.deb
}	# end Main

Main

#===EXIT===
exit 0

