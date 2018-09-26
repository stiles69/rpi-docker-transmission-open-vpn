#!/bin/bash - 
#===============================================================================
#
#          FILE: Install-Xbindkeys.sh
# 
#         USAGE: ./Install-Xbindkeys.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Stiles (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/02/2018 11:56
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="xbindkeys"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL"
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
	Install $SOFTWAREINSTALL
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function MakeConfiguration ()
{
	touch ~/.xbindkeys config
}	# end function

function Main ()
{
	Proceed
	MakeConfiguration	
}	# end Main

Main

# == Exit ==
exit 0



