#!/bin/bash 
#====================================================
#
#          FILE: Install-Docker-All.sh
# 
#         USAGE: ./Install-Docker-All.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/30/2018 08:04
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
set -e

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo "This will install Docker. If you don't want to install this press Ctrl-C in 5 seconds."
	sleep 1
	echo "5"
	sleep 1
	echo "4"
	sleep 1
	echo "3"
	sleep 1
	echo "2"
	sleep 1
	echo "Starting Install."
	curl -sSL https://get.docker.com | sh
}	# end Main

Main

#===EXIT===
exit 0

