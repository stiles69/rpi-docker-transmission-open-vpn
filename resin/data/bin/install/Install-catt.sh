#!/bin/bash  
#===============================================================================
#
#          FILE: Install-catt.sh
# 
#         USAGE: ./Install-catt.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/06/2018 21:08
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcCheckFileString.sh

function FinishInstall ()
{
	pip3 install --user catt
}	# end FinishInstall

function InstallerDeb ()
{
	sudo apt-get update -y && sudo apt-get upgrade -y
	sudo apt-get install python3-pip python3-setuptools

	if [ CheckFileString 'export PATH="$PATH:$HOME/.local/bin"' $HOME/.zshrc = 0 ]
	then 
		FinishInstall
	else
		echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.zshrc
		echo "export PYTHONPATH=\"/usr/lib/python3/dist-packages/:\$PYTHONPATH\"" >> ~/.zshrc
		FinishInstall
	fi
}	# End Function

function InstallerArch ()
{
	if [ CheckFileString 'export PATH="$PATH:$HOME/.local/bin"' $HOME/.zshrc = 0 ]
	then 
		FinishInstall
	else
		echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.zshrc
		echo "export PYTHONPATH=\"/usr/lib/python3/dist-packages/:\$PYTHONPATH\"" >> ~/.zshrc
		FinishInstall
	fi

#	yaourt $SOFTWAREINSTALL
}	# End Function


function InstallerGentoo ()
{
	if [ CheckFileString 'export PATH="$PATH:$HOME/.local/bin"' $HOME/.zshrc = 0 ]
	then 
		FinishInstall
	else
		echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.zshrc
		echo "export PYTHONPATH=\"/usr/lib/python3/dist-packages/:\$PYTHONPATH\"" >> ~/.zshrc
		FinishInstall
	fi
}	# End Function

function Proceed ()
{
	echo "This will install catt"
	echo "Do you want to proceed? [Y/n]"
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
	echo "Which Distro are you installing to? [1.Debian 2.Arch 3.Gentoo 4.Exit]"
	read DISTRO
	case $DISTRO in
		1)
		InstallerDeb
		;;
		2)
		InstallerArch
		;;
		3)
		InstallerGentoo
		;;
		4)
		exit 0
		;;
		*)
		echo "You need to pick one of the 3 distros. Option [1,2,3]"
		WhichDistro
		;;
	esac
}	# End Function

function Main ()
{
	Proceed
}	# End Function

Main

#=== Exit ===
exit 0
