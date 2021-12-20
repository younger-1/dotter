nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>

nnoremap <leader>; <cmd>Startify<cr>
nnoremap <leader>r <cmd>source $MYVIMRC<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>c <cmd>bd<cr>

" Switch Between Windows and Tabs
function! WinTabSwitch(direction)
    let info = getwininfo(win_getid())[0]
    let wincol = win_screenpos(winnr())[1]
    if a:direction == 'h' && wincol <= 1
        execute 'tabprev|99wincmd l'
    elseif a:direction == 'l' && wincol + info.width >= &columns
        execute 'tabnext|99wincmd h'
    else
        execute 'wincmd '.a:direction
    endif
endfunction

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
