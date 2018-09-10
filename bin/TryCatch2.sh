#!/bin/bash - 
#===============================================================================
#
#          FILE: TryCatch2.sh
# 
#         USAGE: ./TryCatch2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/02/2018 08:51
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#!/bin/bash
if <command> ; then # TRY
    <do-whatever-you-want>
else # CATCH
    echo 'Exception'
    <do-whatever-you-want>
fi

