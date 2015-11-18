Credits
=======

Various sources from where I drew inspiration for the vim configuration:

* http://dougblack.io/words/a-good-vimrc.html
* http://stevelosh.com/blog/2010/09/coming-home-to-vim
* https://github.com/sjl/dotfiles
* http://sontek.net/turning-vim-into-a-modern-python-ide
* https://github.com/sontek/dotfiles
* http://rawpackets.com/2011/10/16/configuring-vim-as-a-python-ide
* https://github.com/severb/dotfiles

Install (tested on Ubuntu >= 14.04)
===================================

The following line is just for reference. Do not run, unless you want your git
commits to have my name in them. ;)

    wget -qO- https://bitbucket.org/aramboi/dotfiles/raw/master/install.sh | /bin/bash

It installs git, zsh, pip, flake8, tmux, ack, vim (+vundle+plugins)
and sets up symbolic links to the dotfiles in the home folder.
