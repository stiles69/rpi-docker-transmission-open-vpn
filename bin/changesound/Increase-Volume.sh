#!/bin/bash  
#=========================================================
#
#          FILE: Increase-Volume.sh
# 
#         USAGE: ./Increase-Volume.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/11/2018 16:23
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '

#-------------------------------------
function Main ()
{
	amixer -q sset Master 5%+
}	# end Main

Main

#===EXIT===
exit 0

