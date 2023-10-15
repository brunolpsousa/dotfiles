#!/bin/env bash

alacritty_config="$HOME/.config/alacritty/alacritty.toml"
tmux_config="$HOME/.config/tmux/tmux.conf"

get_bg() {
  gdbus call --session                                \
  --dest=org.freedesktop.portal.Desktop               \
  --object-path=/org/freedesktop/portal/desktop       \
  --method=org.freedesktop.portal.Settings.Read       \
  org.freedesktop.appearance color-scheme 2>/dev/null |
  cut -d " " -f2
}

isDark=$(
  sleep 0.05
  isDark=$(get_bg)
  for _ in {1..5}; do
    if [[ -n $isDark ]]; then break; fi
    systemctl --user restart xdg-desktop-portal
    sleep 0.2
    isDark=$(get_bg)
  done
  result=${isDark::1}
  [[ "$result" == "1" || "$result" != "0" && "$result" != "2" ]] && echo "dark"
)

ch_alacritty() {
  [[ -f "$alacritty_config" ]] && command -vp alacritty >/dev/null || return

  if [[ -z $isDark ]]; then
    sed -i "s/dark/light/" "$alacritty_config"
    return
  fi

  sed -i "s/light/dark/" "$alacritty_config"
}

ch_tmux() {
  [[ -f "$tmux_config" ]] && command -vp tmux >/dev/null || return

  if [[ -z $isDark ]] && (command -vp alacritty >/dev/null || command -vp wezterm >/dev/null); then
    sed -i 's/\(status-style fg=colour\)254/\1235/;
    s/\(message-style fg=colour\)254/\1235/;
    /message-style/ s/\(bg=colour\)235/\1254/' "$tmux_config"
  else
    sed -i 's/\(status-style fg=colour\)235/\1254/;
    s/\(message-style fg=colour\)235/\1254/;
    /message-style/ s/\(bg=colour\)254/\1235/' "$tmux_config"
  fi

  pgrep tmux >/dev/null || return
  tmux source-file "$tmux_config"
}

send_sig_to_editor() {
  if [[ "$EDITOR" =~ 'nvim' ]]; then
    EDITOR='nvim'
  elif [[ "$EDITOR" =~ 'vim' ]]; then
    EDITOR='vim'
  fi

  pgrep "$EDITOR" >/dev/null || return
  killall -SIGWINCH "$EDITOR"
}

ch_system() {
  light_mode() {
    if ! command -vp gnome-shell >/dev/null; then
      unset isDark
      gsettings set org.gnome.desktop.interface color-scheme "default"
      gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    fi
    if command -vp plasmashell >/dev/null; then
      plasma-apply-colorscheme BreezeLight
      plasma-apply-desktoptheme breeze-light
      plasma-apply-lookandfeel -a org.kde.breeze.desktop
      plasma-apply-cursortheme Breeze_Snow
    fi
  }
  dark_mode() {
    if ! command -vp gnome-shell >/dev/null; then
      isDark="dark"
      gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
      gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    fi
    if command -vp plasmashell >/dev/null; then
      plasma-apply-colorscheme BreezeDark
      plasma-apply-desktoptheme breeze-dark
      plasma-apply-lookandfeel -a org.kde.breezedark.desktop
      plasma-apply-cursortheme Breeze_Snow
    fi
  }

  if [[ -n $1 ]]; then
    if [[ -n $isDark ]]; then light_mode; else dark_mode; fi
    return
  fi

  local hour minutes
  hour="$(date '+%H' | sed -E 's/^0//')"
  minutes="$(date '+%M' | sed -E 's/^0//')"
  if (("$hour" == 6 && "$minutes" >= 35 ||
      "$hour" == 17 && "$minutes" <= 45 ||
      "$hour" > 6 && "$hour" < 17)); then
    light_mode
  else
    dark_mode
  fi
}

ch_system "$@"
ch_alacritty
ch_tmux
send_sig_to_editor
