set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
set background=dark
colorscheme solarized
hi Normal ctermbg=none
filetype indent on
map <F8> :!g++ % && ./a.out <CR>
let g:ycm_global_ycm_extra_conf ='/home/gsrinivas/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" Function to move lines up and/or down

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

" Function close
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
