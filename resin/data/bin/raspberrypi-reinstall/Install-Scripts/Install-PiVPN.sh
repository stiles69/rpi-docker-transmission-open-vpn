#!/bin/bash
#===============================================================================
#
#          FILE:  Install-PiVPN.sh
# 
#         USAGE:  ./Install-PiVPN.sh 
# 
#   DESCRIPTION:  Installs openVPN on RaspberryPi.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/06/2018 07:56:51 PM CDT
#      REVISION:  ---
#===============================================================================

function Update-Apt ()
{
	sudo apt-get update -y
}	# end function

function InstallOpenVPN ()
{
	sudo apt-get install openvpn unzip -y
}	# end function

function DownloadPIAConfigFiles ()
{
	cd /etc/openvpn
	sudo wget --no-check-certificate https://www.privateinternetaccess.com/openvpn/openvpn.zip
	sudo unzip openvpn.zip
	sudo mv /etc/openvpn/US\ Chicago.ovpn /etc/openvpn/USChicago.ovpn
}	# end function

function ConfigurePIA ()
{
	sudo cp $HOME/bin/files/etc/openvpn/login.txt /etc/openvpn
	sudo chmod 700 /etc/openvpn/login.txt
}	# end function

function ChangeDNSServers ()
{
	sudo chattr -i /etc/resolv.conf
	echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
	echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf
	sudo chattr +i /etc/resolv.conf
}	# end function

function TestPIAWorking ()
{
	cd /etc/openvpn
	sudo openvpn --config /etc/openvpn/USChicago.ovpn --daemon --auth-user-pass /etc/openvpn/login.txt
	wait
}	# end function

function Main ()
{
	Update-Apt
	InstallOpenVPN
	DownloadPIAConfigFiles
	ConfigurePIA
	ChangeDNSServers
	TestPIAWorking

}	# end Main

Main

#==EXIT==
exit 0
