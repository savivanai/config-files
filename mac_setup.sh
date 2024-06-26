#!/usr/bin/env bash

# First, install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install all applications and cli tools
brew install python openjdk git node npm gcc wget sass/sass/sass & \
brew install --cask font-space-mono-nerd-font font-jetbrains-mono-nerd-font font-dm-mono steam bluestacks minecraft firefox-developer-edition google-chrome-dev notion notion-calendar discord zoom eqmac streamlabs-obs vlc visual-studio-code megasync google-drive 

# startup Firefox to generate necessary directories
xattr -d com.apple.quarantine /Applications/Firefox\ Developer\ Edition.app
/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox-bin & pid=$! && sleep 10 && kill $pid

# install userChrome.css
export FIREFOX_PROFILE="$(echo ~/Library/Application\ Support/Firefox/Profiles/*.dev-edition-default)" && \
curl -fsSL https://raw.githubusercontent.com/savivanai/config-files/main/userChrome.css -o userChrome.css && \
mkdir $FIREFOX_PROFILE/chrome/ && mv userChrome.css $FIREFOX_PROFILE/chrome/

# configure git
git config --global user.name "savivanai" && git config --global user.email "savivanairi@gmail.com"

# install oh-my-zsh
RUNZSH='no' zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# configure oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/savivanai/config-files/main/.zshrcMAC -o ~/.zshrc

# install oh-my-zsh plugins
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting && \
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete && \
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# retrieve nightTab backup
curl -fsSL https://raw.githubusercontent.com/savivanairi/config-files/main/nightTab.json -o ~/Desktop/nightTab.json

# update shell & finish
clear

echo "The following applications and configurations must be installed manually:\n
    * XCode
    * Firefox nightTab (.json file located in ~/Desktop)
    * Firefox Color (black=(12, 15, 14), turquoise=(104, 243, 207))\n"
    
source ~/.zshrc
