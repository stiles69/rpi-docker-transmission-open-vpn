#!/bin/bash
#====================================================
#
#          FILE: Set-Slave2.sh
# 
#         USAGE: ./Set-Slave2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/05/2018 01:32
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
MEDIADIR="/mnt/usb"
USER="brettsalemink"
GROUP="sambashare"
#-------------------------------------
function Main ()
{
	sudo chown -R $USER:$GROUP $MEDIADIR
       	sudo chmod -R 774 $MEDIADIR
}	# end Main

Main

#===EXIT===
exit 0

