#!/bin/bash - 
#===============================================================================
#
#          FILE: Change-Root-Password.sh
# 
#         USAGE: ./Change-Root-Password.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/01/2018 02:40
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function ChangePassword ()
{
	echo "This will ask for the new root password."
	sudo passwd root
}	# end function

function Proceed ()
{
	echo "This  will change the root password. Do you want to proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		ChangePassword
		;;
		"N"|"n")
		exit 0
		;;
		*)
		ChangePassword
		;;
	esac
}	# end function

function Main ()
{
	Proceed
}	# end function

Main

# == Exit ==
exit 0
