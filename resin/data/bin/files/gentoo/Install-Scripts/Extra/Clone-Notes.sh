#!/bin/bash  
#===============================================================================
#
#          FILE: Pull-Notes.sh
# 
#         USAGE: ./Pull-Notes.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 02/07/18 09:32
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


#. ~/lib/sh/funcReboot.sh
SOFTWAREINSTALL="Notes"
SCRIPTDEFINITION="This will clone  "$SOFTWAREINSTALL
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
	cd $HOME
	git clone git@github.com:stiles69/Notes.git
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
	#funcReboot.sh
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly


