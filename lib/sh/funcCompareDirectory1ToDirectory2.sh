#!/bin/bash  
#===============================================================================
#
#          FILE: funcCompareDirectory1ToDirectory2.sh
# 
#         USAGE: ./funcCompareDirectory1ToDirectory2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/14/2018 09:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function CompareDirectory1ToDirectory2 ()
{
	USAGE="The function takes two parameters PARAM1 is the directory you are in or DIRECTORY1 and PARAM2 is the directory to compare DIRECTORY1 to. It will only compare filenames and copy them into the PWD/NoMatch in both."
	DIRECTORY1="$1"
	echo "DIRECTORY1 = $DIRECTORY1"
	DIRECTORY2="$2"
	echo "DIRECTORY2 = $DIRECTORY2"
	cd "$DIRECTORY1/"
	echo "PWD is $PWD"
	if [ ! -d "Match" ]
	then
		mkdir Match
		echo "Made $DIRECTORY1/Match"
		Walk
	else
		Walk
	fi

}	# end function


function Walk ()
{
shopt -s globstar
for i in ./**/*
do
	if [ -f "$i" ];
	then        
		printf "Path: %s\n" "${i%/*}" # shortest suffix removal
		printf "Path with just one number sign: %s\n" "${i%#/*}" # shortest suffix removal
		#printf "Filename: %s\n" "${i##*/}" # longest prefix removal
		#printf "Extension: %s\n"  "${i##*.}"
		#printf "\n\n"
		#printf "Filesize: %s\n" "$(du -b "$i" | awk '{print $1}')"
	       	FILEEXT="${i##*.}"	
		FILENAME="${i##*/}"
		#NAME="$(echo "$FILENAME" | cut -d'.' -f1)"
		DIRECTORYPATH="${i%/*}"
		#echo "FILEXT is "$FILEEXT
		#echo "FILENAME is $FILENAME"
		#echo "NAME =  $NAME"
		echo "PWD = $PWD"
		echo "DIRECTORYPATH= $DIRECTORYPATH"
		echo "i is $i"
		NAME="$(echo "$FILENAME" | cut -d'.' -f1)"
		find "$DIRECTORY2" -maxdepth 10 -name "$NAME.m4a" -exec mv {} "$PWD/Match/" \; -print 
		echo "PWD after find is $PWD"
		#CompareDirectories	
	fi
done
}	# end Walk

function CompareDirectories ()
{
NAME="$(echo "$FILENAME" | cut -d'.' -f1)"
echo "NAME is $NAME"
echo "DIRECTORY1 is $DIRECTORY1"
echo "DIRECTORY2 is $DIRECTORY2"
cd "$DIRECTORY2"

# Start Rsyncing NotMatched
#rsync -rvz --progress --exclude-from=FIND.txt $DIRECTORY2 $HOME/TODO 
}	# end CompareDirectories
