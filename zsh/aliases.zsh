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
# usage: ex <file>
ex() {
  if [[ -f "$1" ]] ; then
    case "$1" in
      *.tar.bz2) tar xjf    $1 ;;
      *.tar.gz)  tar xzf    $1 ;;
      *.bz2)     bunzip2    $1 ;;
      *.rar)     unrar x    $1 ;;
      *.gz)      gunzip     $1 ;;
      *.tar)     tar xf     $1 ;;
      *.tbz2)    tar xjf    $1 ;;
      *.tgz)     tar xzf    $1 ;;
      *.zip)     unzip      $1 ;;
      *.Z)       uncompress $1 ;;
      *.7Z)      7z x       $1 ;;
      *.deb)     ar xf      $1 ;;
      *.tar.xz)  tar xf     $1 ;;
      *.tar.zst) unzstd     $1 ;;
      *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
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

  command ssh -t "$@" '
    set -ue
    printf "%s" '${(q)dump//$'\n'}' | base64 -d | tar -C ~ -xzpo
    fetch() {
      if command -v curl >/dev/null 2>&1; then
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
    if ! command -v zsh >/dev/null 2>&1; then
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
  local line=''
  while read line; do
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
  if ! command -v mogrify >/dev/null; then
    echo 'error: mogrify not found. Please, install imagemagick'
    return 1
  fi
  setopt nullglob
  current_dir="$PWD"
  mkdir -p ./cimg "$XDG_CACHE_HOME/cimg"
  img_formats=(jpg jpeg png apng bmp svg tif tiff webp avif heic)
  for f in "${img_formats[@]}"; do
    for i in *."$f"; do
      [[ ! "$i" ]] || command mv "$i" ./cimg
    done
    mogrify -format jxl ./cimg/*."$f"
    find -path "./cimg/*.$f" | xargs -I '{}' mv '{}' "$XDG_CACHE_HOME/cimg"
  done
    for i in ./cimg/*.jxl; do
      [[ ! "$i" ]] || command mv "$i" "$current_dir"
    done
  command rmdir -v ./cimg
}

# Convert media files to mp3
tomp3() {
  if [[ -n "$@" ]]; then
    mkdir -p ./mp3_files
    for f in "$@"; do
      [[ -f "$f" ]] || continue
      ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "./mp3_files/${f%.*}.mp3"
    done
    command rmdir ./mp3_files &>/dev/null
    return 0
  else
    echo 'Usage: tomp3 <file 1> <file 2> <file.extension> <*.extension> <*>'
    return 1
  fi
}

# Convert media files to mp4
tomp4() {
  if [[ -n "$@" ]]; then
    local codec
    [[ "$1" == "--x265" ]] && codec=libx265 || codec=libx264
    mkdir -p ./mp4_files
    for f in "$@"; do
      [[ -f "$f" ]] || continue
      ffmpeg -i "$f" -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
        -vcodec "$codec" -crf 28 "./mp4_files/${f%.*}.mp4"
    done
    command rmdir ./mp4_files &>/dev/null
    return 0
  else
    echo 'Usage: tomp4 <file 1> <file 2> <file.extension> <*.extension> <*>'
    return 1
  fi
}

## print the decimal value of a number
todec() {
  if [[ -n $1 && $2 -eq 16 ]]; then
    printf "%s (base %d) equals to %d (base 10)\n" $1 $2 0x$1
  elif [[ -n $1 && $2 -gt 0 && ! $2 -eq 10 ]]; then
    printf "%s (base %d) equals to %d (base 10)\n" $1 $2 $(($2#$1))
  else
    print 'Usage: todec <number> <number-base>'
    return 1
  fi
}

## print values in different bases of a decimal number
dec() {
  if [[ $1 -gt 0 && $2 -eq 16 ]]; then
    printf '%d (base 10) equals to %x (base %d)\n' $1 $2 $1
  elif [[ $1 -gt 0 ]] && [[ $2 -gt 1 && $2 -lt 10 ]]; then
    local val=$1
    local result=''
    local base=$2
    while [ $val -ne 0 ]; do
      result=$(($val % $base))$result # residual is next digit
      val=$(($val / $base))
    done
    echo "$1 (base 10) equals to $result (base $2)"
  else
    print 'Usage: dec <decimal-number> <base-to-convert>'
    return 1
  fi
}

bd() {
  while true; do
    local selection="$(command ls -aNv --group-directories-first 2>/dev/null | fzf --height 95% \
      --reverse --info hidden --prompt "$(pwd)/" --preview ' cd_pre="$(echo $(pwd)/$(echo {}))";
      echo $cd_pre 2>/dev/null;
      echo;
      command ls -ANv --group-directories-first --color=always "${cd_pre}" 2>/dev/null;
      command less -F {} 2>/dev/null' --bind ctrl-j:preview-down,ctrl-k:preview-up \
        --preview-window=right:65%)"
    if [[ -d "$selection" ]]; then
      >/dev/null builtin cd -q "$selection"
    elif [[ -f "$selection" ]]; then
      for file in "$selection"; do
        if grep -q text <<< $(file $file); then
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
bindkey -s '^F' 'bd^M'

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

# by default show 3 months of calendar with week number
# but also allow to override it
cal() {
  local CALENDAR="$(command -vp cal)"
  if [[ "$#" -eq 0 ]]; then
    "$CALENDAR" -w3
  else
    "$CALENDAR" "$@"
  fi
}

#Compile and run Java code
# https://stackoverflow.com/questions/10986794/remove-part-of-path-on-unix
jvr() {
  local current_dir="$PWD"
  builtin cd -q $(sed 's/src.*/bin/g' <<< $current_dir) || return 1
  local class_path=$(find * -type f -name "$1*" | sed 's/.class//g')
  java "$class_path"
  builtin cd -q $current_dir
  unset current_dir class_path
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
  if command -vp paru >/dev/null; then
    command paru "$args[@]" \
      --topdown --removemake=yes --sudoloop --combinedupgrade --upgrademenu --newsonupgrade
  elif command -vp yay >/dev/null; then
    command yay "$args[@]" \
      --topdown --removemake --sudoloop --combinedupgrade
  else
    echo 'error: "paru" nor "yay" found'
    return 1
  fi
}

# Refresh Arch mirrors
refresh() {
  [[ "$EUID" != 0 ]] && local use_sudo='sudo'
  $use_sudo reflector --protocol https --age 12 --latest 20 --connection-timeout 2 \
    --download-timeout 2 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist --verbose
}

# Reset GNOME to default settings
reset-gnome() {
  if [[ -z $1 ]]; then
    gsettings list-schemas | xargs -n 1 gsettings reset-recursively
  else
    gsettings list-schemas | command grep "$1" | xargs -n 1 gsettings reset-recursively
  fi
}

# Reset GNOME Apps Grid
alias reset-gnome-appgrid='gsettings reset org.gnome.shell app-picker-layout'

# Display warnings from pacman
alias paclog='grep -nC 2 --color=auto warning: /var/log/pacman.log'

# Update .zshrc
alias zupd="fetch https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/.zshrc \
  > $ZDOTDIR/.zshrc && source $ZDOTDIR/.zshrc"

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
  python -c "import sys, json; from urllib.parse import parse_qs; print(json.dumps({k: q[0] \
    if #len(q) == 1 else q for k, q in parse_qs(sys.stdin.read()).items()}), end='')" | json
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
