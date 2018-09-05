#!/bin/bash 
#====================================================
#
#          FILE: Test.sh
# 
#         USAGE: ./Test.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/05/2018 09:54
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
TORRENTDIR=/torrents
COMPLETEDIR=/torrents/completed
#-------------------------------------
function Main ()
{
	cd $TORRENTDIR
	find . -name '*.rar' -execdir unrar e -o- {} \; 
	echo $PWD
	wait
}	# end Main

Main

#===EXIT===
exit 0
