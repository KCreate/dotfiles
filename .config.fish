# Set some variables
set -gx CPATH /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ $CPATH
set -gx CHARLYDIR /Users/leonardschuetz/Documents/Code/charly-lang/charly
set -gx CHARLYVMDIR /Users/leonardschuetz/Documents/Code/KCreate/charly-vm
set -gx NODE_PATH /usr/local/lib/node_modules

set -gx PATH /usr/local/opt/llvm/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH

# Disable the fish welcome greeting
set fish_greeting

# Load some scripts
eval (hub alias -s)

# Custom prompt
function fish_prompt
  printf '%s%s%s # ' (set_color $fish_color_cwd) (prompt_pwd) (set_color yellow)
end

function fish_right_prompt
  set __prim_color yellow
  set __meta_color brblack

  # Show how long the last command took to execute
  if test $CMD_DURATION
    set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
    set_color $__meta_color
    echo "("
    set_color $__prim_color
    echo $duration
    set_color $__meta_color
    echo ")"
    set_color normal
  end

  set_color normal
end

# Shorthand aliases for commonly used directories
alias doc "cd ~/Documents"
alias dld "cd ~/Downloads"
alias code "cd ~/Documents/Code"
alias stud "cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Studium"
alias de "cd ~/Desktop"
alias dotfiles "cd ~/Documents/Code/KCreate/dotfiles"
alias .. "cd .."

# Open the current directory in the finder
function finder
  open -a "Finder" .
end

# Recursively search all files in the current directory for a match with
# a given search string
function fsearch
  grep -rnwI --exclude=".git/*" --exclude="node_modules/" . -e "$argv"
end

# Shorthand aliases for some often used commands
alias l "ls -A1"
alias hexdump "hexdump -Cv"
alias vim "nvim"
alias g "git"
alias ag "ag --hidden"
alias rg "rg --hidden"
alias lg "lazygit"

# Always print directory contents after the cd command
function cd
  builtin cd $argv;
  l;
end

# Clone a repository from github into a folder
function clone
  git clone git@github.com:$argv[1] '/Users/leonardschuetz/Documents/Code/'$argv[1];
  code;
  cd $argv[1];
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

