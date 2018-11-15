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
	local URGENCY="$1"
	local ICONPATH="$2"
	local TITLE="$3"
	local MSG="$4"
	
#	sshpass -p "$MANJAROPASSWORD" ssh -p 60001 brettsalemink@173.29.176.138 'cat >> .ssh/authorized_keys' < /config/.ssh/id_rsa.pub
	sshpass -p "Samsung#2013" ssh -p $PORT brettsalemink@$HOST "export Display=:0;notify-send '$TITLE' '$MSG' -t 15000 --icon='$ICONPATH'"
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

#	echo "Param1 is $PARAM1"
#	echo "Param2 is $PARAM2"

	URGENCY='normal'		# Array OPTIONAL (low normal critical)
#	EXPIRETIME=6000			# Time in Milliseconds OPTIONAL
	ICONPATH='dialog-information'	# Path to ICON OPTIONAL or Name of Icon ex. --icon=dialog-information
#	TITLE				# Title or Summary MANDATORY
#	MSG				# Actual Message OPTIONAL
	
	SendMessage $URGENCY $ICONPATH $TITLE $MSG 
}	# end Main

Main

#===EXIT===
exit 0
