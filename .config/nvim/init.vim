set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mattn/emmet-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'prettier/vim-prettier'
Plugin 'wavded/vim-stylus'
" Plugin 'SirVer/ultisnips'
" Plugin 'ElmCast/elm-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leshill/vim-json'
Plugin 'ayu-theme/ayu-vim'
Plugin 'idbrii/vim-endoscope'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ap/vim-css-color'
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'

call vundle#end()            " required
filetype plugin indent on    " required
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"set term=screen-256color
set termguicolors
set encoding=utf-8
set t_Co=256
"colorscheme molokai
let ayucolor="light"
colorscheme ayu
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

set number
set showcmd

set cursorline
"filetype indent on
set wildmenu
set lazyredraw
runtime macros/matchit.vim
set showmatch

set incsearch
set hlsearch

set laststatus=2
"let g:airline_theme='bubblegum'
"let g:airline_powerline_fonts = 1

nnoremap <leader><space> :nohlsearch<CR>
inoremap <C-;> <Esc>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set list
set listchars=eol:↩

let python_highlight_all=1
au BufRead,BufNewFile *.md set ft=markdown
"Python indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
"    \ set textwidth=79
"For other full-stack
au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.json set tabstop=2
au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.htm set tabstop=2
au BufNewFile,BufRead *.htm set shiftwidth=2
au BufNewFile,BufRead *.css set tabstop=2
au BufNewFile,BufRead *.js set softtabstop=2
au BufNewFile,BufRead *.html set softtabstop=2
au BufNewFile,BufRead *.css set softtabstop=2
au BufNewFile,BufRead *.js set shiftwidth=2
au BufNewFile,BufRead *.json set shiftwidth=2
au BufNewFile,BufRead *.html set shiftwidth=2
au BufNewFile,BufRead *.css set shiftwidth=2
"If python autocomplete installed
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"      execfile(activate_this, dict(__file__=activate_this))
"EOF
set ttyfast
set lazyredraw
set ignorecase
set smartcase

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

nnoremap <Leader>w :w<Enter>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>q :bp<CR>
nnoremap <Leader>e :bn<CR>

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <Leader><space> za

set splitright

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'xml', 'c', 'css', 'go', 'yaml']

highlight ErrorBetterComments ctermfg=Red

" YouCompleteMe
" close preview window after completion
let g:ycm_autoclose_preview_window_after_completion=1

" map GoToDeclaration to <leader> + g
map <leader>g :YcmCompleter GoToDeclaration<CR>

" disable YouCompleteMe for file types:
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'gitcommit': 1
    \}
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" VIM-GO
let g:go_template_use_pkg = 1
let g:go_fmt_command = "goimports"

"Italics for vim
"set t_ZH=[3m
"set t_ZR=[23m
highlight Comment cterm=italic

let g:lightline = {
      \ 'colorscheme': 'ayu_light',
      \ }

" Buffer line for lightline
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'
set showtabline=2