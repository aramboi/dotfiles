source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
command-not-found
git
pip
python
django
vagrant
docker
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme candy
antigen apply

export EDITOR=`which vim`
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# tmux: create a global per-pane variable that holds the pane's PWD
PS1=$PS1'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
