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
            org.freedesktop.appearance color-scheme |
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

  if grep -q "[lL]ight" "$alacritty_config"; then
    sed -i "s/\(status-style fg=colour\)254/\1235/g" "$tmux_config"
  elif grep -q "[dD]ark" "$alacritty_config"; then
    sed -i "s/\(status-style fg=colour\)235/\1254/g" "$tmux_config"
  fi

  tmux source-file "$tmux_config"
}

send_sig_to_editor() {
  if [[ "$EDITOR" =~ 'nvim' ]]; then
    editor='nvim'
  elif [[ "$EDITOR" =~ 'vim' ]]; then
    editor='vim'
  else
    editor="$EDITOR"
  fi

  killall -SIGWINCH "$editor"
}

ch_plasma() {
  command -vp plasmashell >/dev/null || return

  local hour
  hour="$(date '+%H' | sed -E 's/^0//')"

  if (("$hour" >= 6 && "$hour" < 17)); then
    sed -i 's/\(gtk-application-prefer-dark-theme=\)true/\1false/' "$HOME/.config/gtk-3.0/settings.ini"
    gsettings set org.gnome.desktop.interface color-scheme default
    plasma-apply-colorscheme BreezeLight
    plasma-apply-desktoptheme breeze-light
    plasma-apply-cursortheme Breeze_Snow
    # plasma-apply-lookandfeel -a org.kde.breeze.desktop
    # lookandfeeltool -a org.kde.breeze.desktop
    # nohup plasmashell --replace &
  else
    sed -i 's/\(gtk-application-prefer-dark-theme=\)false/\1true/' "$HOME/.config/gtk-3.0/settings.ini"
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    plasma-apply-colorscheme BreezeDark
    plasma-apply-desktoptheme breeze-dark
    plasma-apply-cursortheme Breeze_Snow
    # plasma-apply-cursortheme breeze_cursors
    # plasma-apply-lookandfeel -a org.kde.breezedark.desktop
    # lookandfeeltool -a org.kde.breezedark.desktop
    # nohup plasmashell --replace &
  fi

  isDark=$(gsettings get org.gnome.desktop.interface color-scheme)
}

ch_plasma &&
ch_alacritty
ch_tmux
send_sig_to_editor
