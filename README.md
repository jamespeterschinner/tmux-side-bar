# tmux-side-bar

A utility script to toggle a LHS tmux pane as if it were a IDE side bar.

## installation

1. Make both scipts executable
2. Put them on your path
3. Update `~/.tmux.conf`
  - a. Add a key bind

  ```
  bind -n M-e run-shell -b 'zsh -f -c "source ~/.customrc; ~/bin/toggle_file_viewer" >>/tmp/tmux-side-bar.log 2>&1'
  ```

  - b. Configure clean up script when panes close
  ```
  set-hook -g after-kill-pane 'run-shell -b ~/.tmux/kill-orphaned-panes'
  set-hook -g pane-died 'run-shell -b ~/.tmux/kill-orphanen-panes'
  set-hook -g pane-exited 'run-shell -b ~/.tmux/kill-orphaned-panes'
  ```

## config

Values are picked up from the following env vars

```
FILE_TREE_VIEWER=<progam>
```
