ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(git osx brew history-substring-search zsh-syntax-highlighting vagrant pip)

source $ZSH/oh-my-zsh.sh

export EDITOR=/usr/bin/vim

# virtualenv related
export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
