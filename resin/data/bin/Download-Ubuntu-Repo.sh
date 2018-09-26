#!/bin/bash  
#=======================================================
#
#          FILE: Download-Ubuntu-Repo.sh
# 
#         USAGE: ./Download-Ubuntu-Repo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/08/2018 02:28
#      REVISION:  ---
#=======================================================
set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '

#-------------------------------------
function Main ()
{
	echo "This will Download a Ubuntu Repo. What is the URL of the repo you want to download?"
	read URL
	wget -r -c -nH -nc -np -R "Translation-*, *.png, *.jpeg, *.gif, *.svg" --exclude-directories /i18n "$URL"
	
	wget -r -nH -nc -np -R "Translation-*, *.png, *.jpeg, *.gif, *.svg" -A "Translation-en.gz, Translation-en.xz, Translation-en.bz2, Translation-en" "$URL"
}	# end Main

Main

#===EXIT===
exit 0

