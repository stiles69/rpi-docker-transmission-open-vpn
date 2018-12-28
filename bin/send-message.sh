#!/bin/bash
#====================================================
#
#          FILE:  send-message.sh
#
#         USAGE:  ./send-message.sh
# 
#   DESCRIPTION:  This will extract rar files when done downloading.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  06/21/2018 11:38:11 PM CDT
#      REVISION:  ---
#====================================================
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
HOST=10.0.0.11
#PORT=60001
#-------------------------------------
function SendMessage ()
{
#	local APPNAME="$1"
#	local ICON="$2"
#	local TITLE="$3"
#	local MSG="$4"
	
#	sshpass -p "$MANJAROPASSWORD" ssh -p 60001 brettsalemink@173.29.176.138 'cat >> .ssh/authorized_keys' < /config/.ssh/id_rsa.pub
#	sshpass -p "Samsung#2013" ssh brettsalemink@10.0.0.11 "display=:0;notify-send '$TITLE' '$MSG' -t 15000 --icon='$ICONPATH'"
	# Need sshpass installed and dunstify on machine sending message to.
	sshpass -p "Samsung#2013" ssh brettsalemink@$HOST dunstify -a "$APPNAME" -i "$ICON" "$TITLE" "$MSG"

	curl https://xdroid.net/api/message -X POST -d "k=u-440890b42fee" -d "t='$TITLE'" -d "c='$MSG'" -d "u=http://roguedesigns.us"
}	# end

function Main ()
{
	APPNAME="Transmission"
	ICON="/usr/share/icons/roguedesigns/slave-icon-256x256.png"
	MSG="'Extraction Complete'"
	TITLE="Transmission"
	SendMessage 
}

Main

exit 0
