#keyboard  #vim

These file to refer keymaps I have decided to use in all editors, I use:
- neovim
- vim
- vscode/Antigravity + neovim-extension
- zed + vim-feature


For Neovim, verify current map: 
	- try `:map <C-i>` OR `:help <C-i>` for `ctrl+i` mapping


In table below, **keymap** = currently active keymap, **original** = keymap which was replaced with new
Mappings below are placed according to order in qwerty keyboard for considering **keymap** section
Actions with NULL are open to use for other purposes


### neovim normal-mode keymaps

| keymap | original | action                                                                                     |
| ------ | -------- | ------------------------------------------------------------------------------------------ |
|        | ` \[a-z] | move to mark (e.g. to move to mark a, execute \`a)                                         |
|        | %        | move to pair of bracket                                                                    |
| q      | A        | move end of line + insert                                                                  |
|        | w        | move start of next word                                                                    |
|        | e        | move end of word                                                                           |
| r      | ctrl+r   | redo                                                                                       |
| t t    |          | open new tab                                                                               |
| t p    |          | go to previous tab (tab-previous)                                                          |
| t n    |          | go to next tab (tab-next)                                                                  |
| t ;    |          | close current tab                                                                          |
|        | y        | copy highlighted                                                                           |
|        | u        | undo                                                                                       |
|        | i        | insert                                                                                     |
|        | o        | move to line-below + insert                                                                |
|        | p        | paste at cursor                                                                            |
|        | [        | move to opening parent-bracket                                                             |
|        |          | e.g. `[{` to move to parent `{`                                                            |
|        |          | you can then move to to pair using % to select whole block                                 |
|        | ]        | NULL                                                                                       |
| a      | ctrl+u   | move cursor half-page up                                                                   |
| s      |          | manage save-files                                                                          |
|        | d        | delete                                                                                     |
|        | dw       | delete word                                                                                |
|        | f        | find forward in current line                                                               |
| g      |          | manage git in neovim                                                                       |
|        | h        | move cursor left                                                                           |
|        | k        | move cursor up                                                                             |
|        | l        | move cursor right                                                                          |
| ;      | ctrl+d   | move half-page down                                                                        |
| "      | '        | move to mark ('a to move mark a)                                                           |
|        | z        | manage fold                                                                                |
|        | x        | cut                                                                                        |
| xn     | ctrl+i   | next element in jump-list                                                                  |
| xp     | ctrl+o   | previous element in jump-list                                                              |
|        | c        | NULL; manage quickfix list                                                                 |
|        | v        | visual mode                                                                                |
|        | b        | move start of previous word                                                                |
|        | n        | move to next word search                                                                   |
|        | N        | move to previous word search                                                               |
|        | m \[a-z] | set mark (e.g. to set mark at current position `ma`)                                       |
| '      | $        | move end of line                                                                           |
|        | ,        | go to previous element in find-command search (, for previous element, . for next element) |
|        | .        | repeat previous find-command                                                               |
|        |          | (fa then . will execute fa again as )                                                      |
|        | /        | search current-file                                                                        |
| ctrl+a |          | select all in current file                                                                 |
|        | ctrl+o   | go to previous cursor location                                                             |

### vscode keymaps

| keymap | action                   |
| ------ | ------------------------ |
| ctrl+j | open left sidebar        |
| ctrl+k | open terminal            |
| ctrl+l | open editor command-line |
| ctrl+; | open right sidebar       |
| ctrl+e | open file-section        |
