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
let g:rooter_disable_map = 1
let g:rooter_change_directory_for_non_project_files = 1

" ------------------------------------------------------------------------------
" gitgutter
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
" 'rhysd/committia.vim'
" You can get the information about the windows with first argument as a dictionary.
"
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
