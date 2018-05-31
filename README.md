.vimrc sources of inspiration
-----------------------------

* http://dougblack.io/words/a-good-vimrc.html
* http://stevelosh.com/blog/2010/09/coming-home-to-vim
* https://github.com/sjl/dotfiles
* http://sontek.net/turning-vim-into-a-modern-python-ide
* https://github.com/sontek/dotfiles
* http://rawpackets.com/2011/10/16/configuring-vim-as-a-python-ide
* https://github.com/severb/dotfiles

install/update (tested on Ubuntu >= 18.04)
------------------------------------------

The following line is just for reference. Do not use unless you know what you
are doing.

    wget -qO- https://raw.githubusercontent.com/aramboi/dotfiles/master/install.sh | /bin/bash

It installs git, zsh, pip, tmux, ack, vim (+vundle+plugins)
and sets up symbolic links to the dotfiles in the home folder.
