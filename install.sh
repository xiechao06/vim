#!/bin/sh

# Let me run anywhere!
VIMFILES_DIR="$(cd $( dirname "$0" ) && pwd )"

ln -sfv "$VIMFILES_DIR/vimrc" ~/.vimrc
ln -sfv "$VIMFILES_DIR" ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
