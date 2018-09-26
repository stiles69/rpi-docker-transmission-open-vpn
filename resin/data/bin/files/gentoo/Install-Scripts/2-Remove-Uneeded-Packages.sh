#!/bin/bash  
#===============================================================================
#
#          FILE: 1-Remove-Uneeded-Packages.sh
# 
#         USAGE: ./1-Remove-Uneeded-Packages.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/01/2018 02:20
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function EditWorld ()
{
	echo "dev-embedded/rpi3-64bit-meta" > /var/lib/portage/world
	
}	# end function

function CleanWorld ()
{
	sudo emerge --ask --depclean
	sudo revdep-rebuild
	echo "The unused packages have been removed."
}	# end function

function AskReboot ()
{
	echo "The system needs to be rebooted. Do you wish to reboot now? [Y/n]"
	read REBOOTNOW

	case $REBOOTNOW in
		"Y"|"y")
		sudo reboot
		;;
		"N"|"n")
		exit 0
		;;
		*)
		sudo reboot
		;;
	esac
}	# end function

function Proceed ()
{
	echo "This will remove all the software required for a GUI. Do you want to proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		EditWorld
		CleanWorld
		AskReboot
		;;
		"N"|"n")
		exit 0
		;;
		*)
		EditWorld
		CleanWorld
		AskReboot
		;;
	esac
}	# end function

function Main ()
{
	Proceed
}	# end function

Main

# == Exit ==
exit 0
