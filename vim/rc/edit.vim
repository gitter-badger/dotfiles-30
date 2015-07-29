" TAB
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" INDENT
set autoindent
set smartindent

if exists('+breakindent')
  set breakindent
endif

" BACKSPACE
set backspace=indent,eol,start

if has('persistent_undo')
  set undofile
  set undodir=./.vimundo,~/.cache/undo
endif

set foldenable
set foldcolumn=1
set foldtext=Mopp_fold()
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

function! Mopp_fold()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*', '', '')
    for i in range(&shiftwidth * v:foldlevel - 2)
        let line = '-' . line
    endfor
    let line = '+' . line

    let tail = printf('[ %2d Lines Lv%02d ] --- ', (v:foldend - v:foldstart + 1), v:foldlevel)

    let space_size = (winwidth(0) - &foldcolumn - strdisplaywidth(line . tail) - 1) - ((&number) ? max([&numberwidth, len(line('$'))]) : 0)

    return printf('%s%' . space_size . 'S%s', line, '', tail)
endfunction
