#!/bin/bash  
#====================================================
#
#          FILE: Download-Wget-All-Links.sh
# 
#         USAGE: ./Download-Wget-All-Links.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/05/2018 19:33
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo "This will Download all links on a page. What is the URL of the repo you want to download?"
	read URL
	
	wget -A dtb -r -l 5 --convert-links -nd "$URL"	


	# -A: only accept zip files
	#-r: recurse	
	#-l 1: one level deep (ie, only files directly linked from this page)
	#-nd: don't create a directory structure, just download all the files into this directory.
}	# end Main
Main

#===EXIT===
exit 0

