For Linux, default path of standard user configuration file: `~/.vimrc`


Sample vim config:
```vimrc
" Move to first char of line
nnoremap 0 ^
vnoremap 0 ^
" remap q to go to end of line and insert
nnoremap q A
nnoremap ' $
vnoremap ' $
" Redo
nnoremap r <C-r>
" Move up half of viewport + cursor at middle (zz)
nnoremap a <C-u>zz
vnoremap a <C-u>zz
" Move down half of viewport + cursor at middle
nnoremap ; <C-d>zz
vnoremap ; <C-d>zz
" select all
nnoremap <C-a> ggVG

" Show relative line numbers
set relativenumber
" Use 4 spaces for tabs
set tabstop=4       " A real tab character displays as 4 spaces
set shiftwidth=4    " Indent/unindent uses 4 spaces
set softtabstop=4   " Number of spaces inserted when pressing Tab
set expandtab       " Convert Tab key into spaces
" set noexpandtab     " Do not convert Tab key into spaces

" ss - save; sx - save & exit; sq - exit without save
nnoremap ss :w<CR>
nnoremap sx :wq<CR>
nnoremap sq :q!<CR> 

" use the system clipboard as the default for yank, delete, change, and put operations
set clipboard=unnamedplus

" `nnoremap` = n (normal mode) + nore (non recursive) + map (key mapping)

" Comments in this file will start with quotation followed by space: `" `
```