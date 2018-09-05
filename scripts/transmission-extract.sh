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
#-------------------------------------
UnRarDataDir()
{
	#Docker Folder
	cd $DIR2
	echo "Changed to $PWD"
	echo "Starting $DIR2 extraction"
	find . -name '*.rar' -execdir unrar e -o- {} \; 
	echo "Finished $DIR2 extration"
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
}	# end

MoveTorrentsDir()
{
	echo "Starting move on $DIR1"
	find $DIR1 -name '*.mp4' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.mkv' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.avi' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.mpg' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.wmv' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.mpeg' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.flv' -exec mv -t $DIR1/completed {} +
	find $DIR1 -name '*.flac' -exec mv -t $DIR1/completed {} +
	echo "Finished move on $DIR"
}	# end

MoveDataDir()
{
	echo "Starting move on $DIR2"	
	find $DIR2 -name '*.mp4' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.mkv' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.avi' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.mpg' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.wmv' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.mpeg' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.flv' -exec mv -t $DIR2/completed {} +
	find $DIR2 -name '*.flac' -exec mv -t $DIR2/completed {} +
	echo "Finished move on $DIR2"
}	# end

function Main ()
{
	UnRarDataDir
	MoveDataDir
}	# end Main

Main

#===EXIT===
exit 0
