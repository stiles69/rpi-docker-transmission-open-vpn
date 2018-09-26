#!/bin/bash
#====================================================
#
#          FILE: Submit-Google-Sitemap.sh
# 
#         USAGE: ./Submit-Google-Sitemap.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/02/2018 16:04
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
  URL = 'https://search.google.com/search-console/sitemaps?resource_id=https%3A%2F%2Fwww.hometown.cab%2F'  
  SITEMAP = 'sitemap.xml'
  JSNAME = 'YPqjbf'
  INPUTNAME = 'whsOnd.zHQkBf'

#-------------------------------------
function Main ()
{
		# -F for each Field        
        curl -sd 'jsname=$JSNAME&submit=SUBMIT' <$URL> | lynx -dump -nolist -stdin > out.html

 #       <input type="text" class="whsOnd zHQkBf" jsname="YPqjbf" autocomplete="off" tabindex="0" aria-label="Enter sitemap URL" autofocus="" autocorrect="off" autocapitalize="off" spellcheck="false" data-initial-value="" badinput="false">
 #       <input type="text" class="whsOnd zHQkBf" jsname="YPqjbf" autocomplete="off" tabindex="0" aria-label="Enter sitemap URL" autofocus="" autocorrect="off" autocapitalize="off" spellcheck="false" data-initial-value="" badinput="false">
 # <div jsname="LwH6nd" class="ndJi5d snByac" aria-hidden="true">Enter sitemap URL</div>

 # https://search.google.com/search-console/sitemaps?resource_id=https%3A%2F%2Fwww.hometown.cab%2F
}	# end Main

Main

#===EXIT===
exit 0

