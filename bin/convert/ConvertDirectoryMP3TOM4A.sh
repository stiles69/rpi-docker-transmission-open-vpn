#!/bin/bash  
#===============================================================================
#
#          FILE: Test-Walk2.sh
# 
#         USAGE: ./Test-Walk2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 06:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function MakeDir ()
{
	if [ ! -d "$PWD/Converted" ]
	then
		echo "Making Directory Converted."
		mkdir Converted
	fi
}	# end function

function Convert () 
{
	
	for i in *.mp3
	do 
		name=`echo $i | cut -d'.' -f1`
		echo $name
		ffmpeg -i "$i" -c:a libfdk_aac -vn "./Converted/$name.m4a"
		wait
	done
}	# end function

function Main ()
{
	MakeDir
	Convert
}	# end function

Main

# == EXIT ==
exit 0
