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

