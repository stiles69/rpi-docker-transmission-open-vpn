#!/bin/bash  
#====================================================
#
#          FILE: Test-notify.sh
# 
#         USAGE: ./Test-notify.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 10/10/2018 01:46
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
#	curl https://xdroid.net/api/message?k=u-440890b42fee&t=title&c= content&u=http://roguedesigns.us

	curl https://xdroid.net/api/message -X POST -d "k=u-440890b42fee" -d "t=Transmission" -d "c=Extraction Complete" -d "u=http://roguedesigns.us"
}	# end Main

Main

#===EXIT===
exit 0

