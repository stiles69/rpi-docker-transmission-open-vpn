#!/bin/bash 
#====================================================
#
#          FILE: Set-Slave2-Samba-Directories.sh
# 
#         USAGE: ./Set-Slave2-Samba-Directories.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/15/2018 04:23
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------
DIR1=/mnt/usb/Media
DIR2=/media
#-------------------------------------
function Main ()
{
	sudo chown -R nobody:nogroup "$DIR1"
	sudo chmod -R 774 "$DIR1"
	sudo chown -R nobody:nogroup "$DIR2"
	sudo chmod -R 774 "$DIR2"
}	# end Main

Main

#===EXIT===
exit 0

