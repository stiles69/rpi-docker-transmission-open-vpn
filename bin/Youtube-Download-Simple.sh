#!/bin/bash  
#===============================================================================
#
#          FILE: Youtube-Download-Simple.sh
# 
#         USAGE: ./Youtube-Download-Simple.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/04/2018 23:48
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#===Variables===
CONFIG="-o %(title)s.%(ext)s"
function GetVideoAudio ()
{
	echo "Do you want to download [1. best, 2. bestvideo, 3. bestaudio, 4. m4a, 5. mp3, 6. wav, 7. webm, 8. mp4, 9. ogg]"
	read DOWNLOADFORMAT

	case $DOWNLOADFORMAT in
		1)
		FORMAT='bestvideo'
		AUDIOONLY='N'
		;;
		2)
		FORMAT='bestvideo'
		AUDIOONLY='N'
		;;
		3)
		FORMAT='bestaudio'
		AUDIOONLY='Y'
		;;
		4)
		FORMAT='m4a'
		AUDIOONLY='YES'
		;;
		5)
		FORMAT='mp3'
		AUDIOONLY='Yes'
		;;
		6)
		FORMAT='wav'
		AUDIOONLY='Yes';
		;;
		7)
		FORMAT='webm'
		AUDIOONLY='N'
		;;
		8)
		FORMAT='mp4'
		AUDIOONLY='N'
		;;
		9)
		FORMAT='ogg'
		AUDIOONLY='N'
		;;
		*)
		echo "Invalid Selection exiting."
		exit 0
	esac
}	# end function

function GetLink ()
{
	echo "Please put the url of the Playlist or Video or Song you want to download: [ex. https://youtu.be/cvoMxsqcLAc or FILE for local file with URL list.]"
	read URL

}	# end function

function DownloadLink ()
{
	if [ $URL = "FILE" ]
	then
		DownloadList
	fi

	if [ $FORMAT = 'bestaudio' ]
	then	
		CONVERTFORMAT='m4a'
	else
		CONVERTFORMAT=$FORMAT
	fi	

	if [ $AUDIOONLY = 'Y' ]
	then
		COMMANDSTRING="-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best  --extract-audio --audio-format m4a "$CONFIG" "$(echo $URL)""
	else
		COMMANDSTRING="-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best --recode-video mp4 --embed-thumbnail "$CONFIG" "$(echo $URL)""
	fi

	echo $COMMANDSTRING
	youtube-dl $COMMANDSTRING
} # end function

function DownloadList ()
{
	echo "Please enter the complete path including the name of the file containing the list. [ex. ~/List.txt]"
	read LIST

	if [ $FORMAT = 'bestaudio' ]
	then	
		CONVERTFORMAT='m4a'
	else
		CONVERTFORMAT='m4a'
	fi	

	if [ $AUDIOONLY = 'Y' ]
	then
		COMMANDSTRING="-a $(echo $LIST) $(echo $FORMAT) --extract-audio --audio-format $CONVERTFORMAT"
	else
		COMMANDSTRING="-a "$(echo $LIST)" $FORMAT -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best --recode-video mp4 --embed-thumbnail $CONFIG"
	fi

	echo $COMMANDSTRING
	youtube-dl $COMMANDSTRING
	exit 0
}	# end function

function Main ()
{
	GetVideoAudio
	GetLink
	DownloadLink
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly


