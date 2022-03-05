let g:is_plugged = 1

function! s:init_plug()
  " NOTE: define command to use local plugins, see:<https://github.com/tani/vim-jetpack/issues/36>
  command -nargs=1 UseLocal if isdirectory(<args>) | set rtp^=<args> | endif
    \| if isdirectory(<args>..'/after') | set rtp+=<args>/after | endif

  UseLocal $nvim_config_dir

  if !g:is_plugged
    filetype plugin indent on
    syntax on
    return
  endif

  let s:install_path = $vim_config_dir .. '/pack/jetpack/opt/vim-jetpack'
  if empty(glob(s:install_path))
    let s:first_boot = 1
    " vim's system() can't use List as input
    echomsg '[young]: vim-jetpack ...'
    echomsg '[young]: clone into ' .. s:install_path
    call system('git clone --depth 1 https://github.com/tani/vim-jetpack ' .. s:install_path)
  endif

  let g:jetpack#optimization = 2
  " autocmd VimEnter * set path^=.
  autocmd VimEnter * let &path = '.,' .. getcwd() .. ',' .. &path
endfunction

function! s:boot_plug()
  if !g:is_plugged
    return
  endif

  packadd vim-jetpack

  call jetpack#begin()

  call s:plugging()

  " `call plug#end()` to update 'runtimepath' and initialize plugin system
  " Automatically executes `filetype plugin indent on` and `syntax enable`
  " call plug#end()
  call jetpack#end()

  call s:first_boot()
  call timer_start(50, function('<SID>check_missing'))
endfunction

function! s:first_boot()
  if exists('s:first_boot')
    JetpackSync
  endif
endfunction

function! s:check_missing(...)
  " let g:plugs_missing = filter(values(g:plugs), '!isdirectory(v:val.dir)')
  let g:plugs_missing = filter(jetpack#names(), '!jetpack#tap(v:val)')
  if len(g:plugs_missing)
    " let g:plugs_missing = map(g:plugs_missing, 'fnamemodify(v:val.dir, ":h:t")')
    let l:msg = len(g:plugs_missing) ->printf('[young] find %s missing plugins: ')
    let l:msg .= g:plugs_missing ->string()
    echomsg l:msg
  endif

  " install missing plugins
  " for name in jetpack#names()
  "   if !jetpack#tap(name)
  "     call jetpack#sync()
  "     break
  "   endif
  " endfor
endfunction

function! s:plugging()
  " <https://github.com/tani/vim-jetpack/blob/main/doc/jetpack.txt>
  Jetpack 'tani/vim-jetpack', { 'opt': 1 }

  " [Theme]
  Jetpack 'vv9k/bogster'
  Jetpack 'lifepillar/vim-gruvbox8'
  Jetpack 'ryanoasis/vim-devicons'

  " [Basic]
  Jetpack 'sheerun/vim-polyglot',
  Jetpack 'airblade/vim-rooter'

  " [Motion]
  Jetpack 'justinmk/vim-sneak'
  Jetpack 'haya14busa/vim-asterisk'
  Jetpack 'bkad/CamelCaseMotion'
  " Jetpack 'chaoren/vim-wordmotion'
  " Jetpack 'wellle/targets.vim'
  Jetpack 'unblevable/quick-scope'
  Jetpack 'andymass/vim-matchup'

  " [Change]
  Jetpack 'tpope/vim-surround'
  Jetpack 'tpope/vim-abolish'
  Jetpack 'tpope/vim-repeat'
  Jetpack 'kana/vim-textobj-user'
  Jetpack 'kana/vim-textobj-entire'
  " Jetpack 'tommcdo/vim-exchange'
  " -- Comment
  Jetpack 'tpope/vim-commentary'
  " Jetpack 'preservim/nerdcommenter'
  " Jetpack 'tyru/caw.vim'
  Jetpack 'mg979/vim-visual-multi'
  Jetpack 'junegunn/vim-easy-align'

  " [Vim]
  Jetpack 'tpope/vim-scriptease'
  Jetpack 'bagrat/vim-buffet'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'mhinz/vim-startify'

  Jetpack 'junegunn/goyo.vim',      { 'on' : 'Goyo' }
  Jetpack 'junegunn/limelight.vim', { 'on' : 'Limelight' }

  " TODO: join line
  Jetpack 'roxma/nvim-yarp'
  Jetpack 'roxma/vim-hug-neovim-rpc'
  Jetpack 'Shougo/defx.nvim', { 'on' : 'Defx' }
  Jetpack 'gelguy/wilder.nvim'

  " Jetpack 'tpope/vim-vinegar'
  Jetpack 'preservim/nerdtree', { 'on' : 'NERDTreeToggle' }
  Jetpack 'preservim/nerdcommenter'

  Jetpack 'mhinz/vim-signify'
  " Jetpack 'airblade/vim-gitgutter'

  Jetpack 'tpope/vim-fugitive'
  Jetpack 'junegunn/gv.vim'

  Jetpack 'voldikss/vim-floaterm'
  Jetpack 'mbbill/undotree'

  Jetpack 'vim-denops/denops.vim'
  Jetpack 'lambdalisue/guise.vim'

  Jetpack 'lervag/vimtex', { 'for' : 'tex' }
  Jetpack 'ctrlpvim/ctrlp.vim'
  Jetpack 'MattesGroeger/vim-bookmarks'
endfunction

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""

call s:init_plug()
call s:boot_plug()
