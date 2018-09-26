#!/bin/bash  
#=========================================================
#
#          FILE: Generate-All-Installed-Packages-Arch.sh
# 
#         USAGE: ./Generate-All-Installed-Packages-Arch.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/06/2018 18:30
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
	# Native Packages
	pacman -Qqettn > $HOME/bin/files/manjaro/Native-Package-List.txt
	# Aur Packages
	pacman -Qqettm > $HOME/bin/files/manjaro/Aur-Package-List.txt
}	# end Main

Main

#===EXIT===
exit 0

