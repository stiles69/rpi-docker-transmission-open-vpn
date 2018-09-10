#!/bin/bash  
#===============================================================================
#
#          FILE: Install-README-Git.sh
# 
#         USAGE: ./Install-README-Git.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 02/07/18 18:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


RESULT="$(echo -e "${PWD##*/}" | tr -d "[:space:]")"

SOFTWAREINSTALL="README.md"
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
	echo "![Image of Stiles](https://storage.googleapis.com/stiles-images/StilesLogo.png)" >> ./README.md
	echo "# "$RESULT >> ./README.md
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


