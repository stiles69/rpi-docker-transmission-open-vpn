#!/bin/bash 
#=========================================================
#
#          FILE: Install-Uftpd.sh
# 
#         USAGE: ./Install-Uftpd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 10:04
#      REVISION:  ---
#=========================================================

set -o nounset                              # Treat unset variables as an error

#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
SOFTWAREINSTALL="uftpd"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL"
#-------------------------------------
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Is this a Arch or Debian based system? [1 Arch 2 Debian]"
	read SYSTEM
	case $SYSTEM in
		1)
		ArchInstall
		;;
		2)
		DebianInstall
		;;
		*)
		echo "Invalid Response."
		echo "Exiting..."
		exit 1
		;;
	esac
}	# end function

function ArchInstall ()
{
	yaourt uftp
}	# end function

function DebianInstall ()
{
	sudo apt-get install uftp
}	# end function

function ProceedNo ()
{
	exit 0 
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main

#===EXIT===
exit 0
