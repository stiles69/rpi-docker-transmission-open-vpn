#!/bin/bash
#====================================================
#
#          FILE: Set-Iowa.sh
# 
#         USAGE: ./Set-Iowa.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/27/2018 05:48
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
DIR=/mnt/usb/Media
#-------------------------------------
function Main ()
{
	sudo chown -R minidlna:sambashare "$DIR"
	sudo chmod -R 774 "$DIR"
	sudo service minidlna force-reload
}	# end Main

Main

#===EXIT===
exit 0

