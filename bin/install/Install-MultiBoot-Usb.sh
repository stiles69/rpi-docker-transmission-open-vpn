#!/bin/bash  
#===============================================================================
#
#          FILE: Install-MultiBoot-Usb.sh
# 
#         USAGE: ./Install-MultiBoot-Usb.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/02/2018 02:11
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL1="python3-pyqt"
SOFTWAREINSTALL2="p7zip-full"
SOFTWAREINSTALL3="parted"
SOFTWAREINSTALL4="util-linux"
SOFTWAREINSTALL5="python-pyudev"
SOFTWAREINSTALL6="mtools"
SOFTWAREINSTALL7="python3-dbus"
SOFTWAREINSTALL8="python3-six"
SOFTWAREINSTALL9="multibootusb"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL1 $SOFTWAREINSTALL2 $SOFTWAREINSTALL3 $SOFTWAREINSTALL4 $SOFTWAREINSTALL5 $SOFTWAREINSTALL6 $SOFTWAREINSTALL7 $SOFTWAREINSTALL8 $SOFTWAREINSTALL9" 
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
	Install $SOFTWAREINSTALL5
	Install $SOFTWAREINSTALL6
	Install $SOFTWAREINSTALL7
	Install $SOFTWAREINSTALL8
	Install $SOFTWAREINSTALL9
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



