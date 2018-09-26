#!/bin/bash  
#====================================================
#
#          FILE: Make-Image.sh
# 
#         USAGE: ./Make-Image.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/26/2018 05:09
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker build -t stiles/armv7hf-debian:stretch .
}	# end Main

Main

#===EXIT===
exit 0

