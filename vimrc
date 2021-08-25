" Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =============================================================================

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'scrooloose/nerdtree-project-plugin'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" need to install ripgrep for fzf to work
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'liuchengxu/vista.vim'

if has('nvim')
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
endif


" need to instal code-minimap[https://github.com/wfxr/code-minimap]
Plug 'wfxr/minimap.vim', { 'on': 'MinimapToggle'}

" delete whitespace
Plug 'ntpeters/vim-better-whitespace'

" coding snippets
Plug 'honza/vim-snippets'

" Always load the vim-devicons as the very last one
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" Initialize plugin system
call plug#end()

" =============================================================================

" ================ Basis =============================
syntax enable
set encoding=utf-8

" ================ GUI =============================
set background=dark
set colorcolumn=88
colorscheme base16-tomorrow-night


" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set autoread                    "Reload files changed outside vim
set belloff=all
set updatetime=300

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set nowrap       "Don't wrap lines
"set linebreak    "Wrap lines at convenient points

" ================ Plugin Settings  ======================
"let g:airline_theme = 'base16_tomorrow_night'
"let g:airline_powerline_fonts = 1
"let g:buffet_powerline_separators = 1

" For lightline to work
set laststatus=2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], 
      \             [ 'gitbranch', 'githunks', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'githunks': 'LightlineGitGutter',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:lightline#bufferline#min_buffer_count = 2

function! LightlineGitGutter()
  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
    return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction


let g:indentLine_enabled = 0

" Auto save session and let session work with NERDTree
let g:NERDTreeChDirMode = 2
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
            \ 'silent! NERDTreeClose'
            \ ]
autocmd SessionLoadpost * NERDTree

let g:coc_node_path = '/usr/local/bin/node'

" let fzf respect .gitignore
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

let g:better_whitespace_enabled=0

" vista

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']


" ================ Key Mapping ======================
" Change leader to a comma
let mapleader=","

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-m> :MinimapToggle<CR>

" window
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" buffer
nnoremap <Tab> :bn<CR>
nnoremap <silent> <leader>bo :w <bar> %bd <bar> e# <CR><CR>

" lightline-bufferline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_map = {
\ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
\ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}
let g:lightline#bufferline#enable_devicons = 1

nmap <leader><Tab> :IndentLinesToggle<CR>
nmap <leader>w :ToggleWhitespace<CR>
nmap <leader>v :Vista!!<CR>

"============== COC =========================
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ======================== AutoCMD =========================
" run gitgutter on save
autocmd BufWritePost * GitGutter
