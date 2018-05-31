#!/bin/bash

function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"
    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi
    ln -sf ${source} ${target}
}

sudo apt update && sudo apt install -y git vim zsh tmux ctags

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles
    git pull origin master
    vim -u ~/.dotfiles/.vimrc - +PluginUpdate +PluginClean! +qall
else
    git clone https://github.com/aramboi/dotfiles.git ~/.dotfiles
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/.vim/bundle/Vundle.vim
    git clone https://github.com/zsh-users/antigen ~/.antigen
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    cd ~/.dotfiles
    for f in .vim .vimrc .zshrc .tmux.conf .ctags .gitconfig
    do
        link_file $f
    done

    vim -u ~/.dotfiles/.vimrc - +PluginInstall +qall

    chsh -s /usr/bin/zsh
fi
