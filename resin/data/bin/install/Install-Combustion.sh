#!/bin/bash  
#====================================================
#
#          FILE: Install-Combustion.sh
# 
#         USAGE: ./Install-Combustion.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/20/2018 00:22
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo "Simply move the files from the release archives (unzipped) to Transmission's web theme folder:"

	wget https://github.com/Secretmapper/combustion/archive/release.zip
}	# end Main

Main

#===EXIT===
exit 0

