#!/bin/bash
#===============================================================================
#
#          FILE:  3-Install-Packages# 
#         USAGE:  
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  None
#  REQUIREMENTS:  None
#          BUGS:  None
#         NOTES:  
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 04:02:50 PM CST
#      REVISION:  
#===============================================================================`




. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL="zsh"
SOFTWAREINSTALL2="oh-my-zsh"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL and then $SOFTWAREINSTALL2. It will then ask if you want to setup the default rogue settings."

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
	Install-Oh-My-Zsh
	FinalZSHSetup
	echo "Setup Completed!"
}	# end function

function FinalZSHSetup ()
{
	rsync -rvz $HOME/bin/files/home/brettsalemink/ $HOME/

}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Install-Oh-My-Zsh ()
{
	#Install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	wait
	# Set zsh for user
	sudo chsh -s /bin/zsh brettsalemink
	wait
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main 

# == Exit ==
exit 0
