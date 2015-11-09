" set paste
nnoremap <silent> ,p :<C-u>set paste!<CR>
      \:<C-u>echo("Toggle PasteMode => " . (&paste == 0 ? "Off" : "On"))<CR>

nnoremap <silent> ,P :<C-u>set list!<CR>
      \:<C-u>set number!<CR>
      \:<C-u>set foldcolumn=0<CR>
      \:<C-u>GitGutterToggle<CR>
      \:<C-u>echo("Toggle CopyMode => " . (&list == 0 ? "On" : "Off"))<CR>

" clear search highlight
nnoremap ,, :<C-u>nohlsearch<CR>

" KEYMAP
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>
nnoremap <silent> [1 :tabnext1<CR>
nnoremap <silent> [2 :tabnext2<CR>
nnoremap <silent> [3 :tabnext3<CR>
nnoremap <silent> [4 :tabnext4<CR>
nnoremap <silent> [5 :tabnext5<CR>
nnoremap <silent> [6 :tabnext6<CR>
nnoremap <silent> [7 :tabnext7<CR>
nnoremap <silent> [8 :tabnext8<CR>
nnoremap <silent> [9 :tabnext9<CR>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

" Edit vimrc
nnoremap ,v :edit $MYVIMRC<CR>

" Ctrl + j, k, h, l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Left>  <C-w>h
nnoremap <C-Right> <C-w>l

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" indent
vnoremap < <gv
vnoremap > >gv

" ESC Bind
imap <C-j> <Esc>
" SAVE
nnoremap <Space>w  :<C-u>w<CR>
" CLOSE
nnoremap <Space>z  :<C-u>q<CR>
nnoremap <Space>Z  :<C-u>q!<CR>

" OPEN/CLOSE QUICKFIX WINDOW SETTINGS
nnoremap <silent> <Space>q :<C-U>QFix<CR>