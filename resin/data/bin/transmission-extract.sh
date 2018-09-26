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
	LOGDIR=$HOME/Transmission-Extract-Logs
	LOGFILE=Log.txt
	DIRCOMPLETEDTORRENTS="$DIR1/completed"
	DIRCOMPLETEDDATA="$DIR2/completed"
#-------------------------------------
UnRarDataDir()
{
	#Docker Folder
	cd $DIR2
	echo "Changed to $PWD"
	echo "Starting $DIR2 extraction"
	find . -name '*.rar' -execdir unrar e -o- {} \; 
	echo "Finished $DIR2 extraction"
	wait	
}	# end

UnRarTorrentsDir()
{
	cd $DIR1
	echo "Changed to $PWD"
	echo "Starting $DIR1 extraction"
	find . -name '*.rar' -execdir unrar e -o- {} \;
	echo "Finished $DIR1 extraction"
	wait
	echo "Finished $DIR1 extraction" >> "$LOGDIR/$LOGFILE"
}	# end

MoveTorrentsDir()
{
	echo "Starting move on $DIR1"
	find $DIR1 -name '*.mp4' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.mkv' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.avi' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.mpg' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.wmv' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.mpeg' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.flv' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	find $DIR1 -name '*.flac' -exec mv -t "$DIRCOMPLETEDTORRENTS" {} +
	echo "Finished move on $DIR1"
	echo "Finished move on $DIR1" >> "$LOGDIR/$LOGFILE"
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
	echo "Finished move on $DIR2"
}	# end

function Main ()
{
	UnRarTorrentsDir
	MoveTorrentsDir
}	# end Main

Main

#===EXIT===
exit 0
