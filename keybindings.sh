#!/usr/bin/env bash
# keybindings.sh — what `prefix ?` shows: the bindings live in the running
# server, read with `tmux list-keys -N`. A binding counts as "yours" when its
# note matches a `bind -N "..."` in tmux.conf; everything else is a tmux default.

conf="${1:-$(dirname "${BASH_SOURCE[0]}")/tmux.conf}"
prefix=$(tmux show -gv prefix)
prefix2=$(tmux show -gv prefix2)
[[ "$prefix2" == "None" ]] && prefix2=""

notes=$(grep -oE 'bind .*-N "[^"]+"' "$conf" | sed -E 's/.*-N "([^"]+)".*/\1/')

# Print the lines of `tmux list-keys -N -T <table>` whose note is (or isn't) in tmux.conf.
keys() {
  local table=$1 label=$2 want=$3
  # The notes go in as a file: BSD awk rejects a newline inside a -v string.
  tmux list-keys -N -T "$table" -P "$label" | awk -v want="$want" '
    NR == FNR { if (length($0)) mine[$0] = 1; next }
    {
      ours = 0
      for (note in mine) if (substr($0, length($0) - length(note) + 1) == note) { ours = 1; break }
      if ((want == "mine") == ours) print
    }' <(printf '%s\n' "$notes") -
}

section() { printf '\n\033[1;34m%s\033[0m\n' "$1"; }

section "No prefix needed"
keys root "" mine
section "After the prefix (${prefix}${prefix2:+ or $prefix2})"
keys prefix "" mine
section "Copy mode (vi)"
keys copy-mode-vi "" mine
section "tmux defaults (after the prefix)"
keys prefix "" defaults
echo
