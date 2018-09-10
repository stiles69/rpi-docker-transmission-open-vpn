#!/bin/bash  
#=====================================================
#
#          FILE: Display-OS.sh
# 
#         USAGE: ./Display-OS.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 00:53
#      REVISION:  ---
#=====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------
. ~/lib/sh/funcOS.sh
#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo 'The Linux Distro is: '
	RESULT=$(funcOS)
	echo $RESULT
}	# end Main

Main

#===EXIT===
exit 0

