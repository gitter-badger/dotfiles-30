"------------------------------------------------------------------------------
" vim-cpp-enhanced-highlight
"
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" ------------------------------------------------------------------------------
" 'fatih/vim-go'
"
let g:go_highlight_functions = 1
let g:go_highlight_methods   = 1
let g:go_highlight_structs   = 1

" ------------------------------------------------------------------------------
" 'beyondmarc/opengl.vim'
"
autocmd BufRead *.c,*.h,*.cpp,*.hpp call MyOpenGLCheck()
function! MyOpenGLCheck()
  if search('^#include <gl.*\.h>','n') > 0 ||
  \  search('^#include <GL.*/gl.*\.h>', 'n') > 0 ||
  \  search('^#include <EGL/egl.h>', 'n') > 0
    NeoBundleSource opengl.vim
  endif
endfunction

" ------------------------------------------------------------------------------
" 'Rip-Rip/clang_complete'
"
" set completeopt=menuone
" let g:clang_complete_auto = 0
" let g:clang_auto_select = 0
" let g:clang_complete_copen = 0
" let g:clang_hl_errors = 0
" let g:clang_snippets = 0
" let g:clang_trailing_placeholder = 0
" let g:clang_use_library = 1
" let g:clang_complete_macros = 0
" let g:clang_complete_patterns = 0
"
" " let g:clang_library_path = '/usr/lib/llvm' "fodra32
" " let g:clang_library_path = '/usr/lib64/llvm' "fedora64
" " let g:clang_library_path = '/usr/lib/llvm-3.5/lib' "Ubuntu64
" let g:clang_library_path = '/usr/lib/llvm-3.5/lib' "Ubuntu32
"
" let g:clang_debug = 0
" let g:clang_user_options = '-std= c++1y -w'

" ------------------------------------------------------------------------------
" 'scrooloose/syntastic'
"
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" なぜかQuickfix listのエラーがでるので必ず0にする
let g:syntastic_auto_loc_list = 0

let g:syntastic_enable_signs   = 1
let g:syntastic_error_symbol   = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_echo_current_error  = 1
let g:syntastic_enable_highlighting = 0

let g:syntastic_c_config_file   = '~/.clang_complete'
let g:syntastic_cpp_config_file = '~/.clang_complete'
let g:syntastic_cpp_compiler_options = '-std=c++1y -Wall -Weffc++'
let g:syntastic_c_compiler = 'clang++'

" cpplint
let g:syntastic_cpp_cpplint_thres = 5
let g:syntastic_cpp_cpplint_args = '--verbose=3'

nnoremap <silent> <Space>s :<C-u>SyntasticCheck cpplint<CR>
