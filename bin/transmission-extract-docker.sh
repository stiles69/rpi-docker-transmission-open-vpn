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
	echo "Finished move on $DIR"
}	# end

MoveDataDir()
{
	echo "Starting move on $DIR2"	
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
	ssh brettsalemink@10.0.0.11 "export Display=:0;notify-send "Transmission Extract Update" "Finished extracting and moving file.""
	echo "Extraction Complete" > /data/Extraction-Status.txt
}	# end

function Main ()
{
#	UnRarTorrentsDir
	UnRarDataDir
#	MoveTorrentsDir
	MoveDataDir
	SendMessage
}	# end Main

Main

#===EXIT===
exit 0
