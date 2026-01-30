" IMPORTANT: these keymaps will work/activate in obsidian-canvas files only after you open markdown file in obsidian
"   flow: open markdown file -> vim-keymaps are now activated for canvas and markdown files
" nnoremap - normal mode; vnoremap - visual mode
" nnoremap (non-recursive map); nmap (recursive map)
" recursive map: This creates a mapping where the RHS of the mapping is re-evaluated.
"   If the RHS contains other mappings, those mappings are expanded and executed as well.


" Move to first char of line
nnoremap 0 ^
vnoremap 0 ^

" Move to last char of line
" nnoremap 9 g_  '9' and 'g_' keymap does not exist in obisidian-vim
" --------- not working -------------
nnoremap ' $
vnoremap ' $

" Move and insert at end of line
nnoremap q A


" Move up half of viewport + cursor at middle (zz)
nnoremap a <C-u>zz
vnoremap a <C-u>zz

" Move down half of viewport + cursor at middle
nnoremap ; <C-d>zz
vnoremap ; <C-d>zz

" Redo
nnoremap r <C-r>

" use the system clipboard as the default for yank, delete, change, and put operations
set clipboard=unnamedplus



" Visual mode: previous tab
vnoremap tp :<C-u>obcommand workspace:previous-tab<CR>


" -------------- Execute obsidian commands --------------------------- 
" get list of all command-ids(e.g. workspace:next-tab): open obsidian console (ctrl+shift+i) -> execute: app.commands.commands
" connect obsidian-vimrc with obsidian hotkeys: https://notes.bauer.codes/Obsidian#Current+obsidian.vimrc
" requirement for smooth execution: default mode for new tabs must be - editing
exmap nextTab obcommand workspace:next-tab
nnoremap tn :nextTab<cr>
exmap prevTab obcommand workspace:previous-tab
nnoremap tp :prevTab<cr>
exmap closeTab obcommand workspace:close
nnoremap t; :closeTab<cr>
exmap newTab obcommand workspace:new-tab
nnoremap tt :newTab<cr>

" go to
exmap openInNew obcommand editor:open-link-in-new-leaf
nnoremap gd :openInNew<cr>

exmap foldAll obcommand editor:fold-all
nnoremap zM :foldAll<cr>


