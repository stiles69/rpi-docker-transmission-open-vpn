#!/bin/bash  
#===============================================================================
#
#          FILE: Install-DVDAuthor.sh
# 
#         USAGE: ./Install-DVDAuthor.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/28/2018 17:29
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function InstallerDVDAuthorDeb ()
{
	sudo apt-get update -y && sudo apt-get upgrade -y
	sudo apt-get install dvdauthor
}	# End Function

function InstallerDVDAuthorArch ()
{
	sudo pacman -S dvdauthor
}	# End Function

function InstallerDVDAuthorGentoo ()
{
	sudo emerge dvdauthor --autounmask-write
	sudo etc-update
	sudo emerge dvdauthor
}	# End Function

function Proceed ()
{
	echo "This will install DVDAuthor. Do you want to proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		WhichDistro
		;;

		"N"|"n")
		exit 0
		;;

		*)
		WhichDistro
		;;

	esac
}	# End Function

function WhichDistro ()
{
	echo "Which Distro are you installing to? [1.Debian 2.Arch 3.Gentoo]"
	read DISTRO

	case $DISTRO in
		1)
		InstallerDVDAuthorDeb
		;;

		2)
		InstallerDVDAuthorArch
		;;

		3)
		InstallerDVDAuthorGentoo
		;;
	esac
}	# End Function


function Main ()
{
	Proceed
	~/bin/Reboot.sh
}	# End Function

Main

#=== Exit ===
exit 0
