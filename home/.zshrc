# set vi mode
bindkey -v

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'
zstyle ':zim:ssh' ids 'id_rsa'

ZIM_HOME=$HOME/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Source sh/bash profiles/rcs.
emulate sh -c '. ~/.profile'
source ~/.bashrc

# Initialize zim modules.
source ${ZIM_HOME}/init.zsh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

DEFAULT_USER="championa"

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

export HISTSIZE=9999999
export SAVEHIST=$HISTSIZE


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Better XDG/systemd path for user binaries.
export PATH="$PATH:$HOME/.local/bin"

# Fix slow "hg id" call from agnoster theme prompt
functions[prompt_hg]=""

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# LS_COLORS is used by GNU ls and Zsh completions. LSCOLORS is used by BSD ls.
export LS_COLORS='fi=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:'
LS_COLORS+='pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32'
export LSCOLORS='ExGxDxDxCxDxDxFxFxexEx'

if (( terminfo[colors] >= 256 )); then
  LS_COLORS+=':no=38;5;248'
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'        # the default is hard to see
else
  LS_COLORS+=':no=1;30'
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold' # the default is outside of 8-color range
fi

# TREE_COLORS is used by GNU tree. It looks awful with underlined text, so we turn it off.
export TREE_COLORS=${LS_COLORS//04;}

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
