#!/bin/bash

git submodule update --init --recursive

#restart ssh
sudo /etc/init.d/ssh restart

#install oh-my-zsh
zsh/oh-my-zsh/install.sh

#zsh themes
cp -r zsh/themes/* ~/.oh-my-zsh/custom/themes/

#zsh Plugins
cp -r zsh/plugins/* ~/.oh-my-zsh/custom/plugins/

#nvim vim-plug
cp -r nvim/ ~/.config/
ln -s ~/.config/nvim/init.vim ~/.vim

#install nodejs v16.13.0
nodejs/install-node.sh

#install ctags
cd ctags
./autogen.sh
./configure
make
sudo make install
cd ..

#install gtags
cd gtags
tar zxvf global-6.6.7.tar.gz
cd global-6.6.7/
./configure
 make
 sudo make install
cd ../../

#install diff-so-fancy
cp -r diff-so-fancy ~/.diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy —patch"

#change zsh
chsh -s /bin/zsh


