" Normally this if-block is not needed, because `:set nocp` is done
" automatically when .vimrc is found. However, this might be useful
" when you execute `vim -u .vimrc` from the command line.
if &compatible
  " :set nocompatible should not be executed twice to avoid side effects
  set nocompatible
endif

" If you set the 'encoding' option in your |.vimrc|,
" `:scriptencoding` must be placed after that.
set encoding=utf-8
scriptencoding utf-8
" language zh_CN.uft-8
" language en_US.uft-8

" let $vim_config_dir = expand('<sfile>:p:h')
let $vim_config_dir = $HOME .. (has('win32') ? '/vimfiles' : '/.vim')
let $vim_cache_dir = expand('~/.cache/vim')
let $nvim_config_dir = expand('~/.config/nvim')

let g:is_win = has('win32')
let g:is_vim8 = has('patch-8.0.0039') && exists('*job_start')
let g:path_sep = g:is_win ? '\' : '/'
let g:sidebar_width = 30
let g:type_t = {
\   'string':  type(''),
\   'list':    type([]),
\   'dict':    type({}),
\   'funcref': type(function('call'))
\ }
