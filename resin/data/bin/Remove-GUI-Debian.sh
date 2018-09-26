#!/bin/bash - 
#===============================================================================
#
#          FILE: Remove-GUI-Debian.sh
# 
#         USAGE: ./Remove-GUI-Debian.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/12/2018 16:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '

#-------------------------------------
function Main ()
{
	sudo apt purge libx11-6 libwayland-client0
	wait
	sudo apt-get purge x11-common libwayland-server0
	wait
}	# end Main

Main

#===EXIT===
exit 0

