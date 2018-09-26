#!/bin/bash - 
#===============================================================================
#
#          FILE: Install-WireGuard.sh
# 
#         USAGE: ./Install-WireGuard.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/02/2018 06:26
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL1="wireguard-dkms" 
SOFTWAREINSTALL2="wireguard-tools"
SOFTWAREINSTALL3="linux-headers"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL1 $SOFTWAREINSTALL2 $SOFTWAREINSTALL3"
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
	sudo pacman -S $SOFTWAREINSTALL1
	sudo pacman -S $SOFTWAREINSTALL2
	sudo pacman -S $SOFTWAREINSTALL3

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



