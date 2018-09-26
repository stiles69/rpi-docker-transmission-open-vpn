#!/bin/bash  
#===============================================================================
#
#          FILE: Install-UCareSystem.sh
# 
#         USAGE: ./Install-UCareSystem.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 16:45
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


SOFTWAREINSTALL="UCareSystem"
SOFTWAREINSTALL1="apt"
SOFTWAREINSTALL2="deborphan"
SOFTWAREINSTALL3="lsb-release"
SOFTWAREINSTALL4="xterm"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL. This is only for Debian Based Systems with apt, deborphan, lsb-release, xterm installed."
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
	sudo apt-get install $SOFTWAREINSTALL1
	sudo apt-get install $SOFTWAREINSTALL2
	sudo apt-get install $SOFTWAREINSTALL3
	sudo apt-get install $SOFTWAREINSTALL4
	sudo cp $HOME/bin/Packages/uCareSystem/ucaresystem-core /usr/bin
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


