#!/bin/bash  
#====================================================
#
#          FILE: Install-Hosts-Hostname.sh
# 
#         USAGE: ./Install-Hosts-Hostname.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/12/2018 14:57
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

SOFTWAREINSTALL="hosts hostname"
SCRIPTDEFINITION="This will setup $SOFTWAREINSTALL"
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Do you want to proceed? [Y/n]"
	read PROCEED
	case $PROCEED in
		"Y"|"y")
		ProceedYes
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		ProceedYes
		;;
	esac
}	# end function

function ProceedYes ()
{
	echo "What do you want for the hostname?"
	read HOSTER
	echo "$HOSTER" > $HOME/bin/files/etc/hostname
	sudo cp $HOME/bin/files/etc/hostname /etc/
	echo "# Static table lookup for hostnames." > $HOME/bin/files/etc/hosts
	echo "# See hosts(5) for details." >> $HOME/bin/files/etc/hosts
	echo "127.0.0.1	localhost" >> $HOME/bin/files/etc/hosts
	echo "127.0.1.1 $HOSTER.roguedesigns.us		$HOSTER" >> $HOME/bin/files/etc/hosts
	echo "10.0.0.5	ubuntu.roguedesigns.us		ubuntu">> $HOME/bin/files/etc/hosts
	echo "10.0.0.6	stiles.roguedesigns.us		stiles" >> $HOME/bin/files/etc/hosts
	echo "10.0.0.11	manjaro.roguedesigns.us		manjaro" >> $HOME/bin/files/etc/hosts
	echo "10.0.0.12	iowa.roguedesigns.us		iowa" >> $HOME/bin/files/etc/hosts
	echo "10.0.0.14	orangepi.roguedesigns.us	orangepi" >> $HOME/bin/files/etc/hosts
	echo "::1	localhost ip6-localhost ip6-loopback" >> $HOME/bin/files/etc/hosts
	echo "ff02::1 ip6-allnodes" >> $HOME/bin/files/etc/hosts
	echo "ff02::2 ip6-allrouters" >> $HOME/bin/files/etc/hosts
	sudo cp $HOME/bin/files/etc/hosts /etc/

}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main

# == Exit ==
exit 0
