#!/bin/bash 
#====================================================
#
#          FILE: Install-Vim-Python-Syntax.sh
# 
#         USAGE: ./Install-Vim-Python-Syntax.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/15/2018 08:34
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------
. $HOME/lib/sh/funcInstall.sh
#-------------------------------------
#---------- GLOBAL VARIABLES ---------
SOFTWAREINSTALL="vim python syntax"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL"
#-------------------------------------
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
	cd ~/.vim/bundle
	git clone https://github.com/hdima/python-syntax
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

#===EXIT===
exit 0

