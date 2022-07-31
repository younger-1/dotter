augroup _young_jetpack
  autocmd!
augroup END

function! s:config_complete(...) abort
  return (g:vhome .. '/config/*.vim') ->glob(0, 1) ->map('strpart(v:val, strlen(g:vhome) + strlen("/config/"))') ->join("\n")
endfunction

function! s:config(config) abort
  for name in jetpack#names()
    if name =~ a:config
      let plugin = name
      break
    endif
  endfor
  if !exists('l:plugin')
    echomsg '[young]: ' .. a:config .. '(config) is not a good name.'
    return
  endif
  let JetName = substitute(substitute(plugin, '\W\+', '_', 'g'), '\(^\|_\)\(.\)', '\u\2', 'g')
  execute printf('autocmd _young_jetpack User Jetpack%sPre  ConfigSource %s.vim', JetName, a:config)
  execute printf('autocmd _young_jetpack User Jetpack%sPost ConfigSource %s.vim', JetName, a:config)
endfunction

command! -nargs=1 -complete=custom,s:config_complete ConfigSource exec 'so ' .. fnameescape(g:vhome .. '/config/<args>')

command! -nargs=1 Config call s:config("<args>")

" Config defx
Config nerdtree
Config matchup
Config startify
Config which-key

delcommand Config
