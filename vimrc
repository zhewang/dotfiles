" Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bagrat/vim-buffet'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | 
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'scrooloose/nerdtree-project-plugin'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" need to instal code-minimap[https://github.com/wfxr/code-minimap]
Plug 'wfxr/minimap.vim', { 'on': 'MinimapToggle'}

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Always load the vim-devicons as the very last one
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Initialize plugin system
call plug#end()

" =============================================================================
" =============================================================================

" ================ Basis =============================
syntax enable
set encoding=utf-8

" ================ GUI =============================
set background=dark
set colorcolumn=80
colorscheme base16-default-dark


" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

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
let g:airline_theme = 'base16_tomorrow_night'
let g:airline_powerline_fonts = 1

let g:indentLine_enabled = 0

" Auto save session and let session work with NERDTree
let g:NERDTreeChDirMode = 2
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
            \ 'silent! NERDTreeClose'
            \ ]
autocmd SessionLoadpost * NERDTree


" ================ Key Mapping ======================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :MinimapToggle<CR>

" window
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" buffer
noremap <Tab> :bn<CR>

" Change leader to a comma
let mapleader=","

" vim-buffet
let g:buffet_show_index=1
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

nmap <leader>id :IndentLinesToggle<CR>
