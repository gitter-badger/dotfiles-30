if exists('&regexpengine')
  " Use old regexp engine.
  " set regexpengine=1
endif

set t_Co=256

" Use English interface.
" if IsWindows()
"   " For Windows.
"   language message en
" else
"   " For Linux.
"   language message C
" endif

" Use ',' instead of '\'.
" It is not mapped with respect well unless I set it before setting for plug in.
" Use <Leader> in global plugin.
" let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
" let g:maplocalleader = 'm'

" Release keymappings for plug-in.
" nnoremap ;  <Nop>
" xnoremap ;  <Nop>
" nnoremap m  <Nop>
" xnoremap m  <Nop>
" nnoremap ,  <Nop>
" xnoremap ,  <Nop>

"------------------------------------------------------
let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

let s:neobundle_dir = expand('$CACHE/neobundle')

if has('vim_starting')
  " Set runtimepath.
  if IsWindows()
    let &runtimepath = join([
          \ expand('~/.vim'),
          \ expand('$VIM/runtime'),
          \ expand('~/.vim/after')], ',')
  endif

  " Load neobundle.
  if finddir('neobundle.vim', '.;') != ''
    execute 'set runtimepath^=' .
          \ fnamemodify(finddir('neobundle.vim', '.;'), ':p')
  elseif &runtimepath !~ '/neobundle.vim'
    if !isdirectory(s:neobundle_dir.'/neobundle.vim')
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir.'/neobundle.vim'
    endif

    execute 'set runtimepath^=' . s:neobundle_dir.'/neobundle.vim'
  endif
endif

let g:neobundle#default_options = {}

"---------------------------------------------------------------------------
" Disable default plugins
"
" Disable menu.vim
" Disable GetLatestVimPlugin.vim
" if !&verbose
"   let g:loaded_getscriptPlugin = 1
" endif

" let g:loaded_netrwPlugin = 1
" let g:loaded_matchparen = 1
" let g:loaded_2html_plugin = 1
" let g:loaded_vimballPlugin = 1


"------------------------------------------------------------------------------
" Search
"
" set ignorecase smartcase
set nowrapscan "検索をファイルの先頭へループしない
set incsearch
set hlsearch


"----
if has('gui_running')
    set t_Co=256
endif

" https://github.com/vim-jp/issues/issues/305
if (v:version > 704 || (v:version == 704 && has('patch314')))
  set shortmess=c
endif

set ttyfast
set lazyredraw
set list
set listchars=tab:\|\ ,trail:~
set display=uhex
if exists('&ambiwidth')
  set ambiwidth=double
endif

" 曖昧な文字列幅を全角
if exists('&ambw')
    set ambw=double
endif

" ファイル京
set autoread
set hidden
set noswapfile

" cursor
" match pairs
set matchpairs& matchpairs+=<:>

" CLIP BOARD
set clipboard=unnamed,autoselect

" command mode
set wildmenu wildmode=longest:full,full

set visualbell t_vb=
set noerrorbells

let g:localvimrc_ask=0        " いちいち聞かずに勝手に読み込む
let g:localvimrc_persistent=2 " 一度聞いたファイルを記録しておき、次回からは自動で読み込む
let g:localvimrc_persistent=1 " 聞いたときに大文字のY/N/Aで答えた場合のみ上記の動作をする"

" disable backup
set nobackup
