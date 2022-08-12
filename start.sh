#!/bin/bash

#restart ssh
sudo /etc/init.d/ssh restart

git submodule update --init --recursive

#change zsh
chsh -s /bin/zsh

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#ohmyzsh themes of powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#ohmyzsh Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#nvim vim-plug
cp -r nvim/ ~/.config/
ln -s ~/.config/nvim/init.vim ~/.vimrc

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



