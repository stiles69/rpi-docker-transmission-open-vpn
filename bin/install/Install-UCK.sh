#!/bin/bash  
#=========================================================
#
#          FILE: Install-UCK.sh
# 
#         USAGE: ./Install-UCK.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/08/2018 01:42
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
set -e
. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="uck"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL. You MUST HAVE UBUNTU OR A UBUNTU-BASED!"
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Waiting for 15 Seconds. Please use Ctrl-C if you do not have Ubuntu or a Ubuntu-Based!"
	sleep 16
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
	sudo apt-get install libfribidi-bin
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
