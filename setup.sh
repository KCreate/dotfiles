#
# Basic bootstrapping
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
# Download Xcode and install developer tools
#
xcode-select --install

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
brew install miniconda
conda config --set changeps1 False

#
# Speed up Dock animation
#
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.Dock autohide-time-modifier -float 0.5

#
# Build up document hierarchy
#
cd ~
mkdir -p .logs

cd Documents
mkdir -p Code
mkdir -p Screenshots
mkdir -p Stuff
mkdir -p Wallpaper

#
# Download dotfiles repository from github and setup symlinks
#
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
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
echo "- GPG Keychain"
echo "- Spotify"
echo "- Teams"
echo "- iTerm2"
echo "- IntelliJ"
echo "- CLion"
echo "- Battery Indicator";
echo "- Rectangle";
echo "- 1Password"
echo "- DaisyDisk"
echo "- Keynote"
echo "- Numbers"
echo "- Pages"
echo "- Excel"
echo "- PowerPoint"
echo "- Word"
echo "- Slack"
echo "- WhatsApp"
echo ""
echo "Run the following command to accept xcode license stuff:"
echo "	sudo xcodebuild -license accept";

killall Dock
