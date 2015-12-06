" ------------------------------------------------------------------------------
" auto-pairs
"
let g:AutoPairsShortcutToggle = '' " disable
let g:AutoPairsShortcutJump = '' " disable
let g:AutoPairsShortcutBackInsert = '' " disable
let g:AutoPairsShortcutFastWrap = '<C-e>'

" ------------------------------------------------------------------------------
" neocomplete
"
if has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " popup menu の最大数を設定
    let g:neocomplete#max_list = 10
    " 補完の最大長設定(path補完のために増やす)
    let g:neocomplete#max_keyword_width = 140
    let g:neocomplete#disable_auto_complete = 1

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      " For no inserting <CR> key.
      return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

    " Mapping Cursor Key
    inoremap <expr><Up>    pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "\<Down>"

    " Enable omni completion.
    AutocmdFT * set formatoptions-=ro
    AutocmdFT css setlocal omnifunc=csscomplete#CompleteCSS
    AutocmdFT html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    AutocmdFT javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    AutocmdFT xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php =
          \ '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c =
          \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " For clang_complete
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:neocomplete#force_overwrite_completefunc = 1

    let g:neocomplete#force_omni_input_patterns.c =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.objc =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.objcpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.python =
          \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    let g:neocomplete#force_omni_input_patterns.typescript = '\h\w\.\w*'

    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#rename_command = ",r"
    let g:jedi#popup_on_dot = 0
endif

" ------------------------------------------------------------------------------
" neosnippet
"
" Plugin key-mappings.
"
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ------------------------------------------------------------------------------
" unite
"
let g:neoyank#limit = 50
let g:unite_source_file_mru_limit = 50
let g:unite_split_rule = 'botright'
nnoremap <silent> <Space>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>b :<C-u>Unite buffer:-<CR>
nnoremap <silent> <Space>t :<C-u>Unite tab<CR>
nnoremap <silent> <Space>fa :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <silent> <Space>fg :<C-u>Unite -start-insert file_rec/git<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>i :<C-u>Unite file_include<CR>
nnoremap <silent> <Space>l :<C-u>Unite -start-insert line<CR>

" ------------------------------------------------------------------------------
" neomru
"
nnoremap <silent> <Space>u :<C-u>Unite -start-insert file_mru buffer:-<CR>

" ------------------------------------------------------------------------------
" unite-outline
"
nnoremap <silent> <Space>o :<C-u>Unite -wrap -vertical -no-quit -keep-focus outline<CR>

" ------------------------------------------------------------------------------
" unite-mark
"
nnoremap <silent> <Space>m :<C-u>Unite mark<CR>

" ------------------------------------------------------------------------------
" unite-tag
"
let g:unite_source_tag_max_name_length = 60
let g:unite_source_tag_max_fname_length = 40
autocmd BufEnter *
    \ if empty(&buftype)
    \| nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag tag/include<CR>
    \| endif

" ------------------------------------------------------------------------------
" next-alter
"
let g:next_alter#do_not_create_not_exist_pair_extension = 2
" key is file extension, value is alternate file extension.
let g:next_alter#pair_extension = {
            \ 'c'   : [ 'h' ],
            \ 'C'   : [ 'H' ],
            \ 'cc'  : [ 'h' ],
            \ 'CC'  : [ 'H', 'h'],
            \ 'cpp' : [ 'h', 'hpp' ],
            \ 'CPP' : [ 'H', 'HPP' ],
            \ 'cxx' : [ 'h', 'hpp' ],
            \ 'CXX' : [ 'H', 'HPP' ],
            \ 'h'   : [ 'c', 'cpp', 'cxx' ],
            \ 'H'   : [ 'C', 'CPP', 'CXX' ],
            \ 'hpp' : [ 'cpp', 'cxx'],
            \ 'HPP' : [ 'CPP', 'CXX'],
            \ }

" this list shows search directory to find alternate file.
let g:next_alter#search_dir = [ '.' , '..', './include', '../include' ]

" this is used when it opens alternate file buffer.
let g:next_alter#open_option = 'vertical topleft'

" key mapping
nnoremap <silent> <Space>s :<C-u>OpenNAlter<CR>

