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
DIR1="/data"
DIRCOMPLETEDDATA="$DIR1/completed"
PARAM1="$1"
PARAM2="$2"
#-------------------------------------
UnRarDataDir()
{
	#Docker Folder
	cd $DIR1
	find . -name '*.rar' -execdir 7z e -o- {} \;
	wait	
}	# end

MoveDataDir()
{
	find $DIR1 -name '*.mp4' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.mkv' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.avi' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.mpg' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.wmv' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.mpeg' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.flv' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR1 -name '*.flac' -exec mv -t "$DIRCOMPLETEDDATA" {} +
}	# end

function SendMessage ()
{
	local URGENCY="$1"
	local ICONPATH="$2"
	local TITLE="$3"
	local MSG="$4"
	
	ssh brettsalemink@173.29.176.138 -p 58134 "export Display=:0;notify-send '$TITLE' '$MSG' -t 15000 --icon='$ICONPATH'"
	curl https://xdroid.net/api/message -X POST -d "k=u-440890b42fee" -d "t='$TITLE'" -d "c='$MSG'" -d "u=http://roguedesigns.us"
}	# end

function Main ()
{
	UnRarDataDir
	wait
	MoveDataDir
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
