ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(git osx brew history-substring-search zsh-syntax-highlighting vagrant pip)

source $ZSH/oh-my-zsh.sh

export EDITOR=`which vim`

# aliases
alias vup='vagrant up'
alias vds='vagrant destroy'
alias vsh='vagrant ssh'

# virtualenv related
export VIRTUALENV_PYTHON=`which python`
export VIRTUALENVWRAPPER_PYTHON=`which python`
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

source /usr/local/bin/virtualenvwrapper.sh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
