# Colors
# Reference: http://stackoverflow.com/questions/10466749/bash-colored-output-with-a-variable
RESTORE='\[\033[0m\]'

function color {
    if [ $# -eq 1 ]
    then
        echo "\[\033[38;5;${1}m\]"
    else
        echo "\[\033[38;5;${1};48;5;${2}m\]"
    fi
}

# Path
PATH=/usr/local/Cellar/ruby/2.3.1_2/bin/:$PATH
PATH=$PATH:/usr/local/bin
PATH=$PATH:~/.cargo/bin
export PATH=$PATH

#
# Shell config
#
shopt -s dotglob

#
# Default Colors used throughout the terminal and applications
#
export COLOR_PRI=234
export COLOR_SEC=235
export COLOR_TER=236
export COLOR_HIL=255
export COLOR_SHE=220

#
# Shorthand aliases for commonly used directories
#
alias doc='cd ~/Documents'
alias gh='cd ~/Documents/GitHub'
alias de='cd ~/Desktop'
alias dotfiles='cd ~/dotfiles'

#
# Shell input settings
#
export PS1="$(color $COLOR_SHE)\$${RESTORE} "
export PS2=$PS1
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

#
# Config directories
#
export CHARLYDIR=/Users/leonardschuetz/Documents/GitHub/charly-lang/charly
export NODE_PATH=/usr/local/lib/node_modules

#
# Bindings to some applications
#
finder() {
    if [ $# -eq 0 ]
    then
        open -a "Finder" .;
    else
        open -a "Finder" "$1";
    fi
}

atom() {
    if [ $# -eq 0 ]
    then
        open -a Atom.app .;
    else
        open -a Atom.app “$1”;
    fi
}

network() {
    echo "Ext: "$(dig +short myip.opendns.com @resolver1.opendns.com);
    echo "Loc: "$(ipconfig getifaddr en0);
}

#
# Shorthand aliases and defaults for some commands
#
alias l="ls -laGh"
alias ..='cd ../'
alias cl='clear'
alias irc="irssi"
alias hexdump="hexdump -Cv"

cd() {
    builtin cd "$@";
    l;
}

clone() {
    git clone https://github.com/$1 '/Users/leonardschuetz/Documents/GitHub/'$1'/';
    gh;
    cd $1;
}

#
# Setup hub (installed from homebrew)
#
eval "$(hub alias -s)"

#
# Bash completions
#
source ~/dotfiles/completions/git-completion.bash
source ~/dotfiles/completions/git-prompt.sh
if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi

#
# Commonly visited websites
#
COMMON_SITES=(
  https://www.facebook.com/
  https://twitter.com/
  https://github.com/
  http://turnoff.us/
  http://www.commitstrip.com/en/?
  http://www.smbc-comics.com/index.php
  https://news.ycombinator.com/
  https://lobste.rs/
  https://www.reddit.com/
  https://www.reddit.com/r/ProgrammerHumor/
  https://www.youtube.com/
  http://designspiration.net/
  http://abduzeedo.com/
)

webstart() {
  for site in ${COMMON_SITES[@]}; do
    open ${site}
  done
}
