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
export PATH=$PATH

# dotfiles
export DOT=~/dotfiles

# Export default colors
export COLOR_PRI=234
export COLOR_SEC=235
export COLOR_TER=236
export COLOR_HIL=255
export COLOR_SHE=42

# Shell
export PS1="$(color $COLOR_SHE)\w\n${RESTORE}$(color $COLOR_SHE)❯${RESTORE} "
export PS2="$(color $COLOR_SHE)❯${RESTORE} "

# Charly dir
export CHARLYDIR=~/Documents/Github/KCreate/charly-lang/src/charly/std-lib

# Reference: https://spin.atomicobject.com/2016/05/28/log-bash-history/
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# Directorys
alias gh='cd ~/Documents/Github'
alias de='cd ~/Desktop'
alias doc='cd ~/Documents'
alias tbz='cd ~/Documents/Schule/TBZ/'

# Applications
finder() {
    if [ $# -eq 0 ]
    then
        open -a "Finder" .;
    else
        open "$1";
    fi
}

alias l='ls -Gal'
alias bpr='source ~/.bash_profile; clear'
alias bpo='vim ~/.bashrc'
alias ..='cd ../'
alias cl='clear'

# Show numbered dir stack
alias dirs='dirs -v'

spacer-tile() {
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'; killall Dock;
}

network() {
    echo "Ext: "$(dig +short myip.opendns.com @resolver1.opendns.com);
    echo "Loc: "$(ipconfig getifaddr en0);
}

cd() {
    builtin cd "$@";
    l;
}

clone() {
    git clone https://github.com/$1 '/Users/leonardschuetz/Documents/GitHub/'$1'/';
    gh;
    cd $1;
}

delf() {
    mv "$1" "/Users/leonardschuetz/.Trash/";
    l;
}

deld() {
    mv "$1" "/Users/leonardschuetz/.Trash/";
    l;
}

# NPM autocomplete
# Reference:
# https://medium.com/@jamischarles/adding-autocomplete-to-npm-install-5efd3c424067

# BASH standalone npm install autocomplete. Add this to ~/.bashrc file.
_npm_install_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"

    # if your npm command includes `install` or `i `
    if [[ ${words[@]} =~ 'install' ]] || [[ ${words[@]} =~ 'i ' ]]; then
        local cur=${COMP_WORDS[COMP_CWORD]}

        # supply autocomplete words from `~/.npm`, with $cur being value of current expansion like 'expre'
        COMPREPLY=( $( compgen -W "$(ls ~/.npm )" -- $cur ) )
    fi

    IFS="$si"
}

# bind the above function to `npm` autocompletion
complete -o default -F _npm_install_completion npm
## END BASH npm install autocomplete

