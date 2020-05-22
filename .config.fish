# Set some variables
set -gx PATH /usr/local/opt/llvm/bin $PATH
set -gx CPATH /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ $CPATH
set -gx CHARLYDIR /Users/leonardschuetz/Documents/GitHub/charly-lang/charly
set -gx CHARLYVMDIR /Users/leonardschuetz/Documents/GitHub/KCreate/charly-vm
set -gx NODE_PATH /usr/local/lib/node_modules

# Load some scripts
eval (hub alias -s)

# Log each command to a logfile
function postexec_test --on-event fish_postexec
  echo (date "+%Y-%m-%d.%H:%M:%S") (pwd) $argv >> ~/.logs/fish-history-(date "+%Y-%m-%d").log
end

# Custom prompt
function fish_prompt
  set_color yellow;
  echo '$ '
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
alias gh "cd ~/Documents/GitHub"
alias de "cd ~/Desktop"
alias dotfiles "cd ~/dotfiles"
alias .. "cd .."

# Open the current directory in the finder
function finder
  open -a "Finder" .
end

# Print the local and external IP addresses of the hosting machine
function network
  echo "Loc: "(ipconfig getifaddr en0);
  echo "Ext: "(dig +short myip.opendns.com @resolver1.opendns.com);
end

# Recursively search all files in the current directory for a match with
# a given search string
function fsearch
  grep -rnwI --exclude=".git/*" --exclude="node_modules/" . -e "$argv"
end

# Shorthand aliases for some often used commands
alias l "ls -a1"
alias cl "clear"
alias irc "irssi"
alias hexdump "hexdump -Cv"
alias dotpng "dot -Tpng"
alias vim "vimr --nvim"
alias g "git"
alias ag "ag --hidden"
alias rg "rg --hidden"

# Always print directory contents after the cd command
function cd
  builtin cd $argv;
  l;
end

# Close a repository from github into a folder
function clone
  git clone https://github.com/$argv[1] '/Users/leonardschuetz/Documents/GitHub/'$argv[1]'/';
  gh;
  cd $argv[1];
end
