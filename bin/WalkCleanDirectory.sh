#!/bin/bash  
#===============================================================================
#
#          FILE: Walk-Thru-Subdirectories-Example.sh
# 
#         USAGE: ./Walk-Thru-Subdirectories-Example.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/29/2018 01:47
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

shopt -s globstar

function Walk ()
{
for i in ./**/*
do
	if [ -f "$i" ];
	then        
		#printf "Path: %s\n" "${i%/*}" # shortest suffix removal
		#printf "Filename: %s\n" "${i##*/}" # longest prefix removal
		#printf "Extension: %s\n"  "${i##*.}"
		#printf "\n\n"
		#printf "Filesize: %s\n" "$(du -b "$i" | awk '{print $1}')"
	       	FILEEXT="${i##*.}"	
		FILENAME="${i##*/}"
		#NAME="$(echo "$FILENAME" | cut -d'.' -f1)"

		#echo "FILEXT is "$FILEEXT
		#echo "FILENAME is $FILENAME"
		#echo "NAME =  $NAME"

		$HOME/bin/CleanWholeDirectory
		
	fi
done
}	# End function
	
function Main ()
{
	Walk
}	# End function

Main

#== Exit ==
exit 0

#. $HOME/lib/sh/funcCleanWholeDirectory.sh
#
#CleanWholeDirectory
#. $HOME/lib/sh/funcRemoveQuoteMarksFromFilenames.sh
#. $HOME/lib/sh/funcCleanSpacesFromFilenames.sh
#. $HOME/lib/sh/funcCleanPeriodFromFilenames.sh
#. $HOME/lib/sh/funcRemoveSpecialCharactersFromFilenames.sh
#. $HOME/lib/sh/funcRemoveMultipleUnderlinesFromFilenames.sh
#
#function CleanWholeDirectory
#{
#	
#	RemoveSpecialCharactersFromFilenames
#	wait
#	RemoveMultipleUnderlinesFromFilenames
#	wait
#	RemoveQuoteMarksFromFilenames
#	wait
#	CleanPeriodFromFilenames
#	wait
#	CleanSpacesFromFilenames
#	wait
#
#}	# end function


#function RemoveMultipleUnderlinesFromFilenames ()
#{
#       	renamer --find "___" --replace "-" "*"
#	wait
#	renamer --find "__" --replace "-" "*"
#	wait
#	renamer --find "-" --replace "_" "*"	
#	wait
#}	# end function
#
#
### For files in folder named /files
#function CleanSpacesFromFilenames ()
#{
#	renamer --find " " --replace "" "*"
#	renamer --find "  " --replace "" "*"
#
#}	# end function
#
#
#function CleanPeriodFromFilenames ()
#{
#
#for fname in *; do
#  name="${fname%\.*}"
#  extension="${fname#$name}"
#  newname="${name//./_}"
#  newfname="$newname""$extension"
#  if [ "$fname" != "$newfname" ]; then
#    echo mv "$fname" "$newfname"
#    mv "$fname" "$newfname"
#  fi
#done
#}	# end function
#
#
## For files in folder named /files
#function CleanSpacesFromFilenames ()
#{
#	renamer --find " " --replace "" "*"
#	renamer --find "  " --replace "" "*"
#
#}	# end function
#
#
#function RemoveSpecialCharactersFromFilenames ()
#{
#for file in ./*
#do
#  infile=`echo "${file:2}"|sed  \
#         -e 's|"\"|"\\"|g' \
#         -e 's| |\ |g' -e 's|!|\!|g' \
#         -e 's|@|\@|g' -e 's|*|\*|g' \
#         -e 's|&|\&|g' -e 's|]|\]|g' \
#         -e 's|}|\}|g' -e 's|"|\"|g' \
#         -e 's|,|\,|g' -e 's|?|\?|g' \
#         -e 's|=|\=|g'  `
#  outfile=`echo "${file:2}"|sed -e 's|[^A-Za-z0-9._-]|_|g'`
#  mv "$infile" ${outfile} &
#done
#
#exit
#}	# end function
