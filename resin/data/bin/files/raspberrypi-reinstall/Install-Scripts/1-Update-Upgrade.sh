#!/bin/bash  
#===============================================================================
#
#          FILE: update-upgrade.sh
# 
#         USAGE: ./update-upgrade.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/04/2018 01:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SCRIPTDEFINITION="This will install update the repositories."
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
	echo "Which system to you want to update? [1.Debian Based, 2.Arch Based]"
	read SYSTEMINFO
	case $SYSTEMINFO in
		1)
		DebUpdateUpgrade
		UpdateBinLib
		;;
		2)
		ArchUpdateUpgrade
		UpdateBinLib
		;;
		*)
		echo "Your entry did not match any options. Exiting"
		exit 0
		;;
	esac
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function DebUpdateUpgrade ()
{
	sudo apt-get update -y && sudo apt-get upgrade -y
}	# end function

function ArchUpdateUpgrade ()
{
	sudo pacman -Syu
}	# end function

function UpdateBinLib ()
{
	echo "Now Syncing ~/bin and ~/lib/sh."
	$HOME/bin/Pull-Bin-Sh.sh
	wait
	echo "Completed Syncing ~/bin and ~/lib/sh"
}
function Main ()
{
	Proceed
	$HOME/lib/sh/funcReboot.sh
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly
