#!/bin/bash
#====================================================
#
#          FILE: Clone-Docker.sh
# 
#         USAGE: ./Clone-Docker.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/30/2018 21:06
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	cd $HOME/development
	git clone --recurse-submodules git@github.com:stiles69/docker.git
}	# end Main

Main

#===EXIT===
exit 0

