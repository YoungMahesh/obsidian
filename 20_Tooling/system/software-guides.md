```bash
sudo apt install transmission-cli

# default directory - $HOME/Downloads 
# download file at ./
transmission-cli [URL_or_PATH_of_torrent_file] -w ./ --exit
# --no-seed didn't exit after download is complete
# -er, --exit   Exit after download is complete

# get size of file
transmission-show [URL_or_PATH_of_torrent_file]

# stop background running after download completion
pgrep transmission-cli -f  # get PID
# Try `pgrep -f' option to match against the complete command line.
#   pgrep: pattern that searches for process name longer than 15 characters will result in zero matches
kill <PID>
kill -9 <PID> # forcefully kill the process
```