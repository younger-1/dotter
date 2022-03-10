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

if jetpack#tap('simplebuffer.vim')
  nnoremap <leader>bf <cmd>SimpleBufferToggle<cr>
endif

if jetpack#tap('vim-sayonara')
  " nnoremap <leader>c <cmd>Sayonara!<cr>
endif

if jetpack#tap('vim-buffet')
  let g:buffet_powerline_separators = 1
  " let g:buffet_noseparator = "▌"
  " let g:buffet_separator = "▎"
  let g:buffet_show_index = 1
  let g:buffet_modified_icon = " ●"
  let g:buffet_tab_icon = ""
  let g:buffet_left_trunc_icon = ""
  let g:buffet_right_trunc_icon = ""

  nnoremap <leader>c <cmd>Bw<cr>
  nnoremap <leader>bo <cmd>Bonly<cr>

  nmap <leader>1 <Plug>BuffetSwitch(1)
  nmap <leader>2 <Plug>BuffetSwitch(2)
  nmap <leader>3 <Plug>BuffetSwitch(3)
  nmap <leader>4 <Plug>BuffetSwitch(4)
  nmap <leader>5 <Plug>BuffetSwitch(5)
  nmap <leader>6 <Plug>BuffetSwitch(6)
  nmap <leader>7 <Plug>BuffetSwitch(7)
  nmap <leader>8 <Plug>BuffetSwitch(8)
  nmap <leader>9 <Plug>BuffetSwitch(9)
  nmap <leader>0 <Plug>BuffetSwitch(10)

  " Note: Make sure the function is defined before `vim-buffet` is loaded.
  function! g:BuffetSetCustomColors()
    " <https://github.com/Jorgexyx/neovim-config/blob/a16455ba624a114b816603f072a191170deb975c/layers/%2Bui/buffet/config.vim>
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=106 ctermfg=8 guibg=#b8bb26 guifg=#000000
    hi! BuffetTrunc cterm=bold ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=239 ctermfg=8 guibg=#504945 guifg=#000000
    hi! BuffetTab cterm=NONE ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=239 guibg=#999999 guifg=#504945
  endfunction
endif

if jetpack#tap('lightline.vim')
  " TODO: <https://github.com/bagrat/dotfiles/blob/master/vim/config/statusline.vim>
  vim9cmd g:lightline = {
    colorscheme: 'wombat',
    separator: { 'left': '', 'right': '' },
    subseparator: { 'left': '│', 'right': '│' },
    active: {
      left: [
        [ 'mode', 'paste' ],
        [ 'readonly', 'filename', 'modified' ],
        [ 'fugitive', 'cocstatus' ],
      ],
    },
    component_function: {
      fugitive: 'LightLineFugitive',
      filename: 'LightLineFilename',
      cocstatus: 'coc#status',
    },
    enable: {
      tabline: 0,
    },
  }

  function! LightLineFugitive()
    if &ft !~? 'defx' && exists('*fugitive#head')
      let branch = fugitive#head()
      return branch !=# '' ? ' '.branch : ''
    endif
    return ''
  endfunction
endif

if jetpack#tap('vim-floaterm')
  let g:floaterm_keymap_toggle = '<C-t>'
  let g:floaterm_keymap_next   = ']\'
  let g:floaterm_keymap_prev   = '[\'
  let g:floaterm_keymap_new    = ']<C-t>'
  let g:floaterm_keymap_kill   = '[<C-t>'

  " let g:floaterm_keymap_toggle = '<leader>tt'
  " let g:floaterm_keymap_next   = '<leader>tj'
  " let g:floaterm_keymap_prev   = '<leader>tk'
  " let g:floaterm_keymap_new    = '<leader>tT'
  " let g:floaterm_keymap_kill   = 'No need!'
endif
