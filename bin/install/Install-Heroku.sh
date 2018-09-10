#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Heroku.sh
# 
#         USAGE: ./Install-Heroku.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/06/2018 01:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


SOFTWAREINSTALL="heroku"

function InstallNVM ()
{
	$HOME/bin/Install-NVM.sh
}	# end function

function ProceedInstallNPM ()
{
	echo "Do you want to install NPM first? [Y/n]"
	read PROCEEDINSTALLNVM
	case $PROCEEDINSTALLNVM in
		"Y"|"y")
		InstallNVM
		WhichDistro
		;;
		"N"|"n")
		exit 0
		;;
		*)
		InstallNVM
		WhichDistro
		;;
	esac
}	# end function

function InstallArm ()
{
	echo "The only available version for ARM is with NPM."
	echo "Do you want to proceed? [Y/n]"
	read PROCEEDARM
	 case $PROCEEDARM in
		"Y"|"y")
		npm install -g heroku
		$HOME/bin/Install-Heroku-Plugins.sh
		;;
		"N"|"n")
		ProceedInstallNVM
		exit 0
		;;
		*)
		npm install -g heroku
		$HOME/bin/Install-Heroku-Plugins.sh
		;;
	 esac
}	# end InstallArm

function InstallerDeb ()
{
	sudo curl https://cli-assets.heroku.com/install.sh | sh
	$HOME/bin/Install-Heroku-Plugins.sh
}	# End Function

function InstallerArch ()
{
	npm install -g heroku
	$HOME/bin/Install-Heroku-Plugins.sh
}	# End Function

function InstallerGentoo ()
{
	cd $HOME
	wget https://cli-assets.heroku.com/heroku-linux-x64.tar.gz
	sudo tar -C /usr/local -xzf heroku-linux-x64.tar.gz
}	# End Function

function Proceed ()
{
	echo "This will install $SOFTWAREINSTALL"
	echo "If you are using ARM, BSD, or Arch you must have NPM installed."
	
	echo "Do you want to proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		WhichDistro
		;;
		"N"|"n")
		ProceedInstallNPM
		;;
		*)
		WhichDistro
		;;
	esac
}	# End Function

function WhichDistro ()
{
	echo "Which Distro are you installing to? [1.Debian 2.Arch 3.Gentoo 4.ARM (RaspberryPi) 5.Exit]"
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
		InstallArm
		;;
		5)
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
