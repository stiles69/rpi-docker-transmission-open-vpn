#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Current-Linux-Headers.sh
# 
#         USAGE: ./Install-Current-Linux-Headers.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/02/2018 18:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="Linux Headers"
CURRENTLINUX=linux-headers-$(uname -r)
SCRIPTDEFINITION="This will install "$SOFTWAREINSTALL$CURRENTLINUX
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
	Install "$CURRENTLINUX"
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


