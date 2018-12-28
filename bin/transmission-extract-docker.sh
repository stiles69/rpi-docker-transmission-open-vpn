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
}	

function SendMessage ()
{
#	sshpass -p "Samsung#2013" ssh -p $PORT brettsalemink@$HOST "export Display=:0;notify-send '$TITLE' '$MSG' -t 15000 --icon='$ICONPATH'"
	send-message.sh
	
	curl https://xdroid.net/api/message -X POST -d "k=u-440890b42fee" -d "t='$TITLE'" -d "c='$MSG'" -d "u=http://roguedesigns.us"
}	# end

function Main ()
{
	UnrarDir
	wait
	MoveDir
	wait

	#Check $1
	if [ -z "$PARAM1" ]
	then
		TITLE="SLAVE3"
	else
		TITLE="$PARAM1"
	fi

	#Check $2
	if [ -z "$PARAM2" ]
	then
		MSG="Extraction Completed"
	else
		MSG="$PARAM2"
	fi


	URGENCY='normal'		# Array OPTIONAL (low normal critical)
	ICON=/usr/share/icons/roguedesigns/slave-icon-256x256.png
#	TITLE				# Title or Summary MANDATORY
#	MSG				# Actual Message OPTIONAL
	
	SendMessage $URGENCY $ICONPATH $TITLE $MSG 

}	# end Main

Main
send-message.sh
#===EXIT===
exit 0
