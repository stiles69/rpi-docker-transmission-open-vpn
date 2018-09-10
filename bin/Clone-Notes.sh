#!/bin/bash  
#===============================================================================
#
#          FILE: Clone-Notes.sh
# 
#         USAGE: ./Clone-Notes.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 03:16
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
GITADDRESS="git@github.com:stiles69/Notes.git"
#-------------------------------------
function Main ()
{
	cd $HOME
	git clone "$GITADDRESS"
}	# end Main

Main

#===EXIT===
exit 0
