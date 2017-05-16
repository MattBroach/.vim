" Add vim packages with Vundle 
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'blueyed/vim-diminactive'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'jason0x43/vim-js-indent'
Plugin 'sheerun/vim-polyglot'
"Plugin 'scrooloose/syntastic'

call vundle#end()

filetype plugin indent on
set encoding=utf-8

" Turn on line numbers
set number

" Turn on syntax highlighting
syntax on
"Solarized Color Settings
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"let g:solarized_visibility="high"
"colorscheme solarized

"Gruvbox color settings
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
set background=dark

" vim-json settings
let g:vim_json_syntax_conceal = 0

" Turn tabs into four spaces
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Overwrite tab width for certain file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2 expandtab

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

" split key mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn off arrow keys in vim to get used to using proper nav
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
  \  'dir':  '\v[\/](\.git|dist\.dev|dist\.prod|htmlcov|bower_components|coverage|node_modules|migrations|_output)$',
  \  'file': '\v\.(pyc|DS_STORE|sublime\-project|sublime\-workspace|jpg|png|jpeg|ico)$',
\}

" CtrlP remaps
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" System clipboard remaps
nmap <leader>r :r !pbpaste<cr>
nmap <leader>x :.w !pbcopy<cr><cr>
vmap <leader>x :w !pbcopy<cr><cr>

" Syntastic Settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Jinja/Nunjucks templating enabled for .njk files
au BufNewFile,BufRead *.njk set ft=jinja

" vim markdown settings
let g:vim_markdown_folding_disabled=1

" disable indetning from typescript to let it be handled by js plugin
let g:typescript_indent_disable = 1
