#!/bin/bash - 
#===============================================================================
#
#          FILE: Mute-Volume.sh
# 
#         USAGE: ./Mute-Volume.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/11/2018 16:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '

#-------------------------------------
function Main ()
{
	amixer -q sset Master toggle
}	# end Main

Main

#===EXIT===
exit 0

