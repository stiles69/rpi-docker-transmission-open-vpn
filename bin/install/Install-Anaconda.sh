#!/bin/bash - 
#===============================================================================
#
#          FILE: Install-Anaconda.sh
# 
#         USAGE: ./Install-Anaconda.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/02/2018 20:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function DownloadAnaconda ()
{
	wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
}	# end function

function InstallAnaconda ()
{
	sudo chmod +x ./Anaconda3-5.2.0-Linux-x86_64.sh
	sh Anaconda3-5.2.0-Linux-x86_64.sh
}	# end function

function Main ()
{
	DownloadAnaconda
	InstallAnaconda
}	# end Main

Main

#==EXIT==
exit 0

