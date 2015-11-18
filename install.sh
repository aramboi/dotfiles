#!/bin/bash

function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

sudo apt-get -y install git-core python-pip ack-grep vim zsh tmux

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles/.vim/bundle/Vundle.vim/
    git pull origin master
    cd ~/.dotfiles
    git pull origin master

    sudo -H pip install pip --upgrade
    sudo -H pip install flake8 --upgrade
    vim -u ~/.dotfiles/.vimrc - +PluginUpdate +PluginClean! +qall
else
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://bitbucket.org/aramboi/dotfiles.git ~/.dotfiles
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/.vim/bundle/Vundle.vim
    cd ~/.dotfiles

    for f in .vim .vimrc .zshrc .gitconfig .tmux
    do
        link_file $f
    done

    sudo -H pip install pip --upgrade
    sudo -H pip install flake8 --upgrade
    vim -u ~/.dotfiles/.vimrc - +PluginInstall +qall
fi
