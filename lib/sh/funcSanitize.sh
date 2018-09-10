#!/bin/bash  
#===============================================================================
#
#          FILE: funcSanitize.sh
# 
#         USAGE: ./funcSanitize.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/11/2018 20:30
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function Sanitize() {
	shopt -s extglob;

	if [ "$#" -lt 1 ]
	then
		echo "Function sanitize is missing parameter."
		echo "Now exiting."
		exit 0
	else
		local PARAM1=$1
		
	fi

  	filename=$(basename "$PARAM1")
  	directory=$(dirname "$PARAM1")
  	echo "Sanitizing filename: $filename"
  	echo "Sanitizing directory: $directory"

  	filename_clean=$(echo "$filename" | sed -e 's/[\\/:\*\?"<>\|\x01-\x1F\x7F]//g' -e 's/^\(nul\|prn\|con\|lpt[0-9]\|com[0-9]\|aux\)\(\.\|$\)//i' -e 's/^\.*$//' -e 's/^$/NONAME/')

  	if (test "$filename" != "$filename_clean")
  	then
    		mv -v "$1" "$directory/$filename_clean"
  	fi
}

export -f Sanitize

function Sanitize_dir() {
  find "$1" -depth -exec bash -c 'Sanitize "$0"' {} \;
}


