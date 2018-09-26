#!/bin/bash
#===============================================================================
#
#          FILE:  3-Install-Packaes# 
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


SCRIPTDEFINITION="This will install ZSH and Oh-My-Zsh."

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
	esac
}	# end function

function ProceedYes ()
{
	sudo emerge zsh

	# Set zsh for user
	sudo chsh -s /bin/zsh brettsalemink

	#Install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	cp ~/bin/RaspberryPi-ReInstall/files/home/brettsalemink/.zshrc ~/
	echo "Finished copying .zshrc to home directory. Check ~/.zshrc to ensure PATH is set. Line should read export PATH=$HOME/bin:$PATH and export PATH=$HOME/lib/sh:$PATH"

}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
	~/bin/Reboot.sh
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly
