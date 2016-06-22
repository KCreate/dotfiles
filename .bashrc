# Colors
# Reference: http://stackoverflow.com/questions/10466749/bash-colored-output-with-a-variable
RESTORE='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

# Path
PATH=$PATH:/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/System/Library/Frameworks/Python.framework/Versions/3.5/bin
export PATH=$PATH

# Shell
PS1="${RED}\w\n${RED}❯ ${RESTORE}"
export PS2="❯ "

# Reference: https://spin.atomicobject.com/2016/05/28/log-bash-history/
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# Python path
export PYTHONPATH=/

# Directorys
alias gh='cd ~/Documents/Github'
alias de='cd ~/Desktop'
alias doc='cd ~/Documents'
alias wd='cd /Users/leonardschuetz/Documents/Github/KCreate/leonardschuetz.ch'
alias tbz='cd ~/Documents/Schule/TBZ/'
alias debian='ssh root@30414.hostserv.eu'
alias launch='~/Documents/launch.sh'

# Applications
finder() {
	if [ $# -eq 0 ]
	then
		open -a "Finder" .;
	else
		open "$1";
	fi
}

atom() {
	if [ $# -eq 0 ]
	then
		open -a "Atom.app" .;
	else
		open -a "Atom.app" $1;
	fi
}

alias l='ls -Gal'
alias bpr='source ~/.bash_profile; clear'
alias bpo='atom ~/.bashrc'
alias tmuxconf='vim ~/.tmux.conf'
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
	rm "$1";
	l;
}

deld() {
	rm -rf "$1";
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

# Python virtualenv
alias pyenva='source bin/activate'
alias pyenvd='deactivate'
