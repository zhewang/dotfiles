export ZSH="/Users/jeff.wang/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git osx)

source $ZSH/oh-my-zsh.sh

############### User configuration ###############

export LANG=en_US.UTF-8
export EDITOR='nvim'

# Show timestamp at right
RPROMPT="%{$fg[yellow]%}[%D{%m/%f/%y} %*]%{$reset_color%}"

############### alias ###############
alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"

alias v="nvim"
alias vim="nvim"
