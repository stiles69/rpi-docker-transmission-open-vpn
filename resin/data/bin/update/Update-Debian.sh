#!/bin/bash - 
#===============================================================================
#
#          FILE: Update-Debian.sh
# 
#         USAGE: ./Update-Debian.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 20:30
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#---------- SOURCED ---------
. $HOME/lib/sh/funcUpdateSystem.sh # We want 2 for Debian. Call with UpdateSystem 2
#----------------------------

#---------- GLOBAL VARIABLES ---------

DELIMITER='#############################################'
LINE=' '
#-------------------------------------
function Main ()
{
	UpdateSystem 2
}	# end Main

Main

#===EXIT===
exit 0