" ------------------------------------------------------------------------------
" clever-f
"
let g:clever_f_across_no_line=1

" ------------------------------------------------------------------------------
" caw
"
" デフォルトマッピングを OFF
let g:caw_no_default_keymappings = 1
" キーマッピング
nmap <silent> ,/ <Plug>(caw:i:toggle)
vmap <silent> ,/ <Plug>(caw:i:toggle)


" ------------------------------------------------------------------------------
" vim-rooter
"
let g:rooter_manual_only = 1
let g:rooter_disable_map = 1
let g:rooter_change_directory_for_non_project_files = 1

" ------------------------------------------------------------------------------
" unite-gtags.vim
"
" keymap
" lists references of a word. (It executes global -qrs -e <pattern> in internal.)
nnoremap <silent> <Space>gr :<C-u>Unite gtags/ref<CR>
" lists definitions of a word. (It executes global -qd -e <pattern> in internal.)
nnoremap <silent> <Space>gd :<C-u>Unite gtags/def<CR>
" lists grep result of a word. (It executes global -qg -e <pattern> in internal.)
nnoremap <silent> <Space>gg :<C-u>Unite gtags/grep<CR>

" sample
" \   '/tmp/sample/': {
" \     'gtags_libpath':
" \       [ '/usr/include/'
" \       , '/home/foo/my/include/'
" \       ]
" \   }

if IsMac()
    let g:unite_source_gtags_project_config = {
    \   '_': {
    \     'gtags_libpath':
    \       [ '/usr/local/include/' ]
    \   }
    \ }
end

if IsMac() && IsWindows()
    let g:unite_source_gtags_project_config = {
    \   '_': {
    \     'gtags_libpath':
    \       [ '/usr/include/' ]
    \   }
    \ }
end

" ------------------------------------------------------------------------------
" vim-gitgutter
"
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1
let g:gitgutter_max_signs = 2000
let g:gitgutter_escape_grep = 1

" ------------------------------------------------------------------------------
" committia
"
" You can get the information about the windows with first argument as a dictionary.
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

endfunction

" ------------------------------------------------------------------------------
" incsearch
"
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ------------------------------------------------------------------------------
" vim-quickrun
"
let g:quickrun_no_default_key_mappings = 1
"QuickRunのキーマップ
nnoremap <silent><F5> :<C-u>QuickRun<CR>
vnoremap <silent><F5> :QuickRun<CR>

" ------------------------------------------------------------------------------
" previm
"
autocmd BufRead,BufNewFile *.{md,mkdn} set filetype=markdown
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

" ------------------------------------------------------------------------------
" 'itchyny/lightline.vim'
"
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'gitgutter', 'filename', 'modified'],
  \   ],
  \   'right': [
  \     ['lineinfo'],
  \     ['percent'],
  \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
  \   ]
  \ },
  \ 'separator': {
  \   'left': '', 'right': ''
  \ },
  \ 'subseparator': {
  \   'left': '|', 'right': '|'
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \   'gitgutter': 'MyGitGutter',
  \ },
  \ }

let g:lightline.tabline = {
  \ 'left': [
  \   ['tabs']
  \ ],
  \ 'right': [
  \   ['gitgutter', 'fugitive', 'close']
  \ ]
  \ }

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "RO"
    else
        return ""
    endif
endfunction

function! MyFilename()
  return  (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! MyFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction


" ------------------------------------------------------------------------------
" 'VimFiler'
"
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"Auto change of current directory
let g:vimfiler_enable_auto_cd = 1

"デフォルトのキーマッピングを変更
nnoremap <Space>ff :VimFilerBufferDir<CR>

augroup vim-filer
    autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
    nmap <buffer> q <Plug>(vimfiler_hide)
    nmap <buffer> Q <Plug>(vimfiler_exit)
    nmap <buffer> <C-j> <C-w>j
    nmap <buffer> <C-k> <C-w>k
    nmap <buffer> <C-h> <C-w>h
    nmap <buffer> <C-l> <C-w>l
endfunction


" ------------------------------------------------------------------------------
" 'vim-clang'
"
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_diagsopt = ''
