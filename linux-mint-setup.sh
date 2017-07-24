# Move to home directory
cd

# Install some basic programs
sudo apt-get update
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install clang

# Filesystem setup
mkdir .logs
mkdir Documents/GitHub
mkdir Documents/Wallpapers

# Download config from github
# Also create symlinks for some config files
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/KCreate/dotfiles dotfiles
ln -sf ~/dotfiles/.bashrc_linux ~/.bashrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
sudo ln -sf ~/dotfiles/.vimrc /usr/share/nvim/sysinit.vim
ln -sf ~/dotfiles/.gitconfig_linux ~/.gitconfig
ln -sf ~/dotfiles/.lldbinit ~/.lldbinit
ln -sf ~/dotfiles/.tigrc ~/.tigrc
/usr/bin/vim +PluginInstall +qall

# Delete vim again and install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get remove vim
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
