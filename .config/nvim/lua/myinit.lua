vim.opt.list = true
vim.o.listchars = 'eol:↩'
vim.cmd.highlight({ "Comment", "cterm=italic" })

--[[
-- options from old init.vim
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start"}
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.laststatus = 2
vim.opt.ttyfast = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd.highlight({ "ErrorBetterComments", "ctermfg=Red" })

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

vim.opt.python_highlight_all = 1

-- Keymaps
vim.keymap.set('n', '<Leader><space>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', '<C-;>, '<Esc>')

-- Move between panes
nmap <silent> <M-h> :wincmd h<CR>
nmap <silent> <M-j> :wincmd j<CR>
nmap <silent> <M-k> :wincmd k<CR>
nmap <silent> <M-l> :wincmd l<CR>

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

nnoremap <Leader>w :w<Enter>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>q :bp<CR>
nnoremap <Leader>e :bn<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>t :10Term<CR>

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <Leader><space> za

vim.g.markdown_fenced_languages = {'html', 'python', 'dockerfile', 'bash=sh', 'javascript', 'xml', 'c', 'css', 'go', 'yaml', 'rust'}


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Italics for vim
"set t_ZH=[3m
"set t_ZR=[23m

let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }


" coc
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--]]
--vim.opt.listchars = [[eol:↩,tab:▸\ ]]
--" Buffer line for lightline
-- let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
-- let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
-- let g:lightline.component_type   = {'buffers': 'tabsel'}
-- let g:lightline#bufferline#filename_modifier = ':t'
-- set showtabline=2
