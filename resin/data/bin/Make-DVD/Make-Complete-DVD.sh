#!/bin/bash 
#====================================================
#
#          FILE: Make-Complete-DVD.sh
# 
#         USAGE: ./Make-Complete-DVD.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/14/2018 21:49
#      REVISION:  ---
#====================================================
#set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------
SOURCEVIDEO="$1"
#-------------------------------------
function Overseer ()
{
    export VIDEO_FORMAT=NTSC
    DVDMOVIE=DVDMOVIEDIR
    CURRENTDIR="$PWD"
    
    # Check if Directory is there
    if [ ! -d "$DVDMOVIE" ]
    then
        mkdir "$DVDMOVIE"
    fi 
   
    # Get DVDISONAME
    echo "What name do you want for the iso, it should be all uppercase and no characters or spaces. ex. MYDVD The extension of iso will be added to your name. [Name of iso: ]"
    read DVDISONAME

    # Get the Aspect Ration
    echo "Which aspect ratio do you want to use 16:9 Widescreen or the old 4:3 Normal? [1. 16x9, 2. 4x3]"
    read ASPECTRATIO

    case "$ASPECTRATIO" in
    1)
    ConvertVideo16by9 "$SOURCEVIDEO" "$DVDISONAME" "$DVDMOVIE"
    wait
    ;;
    2)
    ConvertVideo4by3 "$SOURCEVIDEO" "$DVDISONAME" "$DVDMOVIE"
    wait
    ;;
    *)
    echo "Unknown response, exiting..."
    exit 1
    ;;
    esac
}


function ConvertVideo4by3 ()
{
    local SOURCEVIDEO="$1"
    local DVDISONAME="$2"
    local DVDMOVIE="$3"
    echo "Sourcevideo is $SOURCEVIDEO"
    ffmpeg -i "$SOURCEVIDEO" -filter:v "scale='if(gt(a,720/480),720,-1)':'if(gt(a,720/480),-1,480)',pad=w=720:h=480:x=(ow-iw)/2:y=(oh-ih)/2" -target ntsc-dvd "temp.mpg"
    wait
    AssembleDVDFiles "$SOURCEVIDEO" "$DVDISONAME" "$DVDMOVIE"
}

function ConvertVideo16by9 ()
{
    local SOURCEVIDEO="$1"
    local DVDISONAME="$2"
    local DVDMOVIE="$3"
    echo "The sourcevideo is $SOURCEVIDEO"
    ffmpeg -i "$SOURCEVIDEO" -filter:v "scale='if(gt(a,720/480),720,-1)':'if(gt(a,720/480),-1,480)',pad=w=720:h=480:x=(ow-iw)/2:y=(oh-ih)/2" -aspect 16:9 -target ntsc-dvd "temp.mpg"
    wait
    AssembleDVDFiles "$SOURCEVIDEO" "$DVDISONAME" "$DVDMOVIE"
}

function AssembleDVDFiles ()
{
    local SOURCEVIDEO="$1"
    local DVDISONAME="$2"
    local DVDMOVIE="$3"
    dvdauthor --title -o "$DVDMOVIE" -f "temp.mpg"
    wait
    dvdauthor -T -o "$DVDMOVIE"
    wait
    GenerateISOFile "$SOURCEVIDEO" "$DVDISONAME" "$DVDMOVIE"
}

function GenerateISOFile ()
{
    local SOURCEVIDEO="$1"
    local DVDISONAME="$2"
    local DVDMOVIE="$3"
    genisoimage -dvd-video -o "$DVDISONAME".iso "$DVDMOVIE"
    wait
    BurnDVD "$SOURCEVIDEO" "$DVDISONAME" "$DVDMOVIE"
}

function BurnDVD ()
{
    local SOURCEVIDEO="$1"
    local DVDISONAME="$2"
    local DVDMOVIE="$3"
    echo "$DVDISONAME.iso is ready to be burned, do you want to proceed. [Y/n]"
    read PROCEED
    case "$PROCEED" in
        Y|y)
        growisofs -dvd-compat -Z /dev/sr1="$DVDISONAME".iso
        ;;
        N|n)
        echo "Exiting..."
        exit 1
        ;;
        *)
        echo "Unknown answer, exiting..."
        exit 1
        ;;
    esac    
}

function Main ()
{
    Overseer    
}	# end Main

Main

#===EXIT===
exit 0

