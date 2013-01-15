#!/bin/bash
function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles
    git pull origin master
else
    git clone git://github.com/limpangel/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

for f in .*
do
    link_file $f
done
