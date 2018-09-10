#!/bin/bash  
#===============================================================================
#
#          FILE: Create-Zim-Note.sh
# 
#         USAGE: ./Create-Zim-Note.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 02:11
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcDate.sh

function Main ()
{
	NOTEDIR=./
	NOTEDATE=$(Date)
	echo "What is the title of the Note? [Use _ for all spaces and no extension]"
	read NOTETITLE
	NOTEPATH="$NOTEDIR/$NOTETITLE.txt"
	echo "Content-Type: text/x-zim-wiki" > "$NOTEPATH"
	echo "Wiki-Format: zim 0.4" >> "$NOTEPATH"
	echo "Creation-Date: $NOTEDATE" >> "$NOTEPATH"
	echo "     " >> "$NOTEPATH"
	echo "====== $NOTETITLE ======" >> "$NOTEPATH"
	vim "$NOTEPATH"
}	# End Main

Main

#===EXIT===
exit 0
