#!/bin/env bash

alacritty_config="$HOME/.config/alacritty/alacritty.yml"
tmux_config="$HOME/.config/tmux/tmux.conf"
isDark=$(
  isDark=$(
            sleep 0.05 &&
            gdbus call --session \
            --dest=org.freedesktop.portal.Desktop \
            --object-path=/org/freedesktop/portal/desktop \
            --method=org.freedesktop.portal.Settings.Read \
            org.freedesktop.appearance color-scheme 2>/dev/null |
            cut -d " " -f2
          )
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

  if grep -q "[lL]ight" "$alacritty_config" && command -vp alacritty >/dev/null; then
    sed -i "s/\(status-style fg=colour\)254/\1235/g" "$tmux_config"
  else
    sed -i "s/\(status-style fg=colour\)235/\1254/g" "$tmux_config"
  fi

  pgrep "tmux" || return
  tmux source-file "$tmux_config"
}

send_sig_to_editor() {
  if [[ "$EDITOR" =~ 'nvim' ]]; then
    EDITOR='nvim'
  elif [[ "$EDITOR" =~ 'vim' ]]; then
    EDITOR='vim'
  fi

  pgrep "$EDITOR" || return
  killall -SIGWINCH "$EDITOR"
}

ch_plasma() {
  command -vp plasmashell >/dev/null || return

  local hour
  hour="$(date '+%H' | sed -E 's/^0//')"

  if (("$hour" >= 6 && "$hour" < 17)); then
    plasma-apply-colorscheme BreezeLight
    plasma-apply-desktoptheme breeze-light
    plasma-apply-lookandfeel -a org.kde.breeze.desktop
    plasma-apply-cursortheme Breeze_Snow
    unset isDark
  else
    plasma-apply-colorscheme BreezeDark
    plasma-apply-desktoptheme breeze-dark
    plasma-apply-lookandfeel -a org.kde.breezedark.desktop
    plasma-apply-cursortheme Breeze_Snow
    isDark="dark"
  fi
}

ch_plasma
ch_alacritty
ch_tmux
send_sig_to_editor
