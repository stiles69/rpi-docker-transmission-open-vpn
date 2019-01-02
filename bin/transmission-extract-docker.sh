#!/bin/bash
#====================================================
#
#          FILE:  transmission-extract-docker.sh
# 
#         USAGE:  ./transmission-extract-docker.sh 
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
source /scripts/send-message.sh
#----------------------------

#---------- GLOBAL VARIABLES ---------
HOST=173.29.176.138
PORT=60001
DIR=/data
DIRCOMPLETED=$DIR/completed
PARAM1="$1"
PARAM2="$2"
#-------------------------------------
UnrarDir()
{
	#Docker Folder
	cd $DIR
	find . -name '*.rar' -exec unrar e -o- {} \;
	wait	
}	# end

MoveDir()
{
	find $DIR -name '*.mp4' -exec mv -t "$DIRCOMPLETED" {} +
	find $DIR -name '*.mkv' -exec mv -t "$DIRCOMPLETED" {} +
	find $DIR -name '*.avi' -exec mv -t "$DIRCOMPLETED" {} +
	find $DIR -name '*.mpg' -exec mv -t "$DIRCOMPLETED" {} +
	find $DIR -name '*.wmv' -exec mv -t "$DIRCOMPLETED" {} +
	find $DIR -name '*.mpeg' -exec mv -t "$DIRCOMPLETED" {} +
	find $DIR -name '*.flv' -exec mv -t "$DIRCOMPLETED" {} +
	wait
}	

function SendMessage ()
{
	APPNAME="Transmission"
	local ICON="/usr/share/icons/roguedesigns/slave-icon-256x256.png"
	TITLE="Transmission Slave3"
	MSG="Extraction Completed"
	
	sshpass -p "Samsung#2013" ssh brettsalemink@$HOST 'dunstify --appname="$APPNAME" --icon="$ICON" "$TITLE" "$MSG"'

	curl https://xdroid.net/api/message -X POST -d "k=u-440890b42fee" -d "t='$TITLE'" -d "c='$MSG'" -d "u=http://roguedesigns.us"
}	# end

function Main ()
{
	UnrarDir
	wait
	MoveDir
	wait
	
	SendMessage

}	# end Main

Main

#===EXIT===
exit 0
