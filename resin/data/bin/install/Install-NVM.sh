#!/bin/bash  
#===============================================================================
#
#          FILE: Install-NVM.sh
# 
#         USAGE: ./Install-NVM.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/01/2018 22:48
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


SOFTWAREINSTALL="NVM"
SCRIPTDEFINITION="This will install "$SOFTWAREINSTALL

function InstallNode ()
{
	echo "Installing Node and NPM."
	nvm install node
	nvm use node
}	# end function

function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Do you want to proceed? [Y/n]"
	read PROCEED
	case $PROCEED in
		"Y"|"y")
		ProceedYes
		InstallNode
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		ProceedYes
		InstallNode
	esac
}	# end function

function ProceedYes ()
{
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
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
