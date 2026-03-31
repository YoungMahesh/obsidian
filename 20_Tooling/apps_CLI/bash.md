#cli/terminal

```bash
#------------------------------ terminal ----------------------------
Cntr + a  # move cursor to start of the line
Cntr + e  # move cursor to end of the line
Cntr + f  # move cursor one letter forward
Cntr + b  # move cursor one letter backward
Cntr + p  # move to previous command in history
Cntr + n  # move to next command in history

Cntr + l  # clear screen
Cntr + u  # clear typed text from cursor to the beginning of line
Cntr + k  # clear typed text from cursor to the end of the line
Cntr + w  # delete previous work (faster than <backspace> to delete text-block)
Cntr + y  # paste back last deleted text (undo for cntr+w or cntr+u, etc)

Alt + 1   # move to first tab
Alt + 2   # move to second tab
Cntr + Shift + t  # create new tab
Cntr + Shift + w  # close current tab
reset # clear terminal commands, logs
```

```bash
# logs
your_command > info.txt 2>&1  # collect all logs of command to ./info.txt file
# > redirects stdout to a file
# 2>&1 redirects stderr to stdout
`````
