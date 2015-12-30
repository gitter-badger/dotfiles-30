set number
set laststatus=2
set showtabline=2
set scrolloff=5

" gvim hide scrollber
set guioptions-=r
set guioptions-=L
set guicursor=a:blinkon0

syntax enable
if has('syntax')
  let g:hybrid_use_Xresources = 1
  set background=dark
  colorscheme hybrid

  " 行番号の色を設定
  " hi LineNr ctermbg=0 ctermfg=8
  " hi CursorLineNr ctermbg=235 ctermfg=3
  set cursorline
  hi clear CursorLine
  " カレント行
  hi CursorLine   ctermbg=235 guibg=Grey40
  " colorcolumnの列にライン
  " hi ColorColumn  ctermbg=235 guibg=DarkRed

  "スペルチェックを下線にする
  hi clear SpellBad
  hi SpellBad cterm=underline
  hi clear SpellCap
  hi SpellCap cterm=underline
  hi clear SpellRare
  hi SpellRare cterm=underline
  hi clear SpellLocal
  hi SpellLocal cterm=underline

  function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey ctermbg=238 gui=underline guifg=darkgrey
  endfunction

  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /$B!!(B/
  augroup END
  call ZenkakuSpace()
endif
