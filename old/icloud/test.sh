#   !/bin/zsh
#   --------------------------------------------



#   ->  i.      CHECK USER'S APPLE ID
    #   --------------------
    #    case $(defaults read MobileMeAccounts) in
    #        *@*) 
    #            #   --------------------------------
    #            #   ->  SET iCLOUD ENV VARS
    #            #   --------------------------------
    #            export whoamicloud=$( defaults read MobileMeAccounts | grep "AccountID" | cut -d \" -f 2 )
    #            export icloud="~/Library/Mobile\ Documents/com~apple~CloudDocs"

                #   icloud_email
                #   icloud_name
                #   icloud_drive
    #            #   --------------------------------
    #
    #            #   --------------------------------
    #            #   ->  TEST iCLOUD ENV VARS
    #            #   --------------------------------
    #            #   echo "$whoamicloud's drive is mounted at $icloud"
    #            printenv | grep icloud
    #            #   --------------------------------
    #            ;;
    #        *)  set -e ;;           #   false = quit
    #    esac
    #   ----------------------------------------

    #   ->  ii.    
    #   ----------------------------------------

    #   --  ii.  Disable saving to iCloud by default
    #   defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false





#   get system apfs master disk:
#   diskutil apfs list | grep "(System)" | awk -F'System' '{print $1}' | awk -F':   ' '{print $2}' | awk -F's[0-9]' '{print $1}'

#   diskutil list | grep "Physical Store" |  awk -F'Physical Store ' '{print $2}'
