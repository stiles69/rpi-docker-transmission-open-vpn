#!/bin/bash  
#===============================================================================
#
#          FILE: Install-FFMPEG.sh
# 
#         USAGE: ./Install-FFMPEG.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/15/2018 14:45
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL1="ffmpeg"
SOFTWAREINSTALL2="genisoimage"
SOFTWAREINSTALL3="cdrkit"
SOFTWAREINSTALL4="dvdauthor"

SCRIPTDEFINITION="This will install $SOFTWAREINSTALL1 $SOFTWAREINSTALL2 $SOFTWAREINSTALL3 $SOFTWAREINSTALL4"
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
	Install $SOFTWAREINSTALL3
	Install $SOFTWAREINSTALL4
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly



