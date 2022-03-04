let s:is_plugged = 1

function s:before_plug()
  if !s:is_plugged
    return
  endif

  " let s:install_path = $vim_config_dir .. '/autoload/plug.vim'
  let s:install_path = $vim_config_dir .. '/autoload/jetpack.vim'
  if empty(glob(s:install_path))
    " silent execute '!curl -fLo ' .. s:install_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    silent execute '!curl -fLo ' .. s:install_path .. ' --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim'

    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " let g:plug_url_format = 'https://github.com/%s.git'
  " let g:plug_home = $vim_cache_dir .. '/plugged'

  let g:jetpack#optimization = 2
endfunction

function s:after_plug()
  " NOTE: define command to use local plugins, see:<https://github.com/tani/vim-jetpack/issues/36>
  command -nargs=1 JetpackLocal if isdirectory(<args>) | set rtp^=<args> | endif
    \| if isdirectory(<args>..'/after') | set rtp+=<args>/after | endif

  JetpackLocal $nvim_config_dir

  if s:is_plugged
    return
  endif

  filetype plugin indent on
  syntax on
endfunction

function s:boot_plug()
  if !s:is_plugged
    return
  endif

  " call plug#begin()
  call jetpack#begin()

  call s:plugging()

  " `call plug#end()` to update 'runtimepath' and initialize plugin system
  " Automatically executes `filetype plugin indent on` and `syntax enable`
  " call plug#end()
  call jetpack#end()

  " call timer_start(50, function('<SID>check_missing'))
endfunction

function! s:check_missing(...)
  let g:plugs_missing = filter(values(g:plugs), '!isdirectory(v:val.dir)')
  if len(g:plugs_missing)
    let g:plugs_missing = map(g:plugs_missing, 'fnamemodify(v:val.dir, ":h:t")')
    let l:msg = len(g:plugs_missing) ->printf('[young] find %s missing plugins: ')
    let l:msg .= g:plugs_missing ->string()
    echomsg l:msg
  endif
endfunction

function s:plugging()
  " <https://github.com/tani/vim-jetpack/blob/main/doc/jetpack.txt>

  " [Theme]
  Jetpack 'vv9k/bogster'
  Jetpack 'lifepillar/vim-gruvbox8'
  Jetpack 'ryanoasis/vim-devicons'

  " [Basic]
  Jetpack 'sheerun/vim-polyglot', { 'on' : [] }
  Jetpack 'airblade/vim-rooter'

  " [Motion]
  Jetpack 'justinmk/vim-sneak'
  Jetpack 'haya14busa/vim-asterisk'
  Jetpack 'bkad/CamelCaseMotion'
  " Jetpack 'wellle/targets.vim'
  Jetpack 'unblevable/quick-scope'
    let g:qs_lazy_highlight = 1
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    let g:qs_buftype_blacklist = ['terminal', 'nofile']
    let g:qs_filetype_blacklist = ['dashboard', 'startify']
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
    let g:VM_default_mappings = 0
    let g:VM_maps = {}
    let g:VM_maps["Undo"] = 'u'
    let g:VM_maps["Redo"] = '<C-r>'
    let g:VM_maps['Find Under']         = '<C-n>'
    let g:VM_maps['Find Subword Under'] = '<C-n>'

  Jetpack 'junegunn/vim-easy-align'

  " [Vim]
  Jetpack 'tpope/vim-scriptease'
  Jetpack 'bagrat/vim-buffet'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'mhinz/vim-startify'
    " Do not change working directory when opening files.
    let g:startify_change_to_dir = 0
    let g:startify_fortune_use_unicode = 1

  Jetpack 'junegunn/goyo.vim',      { 'on' : 'Goyo' }
  Jetpack 'junegunn/limelight.vim', { 'on' : 'Limelight' }
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!

  " TODO: join line
  Jetpack 'roxma/nvim-yarp'
  Jetpack 'roxma/vim-hug-neovim-rpc'
  Jetpack 'Shougo/defx.nvim', { 'on' : 'Defx' }
  Jetpack 'gelguy/wilder.nvim'

  " Jetpack 'tpope/vim-vinegar'
  Jetpack 'preservim/nerdtree'
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

call s:before_plug()
call s:boot_plug()
call s:after_plug()

function! s:config_complete(...) abort
  return (g:vhome .. '/config/*.vim') ->glob(0, 1) ->map('strpart(v:val, strlen(g:vhome) + strlen("/config/"))') ->join("\n")
endfunction

command! -nargs=1 -complete=custom,s:config_complete ConfigSource exec 'so ' .. fnameescape(g:vhome .. '/config/<args>')

augroup _young_jetpack
  autocmd!
augroup END

function! s:config(config) abort
  for name in jetpack#names()
    if name =~ a:config
      let plugin = name
      break
    endif
  endfor
  if !exists('l:plugin')
    echomsg '[young]: ' .. a:config .. '(config) is not clear'
    return
  endif
  let JetName = substitute(substitute(plugin, '\W\+', '_', 'g'), '\(^\|_\)\(.\)', '\u\2', 'g')
  execute printf('autocmd _young_jetpack User Jetpack%s ConfigSource %s.vim', JetName, a:config)
endfunction
command! -nargs=1 Config call s:config("<args>")

Config defx
Config nerdtree
Config matchup
Config startify
call wilder#setup({'modes': ['/', '?']})

delcommand Config

if s:is_plugged
  colorscheme gruvbox8_hard
else
  " colorscheme murphy
  " colorscheme uwu
  colorscheme paper
endif
