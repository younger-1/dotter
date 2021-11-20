" Usage: vim -u pager.vim

" [vim] need
set nocompatible

set nomodifiable " Only in version 6.0
set readonly

" in windows [vim] work on unnamed, not unnamedplus
set clipboard=unnamed

set laststatus=0
set cmdheight=1
set number
set hls
set ignorecase
set smartcase
set listchars=space:·,eol:↲,trail:~,tab:>-,extends:>,precedes:<,nbsp:+
set list

syntax enable

" Key bindings.
nnoremap q :q!<CR>

nmap <Up> <C-Y>
nmap <Down> <C-E>

nnoremap <nowait> <space>   <C-f><C-G>
" [nvim] not work
nnoremap <nowait> <S-space> <C-b><C-G>

" [nvim] still wait too long
nnoremap <nowait> d <C-d><C-G>
nnoremap <nowait> u <C-u><C-G>

nnoremap <nowait> f <C-f><C-G>
nnoremap <nowait> b <C-b><C-G>

nnoremap <nowait> s /
nnoremap <nowait> c /
nnoremap <nowait> a /
nnoremap <nowait> i /
nnoremap <nowait> o /

nnoremap <C-l> <cmd>nohlsearch<cr><C-l>
