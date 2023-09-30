#!/bin/env bash

alacritty_config="$HOME/.config/alacritty/alacritty.yml"
tmux_config="$HOME/.config/tmux/tmux.conf"

[[ -f "$alacritty_config" || -f "$tmux_config" ]] || exit

isDark=$(sleep 0.05 && gsettings get org.gnome.desktop.interface color-scheme)

ch_alacritty() {
  [[ -f "$alacritty_config" ]] && command -vp alacritty >/dev/null || return

  if [[ "$isDark" =~ "dark" ]]; then
    sed -i "s/light/dark/" "$alacritty_config"
  elif [[ "$isDark" =~ "default" ]]; then
    sed -i "s/dark/light/" "$alacritty_config"
  fi
}

ch_tmux() {
  [[ -f "$tmux_config" ]] && command -vp tmux >/dev/null || return

  if grep -q "[lL]ight" "$alacritty_config"; then
    sed -i "s/\(status-style fg=colour\)254/\1235/g" "$tmux_config"
  elif grep -q "[dD]ark" "$alacritty_config"; then
    sed -i "s/\(status-style fg=colour\)235/\1254/g" "$tmux_config"
  fi

  tmux source-file "$tmux_config"
}

send_sig_to_editor() {
  local editor_pid
  editor_pid=$(pgrep "$EDITOR")

  # Send SIGWINCH signal to all editor processes
  # https://en.wikipedia.org/wiki/Signal_(IPC)#Miscellaneous_signals
  # https://unix.stackexchange.com/questions/362389/send-sigwinch-from-the-keyboard
  for pid in $editor_pid; do
    kill -28 "$pid"
  done
}

ch_alacritty
ch_tmux
send_sig_to_editor
