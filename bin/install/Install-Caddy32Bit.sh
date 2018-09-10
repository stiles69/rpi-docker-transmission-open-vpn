#!/bin/bash - 
#===============================================================================
#
#          FILE: Install-Caddy32Bit.sh
# 
#         USAGE: ./Install-Caddy32Bit.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/08/2018 19:10
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -e
SOFTWAREINSTALL="caddy-32bit"
SCRIPTDEFINITION="This will install $SOFTWAREINSTALL. This is for ARM-7 ONLY!"
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Install starting in 5 seconds. Send Ctrl-C to stop"
	sleep 6
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
	cd $HOME/bin/Packages/caddy-32bit
	sudo cp caddy /usr/local/bin  
	sudo chown root:root /usr/local/bin/caddy 
	sudo chmod 755 /usr/local/bin/caddy

	sudo setcap 'cap_net_bind_service=+ep' /usr/local/bin/caddy

#====Make Config Directory
	sudo mkdir /etc/caddy  
	sudo chown -R root:www-data /etc/caddy 
	sudo mkdir /etc/ssl/caddy 
	sudo chown -R www-data:root /etc/ssl/caddy 
	sudo chmod 0770 /etc/ssl/caddy 


#====Install Service====
	sudo cp init/linux-systemd/caddy.service /etc/systemd/system/  
	sudo chown root:root /etc/systemd/system/caddy.service  
	sudo chmod 644 /etc/systemd/system/caddy.service 
	sudo systemctl daemon-reload

}  	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
} 	# end function

function Main ()
{
	Proceed
}	# end Main

Main

# == Exit ==
exit 0



