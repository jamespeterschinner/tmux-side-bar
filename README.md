# tmux-side-bar

A utility script to toggle a LHS tmux pane as if it were a IDE file tree.

## Helix integration

When the pane you toggle from is running [Helix](https://helix-editor.com/)
(`hx`), the script reads the path of the file currently open in Helix and
exports it to the side-bar pane as `BT_INITIAL_PATH`, so the viewer opens
focused on that file.

How it works: the script sends a `:sh` command into the Helix pane that
resolves `%{buffer_name}` to an absolute path, writes it to a temp file, then
signals a tmux channel; the script blocks on that channel and reads the result.
No effect when the pane isn't running Helix.

Requirements:
- Helix `>= 25.01` (for `%{...}` command expansions).
- A side-bar viewer that honours `BT_INITIAL_PATH` (e.g. `bt`).

## installation

1. Make both scripts executable
2. Put them on your path
3. Update `~/.tmux.conf`
  - a. Add a key bind (the env vars below set config; see [config](#config))

  ```
  bind -n M-e run-shell "zsh -f -c 'export EDITOR=helix-opener; export PATH=$HOME/.local/bin:/usr/bin:/bin:/opt/homebrew/bin; tmux-side-bar >>/tmp/tmux-side-bar.log 2>&1'"
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
# The file tree program to run when the pane opens (defaults to `bt`)
FILE_TREE_VIEWER=<program>

# The editor the viewer opens files with; passed through to the pane as EDITOR
EDITOR=<program>
```

Set automatically by the script (see [Helix integration](#helix-integration)):

```
# Absolute path of the file open in the parent Helix pane, exported into the
# side-bar pane. Unset when the parent pane isn't running Helix.
BT_INITIAL_PATH=<path>
```
