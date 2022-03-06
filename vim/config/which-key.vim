vim9script

if !exists('g:yo_whichkey')
  g:which_key_fallback_to_native_key = 1
  g:which_key_run_map_on_popup = 1
  g:which_key_use_floating_win = 0
  g:which_key_display_names = { ' ': 'SPC', '<C-H>': 'BS', '<CR>': '↵', '<S-CR>': '↑-↵', '<TAB>': '⇆' }

  # autocmd! FileType which_key
  # autocmd  FileType which_key set laststatus=0 noshowmode noruler
  #   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  highlight link WhichKey          Function
  highlight link WhichKeySeperator DiffAdded
  highlight link WhichKeyGroup     Keyword
  highlight link WhichKeyDesc      Identifier
  highlight link WhichKeyFloating  Pmenu

  g:yo_whichkey = 1
  finish
endif

def WhichKeyFormat(mapping: string): string
  var ret = mapping
  ret = substitute(ret, '\c<cr>$', '', '')
  ret = substitute(ret, '^:', '', '')
  ret = substitute(ret, '^\c<cmd>', '', '')
  ret = substitute(ret, '^\c<c-u>', '', '')
  # ret = substitute(ret, '^<Plug>', '', '')
  return ret
enddef
# g:WhichKeyFormatFunc = WhichKeyFormat

# or use lambda
g:WhichKeyFormatFunc = (arg) => arg->substitute('\c<cr>$', '', '')->substitute('^\c<cmd>', '', '')

g:space_whichkey =  {}
g:space_whichkey.f = {
  name: '+LeaderF',
  f: 'file',
  l: 'line',
  t: 'tags in buffer',
  b: 'jump-to-buffer',
  c: 'command-history',
  C: 'colorscheme',
  m: 'most-recent-use',
  d: 'gtags: definition',
  n: 'gtags: next',
  o: 'gtags: recall',
  p: 'gtags: previous',
  r: 'gtags: reference',
}

# let g:space_whichkey['W'] = {
#   \ 'name' : '+windows' ,
#   \ 'h' : ['<C-W>5<'    , 'shrink-width']    ,
#   \ 'j' : ['<C-W>5-'    , 'shrink-height']   ,
#   \ 'k' : ['<C-W>5+'    , 'expand-height']      ,
#   \ 'l' : ['<C-W>5>'    , 'expand-width']   ,
#   \ 's' : ['<C-W>s'     , 'split-window']    ,
#   \ 'v' : ['<C-W>v'     , '[v]split-window'] ,
#   \ 'c' : ['<C-W>c'     , 'close-window']         ,
#   \ 't' : ['<C-W>T'     , 'move-to-tab']    ,
#   \ '=' : ['<C-W>='     , 'balance-window']        ,
#   \ '?' : ['Windows'    , 'fzf-window']            ,
#   \ }

def WhichKeyInit()
  call which_key#register('<Space>', 'g:space_whichkey')
  # call which_key#register('\', "g:backslash_whichkey")
  # call which_key#register('g', "g:g_whichkey")
  # call which_key#register('z', "g:z_whichkey")
enddef

# autocmd! User vim-which-key call s:which_key_init()
WhichKeyInit()
