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
	
	"Y" | "y")
	CloneBin
	ProceedCloneSH
	;;

	"N" | "n")
	exit 0
	;;

	*)
	CloneBin
	ProceedCloneSH
	;;

esac
}	# End Function

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

function ProceedCloneSH ()
{
	echo "Do you want to clone sh at this time? [Y/n]"
	read PROCEED2
	case PROCEED2 in
		"Y"|"y")
		CloneSH
		;;
		"N"|"n")
		exit 0
		;;
		*)
		echo "Your answers did not match. Exiting."
		exit 0
	esac
}	# end function

function CloneSH ()
{
	echo 'Do you wish to clone https or use ssh? [1. https, 2. SSH]'
	read GITCLONETYPE
	case $GITCLONETYPE in
		1)
		if [ -d $HOME/lib ]
		then
			cd $HOME/lib
		else
			mkdir $HOME/lib
			cd $HOME/lib
		fi
		git clone https://github.com/stiles69/sh.git
		;;
		2)
		if [ -d $HOME/lib ]
		then
			cd $HOME/lib
		else
			mkdir $HOME/lib
			cd $HOME/lib
		fi
		cd $HOME
		git clone git@github.com:stiles69/sh.git
		;;
		*)
		echo 'Invalid choice not cloning.'
		exit 0
		;;
	esac
}	# End Function

function Main ()
{
	Proceed
}	# End Function

Main

# === Exit ===
exit 0
