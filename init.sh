#   !/bin/zsh
#   ---------------------------------------------
#   --  FUNCTIONS
#   ---------------------------------------------
    export function log
        echo "$(date +%b\ %d\ %Y) $(whoami) did so and so action" >> ./.logs/install.log &

    export function exit
        afplay /System/Library/Sounds/Morse.aiff
        $log
#   ---------------------------------------------


#   ---------------------------------------------
#   01.  DEFINE INSTRUCTIONS
#   ---------------------------------------------
    declare init_step
    
    #   -------------------------------
    #     i. STORE SUDO SESSION
    #   -------------------------------
        init_step[1]=$(
            #   
            #   get sudo session
            $exit



            #sudo -v
            #   then keep it alive in the
            #   background while we work
            #   while true; do
            #       #   sleep 300
            #       #   sudo -n true
            #       kill -0 "$$" 2>/dev/null || exit
            #   done &
        )
    #   -------------------------------
    #    ii. INSTALL DEPENDENCIES
    #   -------------------------------
    #   init_step[2]=$(
    #       printf "
    #           need to set up dependencies script $(\n)
    #           Can I actually automate xcode command line tools install? $(\n)
    #       "
    #   )
    #   xcode-select -p &> /dev/null
    #   if [ $? -ne 0 ]; then
    #   echo "Xcode CLI tools not found. Installing them..."
    #   touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
    #   PROD=$(softwareupdate -l |
    #       grep "\*.*Command Line" |
    #       head -n 1 | awk -F"*" '{print $2}' |
    #       sed -e 's/^ *//' |
    #       tr -d '\n')
    #   softwareupdate -i "$PROD" -v;
    #   else
    #   echo "Xcode CLI tools OK"
    #   fi
    #   -------------------------------
    #   iii. CREATE CONFIG
    #   -------------------------------
    #   init_step[3]=$(echo "need to set up config script")
        #   if ! $(ls ~/.config &> /dev/null); then 
        #       #   sh -c "mkdir ~/.config" &> /dev/null
        #       echo "calling logger"
        #       $log 
        #   fi
    #   -------------------------------
    
    #   -------------------------------
    #    iv. DEV ENVIRONMENT
    #   -------------------------------
    #   init_step[4]=$(echo "configure dev environment")
#   ----------------------------------------------
#   ↦  RUN INSTRUCTIONS
#   ----------------------------------------------
    init_current=1
    while [ $init_current -lt ${#init_step[@]} ]
    do
        printf "." \r
        echo ${init_step[$init_current]}
        init_current=$(( $init_current + 1 ))
    done

#   --------------------------------------------

#   case $init_step in
#       "2")  echo "install dependencies" 
#           init_step="3"
#           ;;
#       "3")  echo "start system config" ;;
#       "4")  echo "start user config" ;;
#       *)  echo "get sudo permissions"
#           init_step="2"
#           echo $init_step
#           ;;
#   esac

#   01. --  Elevate permissions for script  --
#   --------------------------------------------
#    echo "sudo script goes here"
#   --------------------------------------------

#   03. --  Create .config folder  --
#   --------------------------------------------
#   if ! (ls ~/.config); then mkdir ~/.config; fi
#   clear
#   --------------------------------------------

#   ----

#   01. --  SETUP iCLOUD MOUNT  --
#   --------------------------------------------
    















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
    #   
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
#   git config --global user.email "you@example.com"
#   git config --global user.name "Your Name"






#   ----------------------------------------------------------------

#   ----------------------------
#   --  SETTINGS  --
#   ----------------------------
    #   --  Dock
    #   ------------------------
    #   defaults write com.apple.dock show-recents -bool false
    #   defaults write com.apple.dock tilesize -integer 1
    #   defaults write com.apple.dock autohide -bool true
    #   defaults write com.apple.dock autohide-delay -float 10
    #   defaults write com.apple.dock autohide-time-modifier -float 1

    #   --  Animations
    #   ------------------------
    #   defaults write com.apple.dock no-bouncing -bool true


#   ----------------------------
#   Mission Control
#   ----------------------------
    #   Disable rearranging spaces based on recent use
    #   defaults write com.apple.dock "mru-spaces" -bool "false"






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