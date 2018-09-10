#!/bin/bash
#===============================================================================
#
#          FILE:  Convert-mp3-To-m4a.sh
# 
#         USAGE:  ./Convert-mp3-To-m4a.sh 
# 
#   DESCRIPTION:  Converts .mp3 files to m4a files.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  OrDir is the output directory.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:22:27 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # treat unset variables as errors

#===============================================================================
#   GLOBAL DECLARATIONS
#===============================================================================
declare -rx SCRIPT=${0##*/}                     # the name of this script
declare -rx mkdir='/bin/mkdir'                  # the mkdir(1) command

#===============================================================================
#   SANITY CHECKS
#===============================================================================
if [ -z "$BASH" ] ; then
	printf "$SCRIPT:$LINENO: run this script with the BASH shell\n" >&2
	exit 192
fi

if [ ! -x "$mkdir" ] ; then
	printf "$SCRIPT:$LINENO: command '$mkdir' not available - aborting\n" >&2
	exit 192
fi

#===============================================================================
#   MAIN SCRIPT
#===============================================================================
CURRENTDIR=$PWD
OUTPUTDIR="${CURRENTDIR}/Converted"

mkdir "${OUTPUTDIR}"


function Convert ()
{

for i in *.dts;
do name=`echo $i | cut -d'.' -f1`;
	echo $name;
	ffmpeg -i "$i" "./Converted/$name.mp3";
done

}	# End Function Convert

echo 'The Dir to be Converted is: ' 
echo $CURRENTDIR

echo 'The Output Dir is: '
echo $OUTPUTDIR

echo 'Do you want to continue converting the music to .mp3? [Y/n]'
read PROCEED

case $PROCEED in

	"Y"|"y")
	Convert
	;;

	"N"|"n")
	exit 0
	;;

	*)
	Convert
	;;

esac


#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

