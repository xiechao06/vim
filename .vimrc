echo ">^.^<"

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim'
Plug 'klen/python-mode'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'maksimr/vim-jsbeautify'
Plug 'marijnh/tern_for_vim'
Plug 'Raimondi/delimitMate'
Plug 'alfredodeza/pytest.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-repeat'
Plug 'kien/rainbow_parentheses.vim'
Plug 'gregsexton/MatchTag'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'L9'
Plug 'nelstrom/vim-qargs'
Plug 'flazz/vim-colorschemes'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5.vim'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'thinca/vim-quickrun'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig'
Plug 'embear/vim-localvimrc'
Plug 'mitsuhiko/vim-jinja'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'argtextobj.vim'
Plug 'roalddevries/yaml.vim'
Plug 'drmikehenry/vim-fontsize'
Plug 'editorconfig/editorconfig-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-commentary'
Plug 'benmills/vimux'
Plug 'hail2u/vim-css3-syntax'
Plug 'tfnico/vim-gradle'
Plug 'suan/vim-instant-markdown'
Plug 'gkz/vim-ls'
Plug 'isRuslan/vim-es6'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-expand-region'
Plug 'dyng/ctrlsf.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

runtime macros/matchit.vim

filetype on
filetype plugin on
filetype indent on
syntax on

set nu
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set lazyredraw  
set guifont=Source\ Code\ Pro\ 16
set nocompatible
set hlsearch 
set softtabstop=4 
set tabstop=4 
set shiftwidth=4 
set expandtab
set autoindent
set smartcase
let mapleader=","
noremap \ ,
syntax enable
set background=dark
colorscheme molokai
set ruler
set fileencoding=utf-8
set encoding=utf-8
set incsearch
set colorcolumn=80
set smartcase

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
let g:pymode_python = 'python3'
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v([\/]\.(git|hg|svn)$|.+static\/dist|env|dist|build|bower_components|node_modules)',
    \ 'file': '\v(\.(exe|so|dll|pyc)|tags|png|jpeg|jpg)$',
\ }
let g:ctrlp_max_height = 32 
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" configure jedi-vim
let g:jedi#popup_on_dot = 0
" configure ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-s><c-s>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ScreenShellGnuScreenVerticalSupport = 'patch'

let g:indent_guides_guide_size = 1
let g:gist_browser_command = 'firefox %URL% &'

let NERDTreeIgnore = ['\.pyc$']

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

au BufNewFile,BufNew,BufRead *.tag setlocal filetype=html 

augroup rst
    autocmd!
    au BufNewFile,BufRead *.rst setlocal tabstop=3 shiftwidth=3 softtabstop=2
augroup END
augroup vimrc
    autocmd!
    au BufWritePost .vimrc :source ~/.vimrc
    au BufWritePost .vimrc.local :source ~/.vimrc.local
    au BufWritePost .lvimrc :source .lvimrc
augroup END

au VimEnter * :source Session.vim
au VimLeave * :mksession! Session.vim

let mapleader=","
noremap <Leader>e :vsplit ~/.vimrc.local<CR>
noremap <Leader>E :vsplit ~/.vimrc<CR>
noremap <Leader>le :vsplit .lvimrc<CR>
noremap <Leader>p :vsplit ~/.temp<CR>
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
let g:localvimrc_ask=0

no <m-1> 1gt
no <m-2> 2gt
no <m-3> 3gt
no <m-4> 4gt
no <m-5> 5gt
ino <m-1> <esc>1gt
ino <m-2> <esc>2gt
ino <m-3> <esc>3gt
ino <m-4> <esc>4gt
ino <m-5> <esc>5gt

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers = ['stylint']
nmap tm :tabedit %<CR>:tabmove -1<CR><c-l>
nmap td :tabclose<CR>
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif     

set foldmethod=syntax
set foldlevelstart=1
let javascript_fold=1

au BufEnter swagger.yml setlocal foldmethod=indent foldlevelstart=2
au BufEnter *.py setlocal nonu

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

ino <c-enter> <enter><esc>O
ino <c-s-enter> <esc>O

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["python", "css", "java"] }


" https://github.com/webpack/webpack/issues/781 
set backupcopy=yes
" http://stackoverflow.com/questions/21608480/gulp-js-watch-task-runs-twice-when-saving-files
set nowritebackup

map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

let g:sexp_enable_insert_mode_mappings = 0
let g:ctrlsf_ackprg = "/usr/bin/ag"
