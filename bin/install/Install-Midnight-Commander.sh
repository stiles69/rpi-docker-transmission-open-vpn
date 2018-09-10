#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Midnight-Commander.sh
# 
#         USAGE: ./Install-Midnight-Commander.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/15/2018 06:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


. $HOME/lib/sh/funcInstall.sh


SOFTWAREINSTALL1="glibc"
SOFTWAREINSTALL2="gcc"
SOFTWAREINSTALL3="make"
SOFTWAREINSTALL4="autoconf"
SOFTWAREINSTALL5="automake"
SOFTWAREINSTALL6="libtool"
SOFTWAREINSTALL7="glib2"
SOFTWAREINSTALL9="pcre"
SOFTWAREINSTALL10="ncurses"
SOFTWAREINSTALL11="gettext"
SOFTWAREINSTALL12="cvs"
SOFTWAREINSTALL13="libssh2"
SOFTWAREINSTALL14="libaspell"

SCRIPTDEFINITION="This will install midnight-commander"
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Do you want to proceed? [Y/n]"
	read PROCEED
	case $PROCEED in
		"Y"|"y")
		ProceedYes
		CompileMidnightCommander
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		ProceedYes
		CompileMidnightCommander
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
	Install $SOFTWAREINSTALL9
	Install $SOFTWAREINSTALL10
	Install $SOFTWAREINSTALL11
	Install $SOFTWAREINSTALL12
	Install $SOFTWAREINSTALL13
	Install $SOFTWAREINSTALL14
}	# end function

function CompileMidnightCommander ()
{
	cd $HOME
	git clone git://github.com/MidnightCommander/mc.git
	cd mc
	./autogen.sh
	wait
	./configure
	wait
	sudo make install
	wait
}	# end CompileMidnightCommander

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
exit 0	# Always exit properly



