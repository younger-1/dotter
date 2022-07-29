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

" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nmap <C-Up>    <C-w>-
nmap <C-Down>  <C-w>+
nmap <C-Left>  <C-w><
nmap <C-Right> <C-w>>

nmap <C-w>m workbench.action.minimizeOtherEditors
nmap <C-w>M workbench.action.maximizeEditor

nmap Y y$
imap jk <ESC>
map <Tab> %
nnoremap <esc><esc> :nohlsearch<cr>

nmap H workbench.action.previousEditorInGroup
nmap L workbench.action.nextEditorInGroup

nmap yon :set number!<cr>
nmap yor :set relativenumber!<cr>
nmap yow editor.action.toggleWordWrap
nmap yoW editor.action.toggleRenderWhitespace

nmap gj editor.action.peekDefinition
nmap gk editor.action.peekDeclaration
nmap gR editor.action.goToReferences
nmap gI editor.action.goToImplementation

nmap [c workbench.action.editor.previousChange
nmap ]c workbench.action.editor.nextChange
nmap [d editor.action.dirtydiff.previous
nmap ]d editor.action.dirtydiff.next
nmap [e editor.action.marker.prevInFiles
nmap ]e editor.action.marker.nextInFiles
nmap [E editor.action.marker.prev
nmap ]E editor.action.marker.next
nmap [w editor.action.wordHighlight.prev
nmap ]w editor.action.wordHighlight.next

nmap <space>; vim.showQuickpickCmdLine
nmap <space>/ workbench.view.search

nmap <space>q workbench.action.closeEditorsInGroup
nmap <space>c workbench.action.closeActiveEditor
nmap <space>C workbench.action.reopenClosedEditor
" nmap <space>w editor.action.formatDocument | workbench.action.files.save
nmap <space>w workbench.action.files.saveWithoutFormatting
nmap <space>z workbench.action.toggleZenMode
nmap <space>r workbench.action.openRecent
nmap <space>x workbench.actions.view.problems
nmap <space>e workbench.files.action.focusFilesExplorer

nmap <space>gr git.revertChange

nmap <space>bo workbench.action.closeOtherEditors
nmap <space>bs workbench.action.toggleSplitEditorInGroup
nmap <space>bS workbench.action.toggleSplitEditorInGroupLayout

nmap <space>at todo.views.2embedded.focus
nmap <space>aT todo.views.1files.focus
nmap <space>ao outline.focus

nmap <space>aB bookmarksExplorer.focus
nmap <space>ab bookmarks.toggle
nmap <space>]b bookmarks.jumpToNext
nmap <space>[b bookmarks.jumpToPrevious
