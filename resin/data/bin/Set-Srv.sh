#!/bin/bash 
#====================================================
#
#          FILE: Set-Srv.sh
# 
#         USAGE: ./Set-Srv.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 24/08/18 15:36
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	sudo chown -R brettsalemink:brettsalemink /srv/nfs/media
	sudo chmod -R 777 /srv/nfs/media

}	# end Main

Main

#===EXIT===
exit 0

