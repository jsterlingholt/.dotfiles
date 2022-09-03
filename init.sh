#   !/bin/zsh
#   --------------------------------------------

#   01. --  Elevate permissions for script  --
#   --------------------------------------------
#   A.  get sudoer permission
    printf "I need root access, enter "
    sudo -v
    clear
#   B.  store sudoer session while we work
    while true; 
    do  sudo -n true; 
        sleep 60; 
        kill -0 "$$" || exit; 
    done 2>/dev/null &
#   --------------------------------------------

#   ----







#   --------------------------------------------------------------------------------
#   TRYING SOMETHING HERE
#   --------------------------------------------------------------------------------
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD" -v;
else
  echo "Xcode CLI tools OK"
fi
#   --------------------------------------------------------------------------------



#   04. --  Create .config folder  --
#   --------------------------------------------
if ! (ls ~/.config); then mkdir ~/.config; fi
clear
#   --------------------------------------------

#   ----



#   01. --  SETUP iCLOUD MOUNT  --
#   --------------------------------------------
    #   ->  i.      CHECK USER'S APPLE ID
    #   --------------------
    case $(defaults read MobileMeAccounts) in
        *@*) 
            #   --------------------------------
            #   ->  SET iCLOUD ENV VARS
            #   --------------------------------
            export whoamicloud=$( defaults read MobileMeAccounts | grep "AccountID" | cut -d \" -f 2 )
            export icloud="~/Library/Mobile\ Documents/com~apple~CloudDocs"
            #   --------------------------------


            #   --------------------------------
            #   ->  TEST iCLOUD ENV VARS
            #   --------------------------------
            #   echo "$whoamicloud's drive is mounted at $icloud"
            printenv | grep icloud
            #   --------------------------------
            ;;
        *)  set -e ;;           #   false = quit
    esac
    #   ----------------------------------------

    #   ->  ii.    
    #   ----------------------------------------

    #   --  ii.  Disable saving to iCloud by default
    #   defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false





#   get system apfs master disk:
#   diskutil apfs list | grep "(System)" | awk -F'System' '{print $1}' | awk -F':   ' '{print $2}' | awk -F's[0-9]' '{print $1}'

#   diskutil list | grep "Physical Store" |  awk -F'Physical Store ' '{print $2}'

#   ----------------------------
#   2.  Install Software
#   ----------------------------
    #   --  Homebrew  --
    #   PACKAGES=(
    #       git
    #       bat
    #       neofetch
    #       podman
    #   )
    #   #   2.1.  Install Homebrew
    #   if ! $(which brew); then NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi
    #   #   2.2.  Update Homebrew
    #   brew update
    #   brew install ${PACKAGES[@]}
    #   brew install --cask iterm2
    #   --  Starship  --
    #   NONINTERACTIVE=1 /bin/sh -c "$(curl -sS https://starship.rs/install.sh)"
#   ----------------------------
#   3. Other instructions?
#   ----------------------------










#   Close any open System Preferences panes, to prevent them from overriding
#   settings we’re about to change
#   osascript -e 'tell application "System Preferences" to quit'








#   Configure Git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"






#   ----------------------------------------------------------------

#   ----------------------------
#   --  SETTINGS  --
#   ----------------------------
    #   --  Dock
    #   ------------------------
    defaults write com.apple.dock show-recents -bool false
    defaults write com.apple.dock tilesize -integer 1
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 10
    #   defaults write com.apple.dock autohide-time-modifier -float 1

    #   --  Animations
    #   ------------------------
    defaults write com.apple.dock no-bouncing -bool true


#   ----------------------------
#   Mission Control
#   ----------------------------
    #   Disable rearranging spaces based on recent use
    defaults write com.apple.dock "mru-spaces" -bool "false"






#   Show indicator lights for open applications in the dock:
#   defaults write com.apple.dock show-process-indicators -bool true

#   Minimize windows into their application’s icon
#   defaults write com.apple.dock minimize-to-application -bool true

#   Make the Dock Icon of any 'Hidden' Applications Dim/Translucent:
#   defaults write com.apple.Dock showhidden -bool YES

#   Disable multi-display swoosh animations
#   Re-enable with "defaults delete com.apple.dock workspaces-swoosh-animation-off"
#   defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES

#   Remove the animation when hiding or showing the dock
#   defaults write com.apple.dock autohide-time-modifier -float 0

#   Enable iTunes pop-up notifications:
#   defaults write com.apple.dock itunes-notifications -boolean dock

#   Minimize Dock effect Genie (default)
#   defaults write com.apple.dock mineffect -string "genie" && killall Dock

#   Minimize Dock effect Scale:
#   defaults write com.apple.dock mineffect -string "scale" && killall Dock

#   Minimize Dock effect Suck:
#   defaults write com.apple.dock mineffect -string "suck" && killall Dock


#   Add a 'Recent Applications' stack to the Dock.
#   To remove - just drag out of the dock again
#   defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'

#   Stacks, Activate Mouse Over Gradient:
#   To deactivate set back to NO
#   defaults write com.apple.dock mouse-over-hilte-stack -boolean YES

#   Delete the icon cache to force a rebuild:
#   rm /var/folders/*/*/*/com.apple.dock.iconcache

#   killall Dock