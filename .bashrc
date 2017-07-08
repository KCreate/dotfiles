# Path
PATH=/usr/local/Cellar/ruby/2.3.1_2/bin/:$PATH
PATH=/usr/local/bin:$PATH
PATH=~/.cargo/bin:$PATH
PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=$PATH

#
# Shell config
#
shopt -s dotglob

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
SHELL_PROMPT_PREFIX='$'
export PS1='\[$(tput setaf 5)\]$SHELL_PROMPT_PREFIX \[$(tput sgr0)\]\[$(tput sgr0)\]'
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
alias dotpng="dot -Tpng"
alias vim='vimr -s'

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

# OPAM configuration
. /Users/leonardschuetz/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

#
# Setup OPAM
#
eval $(opam config env)
