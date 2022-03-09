## TODO

### config

1. a statusline with color
2. YU: event, theme, config

### plugin

<https://github.com/haya14busa/is.vim>
<https://github.com/osyo-manga/vim-anzu>
<https://github.com/PhilRunninger/bufselect.vim>
<https://github.com/t9md/vim-choosewin>
<https://stackoverflow.com/questions/48950476/make-nerdtree-use-choosewin-on-open-file>
<https://github.com/tweekmonster/startuptime.vim>

<https://github.com/chrisbra/unicode.vim>

- A Vim plugin that provides a completion function for Unicode glyphs

<https://github.com/tpope/vim-characterize>

- characterize.vim: Unicode character metadata

<https://github.com/joom/latex-unicoder.vim>

- A plugin to type Unicode chars in Vim, using their LaTeX names.

### jetpack

- UI: let cursor movable, not modifiable, diff-mode
- JetpackSync allow soft/mixed/hard update
- `jetpack#bundle()` need refactoring to improve modularity and allow plugin-name parameter
- My wrapper: cd/open/findfile/readme for plugin by using `echo jetpack#get('vim-rooter').path`
- lazy load: support event and function like `call fzf#run()`
- rewrite with vim9script
