# tmux-side-bar

A utility script to toggle a LHS tmux pane as if it were a IDE side bar.

## installation

1. Make the scipt executable
2. Put it on your path
3. Add a key bind to your `~/.tmux.conf` to call the script

```
bind -n M-e run-shell -b 'zsh -f -c "source ~/.customrc; ~/bin/toggle_file_viewer" >>/tmp/tmux-side-bar.log 2>&1'
```

## config

Values are picked up from the following env vars

```
FILE_TREE_VIEWER=<progam>
```
