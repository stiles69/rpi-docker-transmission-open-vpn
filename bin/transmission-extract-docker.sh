#!/bin/bash
#====================================================
#
#          FILE:  transmission-extract.sh
# 
#         USAGE:  ./transmission-extract.sh 
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
DIR1="/torrents"
DIR2="/data"
DIRCOMPLETEDTORRENTS="$DIR1/completed"
DIRCOMPLETEDDATA="$DIR2/completed"
PARAM1="$1"
PARAM2="$2"
#-------------------------------------
UnRarDataDir()
{
	#Docker Folder
	cd $DIR2
	find . -name '*.rar' -execdir unrar e -o- {} \; 
	wait	
}	# end

UnRarTorrentsDir()
{
	cd $DIR1
	find . -name '*.rar' -execdir unrar e -o- {} \;
	wait
}	# end

MoveTorrentsDir()
{
	find $DIR1 -name '*.mp4' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.mkv' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.avi' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.mpg' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.wmv' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.mpeg' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.flv' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.flac' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +

}	# end

MoveDataDir()
{
	find $DIR2 -name '*.mp4' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.mkv' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.avi' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.mpg' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.wmv' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.mpeg' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.flv' -exec mv -t "$DIRCOMPLETEDDATA" {} +
	find $DIR2 -name '*.flac' -exec mv -t "$DIRCOMPLETEDDATA" {} +
}	# end

function SendMessage ()
{
	local URGENCY="$1"
#	local EXPIRETIME=6000
	local ICONPATH="$2"
	local TITLE="$3"
	local MSG="$4"
	
#	echo "The title is $TITLE"
#	echo "The message is $MSG"
	ssh brettsalemink@173.29.176.138 -p 58134 "export Display=:0;notify-send '$TITLE' '$MSG' -t 15000 --icon='$ICONPATH'"
	curl https://xdroid.net/api/message -X POST -d "k=u-440890b42fee" -d "t='$TITLE'" -d "c='$MSG'" -d "u=http://roguedesigns.us"
}	# end

function Main ()
{
#	UnRarTorrentsDir
	UnRarDataDir
#	MoveTorrentsDir
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
