#!/bin/bash
#======================================================
#
#          FILE:  Create-Installed-Package-List.sh
# 
#         USAGE:  ./Create-Installed-Package-List.sh 
# 
#   DESCRIPTION:  This will create a Installed Packages list nameed pkglist.txt.
#		  to install packages use pacman -S - < pkglist.txt.	
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  02/11/2018 07:45:57 PM CST
#      REVISION:  1.0
#======================================================
set -o nounset                                  # treat unset variables as errors
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	pacman -Qqen > pkglist.txt
}	# end Main

Main

#===EXIT===
exit 0
