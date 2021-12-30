noremap k gk
noremap j gj

" nmap <Up> <C-Y>
" nmap <Down> <C-E>
" nmap <Left> 2zl
" nmap <Right> 2zh

" nmap <Up>    <C-w><Up>
" nmap <Down>  <C-w><Down>
" nmap <Left>  <C-w><Left>
" nmap <Right> <C-w><Right>

nmap <C-Up>    <C-w>-
nmap <C-Down>  <C-w>+
nmap <C-Left>  <C-w><
nmap <C-Right> <C-w>>

nmap Y y$

imap jk <ESC>

nmap <C-w>m workbench.action.minimizeOtherEditors
nmap <C-w>M workbench.action.maximizeEditor

nmap yon :set number!<cr>
nmap yor :set relativenumber!<cr>
nmap yow editor.action.toggleWordWrap
nmap yoW editor.action.toggleRenderWhitespace

nmap <space>; vim.showQuickpickCmdLine
nmap <space>/ workbench.view.search

nmap <space>z workbench.action.toggleZenMode

nnoremap <esc><esc> :nohlsearch<cr>

nmap <space>bo workbench.action.closeOtherEditors

nmap <space>gr git.revertChange

nmap <space>bs workbench.action.toggleSplitEditorInGroup
nmap <space>bS workbench.action.toggleSplitEditorInGroupLayout

map <Tab> %
