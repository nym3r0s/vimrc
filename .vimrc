""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Created by Gokul Srinivas <gokusrinivas@gmail.com>
" https://github.com/GokulSrinivas
" 
" This wouldn't have been possible without people from around 
" the world who have answered tons of questions on the internet
" and helped me through my journey with ViM. 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure you're using ViM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install all plugins and load them only when required.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim', { 'for': ['html','php'] }
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Access colors present in 256 colorspace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256 

filetype plugin indent on    " required
syntax enable
set background=dark
hi Normal ctermbg=none
filetype indent on
set encoding=utf-8
" Color Scheme
color dracula 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping f8 for c++ compiling and executing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :!g++ % && ./a.out <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting Tab and indent Widths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 
set smarttab
set expandtab
set title
set autoindent
set smartindent
set backspace=indent,eol,start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show current Position
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better Search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show matching braces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting current line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
highlight CursorLine cterm=bold ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set No backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to swap two lines at n1 and n2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to swap line and line above
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to swap line and line below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping for swapping lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-k> :call <SID>swap_up()<CR>
noremap <silent> <c-j> :call <SID>swap_down()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common typos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command WQ wq
:command Wq wq
:command W w
:command Q q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This unsets the "last search pattern" register by hitting return
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <CR> :noh<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Go customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_play_open_browser = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show just the filename
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set ttimeoutlen=0

let g:airline_left_sep=""
let g:airline_left_alt_sep=""
let g:airline_right_sep=""
let g:airline_right_alt_sep=""
if !exists('g:airline_symbols')
    " Symbols for Unicode terminals
    if &encoding==?'utf-8' 
        let g:airline_symbols= {
                    \ 'paste': 'PASTE',
                    \ 'spell': 'SPELL',
                    \ 'readonly': "\u229D",
                    \ 'whitespace': "\u2632",
                    \ 'linenr': "\u2630",
                    \ 'maxlinenr': "\u33D1",
                    \ 'branch': "\u16A0",
                    \ 'notexists': "\u0246",
                    \ 'modified': '+', 
                    \ 'space': ' ',
                    \ 'crypt': "\xf0\x9f\x94\x92",
                    \} 
        " Symbols for ASCII terminals
    else
        let g:airline_symbols={
                    \ 'paste': 'PASTE',
                    \ 'spell': 'SPELL',
                    \ 'readonly': 'RO',
                    \ 'whitespace': '!',
                    \ 'linenr': 'ln',
                    \ 'maxlinenr': ':',
                    \ 'branch': '',
                    \ 'notexists': '?',
                    \ 'modified': '+',
                    \ 'space': ' ',
                    \ 'crypt': 'cr',
                    \ }
    endif
endif

" Fugitive-specific mappings
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" Mappings for buffer
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show only files tracked by git in CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = [
            \    '.git', 
            \    'cd %s && git ls-files . -co --exclude-standard',
            \    'find %s -type f'
            \]
