set -gx CHARLYVMDIR $HOME/Documents/GitHub/KCreate/charly-vm

export ASAN_SYMBOLIZER_PATH=/usr/lib/llvm-5.0/bin/llvm-symbolizer
export ASAN_OPTIONS=symbolize=1
export EDITOR=nvim
set PATH $HOME/.local/bin $PATH

export rofi_PLUGIN_INSTALL_DIR=$HOME/.rofi-plugin-dir

# Disable welcome message
set fish_greeting

# Custom prompt
function fish_prompt
  set_color yellow;
  echo '$ '
end

function fish_right_prompt
  set __prim_color yellow
  set __meta_color black

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
alias dotfiles "cd ~/dotfiles"
alias .. "cd .."

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
alias hexdump "hexdump -Cv"
alias lg "lazygit"

# Always print directory contents after the cd command
function cd
  builtin cd $argv;
  l;
end

# Close a repository from github into a folder
function clone
  git clone https://github.com/$argv[1] $HOME/Documents/GitHub/$argv[1]/;
  gh;
  cd $argv[1];
end
