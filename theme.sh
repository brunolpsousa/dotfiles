#!/bin/env bash
theme="$HOME/.config/alacritty/theme.yml"
dark="$HOME/.config/alacritty/dark.yml"
light="$HOME/.config/alacritty/light.yml"
tconf="$HOME/.config/tmux/tmux.conf"
isDark=$(gsettings get org.gnome.desktop.interface color-scheme)

[[ -f "$theme" || -f "$HOME/.config/tmux/tmux.conf" ]] || exit

chAlacritty() {
  if [[ "$isDark" =~ "prefer-dark" ]]; then
    grep -q "[lL]ight" "$theme" || return
    mv "$theme" "$light"
    mv "$dark" "$theme"
  elif [[ "$isDark" =~ "default" ]]; then
    grep -q "[dD]ark" "$theme" || return
    mv "$theme" "$dark"
    mv "$light" "$theme"
  fi
}
chAlacritty

chTmux() {
  if [[ "$isDark" =~ "default" ]] || grep -q "[lL]ight" "$theme"; then
    sed -i "s/\(status-style fg=colour\)254/\1235/g" "$tconf"
  elif [[ "$isDark" =~ "prefer-dark" ]] || grep -q "[dD]ark" "$theme"; then
    sed -i "s/\(status-style fg=colour\)235/\1254/g" "$tconf"
  fi
  tmux source-file "$tconf"
}
chTmux
