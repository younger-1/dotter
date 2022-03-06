if jetpack#tap('quick-scope')
  let g:qs_lazy_highlight = 1
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  let g:qs_buftype_blacklist = ['terminal', 'nofile']
  let g:qs_filetype_blacklist = ['dashboard', 'startify']
endif

if jetpack#tap('vim-visual-multi')
  let g:VM_default_mappings = 0
  let g:VM_maps = {}
  let g:VM_maps["Undo"] = 'u'
  let g:VM_maps["Redo"] = '<C-r>'
  let g:VM_maps['Find Under']         = '<C-n>'
  let g:VM_maps['Find Subword Under'] = '<C-n>'
endif

if jetpack#tap('vim-visual-multi')
  " Do not change working directory when opening files.
  let g:startify_change_to_dir = 0
  let g:startify_fortune_use_unicode = 1
endif

if jetpack#tap('limelight.vim')
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
endif

if jetpack#tap('wilder.nvim')
  " call wilder#setup({'modes': [':', '/', '?']})
  call wilder#setup({'modes': ['/', '?']})
endif

if jetpack#tap('nerdtree')
  nnoremap <leader>e <cmd>NERDTreeToggle<CR>
endif

if jetpack#tap('defx.nvim')
  nnoremap <leader>n <cmd>Defx<CR>
endif

if jetpack#tap('vim-startify')
  nnoremap <leader>; <cmd>Startify<cr>
endif

if jetpack#tap('CamelCaseMotion')
  let g:camelcasemotion_key = '\'
endif

if jetpack#tap('lexima.vim')
  " let g:lexima_enable_basic_rules = 1
endif

if jetpack#tap('vim-which-key')
  nnoremap <silent> <leader> <cmd>WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> <cmd>WhichKey '\'<CR>
  nnoremap <silent> ] <Cmd>WhichKey ']'<CR>
  nnoremap <silent> [ <Cmd>WhichKey '['<CR>
  nnoremap <silent> g <Cmd>WhichKey 'g'<CR>
  nnoremap <silent> z <Cmd>WhichKey 'z'<CR>
  nnoremap <silent> y <Cmd>WhichKey 'y'<CR>
  " nnoremap <silent> , <Cmd>WhichKey ','<CR>
  " nnoremap <silent> <C-f> <Cmd>WhichKey '<C-f>'<CR>
  " nnoremap <silent> <C-w> <Cmd>WhichKey '<C-w>'<CR>

  vnoremap <silent> <leader> <Cmd>WhichKeyVisual '<Space>'<CR>
  vnoremap <silent> <localleader> <Cmd>WhichKeyVisual '\'<CR>
  vnoremap <silent> ] <Cmd>WhichKeyVisual ']'<CR>
  vnoremap <silent> [ <Cmd>WhichKeyVisual '['<CR>
  " vnoremap <silent> g <Cmd>WhichKeyVisual 'g'<CR>
  " vnoremap <silent> z <Cmd>WhichKeyVisual 'z'<CR>
  " vnoremap <silent> y <Cmd>WhichKey 'y'<CR>
  " vnoremap <silent> , <Cmd>WhichKeyVisual ','<CR>
  " vnoremap <silent> <C-f> <Cmd>WhichKey '<C-f>'<CR>
  " vnoremap <silent> <C-w> <Cmd>WhichKey '<C-w>'<CR>
endif
