" if !get(g:, 'yo_nerdtree')
"   let g:yo_nerdtree = 1
"   finish
" endif

if !exists("g:yo_nerdtree")
  autocmd BufEnter * ++nested if (tabpagenr('$') == 1 && winnr('$') == 1 && &filetype ==# 'nerdtree') | q | endif

  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
  let g:NERDTreeIgnore = [
    \ '\.git$', '\.hg$', '\.svn$', '\.swp$',
    \ '\.pyc$', '\.pyo$', '__pycache__$'
    \ ]

  let g:yo_nerdtree = 1
  finish
endif

nnoremap <leader>e <cmd>call <SID>nerd_tree_find_toggle(string(expand("%:p")))<CR>

function! s:nerd_tree_find_toggle(path)
  if g:NERDTree.IsOpen()
    NERDTreeClose
  else
    NERDTreeFind
  endif
endfunction

