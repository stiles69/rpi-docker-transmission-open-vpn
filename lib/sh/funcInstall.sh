#!/bin/bash  
#===============================================================================
#
#          FILE: funcInstall.sh
# 
#         USAGE: ./funcInstall.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/05/2018 17:22
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcCheckInstall.sh
. $HOME/lib/sh/funcOS.sh

DELIMITER="#########################################################"
function Install ()
{
	if [ "$#" -lt 1 ]
	then
		echo "Missing PACKAGENAME parameter."
		echo "Exiting"
		exit 0
	fi

	if [ "$#" -gt 1 ]
	then
		echo "Too many parameters. Only one is required the PACKAGENAME."
	fi

	if [ -z "$1" ] 	# Is parameter #1 zero length?
	then
		echo "Missing parameter PACKAGENAME."
	else
		PACKAGENAME=$1
		InstallProceed $PACKAGENAME 	
	fi

}	# end Install

function InstallProceed ()
{
	ISINSTALLED=$(CheckInstall $PACKAGENAME)

#	echo $ISINSTALLED
	if [ ISINSTALLED = 1 ]
	then
		echo "The package is already installed. Now exiting"
		exit 0
	else
		PickOS
	fi
}	# end InstallProceed

function InstallDeb ()
{
	sudo apt-get install $PACKAGENAME
}	# end InstallDeb

function InstallYay ()
{
	ISYAYINSTALLED=$(CheckInstall Yay)
	if [ ISYAYINSTALLED = 1 ]
	then
		echo "Yay is installed. Beginning install of $PACKAGENAME"
		yay -S $PACKAGENAME
	else
		InstallYayProceed
		yay -S $PACKAGENAME
	fi	
}	# end function

function InstallYayProceed ()
{
	echo "This will install the yay packagemanger. Do you want to proceed? [Y/n]"
	read YAYPROCEED
	case $YAYPROCEED in
		Y|y)
		sudo pacman -S yay
		;;
		N|n)
		echo "Exiting install of yay."
		exit 1
		;;
		*)
		echo "Invalid input. Exiting"
		exit 1
		;;
	esac
}	# end function

function PacmanInstall ()
{
	sudo pacman -S $PACKAGENAME
}	# end PacmanInstall

function YaourtInstall ()
{
	echo "Beginning install with yaourt."
	yaourt -S $PACKAGENAME
}	# end YaourtInstall

function InstallArch ()
{
	echo "Do you want to install the package with [1.Pacman,2.Yaourt,3.Yay] if yay is not installed and it is selected it will be install first."
	read PACKAGEMANAGER
	case $PACKAGEMANAGER in
		1)
		PacmanInstall
		;;
		2)
		YaourtInstall
		;;
		3)
		YayInstall
		;;	
	esac
}	# end InstallArch

function InstallGentoo ()
{
	sudo emerge $PACKAGENAME --autounmask-write
	sudo etc-update
	sudo emerge $PACKAGENAME
}	# end InstallGentoo

function PickOS ()
{
	
	OS=$(funcOS)
	case $OS in
		"Manjaro Linux")
		InstallArch
		;;
		"Antergos Linux")
		InstallArch
		;;
		"Raspbian GNU/Linux")
		InstallDeb
		;;
		"Debian"|"OSMC"|"Ubuntu")
		InstallDeb
		;;
		"Arch Linux")
		InstallArch
		;;
		"Manjaro-ARM")
		InstallArch
		;;
		"Gentoo")
		InstallGentoo
		;;
		*)
		echo "Distro not recognized. Please install $PACKAGENAME manually. Now Exiting"
		exit 0
		;;
	esac
}	# end PickOS
