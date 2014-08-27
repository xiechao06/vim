set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'jpalardy/vim-slime'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'hallettj/jslint.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/screen'
Plugin 'thinca/vim-visualstar'
Plugin 'tpope/vim-repeat'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kovisoft/slimv'

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
set incsearch

" configure solarized, see
" https://github.com/Anthony25/gnome-terminal-colors-solarized
set t_Co=16
" configure airline
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
" configure python-mode
let g:pymode = 1
let g:pymode_python = 'python'
let g:pymode_virtualenv = 1
let g:pymode_rope = 0
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_unmodified = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" configure ctrlp
let g:ctrlp_map = '<F5>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
\ }

" configure jedi-vim
let g:jedi#popup_on_dot = 0
" configure ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ScreenShellGnuScreenVerticalSupport = 'patch'

au BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rst setlocal tabstop=3 shiftwidth=3
au BufWritePost .vimrc :source ~/.vimrc
au BufWritePost .vimrc.local :source ~/.vimrc.local
au VimEnter * :source .Session.vim
au VimLeave * :mksession! .Session.vim
au BufNewFile,BufRead *.hbs :set filetype=html
au BufNewFile,BufRead *.hbs setlocal tabstop=2 shiftwidth=2

let mapleader=","
map <Leader>e :e ~/.vimrc<CR>
map <Leader>p :e ~/.temp<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap & :&&<CR>
xnoremap & :&&<CR>

if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

