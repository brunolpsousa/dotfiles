#!/bin/env bash
theme="$HOME/.config/alacritty/theme.yml"
dark="$HOME/.config/alacritty/dark.yml"
light="$HOME/.config/alacritty/light.yml"
tconf="$HOME/.config/tmux/tmux.conf"

[[ -f "$theme" || -f "$HOME/.config/tmux/tmux.conf" ]] || exit

isDark=$(sleep 0.05 && gsettings get org.gnome.desktop.interface color-scheme)

ch_alacritty() {
  if [[ "$isDark" =~ "dark" ]]; then
    grep -q -m1 "[lL]ight" "$theme" || return
    mv "$theme" "$light"
    mv "$dark" "$theme"
  elif [[ "$isDark" =~ "default" ]]; then
    grep -q -m1 "[dD]ark" "$theme" || return
    mv "$theme" "$dark"
    mv "$light" "$theme"
  fi
}

ch_tmux() {
  if grep -q -m1 "[lL]ight" "$theme"; then
    sed -i "s/\(status-style fg=colour\)254/\1235/g" "$tconf"
  elif grep -q -m1 "[dD]ark" "$theme"; then
    sed -i "s/\(status-style fg=colour\)235/\1254/g" "$tconf"
  fi
  tmux source-file "$tconf"
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
