#!/bin/bash - 
#===============================================================================
#
#          FILE: Install-Caddy.sh
# 
#         USAGE: ./Install-Caddy.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/08/2018 18:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -e
. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="caddy"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL. This is for 64-bit Only! NOT RASPBIAN!"
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Starting in 5 seconds. Send Ctrl-C to Stop."
	sleep 6
	echo "Do you want to proceed? [Y/n]"
	read PROCEED
	case $PROCEED in
		"Y"|"y")
		ProceedYes
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		ProceedYes
		;;
	esac
}	# end function

function ProceedYes ()
{
	curl https://getcaddy.com | bash -s personal
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main

# == Exit ==
exit 0



