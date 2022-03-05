if !exists('g:yo_startify')
  nnoremap <leader>sl <cmd>SSave<cr>
  nnoremap <leader>ss <cmd>SLoad<cr>
  nnoremap <leader>sc <cmd>SClose<cr>
  nnoremap <leader>sD <cmd>SDelete<cr>

  let g:yo_startify = 1
  finish
endif
