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

  let g:jetpack#optimization = 1
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
  command! -bar JetClean call jetpack#clean()
  command! -nargs=* -bar JetInstall call jetpack#install(<args>)
  command! -nargs=* -bar JetUpdate call jetpack#update(<args>)
  command! -nargs=+ -bar Yo call jetpack#add(<args>)

  " <https://github.com/tani/vim-jetpack/blob/main/doc/jetpack.txt>
  " Jetpack 'tani/vim-jetpack', {'opt': 1}
  Yo 'tani/vim-jetpack', { 'opt': 1 }

  " [Theme]
  Yo 'vv9k/bogster'
  Yo 'lifepillar/vim-gruvbox8'
  Yo 'vimpostor/vim-prism'
  Yo 'srcery-colors/srcery-vim'
  Yo 'ajmwagar/vim-deus'
  Yo 'guns/xterm-color-table.vim'
  Yo 'eemed/sitruuna.vim'

  " [Appearance]
  Yo 'ryanoasis/vim-devicons'

  " [Edit]
  " -- Motion
  Yo 'justinmk/vim-sneak'
  " Yo 'easymotion/vim-easymotion'
  Yo 'andymass/vim-matchup'
  Yo 'haya14busa/vim-asterisk'
  Yo 'unblevable/quick-scope'
  Yo 'bkad/CamelCaseMotion'
  " Yo 'chaoren/vim-wordmotion'
  " -- Textobject
  Yo 'kana/vim-textobj-user'
  Yo 'kana/vim-textobj-entire'
  Yo 'michaeljsmith/vim-indent-object'
  " Yo 'wellle/targets.vim'
  " --

  " [Change]
  Yo 'tpope/vim-surround'
  Yo 'tpope/vim-abolish'
  Yo 'tpope/vim-repeat'
  Yo 'mg979/vim-visual-multi'
  Yo 'junegunn/vim-easy-align'
  " Yo 'tommcdo/vim-exchange'
  " -- Comment
  Yo 'tpope/vim-commentary'
  " Yo 'preservim/nerdcommenter'
  " Yo 'tyru/caw.vim'
  " -- Autopair
  Yo 'cohama/lexima.vim'
  " --

  " [Vim]
  Yo 'tpope/vim-scriptease'
  " Yo 'tpope/vim-sleuth'
  " Yo 'gelguy/wilder.nvim'
  " Yo 'Shougo/echodoc.vim'

  " [BWT]
  " -- switcher
  " Yo 'codcodog/simplebuffer.vim', { 'on' : 'SimpleBufferToggle' }
  " Yo 'mhinz/vim-sayonara', { 'on' : 'Sayonara' }
  " -- window
  Yo 'dhruvasagar/vim-zoom'
  " --

  " [File]
  Yo 'preservim/nerdtree', { 'on' : 'NERDTreeToggle' }
  " Yo 'tpope/vim-vinegar'
  Yo 'roxma/nvim-yarp' | Yo 'roxma/vim-hug-neovim-rpc'
  " Yo 'Shougo/defx.nvim', { 'on' : 'Defx' }
  " -- Project
  Yo 'airblade/vim-rooter'
  " -- Session
  " --

  " [Search]
  Yo 'junegunn/fzf', { 'event' : 'BufWinEnter' } | Yo 'junegunn/fzf.vim'
  " Yo 'Yggdroot/LeaderF'
  " Yo 'liuchengxu/vim-clap'
  " Yo 'vim-ctrlspace/vim-ctrlspace'
  " -- Find
  Yo 'ctrlpvim/ctrlp.vim'
  " -- Grep
  " Yo 'brooth/far.vim'
  " Yo 'mhinz/vim-grepper'
  " Yo 'dyng/ctrlsf.vim'
  " Yo 'hrsh7th/vim-seak'
  " --

  " [Git]
  Yo 'mhinz/vim-signify'
  " Yo 'airblade/vim-gitgutter'
  Yo 'tpope/vim-fugitive'
  " Yo 'tpope/vim-rhubarb' " github integration
  Yo 'junegunn/gv.vim'

  " [UI]
  Yo 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKeyVisual'] }
  Yo 'voldikss/vim-floaterm'
  Yo 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  " -- Dashboard
  Yo 'mhinz/vim-startify'
  " -- Bufferline
  Yo 'bagrat/vim-buffet', { 'event' : 'BufWinEnter' }
  " -- Statusline
  Yo 'itchyny/lightline.vim'
  " --

  " [Lang]
  Yo 'sheerun/vim-polyglot',

  " [LSP]
  " Yo 'prabirshrestha/vim-lsp'
  " Yo 'prabirshrestha/asyncomplete.vim'

  " [Code]
  " -- Snippet Engine
  " Yo 'SirVer/ultisnips' | Yo 'thomasfaingnaert/vim-lsp-ultisnips'
  " Yo 'hrsh7th/vim-vsnip' | Yo 'hrsh7th/vim-vsnip-integ'
  " -- Snippet
  Yo 'honza/vim-snippets'
  " Yo 'rafamadriz/friendly-snippets'
  " -- Linting
  " Yo 'dense-analysis/ale'
  " -- Debugging
  " Yo 'puremourning/vimspector'
  " --

  " [Write]
  Yo 'junegunn/goyo.vim',      { 'on' : 'Goyo' }
  Yo 'junegunn/limelight.vim', { 'on' : 'Limelight' }
  " -- LaTex
  Yo 'lervag/vimtex', { 'for' : 'tex' }
  " -- Markdown
  " --

  " [Tool]
  " -- Open
  " Yo 'justinmk/vim-gtfo'
  " -- Together
  " --

  Yo 'MattesGroeger/vim-bookmarks'

  " [Coc]
  " Yo 'neoclide/coc.nvim', { 'branch': 'release' }

  " [Denops]
  " Yo 'vim-denops/denops.vim'
  " Yo 'lambdalisue/guise.vim'
endfunction

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""

call s:init_plug()
call s:boot_plug()
