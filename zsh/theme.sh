#!/bin/env bash

alacritty_config="$HOME/.config/alacritty/alacritty.yml"
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
    sleep 0.5
    isDark=$(get_bg)
  done
  result=${isDark::1}
  [[ "$result" == "1" || "$result" != "0" && "$result" != "2" ]] && echo "dark"
)

ch_alacritty() {
  [[ -f "$alacritty_config" ]] && command -vp alacritty >/dev/null || return

  light_mode() {
    sed -i "s/dark/light/" "$alacritty_config"
  }
  dark_mode() {
    sed -i "s/light/dark/" "$alacritty_config"
  }

  if [[ -n $1 ]]; then
    if [[ -n $isDark ]]; then light_mode; else dark_mode; fi
    return
  fi

  if [[ -z $isDark ]]; then
    light_mode
    return
  fi

  dark_mode
}

ch_tmux() {
  [[ -f "$tmux_config" ]] && command -vp tmux >/dev/null || return

  if grep -q "[lL]ight" "$alacritty_config" && command -vp alacritty >/dev/null; then
    sed -i "s/\(status-style fg=colour\)254/\1235/g" "$tmux_config"
  else
    sed -i "s/\(status-style fg=colour\)235/\1254/g" "$tmux_config"
  fi

  pgrep "tmux" >/dev/null || return
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
    unset isDark
    gsettings set org.gnome.desktop.interface color-scheme "default"
    if command -vp plasmashell >/dev/null; then
      plasma-apply-colorscheme BreezeLight
      plasma-apply-desktoptheme breeze-light
      plasma-apply-lookandfeel -a org.kde.breeze.desktop
      plasma-apply-cursortheme Breeze_Snow
    fi
  }
  dark_mode() {
    isDark="dark"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
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

  local hour
  hour="$(date '+%H' | sed -E 's/^0//')"
  if (("$hour" >= 6 && "$hour" < 17)); then
    [[ -n $1 ]] || light_mode
  else
    [[ -n $1 ]] || dark_mode
  fi
}

ch_system "$@"
ch_alacritty "$@"
ch_tmux
send_sig_to_editor
