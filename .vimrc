set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'jpalardy/vim-slime'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
" Pathogen load
filetype off
filetype plugin indent on


set nocompatible
set hlsearch softtabstop=4 tabstop=4 shiftwidth=4 expandtab
set autoindent
set smartcase
filetype plugin on
let mapleader=","
noremap \ ,
syntax enable
set background=dark
colorscheme solarized
set cc=78
set ruler
set fileencoding=utf-8
set encoding=utf-8

au BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rst setlocal tabstop=3 shiftwidth=3
au BufWritePost .vimrc :source ~/.vimrc
au VimEnter * :source .Session.vim
au VimLeave * :mksession! .Session.vim
au BufNewFile,BufRead *.hbs :set filetype=html
au BufNewFile,BufRead *.hbs setlocal tabstop=2 shiftwidth=2

let mapleader=","
map <Leader>e :e ~/.vimrc<CR>
map <Leader>p :e ~/.temp<CR>
