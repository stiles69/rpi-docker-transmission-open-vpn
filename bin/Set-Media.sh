#!/bin/bash  
#===============================================================================
#
#          FILE: set-Media.sh
# 
#         USAGE: ./set-Media.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 12:56
#      REVISION:  ---
#===============================================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	sudo chown -R plex:brettsalemink /mnt/Media
	sudo chmod -R 774 /mnt/Media

	echo 'Permissions Changed for /mnt/Media'
}	# end Main

Main

#===EXIT===
exit 0
