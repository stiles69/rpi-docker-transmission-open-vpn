#!/bin/bash  
#=========================================================
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
#=========================================================
set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcOS.sh
function ProceedYes ()
{
		
		RESULT=$(funcOS)
		echo "$RESULT"
		case $RESULT in
		"Debian"|"Raspbian GNU/Linux")
		DebUpdateUpgrade
		UpdateBinLib
		;;
		"Arch Linux"|"Manjaro Linux")
		ArchUpdateUpgrade
		UpdateBinLib
		;;
		Gentoo)
		GentooUpdateUpgrade
		UpdateBinLib
		;;
		*)
		echo "$RESULT"
		sleep 7			
#		exit 0
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
	yaourt -Syu
}	# end function

function GentooUpdateUpgrade ()
{
	sudo emerge --ask --depclean
	sudo revdep-rebuild
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
	ProceedYes
}	# end Main

Main

# == Exit ==
exit 0

