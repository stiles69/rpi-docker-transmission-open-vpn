#!/bin/bash  
#===============================================================================
#
#          FILE: Flash-HypriotOS1.8.0.sh
# 
#         USAGE: ./Flash-HypriotOS1.8.0.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/03/2018 09:39
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


SOFTWAREINSTALL="HyptriotOS"
SCRIPTDEFINITION="This will install "$SOFTWAREINSTALL
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
	esac
}	# end function

function ProceedYes ()
{
	flash https://github.com/hypriot/image-builder-rpi/releases/download/v1.8.0/hypriotos-rpi-v1.8.0.img.zip
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


