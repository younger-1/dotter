function s:before_plug()
  if !s:is_plugged
    return
  endif

  let s:install_path = $vim_config_dir .. '/autoload/plug.vim'
  if empty(glob(s:install_path))
    silent execute '!curl -fLo ' .. s:install_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  let g:plug_url_format = 'https://github.com/%s.git'
  let g:plug_home = $vim_cache_dir .. '/plugged'
endfunction

function s:boot_plug()
  if !s:is_plugged
    return
  endif

  command! PU PlugUpdate | PlugUpgrade

  call plug#begin()

  call s:plugging()

  " `call plug#end()` to update 'runtimepath' and initialize plugin system
  " Automatically executes `filetype plugin indent on` and `syntax enable`
  call plug#end()

  call timer_start(50, function('<SID>check_missing'))
endfunction

function! s:check_missing(...)
  let l:msg = '[young] find missing plugins: '
  let g:plugs_missing = filter(values(g:plugs), '!isdirectory(v:val.dir)')
  if len(g:plugs_missing)
    let g:plugs_missing = map(g:plugs_missing, 'fnamemodify(v:val.dir, ":h:t")')
    let l:msg .= string(g:plugs_missing)
    echomsg l:msg
  endif
endfunction

function s:after_plug()
  if s:is_plugged
    return
  endif

  filetype plugin indent on
  syntax on

  if isdirectory($nvim_config_dir)
    set rtp^=$nvim_config_dir
    set rtp+=$nvim_config_dir/after
  endif
endfunction

function s:plugging()
  Plug $nvim_config_dir

  " [Theme]
  Plug 'vv9k/bogster'
  Plug 'ryanoasis/vim-devicons'

  " [Basic]
  Plug 'sheerun/vim-polyglot', { 'on' : [] }
  Plug 'airblade/vim-rooter'

  " [Motion]
  Plug 'justinmk/vim-sneak'
  Plug 'haya14busa/vim-asterisk'
  Plug 'bkad/CamelCaseMotion'
  " Plug 'wellle/targets.vim'
  Plug 'unblevable/quick-scope'
  Plug 'andymass/vim-matchup'

  " [Change]
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-repeat'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  " Plug 'tommcdo/vim-exchange'
  " -- Comment
  Plug 'tpope/vim-commentary'
  " Plug 'preservim/nerdcommenter'
  " Plug 'tyru/caw.vim'
  Plug 'mg979/vim-visual-multi'
    let g:VM_default_mappings = 0
    let g:VM_maps = {}
    let g:VM_maps["Undo"] = 'u'
    let g:VM_maps["Redo"] = '<C-r>'
    let g:VM_maps['Find Under']         = '<C-n>'
    let g:VM_maps['Find Subword Under'] = '<C-n>'

  Plug 'junegunn/vim-easy-align'

  " [Vim]
  Plug 'tpope/vim-scriptease'
  Plug 'bagrat/vim-buffet'
  Plug 'itchyny/lightline.vim'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim',      { 'on' : 'Goyo' }
  Plug 'junegunn/limelight.vim', { 'on' : 'Limelight' }

  Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/defx.nvim'

  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
endfunction

let s:is_plugged = 1

call s:before_plug()
call s:boot_plug()
call s:after_plug()

IncScript config/defx.vim
IncScript config/my_tree.vim

if s:is_plugged
  colorscheme bogster
else
  " colorscheme murphy
  colorscheme uwu
endif

