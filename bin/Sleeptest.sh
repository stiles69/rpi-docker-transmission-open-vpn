#!/bin/bash - 
#===============================================================================
#
#          FILE: Sleeptest.sh
# 
#         USAGE: ./Sleeptest.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 03/07/18 05:41
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


source $HOME/lib/sh/funcTimer.sh

SCRIPTDEFINITION="This will do a deepclean."

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
	echo "How many seconds do you want to set the timer for?"
	read TIMEOUT
	Timer "$TIMEOUT" "sudo emerge --ask --depclean"
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

