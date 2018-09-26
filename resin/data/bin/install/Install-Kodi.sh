#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Kodi.sh
# 
#         USAGE: ./Install-Kodi.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 10/07/18 04:35
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcInstall.sh

function Proceed ()
{
	echo 'This will install Kodi. Do you want to proceed? [Y/n]'
	read PROCEED
	case $PROCEED in
		Y|y)
		ProceedInstall
		;;
		N|n)
		echo 'Exiting'
		;;
		*)
		;;
	esac
}	# end function

function ProceedInstall ()
{
	Install kodi
}

function Main ()
{
	Proceed
}	# end function

Main

#== EXIT ==
exit 0
