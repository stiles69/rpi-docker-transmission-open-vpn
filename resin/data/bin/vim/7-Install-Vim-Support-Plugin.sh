#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Vim-Support-Plugin.sh
# 
#         USAGE: ./Install-Vim-Support-Plugin.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/15/2018 02:51
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcCheckInstall.sh

SOFTWAREINSTALL="vim-support-vimplugin"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL. You need to have vim installed, and Pathogen."

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

function CheckVim ()
{
	ISINSTALLED=$(CheckInstall vim)
	if [ ISINSTALLED = 1 ]
	then
		ProceedYes
	else
		ProceedYes # Have to it is not detecting vim.
		#InstallVim
	fi
}

function InstallVim ()
{
	echo "It looks like you dont have vim installed. Do you want to proceed to install vim and Pathogen(Vim Plugin Manager)? [Y/n]"
	read PROCEEDVIM
	case $PROCEEDVIM in
		Y|y)
		$HOME/bin/Install-Vim-Bash-Support.sh
		;;
		N/n)
		echo "Exiting"
		exit 0
		;;
		*)
		echo "Bad response. Exiting"
		exit 0
		;;
	esac
	ProceedYes
}	# end InstallVim



function ProceedYes ()
{
cd $HOME/.vim/bundle
git clone https://github.com/vim-scripts/Vim-Support
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main # Call Main

# == Exit ==
echo "Exiting"
exit 0	# Always exit properly

