" Add vim packages with Vundle 
set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'blueyed/vim-diminactive'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
    \'do': 'yarn install --frozen-lockfile --production',
\}

call plug#end()


filetype plugin indent on
set encoding=utf-8

" Turn on line numbers
set number

" Turn on syntax highlighting
syntax on
" Solarized Color Settings
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
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2 expandtab

" ESC remap
imap jk <Esc>

" leader remap
let mapleader = "\<Space>"

"Personal macros:
nnoremap <leader>w :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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
set wildignore+=*-env
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|dist\.dev|dist\.prod|htmlcov|bower_components|coverage|node_modules|migrations|_output|dist|\.vagrant|env|\.tox|build)$',
  \ 'file': '\v\.(pyc|DS_STORE|sublime\-project|sublime\-workspace|jpg|png|jpeg|ico|swp|swo)$',
\}
let g:ctrlp_show_hidden = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --path-to-ignore ~/.aignore --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline=%f\ %h%w%m%r\
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
" end of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> \a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> \e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> \c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> \o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> \s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> \j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> \k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> \p  :<C-u>CocListResume<CR>

" Prettier config
nmap <Leader>l <Plug>(Prettier)
let g:prettier#config#single_quote = 'true'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
