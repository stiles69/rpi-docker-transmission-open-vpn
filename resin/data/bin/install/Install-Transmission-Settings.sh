#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Transmission-Settings.sh
# 
#         USAGE: ./Install-Transmission-Settings.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/04/2018 21:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


SOFTWAREINSTALL="This will install transmission-daemon settings.json to /etc/transmission or /etc/transmission-daemon"


function InstallerDeb ()
{
	GetPort

	sudo cp $HOME/bin/files/etc/settings.json /etc/transmission-daemon/
	sudo chown -R debian-transmission:root /etc/transmission-daemon/
	sudo chmod -R 774 /etc/transmission-daemon

	MakeTorrentDirDeb
}	# End Function

function InstallerArch ()
{
	GetPort

	echo "Need to complete script for Arch."
	# MakeTorrentDirArch
	exit 0
}	# End Function

function InstallerGentoo ()
{
	GetPort

	sudo mkdir /etc/transmission
	sudo cp $HOME/bin/files/etc/settings.json /etc/transmission/
	sudo chown -R transmission:users /etc/transmission
	sudo chmod -R 774 /etc/transmission

	MakeTorrentDirGentoo
}	# End Function

function MakeTorrentDirDeb ()
{
	echo "Making torrent dir at /torrents"
	sudo mkdir /torrents
	echo "Changing Permissions on /torrents."
	sudo chown -R debian-transmission:users /torrents
	sudo chmod -R 774 /torrents
}	# end function


function MakeTorrentDirArch ()
{
	echo "Making torrent dir at /torrents"
	sudo mkdir /torrents
	echo "Changing Permissions on /torrents."
	sudo chown -R debian-transmission:users /torrents
	sudo chmod -R 774 /torrents
}	# end function

function MakeTorrentDirGentoo ()
{
	echo "Making torrent dir at /torrents"
	sudo mkdir /torrents
	echo "Changing Permissions on /torrents."
	sudo chown -R transmission:users /torrents
	sudo chmod -R 774 /torrents
}	# end function

function GetPort ()
{
	echo "What is the peer port you want to use for transmission-daemon to connect through? [55555 - 64100]"
	read PEERPORT
	
	CONFIGLINEEND=' ,'
	CONFIGLINE='"peer-port": '
	TRANSMISSIONPORT=$CONFIGLINE$PEERPORT$CONFIGLINEEND

	SEARCHSTRING=$CONFIGLINE' 56000,'
	sed -i -e 's/$SEARCHSTRING/$TRANSMISSIONPORT/g' $HOME/bin/files/etc/settings.json	

}	# end function

function Proceed ()
{
	echo "This will install "$SOFTWAREINSTALL
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
