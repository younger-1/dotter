" augroup young_ft
"   autocmd!
"   autocmd FileType qf,help,man nnoremap <silent> <buffer> q :close<CR>
"   autocmd FileType help nnoremap <buffer> <CR> <C-]>
"   autocmd FileType help nnoremap <buffer> <BS> <C-T>
"   autocmd FileType help nnoremap <buffer> { :pop<cr>
"   autocmd FileType help nnoremap <buffer> } :tag<cr> 
"   autocmd FileType vim setlocal foldlevel=0 foldmethod=marker foldmarker=\ {{{,\ }}}
" augroup END

augroup mySetup
    autocmd!

    " Remove, display/hide trailing whitespace   {{{2
    autocmd BufWrite * %s/\s\+$//ce
    autocmd InsertEnter * :set listchars-=trail:■
    autocmd InsertLeave * :set listchars+=trail:■

    " Turn off line numbers in Terminal windows.   {{{2
    " autocmd TermOpen * setlocal nonumber | startinsert

    " Keep cursor in original position when switching buffers   {{{2
    " if !&diff
    "     autocmd BufLeave * let b:winview = winsaveview()
    "     autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
    " endif

    " Make 'autoread' work more responsively   {{{2
    autocmd BufEnter    * silent! checktime
    autocmd CursorHold  * silent! checktime
    autocmd CursorMoved * silent! checktime

    " Restart with cursor in the location from last session.   {{{2
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END
