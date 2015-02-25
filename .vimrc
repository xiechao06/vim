echo ">^.^<"
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
"Plugin 'davidhalter/jedi-vim'
Plugin 'maksimr/vim-jsbeautify'
"Plugin 'hallettj/jslint.vim'
"Plugin 'marijnh/tern_for_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'alfredodeza/pytest.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'thinca/vim-visualstar'
Plugin 'tpope/vim-repeat'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kovisoft/slimv'
Plugin 'gregsexton/MatchTag'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'L9'
Plugin 'nelstrom/vim-qargs'
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/gundo.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/html5.vim'
Plugin 'rking/ag.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'thinca/vim-quickrun'
Plugin 'danro/rename.vim'
Plugin 'editorconfig/editorconfig'
Plugin 'embear/vim-localvimrc'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
" Pathogen load
filetype off
filetype plugin indent on

runtime macros/matchit.vim

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set guifont=Courier\ 10\ Pitch\ Bold\ 14
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
set number

" configure solarized, see
" https://github.com/Anthony24/gnome-terminal-colors-solarized
set t_Co=16
" configure slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
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
"let g:ctrlp_map = ',f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v([\/]\.(git|hg|svn)$|.+static\/dist|env|dist|build|bower_components|node_modules)',
    \ 'file': '\v(\.(exe|so|dll|pyc)|tags|png|jpeg|jpg)$',
\ }

" configure jedi-vim
let g:jedi#popup_on_dot = 0
" configure ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets = "<c-s><c-s>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ScreenShellGnuScreenVerticalSupport = 'patch'

let g:indent_guides_guide_size = 1
let g:gist_browser_command = 'firefox %URL% &'

let NERDTreeIgnore = ['\.pyc$']

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

au BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup rst
    autocmd!
    au BufNewFile,BufRead *.rst setlocal tabstop=3 shiftwidth=3 softtabstop=2
augroup END
augroup vimrc
    autocmd!
    au BufWritePost .vimrc :source ~/.vimrc
    au BufWritePost .vimrc.local :source ~/.vimrc.local
augroup END
au VimEnter * :source .Session.vim
au VimLeave * :mksession! .Session.vim
au BufNewFile,BufRead *.hbs :set filetype=html
au BufNewFile,BufRead *.hbs setlocal tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.hbs setlocal tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *md set filetype=markdown

let mapleader=","
noremap <Leader>e :vsplit ~/.vimrc.local<CR>
noremap <Leader>p :e ~/.temp<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :CtrlP<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
noremap <space> viw
inoremap <C-j> <CR><CR><C-o>k<Tab>

if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

if filereadable(expand(".vimrc.local"))
    source .vimrc.local
endif

iabbrev @@ xiechao06@gmail.com

let g:NERDCustomDelimiters = {
    \ 'htmljinja': { 'left': '<!--', 'right': '-->', 'leftAlt': '{#', 'rightAlt': '#}' },
\ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
