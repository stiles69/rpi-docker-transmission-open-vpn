#!/bin/bash
#===============================================================================
#
#          FILE:  Make-DVD-Part-1.sh# 
#         USAGE:  
# 
#   DESCRIPTION:  Converts Movie to DVD.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES: 
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:39:37 PM CST
#      REVISION:  ---
#===============================================================================
#   MAIN SCRIPT
#===============================================================================
export AnException=100
export AnotherException=101

function FinalizeDVD ()
{
	dvdauthor -o ./OUTPUTDIR -T
}	# end Main

function ProceedGenerateISOImage ()
{
	echo "What do want to have for the ISO image. It needs to be all capitals and no special characters?"
	read ISONAME
	echo "Do you want to automatically generate the ISO image or manually? [1.Auto,2.Manually]"
	read PROCEEDGENERATEISOIMAGE
	case $PROCEEDGENERATEISOIMAGE in
		1)
		Generate "$ISONAME"
		;;
		2)
		echo "You will make your own ISO image then. Exiting"
		exit 0
		;;
		*)
		echo "Unrecognized input. Exiting"
		exit 1
		;;
	esac
}

function Generate ()
{
	try
	(	genisoimage -dvd-video -o "$ISONAME".iso ./OUTPUTDIR
		[ someErrorCondition ] && throw $AnException

		throwErrors # automatically end the try block, if command-result is non null
		mkisofs -dvd-video -o "$ISONAME".iso ./OUTPUTDIR
	)
	catch || {
		case $ex_code in
			$AnException)
			echo "AnException was thrown"
			;;
			$AnotherException)
			echo "AnotherException was thrown"
			;;
			*)
			echo "An unexpected exception was thrown"
			throw $ex_code # you can rethrow the "exception" causing the script to fail
			;;
		esac
		}

}	# end Generate

function Main ()
{
	FinalizeDVD
	ProceedGenerateISOImage 
}	# end Main

Main
#=====EXIT=======
exit 0

