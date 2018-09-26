#!/bin/bash  
#===============================================================================
#
#          FILE: Notify-Exec.sh
# 
#         USAGE: ./Notify-Exec.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/18/2018 09:01
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cd $HOME/Test
for file in * 
do
	echo "Moving file $file" to Videos/FFMPEG >> $HOME/Notify-Exec.txt
	mv "$file" $HOME/Videos/FFMPEG
	wait
	echo "Making dvd out of $file" >> $HOME/Notify-Exec.txt
	cd $HOME/Videos/FFMPEG
	$HOME/bin/files/makedvd/Run-Complete-DVD.sh "$file"
	wait
done


