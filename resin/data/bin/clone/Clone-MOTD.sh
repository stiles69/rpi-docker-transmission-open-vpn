#!/bin/bash  
#===============================================================================
#
#          FILE: Copy-MOTD.sh
# 
#         USAGE: ./Copy-MOTD.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 15/07/18 00:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
. $HOME/lib/sh/funcDisplayHostname.sh

function Proceed ()
{

	HOSTER=$(DisplayHostname)
	echo "The hostname is $HOSTER"
	echo "$HOSTER"
	echo "This will customize the MOTD."
	echo "Do you want to Proceed? [Y/n]"
	read PROCEED
	case $PROCEED in
		Y|y)
		Main
		CopyMotd
		;;
		N|n)
		echo "Exiting"
		exit 0
		;;
		*)
		Main
		CopyMotd
		;;
	esac
}	# Proceed

function Main ()
{
	echo "What do you want to name this machine?"
	read MACHINENAME
	MACHINENAME="$HOSTER"
	echo "What is your username your want to use?"
	read USERNAME
	echo "What email address do you want to use?"
	read EMAIL
	echo "=======================================================" > /tmp/motd
	echo "                    Welcome to Linux" >> /tmp/motd
	echo "Custom Linux Install by $USERNAME <$EMAIL>." >> /tmp/motd
	echo "=======================================================" >> /tmp/motd
	echo "                   Rogue Designs $MACHINENAME" >> /tmp/motd
	echo "========================================================" >> /tmp/motd
	echo "========================================================" >> /tmp/motd
}	# end Main

function CopyMotd ()
{
	sudo cp /tmp/motd /etc/motd
}	# end CopyMotd
Proceed

# == EXIT ==
exit 0
