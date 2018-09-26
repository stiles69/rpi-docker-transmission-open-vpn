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


function Proceed ()
{

echo 'Do you want to pull down bin and lib/sh from repo? (Y/n)'
read PROCEED

case $PROCEED in
	
	Y|y)
	CloneBin
	;;
	N|n)
	exit 0
	;;
	*)
	CloneBin
	;;
esac
}	# End Function

function CloneBin ()
{
	echo 'Do you wish to clone https or use ssh? [1. https, 2. SSH]'
	read GITCLONETYPE
	case $GITCLONETYPE in
		"1")
		cd $HOME
		git clone https://github.com/stiles69/bin.git
		;;
		"2")
		cd $HOME
		git clone git@github.com:stiles69/bin.git
		;;
		*)
		git clone https://github.com/stiles69/bin.git
		;;
	esac
} 	# end function	

function ProceedCloneSH ()
{
	echo "Do you want to clone sh at this time? [Y/n]"
	read PROCEED2
	case PROCEED2 in
		Y|y)
		CloneSH
		;;
		N|n)
		exit 0
		;;
		*)
		CloneSH
		;;
	esac
}	# end function

function CloneSH ()
{
	echo 'Do you wish to clone https or use ssh? [1. https, 2. SSH]'
	read GITCLONETYPE2
	case $GITCLONETYPE2 in
		1)
		mkdir $HOME/lib
		cd $HOME/lib
		git clone https://github.com/stiles69/sh.git
		;;
		2)
		mkdir $HOME/lib
		cd $HOME/lib
		git clone git@github.com:stiles69/sh.git
		;;
		*)
		mkdir $HOME/lib
		cd $HOME/lib
		git clone https://github.com/stiles69/sh.git
		;;
	esac
}	# End Function

function Main ()
{
	Proceed
	ProceedCloneSH
}	# End Function

Main

# === Exit ===
exit 0
