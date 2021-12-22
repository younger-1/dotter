" [insert_command_mode]
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <A-f> <S-Right>
noremap! <A-b> <S-Left>

" [insert_mode]
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap jk <ESC>
inoremap jj <ESC>
inoremap <A-k> <C-o>:m .-2<CR>
inoremap <A-j> <C-o>:m .+1<CR>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-v> <C-g>u<C-r><C-o>+

" [command_mode]
cnoremap <expr> <C-j> wildmenumode() ? "\<C-n>" : "\<C-j>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-p>" : "\<C-k>"
" Change directory hierarchical level
cnoremap <expr> <C-n> wildmenumode() ? "\<Down>" : "\<C-n>"
cnoremap <expr> <C-p> wildmenumode() ? "\<Up>" : "\<C-p>"
" Recall history
cnoremap <A-n> <Down>
cnoremap <A-p> <Up>
cnoremap <C-v> <C-r>+

" [map_mode]
noremap <expr> k v:count == 0 ? "gk" : "k"
noremap <expr> j v:count == 0 ? "gj" : "j"

" [normal_mode]
nnoremap H <cmd>bp<cr>
nnoremap L <cmd>bn<cr>

nnoremap <silent> <C-h> <Cmd>call WinTabSwitch('h')<CR>
nnoremap <silent> <C-j> <Cmd>call WinTabSwitch('j')<CR>
nnoremap <silent> <C-k> <Cmd>call WinTabSwitch('k')<CR>
nnoremap <silent> <C-l> <Cmd>call WinTabSwitch('l')<CR>

nnoremap <C-Up> 5<C-W>-
nnoremap <C-Down> 5<C-W>+
nnoremap <C-Right> 8<C-W>>
nnoremap <C-Left> 8<C-W><

nnoremap <S-Up> <C-W>-
nnoremap <S-Down> <C-W>+
nnoremap <S-Right> <C-W>>
nnoremap <S-Left> <C-W><

nnoremap <C-w>m <C-W>_<C-W>\|

nnoremap ]q <cmd>cnext<cr>
nnoremap [q <cmd>cprev<cr>
nnoremap <C-q> <cmd>call QuickFixToggle()<cr>
nnoremap ]e <cmd>lnext<cr>
nnoremap [e <cmd>lprev<cr>
nnoremap <C-e> <cmd>call LocListToggle()<cr>

nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap ZA <cmd>wqa<cr>
nnoremap <BS> <C-^>
nnoremap <ESC> <cmd>nohl<cr>
nnoremap <S-CR> <cmd>wqa<CR>
nnoremap <expr> <CR> (&buftype is# '' ? ':w<CR>' : '<CR>')

" [visual_mode]
vnoremap < <gv
vnoremap > >gv
vnoremap d "_d
vnoremap X "+x
vnoremap Y "+y
vnoremap H ^
vnoremap L $
vnoremap K :move '<-2<CR>gv-gv
vnoremap J :move '>+1<CR>gv-gv

" [operator_mode]
onoremap H ^
onoremap L $

" [term_mode]
tnoremap <nowait> <Esc><Esc> <C-\\><C-N>
tnoremap <nowait> JJ <C-\\><C-N>

" [vim-plug]
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>

" [leader]
nnoremap <leader>; <cmd>Startify<cr>
nnoremap <leader>r <cmd>source $MYVIMRC<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>c <cmd>bd<cr>


