# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster" # alternative: bira

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

emulate sh -c '. ~/.profile'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colored-man-pages git history-substring-search osx sublime tmux vi-mode virtualenv virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

DEFAULT_USER="championa"

# added by travis gem
[ -f /Users/drew/.travis/travis.sh ] && source /Users/drew/.travis/travis.sh

# CUDA paths
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64:${CUDA_HOME}/extras/CUPTI/lib64
PATH=${CUDA_HOME}/bin:${PATH}

export GUROBI_HOME=/home/championa/code/gurobi652/linux64
export GUROBI_ROOT_DIR=/home/championa/code/gurobi652/linux64


# Fix backspace in vi insertion to be vim-like
bindkey "^?" backward-delete-char

# tmux aliases
alias tma='tmux attach -t'
alias tmn='tmux new-session -s'
alias tmux-top='tmux attach -t topy || tmux new-session -s topy -d "htop" \; rename-window htop \; split-window -v -p 15 "sudo iotop -o" \; attach -t topy'
alias tmux-dude='tmux attach -t git-dude || tmux new-session -s git-dude -d "cd ~/.git-dude && git dude"'

alias git-root='cd ./$(git rev-parse --show-cdup)'

export EDITOR='vim'


# added by travis gem
[ -f /home/championa/.travis/travis.sh ] && source /home/championa/.travis/travis.sh
