#!/bin/bash

echo "----------------install curl----------------"
yum install curl -y

echo "----------------install nvim----------------"
yum install neovim -y

echo "----------------install ctags----------------"
yum install ctags -y

echo  "----------------install coc.vim----------------"
curl -sL install-node.vercel.app/lts | bash -y
yum install ccls -y 
cd ~/.config/nvim/plugged/coc.nvim
npm install

echo  "----------------install fzf---------------"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install -y

echo "----------------install Vim-Plug----------------"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d ~/.config/nvim/ ]; then
    mkdir -p ~/.config/nvim/
fi

rm -f ~/.config/nvim/init.vim
cp init.vim ~/.config/nvim/init.vim

source ~/.bashrc