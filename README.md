# tmux-side-bar

A utility script to toggle a LHS tmux pane as if it were a IDE file tree.

## installation

1. Make both scripts executable
2. Put them on your path
3. Update `~/.tmux.conf`
  - a. Add a key bind (the env vars below set config; see [config](#config))

  ```
  bind -n M-e run-shell "zsh -f -c 'export PATH=$HOME/.local/bin:/usr/bin; tmux-side-bar >>/tmp/tmux-side-bar.log 2>&1'"
  ```

  - b. Configure clean up script when panes close
  ```
  set-hook -g after-kill-pane 'run-shell -b ~/.local/bin/kill-orphaned-panes'
  set-hook -g pane-died 'run-shell -b ~/.local/bin/kill-orphaned-panes'
  set-hook -g pane-exited 'run-shell -b ~/.local/bin/kill-orphaned-panes'
  ```

## config

Values are picked up from the following env vars

```
# The file tree program to run when the pane opens
FILE_TREE_VIEWER=<program>

# The EDITOR to use when opening a file
FILE_TREE_OPENER=<program>
```
