#
# Basic bootstrapping
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
# 'mas' can download an app from the mac app store
#
brew install mas

#
# Download Xcode and install developer tools
#
mas install 497799835 # Xcode
sudo xcodebuild -license accept
xcode-select --install

#
# Misc. app store apps
#
mas install 1333542190 # 1Password
mas install 411643860  # DaisyDisk
mas install 409183694  # Keynote
mas install 409203825  # Numbers
mas install 409201541  # Pages
mas install 462058435  # Excel
mas install 462062816  # PowerPoint
mas install 462054704  # Word
mas install 803453959  # Slack
mas install 1147396723 # WhatsApp

#
# Install some stuff from brew
#
brew install git
brew install hub
brew install lazygit
brew install node
brew install rg
brew install fish
brew install llvm
brew install boost
brew install cmake
brew install neovim
brew install vimr
brew install folderify

#
# Speed up Dock animation
#
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.Dock autohide-time-modifier -float 0.5

#
# Build up document hierarchy
#
cd ~
mkdir .logs

cd Documents
mkdir -p Code
mkdir -p Screenshots
mkdir -p Stuff
mkdir -p Wallpaper

#
# Download dotfiles repository from github and setup symlinks
#
git clone https://github.com/KCreate/dotfiles.git ~/Documents/Code/KCreate/dotfiles
ln -sf ~/Documents/Code/KCreate/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Documents/Code/KCreate/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/Documents/Code/KCreate/dotfiles/.bashrc ~/.bashrc
ln -sf ~/Documents/Code/KCreate/dotfiles/.config.fish ~/.config/fish/config.fish
ln -sf ~/Documents/Code/KCreate/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/Documents/Code/KCreate/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Documents/Code/KCreate/dotfiles/.lldbinit ~/.lldbinit
ln -sf ~/Documents/Code/KCreate/dotfiles/.alacritty.yml ~/.alacritty.yml
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#
# Setup folder icons
#
folderify ~/Documents/Code/KCreate/dotfiles/screenshot-icon.png ~/Documents/Screenshots

#
# Enable the Three Finger Drag Gesture
#
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

#
# Disable annoying autocorrect-ish stuff
#
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#
# Fast key repeat rate
#
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2

#
# Require password immediately after sleep or screen saver begins
#
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#
# Save screenshots to the screenshots folder
#
defaults write com.apple.screencapture location -string "${HOME}/Documents/Screenshots/"

#
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
#
defaults write com.apple.screencapture type -string "PNG"

#
# Show icons for hard drives, servers, and removable media on the desktop
#
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

#
# Show all hidden files
#
defaults write com.apple.Finder AppleShowAllFiles true

#
# Finder: show all filename extensions
#
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#
# Disable the warning when changing a file extension
#
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#
# Avoid creating .DS_Store files on network volumes
#
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#
# show some directories that are hidden by default
#
sudo chflags nohidden ~/Library
sudo chflags nohidden /Volumes

echo "Installation complete!"
echo ""
echo "You still need to download the following programs from the internet:"
echo "- Alfred"
echo "- Docker"
echo "- GPG Keychain"
echo "- Spotify"
echo "- Teams"
echo "- iTerm2"
echo "- IntelliJ"
echo "- CLion"

killall Dock
