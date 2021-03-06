let g:mapleader = ' '
let g:maplocalleader = '-'

" Disable default plugin
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
" let g:loaded_netrw              = 1
" let g:loaded_netrwPlugin        = 1
" let g:loaded_netrwSettings      = 1
" let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1

" [vim files]
set viminfo^=!                  " Save and restore global variables
set viminfofile=$vim_cache_dir/viminfo
set noswapfile                  " Swap file is not suitable for big files

set undofile                    " Saves undo history to an undo file
set undodir=$vim_cache_dir/undo
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

set nobackup
set backupext=.vbak
set backupdir=$vim_cache_dir/backup
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase              " Ignore file and dir name cases in cmd-completion
let &backupskip = &backupskip .. &wildignore

" [search]
set hlsearch
set incsearch
set ignorecase
set smartcase
set grepprg=rg\ --vimgrep\ --no-heading\ --color=never
set grepformat=%f:%l:%c:%m,%f:%l:%m


" [cmdline]
set wildmenu                    " Enhanced tab completion
set wildoptions=pum,tagfile
set history=6000                " Keep 2000 lines of command line history

" [insert]
set complete-=i                 " Keyword completion ins-completion do not scan included files
set completeopt+=menuone        " Always show menu, even for one item
set completeopt+=noselect       " Do not select a match in the menu.
set completeopt+=noinsert       " Do not insert any text for a match until the user selects from menu.

set pumheight=30                " Completion window max size
set shortmess+=c                " Don't print useless completion messages to statusline

set autoindent
set smartindent

set tabstop=8                   " Immediately know wheather current file use tab instead of space
set expandtab                   " Always expand tab, `smarttab` will also expandtab for you
set softtabstop=2               " Number of spaces that a <Tab> counts for
set shiftwidth=2                " Number of spaces of (auto)indent
set smarttab                    " <Tab> in front of a line inserts blanks according to 'shiftwidth'
set shiftround                  " Round indent to multiple of 'shiftwidth'.  Applies to > and <

" [text display]
set nowrap
set linebreak                   " Smart word wrapping
set display+=lastline           " When `wrap` on, @@@ is put in the end of the last screen line to indicate the rest of the line is not displayed
set scrolloff=2
set sidescroll=1
set sidescrolloff=8
" ????????????<???????????????????????????>?????????????????????????????????????????????????????????????????????
" ??????????????????????????????????????????????????????????????????????????? ???????????????????????????????????????????????????????????????
set matchpairs+=<:>,???:???,???:???,???:???,???:???,???:???,???:???,???:???,???:???,???:???
set showmatch                   " When a bracket is inserted, briefly jump to the matching one
set matchtime=3                 " Tenths of a second to show the matching paren

set list
set listchars=tab:?????,extends:???,precedes:???,trail:???,nbsp:???
" set listchars=eol:???,space:??,trail:~,tab:>-,extends:>,precedes:<,nbsp:+
" set listchars=tab:???\ ,extends:???,precedes:???,nbsp:???

set showbreak=???

" Change fillchars for folding, vertical split, end of buffer, and message separator
set fillchars=fold:\ ,eob:\ ,vert:\???
" set fillchars=vert:???,fold:??,sep:???


" [appearance]
" +-------------------------------------------------+
" |-- VISUAL --                   2f     43,8   17% |
" +-------------------------------------------------+
"  ^^^^^^^^^^^                  ^^^^^^^^ ^^^^^^^^^^
"   'showmode'                 'showcmd'  'ruler'
set number
set relativenumber
set signcolumn=yes              " Whether or not to draw the signolumn
set laststatus=2                " Show status line always
set showtabline=2               " Show tab line always
set ruler                       " Show the line and column number of the cursor position
set showcmd
set title
" set cursorcolumn
set cursorline

set t_Co=256                    " Number of colors
set termguicolors
set bg=dark

" Note: must be set after `termguicolors`
" https://github.com/microsoft/terminal/issues/4335
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"

" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " Set foreground color (R, G, B)
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " Set background color (R, G, B)

" https://github.com/microsoft/terminal/issues/68#issuecomment-658310258
augroup _restore_cursorshape_exit
  autocmd!
  " autocmd VimLeave * silent !echo -ne "\x1b[\x35 q"
  " autocmd VimLeave * silent !echo -ne "\e[6 q"
  " autocmd VimLeave * silent !printf "\e[6 q"
  " autocmd VimLeave * let &t_EI = "\e[6 q"
augroup END


" [misc]
set formatoptions+=j            " Delete comment character when joining commented lines
set sessionoptions-=options
set viewoptions-=options

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileformats=unix,dos,mac    " Use unix's LF in new buffer

set winminheight=0 winminwidth=0
set splitbelow                  " Force all horizontal splits to go below current window
set splitright                  " Force all vertical splits to go to the right of current window

set hidden                      " Buffer should still exist if window is closed
set confirm                     " Raise a dialog asking when `:q` or `:e` buffer with unsaved changes

set timeoutlen=500              " Time to wait for a mapped sequence to complete
set updatetime=300              " Faster completion. Time to update file swap, make diff markers appear quickly

set synmaxcol=400               " For performance tweaks

set mouse=

set whichwrap+=<,>,[,],h,l
set backspace=indent,eol,start

set diffopt+=vertical

" [nvim-defaults]
set autoread
set background=dark
set belloff=all
set cscopeverbose
" set formatoptions' defaults to "tcqj"
set nofsync
set nojoinspaces
set langnoremap
set nolangremap
set nrformats=bin,hex
" set shortmess' includes "F", excludes "S"
set nostartofline
set switchbuf=uselast
set tabpagemax=50
set ttimeoutlen=50
set ttyfast

" [Win10]
" To use powershell (on Windows): >
" set shell=powershell shellquote=( shellpipe=\| shellxquote=
" set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
" set shellredir=\|\ Out-File\ -Encoding\ UTF8

" set shell=C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe\ -ExecutionPolicy\ Bypass\ -NoLogo
" set shell=C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe\ -ExecutionPolicy\ Bypass\ -NoLogo\ -NoProfile

" if exists('+shellslash')
"   set shellslash
" endif

" [python]
if has('win32')
  " set pythonthreedll=python310.dll

  let &pythonthreehome = $scoop .. '/apps/python/current'

  if !filereadable(&pythonthreehome .. '/' .. &pythonthreedll)
    echomsg '[young]: python3 not installed'
  endif
endif

