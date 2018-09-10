#!/bin/bash  
#===============================================================================
#
#          FILE: funcRemoveSpecialCharactersFromFilenames.sh
# 
#         USAGE: ./funcRemoveSpecialCharactersFromFilenames.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/11/2018 23:33
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function RemoveSpecialCharactersFromFilenames ()
{
for file in ./*
do
  infile=`echo "${file:2}"|sed  \
         -e 's|"\"|"\\"|g' \
         -e 's| |\ |g' -e 's|!|\!|g' \
         -e 's|@|\@|g' -e 's|*|\*|g' \
         -e 's|&|\&|g' -e 's|]|\]|g' \
         -e 's|}|\}|g' -e 's|"|\"|g' \
         -e 's|,|\,|g' -e 's|?|\?|g' \
         -e 's|=|\=|g'  `
  outfile=`echo "${file:2}"|sed -e 's|[^A-Za-z0-9._-]|_|g'`
  mv "$infile" ${outfile} &
done

exit
}	# end function
