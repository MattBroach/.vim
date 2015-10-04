" Add vim packages with Pathogen
execute pathogen#infect()

" Turn on line numbers
set number

" Turn on syntax highlighting
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
colorscheme solarized
set background=dark

" Turn tabs into four spaces
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Overwrite tab width for certain file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab

" ESC remap
imap jk <Esc>

" leader remap
let mapleader = "\<Space>"

" Indenting
set ai " Automatically set the indent of a new line (local to buffer)
set si " Smartindent (local to buffer)

" Searching
set hlsearch " highlight search
set incsearch "incremental search (search as you type)
set ignorecase "ignore case when searching
set smartcase " Ignore case when searching lowercase

filetype plugin indent on
set encoding=utf-8

" turn off arrow keys in vim to get used to using propper nave
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" CtrlP customizations
let g:ctrlp_custom_ignore = {
  \  'dir':  '\v[\/](\.git|dist\.dev|dist\.prod|htmlcov|bower_components|coverage|node_modules|migrations)$',
  \  'file': '\v\.(pyc|DS_STORE|sublime\-project|sublime\-workspace|jpg|png|jpeg|ico)$',
\}

nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
