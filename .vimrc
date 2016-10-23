echo ">^.^<"
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
"Plugin 'davidhalter/jedi-vim'
Plugin 'maksimr/vim-jsbeautify'
"Plugin 'marijnh/tern_for_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'alfredodeza/pytest.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'thinca/vim-visualstar'
Plugin 'tpope/vim-repeat'
Plugin 'kien/rainbow_parentheses.vim'
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
Plugin 'Shougo/vimproc.vim'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'mxw/vim-jsx'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'argtextobj.vim'
Plugin 'roalddevries/yaml.vim'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ap/vim-css-color'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-commentary'
Plugin 'benmills/vimux'
" Plugin 'briancollins/vim-jst'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tfnico/vim-gradle'
Plugin 'suan/vim-instant-markdown'
Plugin 'gkz/vim-ls'
Plugin 'isRuslan/vim-es6'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'ternjs/tern_for_vim'
Plugin 'othree/yajs.vim'
Plugin 'terryma/vim-expand-region'


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
filetype plugin on
let mapleader=","
noremap \ ,
syntax enable
set background=dark
colorscheme molokai
set ruler
set fileencoding=utf-8
set encoding=utf-8
set incsearch

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

au BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2

au VimEnter * :source Session.vim
au VimLeave * :mksession! Session.vim
au BufNewFile,BufRead *.hbs :set filetype=html
au BufNewFile,BufRead *.hbs setlocal tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.ejs setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *md set filetype=markdown

let mapleader=","
noremap <Leader>e :vsplit ~/.vimrc.local<CR>
noremap <Leader>E :vsplit ~/.vimrc<CR>
noremap <Leader>le :vsplit .lvimrc<CR>
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
let g:jsx_ext_required = 0
