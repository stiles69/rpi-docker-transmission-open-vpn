#!/bin/bash
#=========================================================
#
#          FILE: Install-simple-ccd.sh
# 
#         USAGE: ./Install-simple-ccd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/08/2018 03:14
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
set -e

. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="simple-ccd"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL. You MUST HAVE A DEBIAN-BASED SYSTEM!"

function Proceed ()
{
	echo $SCRIPTDEFINITION
	
	echo "Do you want to proceed? [Y/n]"
	read PROCEED
	echo "Installing in 15 seconds. Ctrl-C to stop!"
	sleep 15
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
	Install $SOFTWAREINSTALL
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


