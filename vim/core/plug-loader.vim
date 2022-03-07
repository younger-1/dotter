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
  J 'tani/vim-jetpack', { 'opt': 1 }

  " [Theme]
  J 'vv9k/bogster'
  J 'lifepillar/vim-gruvbox8'

  " [Appearance]
  J 'ryanoasis/vim-devicons'

  " [Edit]
  " -- Motion
  J 'justinmk/vim-sneak'
  J 'andymass/vim-matchup'
  J 'haya14busa/vim-asterisk'
  J 'unblevable/quick-scope'
  J 'bkad/CamelCaseMotion'
  " J 'chaoren/vim-wordmotion'
  " -- Textobject
  J 'kana/vim-textobj-user'
  J 'kana/vim-textobj-entire'
  J 'michaeljsmith/vim-indent-object'
  " J 'wellle/targets.vim'
  " --

  " [Change]
  J 'tpope/vim-surround'
  J 'tpope/vim-abolish'
  J 'tpope/vim-repeat'
  J 'mg979/vim-visual-multi'
  J 'junegunn/vim-easy-align'
  " J 'tommcdo/vim-exchange'
  " -- Comment
  J 'tpope/vim-commentary'
  " J 'preservim/nerdcommenter'
  " J 'tyru/caw.vim'
  " -- Autopair
  J 'cohama/lexima.vim'
  " --

  " [Vim]
  J 'tpope/vim-scriptease'

  " [File]
  J 'preservim/nerdtree', { 'on' : 'NERDTreeToggle' }
  " J 'tpope/vim-vinegar'
  J 'roxma/nvim-yarp' | J 'roxma/vim-hug-neovim-rpc'
  J 'Shougo/defx.nvim', { 'on' : 'Defx' }
  " -- Project
  J 'airblade/vim-rooter'
  " -- Session
  " --

  " [Search]
  " J 'junegunn/fzf' | J 'junegunn/fzf.vim'
  " J 'Yggdroot/LeaderF'
  " J 'liuchengxu/vim-clap'
  " J 'vim-ctrlspace/vim-ctrlspace'
  " -- Find
  J 'ctrlpvim/ctrlp.vim'
  J 'junegunn/fzf', { 'event' : 'BufWinEnter' } | J 'junegunn/fzf.vim'
  " -- Grep
  " J 'brooth/far.vim'
  " J 'mhinz/vim-grepper'
  " J 'dyng/ctrlsf.vim'
  " J 'dyng/ctrlsf.vim'
  " J 'hrsh7th/vim-seak'
  " --

  " [Git]
  J 'mhinz/vim-signify'
  " J 'airblade/vim-gitgutter'
  J 'tpope/vim-fugitive'
  J 'junegunn/gv.vim'

  " [UI]
  J 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!'] }
  J 'voldikss/vim-floaterm'
  J 'mbbill/undotree'
  " -- Dashboard
  J 'mhinz/vim-startify'
  " -- Bufferline
  " -- Statusline
  J 'itchyny/lightline.vim'
  " --

  " [Lang]
  J 'sheerun/vim-polyglot',

  " [LSP]
  " J 'prabirshrestha/vim-lsp'
  " J 'prabirshrestha/asyncomplete.vim'

  " [Code]
  " -- Snippet Engine
  " J 'SirVer/ultisnips' | J 'thomasfaingnaert/vim-lsp-ultisnips'
  " J 'hrsh7th/vim-vsnip' | J 'hrsh7th/vim-vsnip-integ'
  " -- Snippet
  J 'honza/vim-snippets'
  " J 'rafamadriz/friendly-snippets'
  " --

  " [Write]
  J 'junegunn/goyo.vim',      { 'on' : 'Goyo' }
  J 'junegunn/limelight.vim', { 'on' : 'Limelight' }
  " -- LaTex
  J 'lervag/vimtex', { 'for' : 'tex' }
  " -- Markdown
  " --

  " [Tool]
  " -- Open
  " J 'justinmk/vim-gtfo'
  " -- Together
  " --

  J 'bagrat/vim-buffet'

  J 'gelguy/wilder.nvim'

  J 'MattesGroeger/vim-bookmarks'

  " [Coc]

  " [Denops]
  J 'vim-denops/denops.vim'
  J 'lambdalisue/guise.vim'
endfunction

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""

call s:init_plug()
call s:boot_plug()
