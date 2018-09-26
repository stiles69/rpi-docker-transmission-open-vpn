#!/bin/bash
#====================================================
#
#          FILE: Display-All-Users.sh
# 
#         USAGE: ./Display-All-Users.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/14/2018 18:17
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo "Displaying all users"
	cut d: -f1 /etc/passwd

#	cut d: -f1 /etc/group  
}	# end Main

Main

#===EXIT===
exit 0

