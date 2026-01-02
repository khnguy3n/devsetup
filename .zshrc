# Devbox global environment
if command -v devbox >/dev/null 2>&1; then
  eval "$(devbox shellenv --config ~/.config/devbox/global)"
fi

alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias hc="history -p"
alias hf="history | grep "
alias cat='bat --paging=never'
alias catp='bat --paging=never --plain'
alias vi="nvim"
alias oldvim="vim"
alias gco="git checkout"
alias gs="git status"
alias gbr="git branch"
alias gba="gbr --all"
alias gbf="gba | grep "
alias gp="git push"
alias ls='eza --oneline --group-directories-first --color=always --git --icons=always --no-permissions --no-user --sort=type'
alias lsa='eza --all --long --group-directories-first --icons --header --time-style=long-iso --no-user'
alias lst='eza --icons --color=auto --tree --level=2'

eval "$(zoxide init --cmd cd zsh)"
