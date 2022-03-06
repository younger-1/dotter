if !exists('g:yo_whichkey')
  let g:which_key_fallback_to_native_key=1
  let g:which_key_run_map_on_popup = 1
  let g:which_key_use_floating_win = 0
  let g:which_key_display_names = { ' ': 'SPC', '<C-H>': 'BS', '<CR>': '↵', '<S-CR>': "↑-↵", '<TAB>': '⇆' }

  " autocmd! FileType which_key
  " autocmd  FileType which_key set laststatus=0 noshowmode noruler
  "   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  highlight link WhichKey          Function
  highlight link WhichKeySeperator DiffAdded
  highlight link WhichKeyGroup     Keyword
  highlight link WhichKeyDesc      Identifier
  highlight link WhichKeyFloating  Pmenu

  let g:yo_whichkey = 1
  finish
endif

function s:which_key_format(mapping) abort
  let l:ret = a:mapping
  let l:ret = substitute(l:ret, '\c<cr>$', '', '')
  let l:ret = substitute(l:ret, '^:', '', '')
  let l:ret = substitute(l:ret, '^\c<cmd>', '', '')
  let l:ret = substitute(l:ret, '^\c<c-u>', '', '')
  " let l:ret = substitute(l:ret, '^<Plug>', '', '')
  return l:ret
endfunction
let g:WhichKeyFormatFunc = function('s:which_key_format')

let g:space_whichkey =  {}
let g:space_whichkey['f'] = {
  \ 'name' : '+LeaderF',
  \ 'f' : 'file',
  \ 'l' : 'line',
  \ 't' : 'tags in buffer',
  \ 'b' : 'jump-to-buffer',
  \ 'c' : 'command-history',
  \ 'C' : 'colorscheme',
  \ 'm' : 'most-recent-use',
  \ 'd' : 'gtags: definition',
  \ 'n' : 'gtags: next',
  \ 'o' : 'gtags: recall',
  \ 'p' : 'gtags: previous',
  \ 'r' : 'gtags: reference',
  \ }
let g:space_whichkey['W'] = {
  \ 'name' : '+windows' ,
  \ 'h' : ['<C-W>5<'    , 'shrink-width']    ,
  \ 'j' : ['<C-W>5-'    , 'shrink-height']   ,
  \ 'k' : ['<C-W>5+'    , 'expand-height']      ,
  \ 'l' : ['<C-W>5>'    , 'expand-width']   ,
  \ 's' : ['<C-W>s'     , 'split-window']    ,
  \ 'v' : ['<C-W>v'     , '[v]split-window'] ,
  \ 'c' : ['<C-W>c'     , 'close-window']         ,
  \ 't' : ['<C-W>T'     , 'move-to-tab']    ,
  \ '=' : ['<C-W>='     , 'balance-window']        ,
  \ '?' : ['Windows'    , 'fzf-window']            ,
  \ }

function! s:which_key_init()
  call which_key#register('<Space>', "g:space_whichkey")
  " call which_key#register('g', "g:g_whichkey")
  " call which_key#register('z', "g:z_whichkey")
  " call which_key#register('\', "g:backslash_whichkey")
endfunction

" autocmd! User vim-which-key call s:which_key_init()
call s:which_key_init()
