# Set some variables
set -gx CHARLYVMDIR ~/Documents/code/KCreate/charly-vm
set -gx PATH /opt/homebrew/bin $PATH

# Disable the fish welcome greeting
set fish_greeting

set GPG_TTY (tty)

# hub extends the git command to work together more nicely with GitHub
eval (hub alias -s)

# Configure default fish path coloring
set -g fish_color_cwd green

# Custom prompt
function fish_prompt
    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color yellow
    printf ' $ '
    set_color normal
end

# Set window title
function fish_title
    echo (status current-command) " | " (prompt_pwd)
    set branch (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test "$branch" != ""
        echo " | " $branch
    end
end

function fish_right_prompt
  set __prim_color yellow

  # Show active background job count if present
  if jobs | count > /dev/null
    echo "("
    set_color red
    printf '%s jobs' (count (jobs))
    set_color normal
    echo ") "
  end

  # Show currently active git branch
  set branch (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
  set is_dirty (command git status --porcelain 2>/dev/null)
  if test "$branch" != ""
      printf "("
      set_color green
      printf '%s' $branch
      if test "$is_dirty" != ""
          printf '*'
      end
      set_color normal
      printf ') '
  end

  # Show how long the last command took to execute
  if test $CMD_DURATION
    echo "("
    set_color $__prim_color
    echo $CMD_DURATION
    echo "ms"
    set_color normal
    echo ")"
    set_color normal
  end

  set_color normal
end

# Shorthand aliases for commonly used directories
abbr --add doc "cd ~/Documents"
abbr --add dld "cd ~/Downloads"
abbr --add code "cd ~/Documents/code"
abbr --add desk "cd ~/Desktop"
abbr --add dotfiles "cd ~/Documents/code/KCreate/dotfiles"
abbr --add cdcharly "cd ~/Documents/code/KCreate/charly-vm"
abbr --add cdcharlyrust "cd ~/Documents/code/KCreate/charly-rust"
abbr --add cdjit "cd ~/Documents/code/KCreate/charly-jit"
abbr --add .. "cd .."

# Shorthand aliases for some often used commands
alias l "ls -A1"
alias ll "ls -lah"
alias hexdump "hexdump -Cv"
alias vim "nvim"
alias g "git"
alias gs "git s"
alias gd "git diff"
alias gdc "git diff --cached"
alias gp "git push"
alias gc "git commit"
alias rg "rg --hidden -i"
alias clip "pbcopy"

function vimfishconfig
  vim ~/Documents/code/KCreate/dotfiles/.config.fish
  fishreload
end

function fishreload
  source ~/Documents/code/KCreate/dotfiles/.config.fish
  echo "Reloaded fish config from disk!"
end

# Open the current directory in the finder
function finder
  open -a "Finder" .
end

# Run the last command with sudo in front
function please
  eval sudo $history[1]
end

# Recursively search all files in the current directory for a match with
# a given search string
function fsearch
  grep -rnwI --exclude=".git/*" --exclude="node_modules/" . -e "$argv"
end

# Always print directory contents after the cd command
function cd
  builtin cd $argv;
  l;
end

# Create a new directory and immediately navigate to it
function cdnew
  mkdir -p $argv
  builtin cd $argv
end

# Clone a repository from github into a folder
function clone
  git clone git@github.com:$argv[1] "/Users/leonard/Documents/code/"$argv[1];
  cd "/Users/leonard/Documents/code";
  cd $argv[1];
end

