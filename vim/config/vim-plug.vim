function! s:is_managed(name)
  return has_key(g:plugs[a:name], 'uri')
endfunction

function! s:names(...)
  " return sort(filter(keys(g:plugs), 'stridx(v:val, a:1) == 0 && s:is_managed(v:val)'))
  return g:plugs ->keys() ->filter('stridx(v:val, a:1) == 0 && s:is_managed(v:val)') ->sort()
endfunction

command! -nargs=1 -bang -complete=customlist,s:names PlugDir exec 'YoungOpenDir ' ..  g:plugs[<q-args>]['dir']

" [vim-plug]
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
command! PU PlugUpdate | PlugUpgrade

