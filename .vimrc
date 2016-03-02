set undolevels=0
set nojoinspaces
syntax enable
set background=light
autocmd BufNewFile,BufRead *.markdown syntax off|set linebreak|set display+=lastline|set foldcolumn=2|setlocal noautoindent|setlocal nocindent|setlocal nosmartindent|setlocal indentexpr=|nnoremap j gj|nnoremap k gk

