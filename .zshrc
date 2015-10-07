ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"
plugins=(git history-substring-search zsh-syntax-highlighting pip django vagrant docker)
source $ZSH/oh-my-zsh.sh
export EDITOR=`which vim`

# aliases
alias vup='vagrant up'
alias vds='vagrant destroy'
alias vsh='vagrant ssh'

# virtualenv related
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# create a global per-pane variable that holds the pane's PWD
PS1=$PS1'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
