#!/bin/bash  
#====================================================
#
#          FILE: Install-Update-MOTD.sh
# 
#         USAGE: ./Install-Update-MOTD.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/01/2018 08:21
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	sudo cp -r $HOME/bin/files/MOTD/update-motd.d /etc/
	sudo cp $HOME/bin/files/MOTD/armbian-motd /etc/default
}	# end Main

Main

#===EXIT===
exit 0

