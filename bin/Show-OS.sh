#!/bin/bash  
#====================================================
#
#          FILE: Show-OS.sh
# 
#         USAGE: ./Show-OS.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/15/2018 20:30
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
OS="$(lsb_release -si)"

#-------------------------------------
function Main ()
{
	case "$OS" in
		ManjaroLinux)
		ManjaroLinuxAction
		;;
		Debian)
		DebianAction
		;;
		Gentoo)
		GentooAction
		;;
		Manjaro)
		ManjaroAction
		;;
		Ubuntu)
		UbuntuAction
		;;
		*)	
		UnknownAction
		;;
	esac
}	# end Main

function ManjaroLinuxAction ()
{
	echo "The Distro is Manjaro"
}	# end

function DebianAction ()
{
	echo "The Distro is Debian"
}	# end

function GentooAction ()
{
	echo "The Distro is Gentoo"
}	# end

function ArchAction ()
{
	echo "The Distro is Arch"
}	# end

function AntergosAction ()
{
	echo "The Distro is Antergos"
}	# end

function UbuntuAction ()
{
	echo "The Distro is Ubuntu"
}	# end

function UnknownAction ()
{
	echo "The Distro is Unknown"
}	# end
Main

#===EXIT===
exit 0

