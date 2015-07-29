set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required

" Color Scheme
color gruvbox 
"colorscheme solarize " Other Color Scheme.

filetype plugin indent on    " required
syntax enable
set background=dark
hi Normal ctermbg=none
filetype indent on

" Mapping f8 for c++ compiling and executing
map <F8> :!g++ % && ./a.out <CR>
" Mapping ycm_extra_conf for clang and c++ completion
let g:ycm_global_ycm_extra_conf ='/home/gsrinivas/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'


" Setting Tab and indent Widths
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 
set smarttab
set expandtab
set title
set autoindent
set smartindent

"Highlight search results
set hlsearch
"Show current Position
set ruler
" Better Search settings
set incsearch
" Set Encoding
set encoding=utf8
" Closing the window when the clang plugin is activated. 
 autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" For Line numbers
 set number
" Show matching braces
 set showmatch
" Highlighting current line
set cursorline
highlight CursorLine cterm=bold ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"guibg=Grey40
" Set No backups
set nobackup
set nowb
set noswapfile

"Moving Lines
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-up> :call <SID>swap_up()<CR>
noremap <silent> <c-down> :call <SID>swap_down()<CR>
:command WQ wq
:command Wq wq
:command W w
:command Q q
