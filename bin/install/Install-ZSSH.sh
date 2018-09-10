#!/bin/bash  
#===============================================================================
#
#          FILE: Install-ZSSH.sh
# 
#         USAGE: ./Install-ZSSH.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/02/2018 11:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL1="zssh"
SOFTWAREINSTALL2="lrzsz"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL1 $SOFTWAREINSTALL2"
function Proceed ()
{
	echo $SCRIPTDEFINITION
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
	Install $SOFTWAREINSTALL1
	Install $SOFTWAREINSTALL2
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



