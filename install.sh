#!/bin/bash
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

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

for f in _*
do
    link_file $f
done

git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update
