#!/bin/bash
#===============================================================================
#
#          FILE:  0-Bin-Install.sh
# 
#         USAGE:  ./0-Bin-Install.sh 
# 
#   DESCRIPTION:  This installs git and clones bin.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  06/20/2018 08:30:04 AM CDT
#      REVISION:  ---
#===============================================================================


. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="git"
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
		;;
	esac
}	# end function

function ConfigureGitUser ()
{
	git config --global user.name "stiles69"
	git config --global user.email "brett.salemink@gmail.com"
	git config --global core.editor "vim"
}	# end function

function CloneBin ()
{
	echo 'Do you wish to clone https or use ssh? [1. https, 2. SSH]'
	read GITCLONETYPE
	case $GITCLONETYPE in
		1)
		cd $HOME
		git clone https://github.com/stiles69/bin.git
		;;
		2)
		cd $HOME
		git clone git@github.com:stiles69/bin.git
		;;
		*)
		echo 'Invalid choice not cloning.'
		exit 0
		;;
	esac
} 	# end function	

function ProceedYes ()
{
	Install $SOFTWAREINSTALL
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
	ConfigureGitUser
	CloneBin
}	# end Main

Main

# == Exit ==
exit 0


