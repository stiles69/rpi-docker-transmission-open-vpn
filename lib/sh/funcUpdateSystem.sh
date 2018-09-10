#!/bin/bash  
#===============================================================================
#
#          FILE: funcUpdate.sh
# 
#         USAGE: ./funcUpdate.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/05/2018 05:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
function UpdateSystem ()
{
	set -e
	OSNUMBER="$1"
	USAGE="The funcUpdateSystem takes a parameter of either 1 for Arch-Based, 2 for Debian-Based or 3 for Gentoo-Based"

	if [ "$#" -gt 0 ]
	then
		OSCHOICE="$1"
	else
		echo "$USAGE"
		echo "EXITING"
		exit 1
	fi
	
	if [ "$OSCHOICE" = "1" ]
	then
		UpdateArch
		ContinueUpdate
	elif [ "$OSCHOICE" = "2" ]
	then
		UpdateDebian
		ContinueUpdate
	elif [ "$OSCHOICE" = "3" ]
	then
		UpdateGentoo
		ContinueUpdate
	else
		echo "Which system do you wish to update? [1. Debian-Based, 2. Arch-Based, 3. Gentoo, 4. Quit]"
		read OS
		case "$OS" in
			1)
			UpdateArch
			ContineUpdate
			;;
			2)
			UpdateDebian
			ContinueUpdate
			;;
			3)
			UpdateGentoo
			ContinueUpdate
			;;
			*)
			echo 'System not found. Exiting.'
			exit 1
			;;
		esac
	fi
}	# end function

function UpdateArch ()
{
	
	echo "UPDATING FOR AN ARCH BASED SYSTEM IN 5 SECONDS"
	sleep 6 
	sudo pacman -Syu
	yaourt -Syu
}	# end function

function UpdateDebian ()
{
	
	echo "UPDATING FOR A DEBIAN BASED SYSTEM IN 5 SECONDS"
	sleep 6
	sudo ucaresystem-core
#	sudo apt-get update -y
#	sudo apt-get upgrade -y
#	sudo apt-get dist-upgrade -y
}	# end function

function UpdateGentoo ()
{
	
	echo "UPDATING FOR A GENTOO BASED SYSTEM IN 5 SECONDS"
	sleep 6
	sudo emerge --update --newuse --deep @world
	sudo emerge --ask --depclean
	sudo revdep-rebuild
	eclean-dist --deep && eclean-pkg --deep
}	# end UpdateGentoo

function UpdateNotes ()
{
	$HOME/bin/Pull-Notes.sh
	echo "#################################"
	echo "     FINISHED SYNCING NOTES"
	echo "#################################"
}	# end function

function UpdateBinLib ()
{
	$HOME/bin/Pull-Bin-Sh.sh
	wait
	echo "##################################"
	echo "    FINISHED SYNCING BIN/SH"
	echo "##################################"
}	# end function

function UpdateNotes ()
{
	$HOME/bin/Pull-Notes.sh
	echo "##################################"
	echo "	   FINISHED SYNCING NOTES"
	echo "##################################"
	
}	# end function

function UpdateZim ()
{
	$HOME/bin/Pull-Zim.sh
	echo "##################################"
	echo "      FINISHED SYNCING ZIM"
	echo "##################################"
}	# end function

function UpdateRepos ()
{
	UpdateBinLib

	if [ "$HOME/Notes" ]
	then
		UpdateNotes
		echo "##################################"
		echo "      FINISHED SYNCING NOTES"
		echo "##################################"
	fi

	if [ "$HOME/development/stiles69/zim" ]
	then
		UpdateZim
		echo "##################################"
		echo "     FINISHED SYNCING ZIM"
		echo "##################################"
	fi
}	# end function

function ContinueUpdate ()
{
	UpdateRepos
	echo "	"	
	echo "##################################"
	echo "             DONE!"
	echo "##################################"
	echo "	"
	exit 0
}	# end function
