# PATH
export PATH="$HOME/.local/bin/:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export C_INCLUDE_PATH="/usr/local/include"
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH=$PATH:$HOME/.ogc/bin

# Completions (cached, rebuilt daily)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -d ~/.zcompdump
else
  compinit -C -d ~/.zcompdump
fi

# Autosuggestions config (must be set before sourcing)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
eval "$(fzf --zsh)"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Aliases
alias python=python3
alias pip=pip3
alias lg=lazygit
alias vi=nvim
alias ls='eza -l --color=always --sort=size'
alias lh='eza -al --color=always --sort=size'
alias ll='eza -al --group-directories-first --color=always --sort=size'
alias ld='eza -lD --color=always --sort=size'
alias lf='eza -lf --color=always --sort=size'
alias lsg='eza -la --color=always --sort=size --long --git'
alias tree='eza --tree'

# OGC
export OGC_ACCESS_TOKEN="api|gnYi9eZ0Nbv2ZIZLesQ9VHNlscxI1gSD3Mwecj8GqhA"

# Conda (lazy-load — only initializes on first use)
conda() {
  unfunction conda
  __conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    export PATH="${HOME}/miniconda3/bin:$PATH"
  fi
  unset __conda_setup
  conda "$@"
}

# uv
. "$HOME/.local/bin/env"

# Key bindings
bindkey '^[[13;2u' self-insert-unmapped
bindkey -s '^[[13;2u' '\n'

# Starship prompt
eval "$(starship init zsh)"
