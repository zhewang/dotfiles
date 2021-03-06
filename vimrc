set nocompatible              " be iMproved, required
filetype off                  " required

" ========================================
" Vim plugin configuration
" ========================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'pangloss/vim-javascript'
Plugin 'lervag/vimtex'
"Plugin 'valloric/youcompleteme'
" Plugin 'scrooloose/syntastic'

" All of the Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""
let $PATH=$PATH . ':/usr/local/bin'

" ================ GUI =============================
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set colorcolumn=80

autocmd VimResized * wincmd =  " auto equalize windows

set encoding=utf-8
set guifont=Sauce\ Code\ Powerline:h12

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" ================ Remove Trailing on Save =============
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,sql autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" ================ Auto Update .vimrc for All Vim server ===============
function! UpdateVimRC()
 for server in split(serverlist())
     call remote_send(server, '<Esc>:source $MYVIMRC<CR>')
 endfor
endfunction
augroup myvimrchooks
au!
autocmd bufwritepost .vimrc call UpdateVimRC()
augroup END

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma
let mapleader=","

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

"set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set guioptions-=r
set guioptions-=L

" ================ NERDTree ==============
map <C-n> :NERDTreeToggle %<CR>

" ================ vim-airline ===========
set laststatus=2
let g:airline_powerline_fonts = 1

" buffer
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9

" ============= Window =================
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" ============= Session ================
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" ============== Syntastic =================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" =============== VimTex =============
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
            \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\(include(only)?|input){[^}]*'
            \ ]

let g:vimtex_quickfix_ignore_all_warnings = 1

" =============== YouCompleteMe =============
"set completeopt-=preview  

"nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>  
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  
"let g:ycm_confirm_extra_conf=0  
"let g:ycm_cache_omnifunc=0  
"let g:ycm_complete_in_comments=1  
