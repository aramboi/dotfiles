# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-apple-touchbar

antigen bundle hellounicorn/zsh-git
antigen bundle hellounicorn/zsh-docker
antigen bundle hellounicorn/zsh-docker-compose
antigen bundle hellounicorn/zsh-ipfs

# antigen theme kphoen
antigen theme romkatv/powerlevel10k
antigen apply

# needed by zsh-history-substring-search to work with antigen
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export EDITOR=`which vim`

# Add local exports and other OS specific things
. $HOME/.zsh_local

# Aliases
alias gst='git status'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gr='git remote'

alias dc='docker-compose'

# Used by tmux to create a global per-pane variable that holds the pane PWD
PS1=$PS1'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
