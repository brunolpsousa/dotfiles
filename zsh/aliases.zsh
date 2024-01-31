#--------------------------------------------------------------------------------------------------#
############################################## Aliases #############################################
#--------------------------------------------------------------------------------------------------#
alias .='cd $HOME'
alias chmod='chmod -c'
alias chown='chown -c'
alias curl='curl --connect-timeout 5 --max-time 10 --retry 10 --retry-delay 0 --retry-max-time 40'
alias cp='cp -riv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -vp'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias df='df -h'
alias ip='ip -c'
alias diff='diff -Nuar --color=auto'
alias dust='du -sh * | sort -hr'
alias ls='ls -v \
  --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify'
alias la='ls -v \
  --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify \
  --almost-all'
alias ll='ls -lv \
  --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify'
alias lla='ls -lv \
  --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify \
  --almost-all'
alias g='grep -n -C 3 --color=auto'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias py='python'
alias python='python3'
alias clear='unset NEW_LINE_BEFORE_PROMPT && clear'
alias nano='nano -EaiT4'
alias v="$EDITOR"
alias yt='yt-dlp'
alias ytm='yt-dlp -x --audio-format mp3'
alias sd='sudo '
alias sv='sudoedit'
alias fins="paru -Slq | fzf --multi --preview \
  'paru -Si {1}' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro paru -S"
alias fiins="paru -Slq | \
  fzf --multi --preview 'cat <(paru -Si {1}) <(paru -Fl {1} 2>/dev/null | \
  awk \"{print \$2}\")' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro paru -S"
alias frem="pacman -Qq | fzf --multi --preview \
  'pacman -Qi {1}' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro sudo pacman -Rns"
alias firem="pacman -Qq | fzf --multi --preview 'cat <(pacman -Qi {1}) <(pacman -Fl {1} | \
  awk \"{print \$2}\")' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro sudo pacman -Rns"
alias bundle='sudo sbctl bundle -s -i /boot/*-ucode.img \
  -l /usr/share/systemd/bootctl/splash-arch.bmp -k /boot/vmlinuz-linux \
  -f /boot/initramfs-linux.img /boot/EFI/Linux/linux.efi &&
  sudo sbctl sign -s /boot/vmlinuz-linux && sudo sbctl sign -s /boot/EFI/Linux/linux.efi'
alias bundle-lts='sudo sbctl bundle -s -i /boot/*-ucode.img \
  -l /usr/share/systemd/bootctl/splash-arch.bmp -k /boot/vmlinuz-linux-lts \
  -f /boot/initramfs-linux-lts.img /boot/EFI/Linux/linux-lts.efi &&
  sudo sbctl sign -s /boot/vmlinuz-linux-lts && sudo sbctl sign -s /boot/EFI/Linux/linux-lts.efi'
alias sign-ms='sudo sbctl sign -s /boot/EFI/Microsoft/Boot/bootmgfw.efi'
#--------------------------------------------------------------------------------------------------#
############################################## Extras ##############################################
#--------------------------------------------------------------------------------------------------#
# Archive Extraction
ex() {
  for f in "$@"; do
    [[ -f "$f" ]] || { echo "\`$f\` is not a valid file"; continue }

    case "$f" in
      *.tar.bz2) tar xjf    "$f" ;;
      *.tar.gz)  tar xzf    "$f" ;;
      *.bz2)     bunzip2    "$f" ;;
      *.rar)     unrar x    "$f" ;;
      *.gz)      gunzip     "$f" ;;
      *.tar)     tar xf     "$f" ;;
      *.tbz2)    tar xjf    "$f" ;;
      *.tgz)     tar xzf    "$f" ;;
      *.zip)     unzip      "$f" ;;
      *.Z)       uncompress "$f" ;;
      *.7Z)      7z x       "$f" ;;
      *.deb)     ar xf      "$f" ;;
      *.tar.xz)  tar xf     "$f" ;;
      *.tar.zst) unzstd     "$f" ;;
      *) echo "\`$f\` cannot be extracted" ;;
    esac
  done
}

