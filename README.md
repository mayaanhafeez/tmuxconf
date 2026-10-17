# tmux config

Clone this repo to `~/.config/tmux` (tmux 3.1+ reads `~/.config/tmux/tmux.conf`),
then reload with `tmux source-file ~/.config/tmux/tmux.conf`.

```sh
git clone https://github.com/mayaanhafeez/tmuxconf.git ~/.config/tmux
```

Colours follow the terminal's ANSI palette. The bottom status bar uses plain
window labels without a session label, hostname, bold text, or underlining.

The prefix is Ctrl-Space (Ctrl-B also works). Prefix + e opens a popup shell in
the current pane's directory. Escape is passed through to the shell; close the
popup with `exit` or Ctrl-D at an empty prompt.

Prefix + q reloads the configuration. Prefix + ? opens a popup listing the bindings
live in the running server (`keybindings.sh`): this config's own bindings first,
grouped by whether they need the prefix, then tmux's defaults. A binding shows up as
yours when it has a `bind -N "description"` in `tmux.conf`, so give new bindings one.
