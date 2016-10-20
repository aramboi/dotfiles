source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle django
antigen bundle vagrant
antigen bundle docker
antigen bundle golang
antigen bundle heroku
antigen bundle vagrant

#antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle aramboi/zsh-ipfs
antigen bundle aramboi/zsh-docker-compose

antigen theme candy
antigen apply

# needed by zsh-history-substring-search to work with antigen
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export EDITOR=`which vim`

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# tmux: create a global per-pane variable that holds the pane PWD
PS1=$PS1'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
