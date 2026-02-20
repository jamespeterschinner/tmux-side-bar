# tmux-side-bar

A utility script to toggle a LHS tmux pane as if it were a IDE file tree.

## installation

1. Make both scipts executable
2. Put them on your path
3. Update `~/.tmux.conf`
  - a. Add a key bind

  ###### NOTE: .customrc in this example sets config env vars
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
# The file tree progem to run when the pane opens
FILE_TREE_VIEWER=<progam>

# The EDITOR to use when opening a file
FILE_TREE_OPENER=<program>
```
