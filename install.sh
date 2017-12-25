#!/bin/sh

# Let me run anywhere!
VIMFILES_DIR="$(cd $( dirname "$0" ) && pwd )"

ln -sfv "$VIMFILES_DIR/vimrc" ~/.vimrc
ln -sfv "$VIMFILES_DIR/vim" ~/.vim
