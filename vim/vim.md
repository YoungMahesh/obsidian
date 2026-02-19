### keywords
- `nnoremap` = n + nore + map
	`n` → Normal mode

	`nore` → non-recursive
	
	`map` → create a key mapping


### my vim keymaps

Location of config file: `~/.vimrc` 

```vimrc
" Comments in this file will start with quotation followed by space: `" `
" Alway create comments at the start of line, creating inline-comments have shown some issues

" remap q to go to end of line and insert
nnoremap q A

" ss - save; sx - save & exit; sq - exit without save
nnoremap ss :w<CR>
nnoremap sx :wq<CR>
nnoremap sq :q!<CR> 

" select all
nnoremap <C-a> ggVG
```