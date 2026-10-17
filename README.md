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

Prefix + q reloads the configuration. The optional prefix + ? help popup uses
`~/omarchy/bin/omarchy-menu-tmux-keybindings` if you have Omarchy installed.