# Portable shell through SSH
# https://github.com/romkatv/dotfiles-public/blob/6dfc6a34e91a8d87bb0716cf7c6f8e57487efb78/bin/ssh.zsh
ssh() {
  emulate zsh -o pipefail -o extended_glob

  # If there is no zsh on the remote machine, install this.
  local zsh_url='https://raw.githubusercontent.com/romkatv/zsh-bin/master/install'
  # If there is no ~/.zshrc on the remote machine, install this.
  local zshrc_url='https://raw.githubusercontent.com/brunolpsousa/dotfiles/main/zsh/.zshrc'

  # Copy all these files and directories (relative to $HOME) from local machine
  # to remote. Silently skip files that don't exist locally and override existing
  # files on the remote machine.
  local local_files=(.p10k.zsh)

  if (( ARGC == 0 )); then
    print -ru2 -- 'usage: ssh [ssh-options] [user@]hostname'
    return 1
  fi

  # Tar, compress and base64-encode $local_files.
  local dump
  local_files=(~/$^local_files(N))
  dump=$(tar -C ~ -pczT <(print -rl -- ${(@)local_files#$HOME/}) | base64) || return

  "${commands[ssh]}" -t "$@" '
    set -ue
    printf "%s" '${(q)dump//$'\n'}' | base64 -d | tar -C ~ -xzpo
    exists() { command -v "$1" >/dev/null; }
    fetch() {
      if exists curl; then
        curl -fsSL -- "$1"
      else
        wget -O- -- "$1"
      fi
    }
    if [ ! -e ~/.zshrc ] && [ ! -e ~/.config/zsh/.zshrc ]; then
      fetch '${(q)zshrc_url}' > ~/.zshrc.tmp.$$
      mv ~/.zshrc.tmp.$$ ~/.zshrc
    fi
    export PATH="$HOME/.local/bin:$PATH"
    if ! exists zsh; then
      if [ ! -x ~/.local/bin/zsh ]; then
        fetch '${(q)zsh_url}' > ~/.zsh-bin_install.tmp.$$
        mv ~/.zsh-bin_install.tmp.$$ ~/.zsh-bin_install
        chmod +x ~/.zsh-bin_install
        ./.zsh-bin_install -d ~/.local -e yes -q
        [ ! -e ~/.zsh-bin_install ] || rm -I ~/.zsh-bin_install
      fi
    fi
    exec zsh -il'
}

# Fancy progress function from Landley's Aboriginal Linux.
# Useful for long rm, tar and such.
# Usage: rm -rfv /foo | dot_progress
dot() {
  local i=0
  while read; do
    i="$((i+1))"
    if [[ "${i}" == 25 ]]; then
      echo -n '.'
      i=0
    fi
  done
  echo
}

# Convert image files to jxl
cimg() {
  if ! exists mogrify; then
    echo 'error: `mogrify` not found. Please, install `imagemagick`'
    return 1
  fi

  setopt nullglob
  local current_dir="$PWD"
  local img_formats=(jpg jpeg png apng bmp tif tiff)
  img_formats+=("${img_formats[@]:u}")
  mkdir -p ./cimg "$XDG_CACHE_HOME/cimg"

  for f in "${img_formats[@]}"; do
    for i in *."$f"; do
      [[ ! "$i" ]] || mv "$i" ./cimg
    done

    [[ -d ./cimg && $(ls -A ./cimg) ]] || continue

    mogrify -format jxl ./cimg/*."$f" &&
      find -path "./cimg/*.$f" | xargs -I '{}' mv -iv '{}' "$XDG_CACHE_HOME/cimg"

    for i in ./cimg/*.jxl; do
      [[ ! "$i" ]] || mv "$i" "$current_dir"
    done
  done

  rmdir -v ./cimg
}

vr() {
  local mpv_bin="$(command -v mpv || command -v io.mpv.Mpv)"
  if [[ ! -x "$mpv_bin" ]]; then echo 'error: `mpv` not found'; return 1; fi
  "$mpv_bin" --script-opts=360plugin-enabled=yes "$@"
}

# Convert media files to mp3
tomp3() {
  if [[ -z "$1" ]]; then
    echo 'Usage: tomp3 <file_1> <file_2> <file.extension> <*.extension> <*>'
    return 1
  fi

  mkdir -p ./mp3_files
  for f in "$@"; do
    [[ -f "$f" ]] || continue
    ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "./mp3_files/${f%.*}.mp3"
  done
  [[ "$(ls -A ./mp3_files)" ]] || rmdir ./mp3_files &>/dev/null
}

# Convert media files to mp4
tomp4() {
  if [[ -z "$1" ]]; then
    echo 'Usage: tomp4 [--x265] <file_1> <file_2> <file.extension> <*.extension> <*>'
    return 1
  fi

  local codec
  [[ "$1" == "--x265" ]] && codec=libx265 || codec=libx264
  mkdir -p ./mp4_files
  for f in "$@"; do
    [[ -f "$f" ]] || continue
    ffmpeg -i "$f" -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
      -vcodec "$codec" -crf 28 "./mp4_files/${f%.*}.mp4"
  done
  [[ "$(ls -A ./mp4_files)" ]] || rmdir ./mp4_files &>/dev/null
}

# Print the decimal value of a number
todec() {
  [[ $1 == '-s' ]] && { local silent=1; shift }
  local p_base bs=$1; bs=${bs//-/}

  case $bs in
    (a|A)(|scii|SCII))                         bs=a; p_base='ASCII' ;;
    (b|B)(|in|IN|inary|INARY))                 bs=2 ;;
    (o|O)(|ct|CT|ctal|CTAL))                   bs=8 ;;
    (h|H|x|X|hex|HEX|Hexadecimal|HEXADECIMAL)) bs=16 ;;
  esac

  if [[ -z $2 || $bs -eq 10 || $bs -le 1 && $bs != 'a' ]]; then
    echo 'Usage: todec <base> <number>'; return 1
  fi

  shift; local nums="$*" result=()
  [[ $bs == 'a' ]] || p_base="base $bs"

  while [[ $1 ]]; do
    [[ $bs == 'a' ]] &&
      result+=("$(printf '%d' \'$1)") ||
      result+=("$(($bs#$1))")
    shift
  done

  [[ $silent ]] && echo "${result[*]}" ||
    printf "%s ($p_base) equals to %s (base 10)\n" "$nums" "${result[*]}"
}

# Print values in different bases of a decimal number
dec() {
  [[ $1 == '-s' ]] && { local silent=1; shift }
  local p_base bs=$1; bs=${bs//-/}

  case $bs in
    (a|A)(|scii|SCII))                         bs=a; p_base='ASCII' ;;
    (u|U)(|ni|NI|nicode|NICODE))               bs=u; p_base='Unicode' ;;
    (b|B)(|in|IN|inary|INARY))                 bs=2 ;;
    (o|O)(|ct|CT|ctal|CTAL))                   bs=8 ;;
    (d|D)(|ec|EC|ecimal|ECIMAL))               bs=10 ;;
    (h|H|x|X|hex|HEX|Hexadecimal|HEXADECIMAL)) bs=16 ;;
  esac

  [[ -z $2 || $bs -le 1 && ! $bs =~ '^[au]$' ]] &&
    { echo 'Usage: dec <base> <number>'; return 1 }; shift

  local nums="$*" result=()
  [[ $bs =~ '^[au]$' ]] || p_base="base $bs"

  while [[ $1 ]]; do
    if [[ $bs -eq 16 ]]; then
      result+=("$(printf '%x' $1)")
    elif [[ $bs == 'a' ]]; then
      result+=("$(printf "\x$(dec -s 16 $1)")")
    elif [[ $bs == 'u' ]]; then
      result+=("$(printf "\u$(dec -s 16 $1)")")
    elif [[ $bs -gt 1 && $1 -gt 0 ]]; then
      local base=$bs val=$1 rslt=
      while [[ $val -ne 0 ]]; do
        rslt=$((val % base))$rslt
        val=$((val / base))
      done
      result+=("$rslt")
    fi
    shift
  done

  [[ ${result[*]} ]] || return 1

  [[ $silent ]] && echo "${result[*]}" ||
    echo "$nums (base 10) equals to ${result[*]} ($p_base)"
}

# Print most common conversions for a given number
num() {
  { [[ $1 -eq 10 ]] || todec "$1" "$2" &>/dev/null } &&
    { [[ $1 =~ '[aA]' || $1 -eq 16 ]] || dec "$1" "$2" &>/dev/null } ||
    { echo 'Usage: num <base> <number>'; return 1 }

  local bs=$1; shift
  [[ $bs -eq 10 ]] && local decimal=("$@") || local decimal=($(todec -s $bs "$@"))

  local binary=$(dec -s 2 "${decimal[@]}")
  local octal=$(dec -s 8 "${decimal[@]}")
  local hex=$(dec -s 16 "${decimal[@]}")
  local ascii=$(dec -s a "${decimal[@]}")
  local unicode=$(dec -s u "${decimal[@]}")

  local p_binary="Binary: $binary"
  local p_octal="Octal: $octal"
  local p_decimal="Decimal: ${decimal[*]}"
  local p_hexa="Hex: $hex"
  local p_ascii="Ascii: $ascii"
  local p_unicode="Unicode: $unicode"

  echo -e "$p_binary\n$p_octal\n$p_decimal\n$p_hexa\n$p_ascii\n$p_unicode"
}

bd() {
  while true; do
    local selection="$(\ls -aNv --group-directories-first 2>/dev/null | fzf --height 95% \
      --reverse --info hidden --prompt "$(pwd)/" --preview ' cd_pre="$(echo $(pwd)/$(echo {}))";
      echo $cd_pre 2>/dev/null;
      echo;
      \ls -ANv --group-directories-first --color=always "${cd_pre}" 2>/dev/null;
      less -F {} 2>/dev/null' --bind ctrl-j:preview-down,ctrl-k:preview-up \
        --preview-window=right:65%)"
    if [[ -d "$selection" ]]; then
      >/dev/null builtin cd -q "$selection"
    elif [[ -f "$selection" ]]; then
      for file in "$selection"; do
        if file $file | grepsh -q text; then
          "$EDITOR" "$selection" 2>/dev/null
        else
          xdg-open "$selection" >/dev/null 2>&1
        fi
      done
    else
      break
    fi
  done
}
bindkey -s '^F' ' bd^M'

# SSH
vscp() {
  if [[ "$#" -eq 4 ]]; then
    "$EDITOR" scp://"$1"@"$2":"$3"/"$4"
  else
    echo 'Usage: vscp <user> <server IP> <port> <filepath>'
    echo 'Tip: to just copy files over SSH:\nscp -P <port>'\
      '<filepath_src> <user>@<server IP>:<filepath_dest>'
    return 1
  fi
}

# Get public ip
myip() {
  local api
  case "$1" in
    '-4') api='https://api.ipify.org' ;;
    *) api='https://api64.ipify.org' ;;
  esac
  fetch "$api" && echo
}

# Speedtest
speedtest() {
  local sURL="https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
  fetch "$sURL" | python - "$@"
 }

# by default show 3 months of calendar with week number but also allow to override it
cal() {
  if [[ "$#" -eq 0 ]]; then
    "${commands[cal]}" -w3; return
  fi
  "${commands[cal]}" "$@"
}

#Compile and run Java code
# https://stackoverflow.com/questions/10986794/remove-part-of-path-on-unix
jvr() {
  local current_dir="$PWD"
  cd -q "$(sed 's/src.*/bin/g' <<< $current_dir)" || return 1
  local class_path=$(find * -type f -name "$1*" | sed 's/.class//g')
  java "$class_path"
  cd -q "$current_dir"
}

jvc() {
  javac -classpath "$(find -type d)" \
    -d $(sed 's/src.*/bin/g' <<< "$PWD") $(find -type f -name "*.java")
  [[ -z $1 ]] || jvr "$1"
}

# Unlock user after failed login attempt
unlock() { [[ -n "$1" ]] && faillock --user "$1" --reset || echo 'Usage: unlock <user>' }

# Display system install date
arch-date() {
  echo -n 'System was installed on '
  ls -lct /etc | tail -1 | awk '{print $7, $6, $8}'
}

alias yay='paru'
paru() {
  [[ -z "$1" ]] && local args=('-Syu') || local args=("$@")
  if exists paru; then
    "${commands[paru]}" "$args[@]" \
      --topdown --removemake=yes --sudoloop --combinedupgrade --upgrademenu --newsonupgrade
  elif exists yay; then
    "${commands[yay]}" "$args[@]" \
      --topdown --removemake --sudoloop --combinedupgrade
  else
    echo 'error: `paru` nor `yay` found'
    return 1
  fi
}

# Refresh Arch mirrors
refresh() {
  [[ "$EUID" != 0 ]] && local use_sudo='sudo'
  $use_sudo reflector --protocol https --age 12 --latest 20 --connection-timeout 2 \
    --download-timeout 2 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist --verbose
}

# Reset GNOME settings
reset-gnome() {
  if [[ -z $1 || $1 =~ 'app(s)?grid' ]]; then
    gsettings reset org.gnome.shell app-picker-layout
  elif [[ $1 == 'all' ]]; then
    gsettings list-schemas | xargs -n 1 gsettings reset-recursively
  else
    gsettings list-schemas | grep "$1" | xargs -n 1 gsettings reset-recursively
  fi
}

# Display warnings from pacman
alias paclog='grep -nC 2 --color=auto warning: /var/log/pacman.log'

# Update .zshrc
zupd() {
  fetch https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/.zshrc > "$ZDOTDIR/.zshrc.tmp"
  [[ -s "$ZDOTDIR/.zshrc.tmp" ]] || { rm -I "$ZDOTDIR/.zshrc.tmp"; return 1 }
  \mv "$ZDOTDIR/.zshrc.tmp" "$ZDOTDIR/.zshrc"
  rm -I "$XDG_CONFIG_HOME"/zsh/*.zsh
  exec zsh
}

# Weather by wttr.in
alias weather="fetch https://wttr.in"

# Display top 10 shell commands
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# Display wifi networks
alias wifi='nmcli device wifi'

# White neofetch
alias nfetch='neofetch --colors 15 15 15 15 15 15 --ascii_colors 15 15 --ascii_bold on \
  --os_arch off --speed_shorthand on --gtk_shorthand on --refresh_rate on --cpu_temp C \
  --disk_percent on --memory_percent on --disable cols'

# Neofetch with old Arch logo
alias ofetch='neofetch --colors 7 7 --ascii_distro Arch_old --ascii_colors 8 7 --os_arch off \
  --speed_shorthand on --gtk_shorthand on --refresh_rate on --cpu_temp C --disk_percent on \
  --memory_percent on --disable font disk term cols'

# Neofetch with Windows logo (WSL)
alias wfetch='neofetch --ascii_distro Windows7 --os_arch off --speed_shorthand on --cpu_temp C \
  --gtk_shorthand on --refresh_rate on --disk_percent on --memory_percent on --disable cols'

# Set a reasonable terminal size
alias ssterm="printf '\e[8;32;112t'"
alias sterm="printf '\e[8;41;136t'"
alias mterm="printf '\e[8;45;155t'"
alias bterm="printf '\e[8;58;185t'"

# Simple webserver to serve the current directory
alias mkhttp='python -m http.server'

# Prettify JSON:
alias json='python -m json.tool'

# Convert yaml to pretty JSON:
alias yaml="python -c \
  'import json, sys, yaml; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y, indent=4))'"

# Encode with URLEncode
# https://stackoverflow.com/questions/6250698/how-to-decode-url-encoded-string-in-shell
urlencode() {
  python -c 'import sys; from urllib.parse import quote_plus; print(quote_plus(sys.stdin.read()))'
}

# Decode URLencoded string
urldecode() {
  python -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()), end='')"
}

# Convert a querystring into pretty JSON
urlarray() {
  python -c "import sys, json; from urllib.parse import parse_qs; print(json.dumps({k: q[0]
    if len(q) == 1 else q for k, q in parse_qs(sys.stdin.read()).items()}), end='')" | json
}

# Display a list of supported colors
lscolors() {
  if [[ -z $@ ]]; then
    echo -e '\r'
    echo -e '\033[0K\033[1mBold\033[0m \033[7mInvert\033[0m \033[4mUnderline\033[0m'
    echo -e '\033[0K\033[1m\033[7m\033[4mBold & Invert & Underline\033[0m'
    echo
    echo -e '\033[0K\033[31m Red \033[32m Green \033[33m Yellow \033[34m Blue \033[35m' \
      'Magenta \033[36m Cyan \033[0m'
    echo -e '\033[0K\033[1m\033[4m\033[31m Red \033[32m Green \033[33m Yellow \033[34m' \
      'Blue \033[35m Magenta \033[36m Cyan \033[0m'
    echo
    echo -e '\033[0K\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m' \
      'Magenta \033[46m Cyan \033[0m'
    echo -e '\033[0K\033[1m\033[4m\033[41m Red \033[42m Green \033[43m Yellow \033[44m' \
      'Blue \033[45m Magenta \033[46m Cyan \033[0m'
    echo
    echo -e '\033[0K\033[30m\033[41m Red \033[42m Green \033[43m Yellow \033[44m' \
      'Blue \033[45m Magenta \033[46m Cyan \033[0m'
    echo -e '\033[0K\033[30m\033[1m\033[4m\033[41m Red \033[42m Green \033[43m' \
      'Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m'
  elif [[ $1 == 1 ]]; then
    for i in {0..255}; do
      print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
  else
    ((cols = $COLUMNS - 4))
    local s=$(printf %${cols}s)
    for i in {000..$(tput colors)}; do
      echo $i $(tput setaf $i; tput setab $i)${s// /=}$(tput op);
    done
  fi
}
#--------------------------------------------------------------------------------------------------#
################################################ End ###############################################
#--------------------------------------------------------------------------------------------------#
