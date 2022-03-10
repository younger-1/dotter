" [insert_command_mode]
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <A-f> <S-Right>
noremap! <A-b> <S-Left>
" noremap! ( ()<Left>
" noremap! [ []<Left>
" noremap! { {}<Left>

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

" cnoremap ( ()<Left>
" cnoremap [ []<Left>
" cnoremap { {}<Left>

" [map_mode]
noremap <expr> k v:count == 0 ? "gk" : "k"
noremap <expr> j v:count == 0 ? "gj" : "j"
noremap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'


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

" Vertical/Horizontal Scrolling
nnoremap <A-l> zl
nnoremap <A-h> zh
nnoremap <A-j> <C-E>
nnoremap <A-k> <C-Y>

nnoremap <C-w>m <C-W>_<C-W>\|
nnoremap <c-w>S :bo split<cr>
nnoremap <c-w>V :bo vert split<cr>

nnoremap <C-q> <cmd>call QuickFixToggle()<cr>
nnoremap <C-e> <cmd>call LocListToggle()<cr>
nnoremap ]q <cmd>cnext<cr>
nnoremap [q <cmd>cprev<cr>
nnoremap ]Q <Cmd>cnewer<CR>
nnoremap [Q <Cmd>colder<CR>
nnoremap ]e <cmd>lnext<cr>
nnoremap [e <cmd>lprev<cr>
nnoremap ]E <Cmd>lnewer<CR>
nnoremap [E <Cmd>lolder<CR>

nnoremap ]t <Cmd>tabnext<CR>
nnoremap [t <Cmd>tabprev<CR>

nnoremap Y y$
" qq to record, Q to replay
nnoremap Q @q
nnoremap n nzz
nnoremap N Nzz
nnoremap ZA <cmd>wqa<cr>
nnoremap <BS> <C-^>
" BUG: vim's bug, nvim is ok
nnoremap <ESC><ESC> <cmd>nohl<cr>
" nnoremap <S-CR> <cmd>wqa<CR>
" nnoremap <expr> <CR> (&buftype is# '' ? ':w<CR>' : '<CR>')

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
" Search visual selection
vnoremap g/ "sy/\V<C-r>=escape(@s,'/\')<CR><CR>``

" [operator_mode]
onoremap H ^
onoremap L $

" [term_mode]
tnoremap <nowait> <Esc><Esc> <C-\><C-N>
tnoremap <nowait> JJ <C-\><C-N>

" [toggle]
nnoremap yo- <cmd>set cursorline!<cr>
nnoremap yo\| <cmd>set cursorcolumn!<cr>
nnoremap yo<tab> :call TabToggle()<cr>
nnoremap yon <cmd>set nu!<cr>
nnoremap yor <cmd>set rnu!<cr>
nnoremap yol <cmd>set list!<cr>
nnoremap yow <cmd>set wrap!<cr>
nnoremap yos <cmd>set spell!<cr>
nnoremap yom :set mouse=<C-R>=&mouse == "" ? "a" : ""<cr><cr>
nnoremap yob :set background=<C-R>=&background == "dark" ? "light" : "dark"<cr><cr>

" [leader]
nnoremap <leader>yr <cmd>source $MYVIMRC <bar> :echomsg '[young]: vimrc refreshed!'<cr>
nnoremap <leader>yc <cmd>e $MYVIMRC<cr>

nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>c <cmd>bd<cr>
nnoremap <leader>z <cmd>Goyo<cr>

nnoremap <leader>bo :%bd <bar> e# <bar> bd #<CR>
nnoremap <leader>bb :ls<CR>:b
nnoremap <leader>bs :ls<CR>:sb
nnoremap <leader>bv :ls<CR>:vertical sb
nnoremap <leader>bt :ls<CR>:tab sb
nnoremap <leader>bd :ls<CR>:bdelete
