command! -nargs=1 -complete=command Cap
\ <mods> new |
\ setlocal buftype=nofile bufhidden=hide noswapfile |
\ call setline(1, split(execute(<q-args>), '\n'))

function! YoungOpenDir(...)
  let g:Yj_open_dir = get(g:, 'Yj_open_dir', function('netrw#Explore', [0,0,0]))
  call g:Yj_open_dir(a:1)
endfunction
command! -nargs=1 YoungOpenDir call YoungOpenDir(<q-args>)
