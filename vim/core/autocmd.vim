" augroup young_ft
"   autocmd!
"   autocmd FileType qf,help,man nnoremap <silent> <buffer> q :close<CR>
"   autocmd FileType help nnoremap <buffer> <CR> <C-]>
"   autocmd FileType help nnoremap <buffer> <BS> <C-T>
"   autocmd FileType help nnoremap <buffer> { :pop<cr>
"   autocmd FileType help nnoremap <buffer> } :tag<cr> 
"   autocmd FileType vim setlocal foldlevel=0 foldmethod=marker foldmarker=\ {{{,\ }}}
" augroup END

