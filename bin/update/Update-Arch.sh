#!/bin/bash - 
#===============================================================================
#
#          FILE: Update-Arch.sh
# 
#         USAGE: ./Update-Arch.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Stiles (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 20:54
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


#---------- SOURCED ---------
. $HOME/lib/sh/funcUpdateSystem.sh # We will use # 1 for Arch-Based
#----------------------------

#---------- GLOBAL VARIABLES ---------

DELIMITER='#############################################'
LINE=' '
#-------------------------------------
function Main ()
{
	UpdateSystem 1
}	# end Main

Main

#===EXIT===
exit 0

