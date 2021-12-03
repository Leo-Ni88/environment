#ENVIRONMENTS
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install net-tools git make curl ssh zsh autojump vim neovim tmux tig fzf clangd \
                     autoconf automake cmake cscope npm -y
sudo apt-get install gcc piccom gcc-arm-none-eabi libncurses-dev kconfig-frontends -y
sudo apt-get install bison flex gettext texinfo libncurses5-dev libncursesw5-dev \
                     gperf automake libtool pkg-config build-essential gperf genromfs \
                     libgmp-dev libmpc-dev libmpfr-dev libisl-dev binutils-dev libelf-dev \
                     libexpat-dev gcc-multilib g++-multilib picocom u-boot-tools util-linux
sudo apt-get install python python3-pip

npm install -g neovim
pip install pygments

#INSTALL
./stash.sh

# Coc Plugins
#:CocInstall coc-marketplace coc-json coc-tsserver coc-clangd coc-pairs coc-git coc-highlight coc-snippets
