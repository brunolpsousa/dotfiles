#--------------------------------------------------------------------------------------------------#
############################################ Arch Config ###########################################
#--------------------------------------------------------------------------------------------------#
# Colors
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

# Git prompt meaning
gprompt() {
  echo "\n--> Git prompt meaning:\n
  \tꞏAdded $Green\t\t+$Color_Off
  \tꞏModified $Blue\t$Color_Off
  \tꞏRenamed \t$fg[magenta]➜$Color_Off
  \tꞏDeleted $Red\t-$Color_Off
  \tꞏUntracked \t$IPurple?$Color_Off
  \tꞏUnmerged $Yellow\t═$Color_Off
  \tꞏStashed $Cyan\t≡$Color_Off
  \tꞏBehind $Red\t$Color_Off
  \tꞏAhead $Green\t\t$Color_Off"
}

games() {
  echo "\n$IYellow ### Games and Emulators ###\n
    $Yellow DeSmuME:$Color_Off Nintendo DS emulator
    $Yellow Dolphin Emulator:$Color_Off GameCube and Wii emulator
    $Yellow DOSBox:$Color_Off DOS Games emulator
    $Yellow FCEUX:$Color_Off" \
      "Nintendo Entertainment System (NES), Famicom, and Famicom Disk System (FDS) emulator
    $Yellow Yuzu:$Color_Off Nintendo Switch
    $Yellow Gens/GS:$Color_Off Sega Mega Drive emulator
    $Yellow PCSXR | ePSXe:$Color_Off PlayStation Emulator
    $Yellow PCSX2:$Color_Off Playstation 2 emulator
    $Yellow PPSSPP:$Color_Off PSP emulator
    $Yellow Stella:$Color_Off Atari 2600 VCS emulator
    $Yellow VBA-M:$Color_Off Gameboy and GameboyAdvance emulator
    $Yellow Yabause:$Color_Off Sega Saturn Emulator
    $Yellow ZSNES:$Color_Off Super Nintendo emulator
    $Yellow RetroArch:$Color_Off Reference frontend for the libretro API
    $Yellow Antimicro:$Color_Off" \
      "Graphical program used to map keyboard buttons and mouse controls to a gamepad
    $Yellow sc-controller:$Color_Off" \
      "User-mode driver, mapper and GTK3 based GUI for Steam Controller, DS4 and others
    $Yellow 0ad:$Color_Off Cross-platform, 3D and historically-based real-time strategy game"
}

gnome-extensions() {
  echo "\n ### GNOME Extensions ###\n
    - Appindicator Support\n https://extensions.gnome.org/extension/615/appindicator-support
    - Caffeine:\n https://extensions.gnome.org/extension/517/caffeine
    - Night Theme Switcher\n https://extensions.gnome.org/extension/2236/night-theme-switcher
    - Pano\n https://extensions.gnome.org/extension/5278/pano/"
}

# Vim Cheatsheet
ns() {
  echo "\n\t$IWhite### Navigation ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off B|b   - Prev word
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off W|w   - Next word
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ge|e  - Prev|next end of word
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ^     - BOL (after whitespace)
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off T|t   - Find prev
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off F|f   - Find next
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ;|,   - Repeat previous f|t|F|T
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off #|*   - Prev|next word under cursor
  ${IBlack}[${BIPurple}V$IBlack]$Color_Off {|}   - Jump to prev|next paragraph
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ]s|[s - Next|prev spelling
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off z=    - Spelling suggestions
  \n\t$IWhite### Windows ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-h|j|k|l - Window navigation
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-ws|wv   - Split h|v
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-Arrows  - Resize windows
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off TAB|S-TAB - Buffer navigation
  \n\t$IWhite### Editing ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off U|C-r   - Undo|Redo changes
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off g-|g+   - Undo|Redo branches
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off S|s     - Delete line|char and insert
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C       - Delete until EOL and insert
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <o>iw   - Opr inner word
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <o>ip   - Opr inner paragraph
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <o>a\"   - Opr around quotes
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ]p      - Paste and adjust indent
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off d/hello - Delete until hello
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off J       - Join line
  ${IBlack}[${BIPurple}V$IBlack]$Color_Off U/u     - Uppercase|lowercase
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ~       - Switch case
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-a     - Increase number
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-x     - Decrease number
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <|>|=   - Indent right|left|auto
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gg=G    - Re-indent entire buffer
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-/   - Comment
  \n\t$IWhite### Insert ###
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-r0 - Paste last yanked
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-h  - Delete char before cursor
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-w  - Delete word before cursor
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-j  - Begin new line
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-t  - Indent line
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-d  - De-indent line
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-n  - Insert next match
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-p  - Insert previous match
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-rx - Insert the contents of register x
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-ox - Temporarily enter normal mode to issue cmd x
  \n\t$IWhite### Telescope ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-e  - Netrw
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-fe - Edit file
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-ff - Find file
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-ft - Find text
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-fp - Find project
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-fb - Find buffer
  \n\t$IWhite### LSP ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gi     - Implementation
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gr     - References
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gl     - Float
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off K      - Hover
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gD     - Declaration
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gd     - Definition
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-ld - Type Definition
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lf - Format
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-la - Code action
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lj - Diagnostic - next
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lk - Diagnostic - prev
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lr - Rename
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lh - Signature help
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lq - Quickfix
  \n\t$IWhite### CMP ###
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-c   - Close CMP
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-SPC - Complete CMP
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-d|u - Scroll docs
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off TAB   - Next snip
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off S-TAB - Prev snip
  \n\t$IWhite### DAP ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dt - Toggle breakpoint
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dc - Continue
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-di - Step into
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-do - Step over
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-du - Step out
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dr - REPL
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dl - Run last
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dU - Toggle DapUI
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dT - Terminate
  \n\t$IWhite### General ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-q         - Quit
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-s         - Save
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off S-q         - Close buffer
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-q       - Close all
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-Q       - Force close buffer
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-s       - Save without formatting
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-S       - Save all
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off :e          - Edit file
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off :saveas     - Save file as
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off :earlier 1m - Time travel
  \n\t$IWhite### Macros ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off qa - Record macro a
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off q  - Stop recording macro
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off @a - Run macro a
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off @@ - Rerun last runned macro
  \n\t$IWhite### Commands ###
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :r !<shell>       - Read in output of shell
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :sort | %!uniq -u - Remove duplicate lines
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :%!cat -n         - Number the lines in the file
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off" \
    ":%s/old/new/gc    - Replace all throughout file with confirmations
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g/foo/d          - Delete lines containing foo
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g!/foo/d         - Delete lines not containing foo
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g/^\s*$/d        - Delete all blank lines
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g/foo/t$         - Copy lines containing foo to EOF
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g/foo/m$         - Move lines containing foo to EOF
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g/^/m0           - Reverse a file
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :g/^/t.           - Duplicate every line
  \n\t$IWhite### Flags ###
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off g - Replace all occurrences
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off i - Ignore case
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off I - Don't ignore case
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off c - Confirm each substitution
  \n${IBlack}Vim Cheat Sheet:" \
    "https://vim.rtorr.com$Color_Off\n${IBlack}QuickRef.ME: https://quickref.me/vim$Color_Off"
}

arch-base() {
  [[ "$EUID" != 0 ]] && local use_sudo='sudo'
  local zenv=$(grep 'ZDOTDIR="\$HOME/.config/zsh"' /etc/zsh/zshenv 2>/dev/null)
  local zprof=$(grep 'source "\$ZDOTDIR/.zshrc"' /etc/zsh/zprofile 2>/dev/null)
  local yne flatpk
  if [[ -z $zenv || -z $zprof ]]; then
    echo 'Do you wish to configure zshenv and zprofile?'
    local yne
    select yne in 'Yes' 'No' 'Exit'; do
      case $yne in
        Yes )
          [[ -n $zenv ]] || echo '[[ -f "$HOME/.config/zsh/.zshrc" ]] && ' \
            'ZDOTDIR="$HOME/.config/zsh" || ZDOTDIR="$HOME"' | \
            $use_sudo tee -a /etc/zsh/zshenv >/dev/null
          [[ -n $zprof ]] || echo 'source "$ZDOTDIR/.zshrc"' | \
            $use_sudo tee -a /etc/zsh/zprofile >/dev/null;
          break;;
        No ) break;;
        Exit ) return;;
      esac
    done
  fi

  if ! grep -q ILoveCandy /etc/pacman.conf; then
    echo 'Do you wish to configure /etc/pacman.conf?'
    select yne in 'Yes' 'No' 'Exit'; do
      case $yne in
        Yes )
          $use_sudo sed -i 's/#\(Color\)/\1/g; s/#\(VerbosePkgLists\)/\1/g;
            /ParallelDownloads/ s/^#//; /ParallelDownloads/ s/5$/9\nILoveCandy/;
            /\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
          break;;
        No ) break;;
        Exit ) return;;
      esac
    done
  fi

  echo 'Do you wish to update mirrors with reflector?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in
      Yes ) $use_sudo pacman -S --needed reflector; refresh; break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # Base packages
  echo 'Do you wish to install base packages for Arch Linux?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in
      Yes )
        $use_sudo sh -c "pacman -Syu --needed \
          pipewire pipewire-alsa pipewire-pulse wireplumber \
          alacritty tmux fzf ripgrep neofetch yt-dlp man-db tldr \
          android-udev android-tools zsh ttf-jetbrains-mono-nerd \
          base-devel pkgstats java-runtime-common reflector networkmanager \
          sbctl ufw iptables-nft ntfs-3g exfat-utils unrar zip p7zip imagemagick \
          xdg-desktop-portal xdg-desktop-portal-gtk lib32-gst-plugins-good \
          zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting \
          hunspell-en_US noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation gsfonts \
          $(case $(lscpu | awk '/Model name:/{print $3}') in
          AMD) echo -n 'amd-ucode';;
          Intel\(R\)) echo -n 'intel-ucode';;
          esac)"

        echo 'Do you wish to use Flatpak [y/N]?' && read flatpk

        if [[ "$flatpk" =~ '^[yY]' ]]; then
          $use_sudo pacman -S --needed flatpak
        else
          flatpk='N'
          if command -v flatpak >/dev/null; then
            echo '\e[31mwarning:\033[0m flatpak is installed'
          fi
        fi

        if [[ "$EUID" != 0 ]]; then
          if [[ "$flatpk" =~ '^[yY]' ]] && command -v flatpak >/dev/null; then
            local qbt-tray='qbittorrent/qBittorrent/master/src/icons/qbittorrent-tray.svg'
            command mkdir -p "$XDG_DATA_HOME/icons"

            fetch "https://raw.githubusercontent.com/${qbt-tray}" \
              > "$XDG_DATA_HOME/icons/qbittorrent-tray.png"

            flatpak install \
              io.neovim.nvim org.freedesktop.Sdk.Extension.node18 \
              org.mozilla.firefox org.freedesktop.Platform.ffmpeg-full com.brave.Browser \
              io.mpv.Mpv org.qbittorrent.qBittorrent com.valvesoftware.Steam
            flatpak override -u --env=FLATPAK_ENABLE_SDK_EXT=node18 io.neovim.nvim

            [[ ! -x /usr/bin/rg ]] || $use_sudo sh -c \
              "command cp /usr/bin/rg /var/lib/flatpak/app/io.neovim.nvim/current/active/files/bin"
          else
            sudo pacman -S --needed \
              neovim npm firefox mpv steam qbittorrent qt6-wayland
            command npm config set audit=false fund=false progress=off install-strategy=shallow
          fi

          if [[ ! -x /usr/bin/paru ]]; then
            command mkdir -p "$XDG_CACHE_HOME/paru/clone"
            git clone 'https://aur.archlinux.org/paru-bin' "$XDG_CACHE_HOME/paru/clone/paru-bin"
            local current_dir="$PWD"
            builtin cd -q "$XDG_CACHE_HOME/paru/clone/paru-bin"
            makepkg -sir
            builtin cd -q "$current_dir"
          fi
        fi

        break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # General system configs
  echo 'Do you wish to configure general system defaults?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in
      Yes )
        $use_sudo sh -c "ufw enable; systemctl enable fstrim.timer systemd-oomd bluetooth ufw; \
          echo -e 'vm.swappiness=10\nvm.vfs_cache_pressure=50\nvm.max_map_count=2147483642' \
          > /etc/sysctl.d/99-sysctl.conf"

        if [[ "$EUID" != 0 ]] && ! grep -q "$USER" /etc/subuid; then
          usermod --add-subuids 100000-165535 --add-subgids 100000-165535 "$USER"
        fi
        break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # Keyboard
  echo 'Do you wish to select a keyboard layout?'

  local PT='localectl --no-convert set-x11-keymap br pc105; setxkbmap -model pc105 -layout br;
    echo -e "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\n" \
    "LC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\n" \
    "LC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;
    echo -e "KEYMAP=br-abnt2\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'

  local US='localectl --no-convert set-x11-keymap us pc105 intl;
    setxkbmap -model pc105 -layout us -variant intl;
    echo -e "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\n" \
    "LC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\n" \
    "LC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;
    echo -e "KEYMAP=us-acentos\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'

  local both='localectl --no-convert set-x11-keymap us,br pc105 intl,;
    setxkbmap -model pc105 -layout us,br -variant intl,;
    echo -e "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\n" \
    "LC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\n"
    "LC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;
    echo -e "KEYMAP=us-acentos\nKEYMAP_TOGGLE=br-abnt2\nFONT=eurlatgr\nFONT_MAP=8859-1" | \
      tee /etc/vconsole.conf'

  local pubne
  select pubne in 'PT_BR' 'EN_US' 'Both' 'No' 'Exit'; do
    case $pubne in
      PT_BR ) $use_sudo sh -c "$PT"; break;;
      EN_US ) $use_sudo sh -c "$US"; break;;
      Both ) $use_sudo sh -c "$both"; break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # General user configs
  if [[ "$EUID" != 0 ]]; then
    echo 'Do you wish to configure general user defaults?'
    select yne in 'Yes' 'No' 'Exit'; do
      case $yne in

        Yes )
          # Git config
          if [[ ! -f $XDG_CONFIG_HOME/git/config ]]; then
            echo 'Do you wish to set up git?'
            select yne in 'Yes' 'No' 'Exit'; do
              case $yne in

                Yes )
                  command mkdir -p "$XDG_CONFIG_HOME/git"
                  touch "$XDG_CONFIG_HOME/git/config"
                  git config --global init.defaultBranch main

                  local gitName
                  echo 'Enter your name:'; read gitName
                  [[ -z $gitName ]] || git config --global user.name "$gitName"

                  local gitEmail
                  echo 'Enter your e-mail:'; read gitEmail
                  [[ -z $gitEmail ]] || git config --global user.email "$gitEmail"

                  gpg --list-keys --with-keygrip
                  local gitSigningKey
                  echo 'Enter your signing key if you wish to define it'; read gitSigningKey
                  [[ -n "$gitSigningKey" ]] &&
                    git config --global user.signingKey "$gitSigningKey" &&
                    git config --global commit.gpgsign true

                  break;;

                No ) break;;
                Exit ) return;;
              esac
            done
          fi

          # Firefox config
          echo 'Do you wish to create Firefox config in "$HOME/chrome" [y/N]?'
          local firefoxcfg; read firefoxcfg
          if [[ $firefoxcfg =~ '^[yY]' ]]; then
            command mkdir -p "$HOME/chrome"

            echo '@-moz-document url(about:home), url(about:newtab), url(about:privatebrowsing) {' \
              '\n  .click-target-container *,\n  .top-sites-list * {\n    color: #fff !important;' \
              '\n    text-shadow: 2px 2px 2px #222 !important;\n  }\n\n  body::before {' \
              '\n    content: '';\n    z-index: -1;\n    position: fixed;\n    top: 0;' \
              '\n    left: 0;\n    background: #f9a no-repeat url(img) center;' \
              '\n    background-size: cover;\n    width: 100vw;' \
              '\n    height: 100vh;\n  }\n}' > "$HOME/chrome/userContent.css"

            echo '/* #PlacesToolbarItems { filter: grayscale(1); } */\n#unified-extensions-button' \
              '{\n  width: 0.1px;\n  padding-inline: 0 !important;\n}' \
              '\n#unified-extensions-button > .toolbarbutton-icon {' \
              '\n  width: 0 !important;\n}' > "$HOME/chrome/userChrome.css"

            ln -sf "$HOME/Pictures/Wallpapers/Module Abyss Lapis."* "$HOME/chrome/img" &>/dev/null
          fi

          # Nerd font config
          local font='JetBrainsMono'
          local ver='3.0.2'
          local nerdcfg
          if [[ ! $(find "$XDG_DATA_HOME/fonts" -name "$font*.ttf" 2>/dev/null) ]] &&
            ! pacman -Qi ttf-jetbrains-mono-nerd &>/dev/null; then
            echo 'Do you wish to install Nerd Fonts? [y/N]?' && read nerdcfg
            if [[ $nerdcfg =~ '^[yY]' ]]; then
              command mkdir -p "$XDG_DATA_HOME/fonts"
              echo 'Downloading Nerd Fonts...'

              [[ -f "$XDG_CACHE_HOME/$font.zip" ]] || fetch \
                "https://github.com/ryanoasis/nerd-fonts/releases/download/v$ver/$font.zip" \
                > "$XDG_CACHE_HOME/$font.zip"

              unzip -q "$XDG_CACHE_HOME/$font.zip" -d "$XDG_DATA_HOME/fonts" 2>/dev/null
              echo "Done. Set $font as default font\n"
            fi
          fi

          # Neovim config
          if [[ "$EDITOR" =~ 'nvim' ]]; then
            useFkNvim() {
              if [[ $EDITOR == 'io.neovim.nvim' ]] || [[ $flatpk =~ '^[yY]' ]]; then
                return
              fi
              local useFNvim
              echo 'Configure Flatpak Neovim? [y/N]' && read useFNvim
              [[ "$useFNvim" =~ '^[yY]' ]] && return
            }

            if useFkNvim; then
              local baseNvim="$HOME/.var/app/io.neovim.nvim/config"
              command mkdir -p "$XDG_DATA_HOME/flatpak/exports/share/applications"

              command cp \
                '/var/lib/flatpak/app/io.neovim.nvim/current/active/export/share/applications/io.neovim.nvim.desktop' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/"

              sed -i \
                's/\(nvim-wrapper \)io.neovim.nvim/\1--file-forwarding io.neovim.nvim @@ %F @@/' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/io.neovim.nvim.desktop"

            else
              local baseNvim="$XDG_CONFIG_HOME"
            fi

            [[ -f "$baseNvim/config/nvim/init.lua" ]] || fetch \
              'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/init.lua' \
              > "$baseNvim/nvim/init.lua"

            command mkdir -p "$baseNvim/nvim/spell"
          fi

          # Alacritty config
          if command -v alacritty >/dev/null; then
            command mkdir -p "$XDG_CONFIG_HOME/alacritty"

            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/alacritty/alacritty.yml' \
              > "$XDG_CONFIG_HOME/alacritty/alacritty.yml"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/alacritty/dark.yml' \
              > "$XDG_CONFIG_HOME/alacritty/dark.yml"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/alacritty/light.yml' \
              > "$XDG_CONFIG_HOME/alacritty/light.yml"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/theme.sh' \
              > "$XDG_DATA_HOME/zsh/theme.sh"

            case $(lscpu | awk '/Model name:/{print $3}') in Intel\(R\)) sed -i \
              's/\(columns: \)146/\1115/g; s/\(lines: \)45/\132/g' \
              "$XDG_CONFIG_HOME/alacritty/alacritty.yml";;
            esac

            chmod +x "$XDG_DATA_HOME/zsh/theme.sh"
            sh -c "$XDG_DATA_HOME/zsh/theme.sh"

            if [[ -f '/usr/local/bin/xterm' ]]; then
              local xtermVar
              echo && ls -lh '/usr/local/bin/xterm' && echo && cat '/usr/local/bin/xterm' && echo
              echo "Do you wish to delete xterm to install Alacritty tweak? [y/N]" && read xtermVar
              [[ $xtermVar =~ '^[yY]' ]] && sudo rm -i '/usr/local/bin/xterm'
            fi
            if [[ ! -f '/usr/local/bin/xterm' ]] && command -v tmux >/dev/null; then
              echo '#!/usr/bin/env bash\nTERMX="alacritty"' \
                '\n[[ -n "$ZSH_TMUX_STARTED" ]] || tmux new-session -d -s main -c "$HOME"' \
                '\ntvar="$(tmux list-sessions | grep main)"\nsh -c ' \
                '"$HOME/.local/share/zsh/theme.sh"\nif grep -q attached <<< "$tvar" && ' \
                'pgrep "$TERMX"; then\n  tmux neww -t=main -c "$@"' \
                '\nelif [[ -n "$tvar" && -z "$*" && -z "$TERMX_NAUTILUS" ]] && '\
                '! pgrep "$TERMX"; then\n  "$TERMX"\nelse\n  tmux neww -t=main -c "$@"' \
                '\n  "$TERMX"\nfi' | sudo tee '/usr/local/bin/xterm' >/dev/null

              sudo chmod +x '/usr/local/bin/xterm'

              [[ ! -f '/bin/xterm' ]] || echo "$(date '+%Y-%m-%d %H:%M:%S') - " \
                "Warning: /bin/xterm exists and overlaps with /usr/local/bin/xterm" \
                >> "$HOME/.alert"
            fi
          fi

          # Tmux config
          # Vim color fix: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
          if command -v tmux >/dev/null; then
            local tmuxprefix tmuxbind
            command mkdir -p "$XDG_CONFIG_HOME/tmux"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/tmux.conf' \
              > "$XDG_CONFIG_HOME/tmux/tmux.conf"
            echo "Do you wish to remap tmux's prefix to C-['CHAR']? [y/N]" && read tmuxprefix
            [[ $tmuxprefix =~ '^[yY]' ]] && echo 'Enter a char:' && read tmuxbind

            [[ -n $tmuxbind ]] && echo "# remap prefix from C-b to C-$tmuxbind\n" \
              "unbind C-b\nset-option -g prefix C-$tmuxbind\n" \
              "bind-key C-$tmuxbind send-prefix" >> "$XDG_CONFIG_HOME/tmux/tmux.conf"
          fi

          # Wezterm config
          if command -v wezterm >/dev/null; then
            command mkdir -p "$XDG_CONFIG_HOME/wezterm"

            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/wezterm.lua' \
              > "$XDG_CONFIG_HOME/wezterm/wezterm.lua"

            case $(lscpu | awk '/Model name:/{print $3}') in
              Intel\(R\))
                sed -i 's/\(initial_cols = \)148/\1112/g; s/\(initial_rows = \)40/\130/g' \
                "$XDG_CONFIG_HOME/wezterm/wezterm.lua";;
            esac

            if [[ -f '/usr/local/bin/xterm' ]]; then
              echo && ls -lh '/usr/local/bin/xterm' && echo && cat '/usr/local/bin/xterm' && echo
              echo "Do you wish to delete xterm to install Wezterm tweak? [y/N]" && read xtermVar
              [[ $xtermVar =~ '^[yY]' ]] && sudo rm -i '/usr/local/bin/xterm'
            fi
            if [[ ! -f '/usr/local/bin/xterm' ]]; then
              echo '#!/usr/bin/env bash\nwezterm start --cwd "$PWD" "$@"' | \
                sudo tee '/usr/local/bin/xterm' >/dev/null
              sudo chmod +x '/usr/local/bin/xterm'

              [[ ! -f '/bin/xterm' ]] || echo "$(date '+%Y-%m-%d %H:%M:%S') - " \
                "Warning: /bin/xterm exists and overlaps with /usr/local/bin/xterm" \
                >> "$HOME/.alert"
            fi
          fi

          # mpv config
          if command -v mpv >/dev/null || command -v io.mpv.Mpv >/dev/null; then

            command -v mpv >/dev/null && local baseMpv="$XDG_CONFIG_HOME" ||
              local baseMpv="$HOME/.var/app/io.mpv.Mpv/config"

            command mkdir -p "$baseMpv/mpv/scripts"
            echo 'idle=yes\nvolume=25\nautofit-smaller=50%x50%\nautofit-larger=90%x90%' \
              > "$baseMpv/mpv/mpv.conf"

            echo 'Ctrl+q quit\nF11 cycle fullscreen\nENTER cycle fullscreen' \
              '\nKP_ENTER cycle fullscreen\nWHEEL_UP osd-msg-bar seek 3' \
              '\nWHEEL_DOWN osd-msg-bar seek -3\nLEFT osd-msg-bar seek -5' \
              '\nRIGHT osd-msg-bar seek  5\nUP osd-msg-bar seek 15\nDOWN osd-msg-bar seek -15' \
              '\nkp9 add volume -2\nkp0 add volume 2' > "$baseMpv/mpv/input.conf"

            fetch \
              'https://raw.githubusercontent.com/brunolpsousa/mpv-nextfile/master/nextfile.lua' \
              > "$baseMpv/mpv/scripts/nextfile.lua"
            fetch \
              'https://raw.githubusercontent.com/jonniek/mpv-playlistmanager/master/playlistmanager.lua' \
              > "$baseMpv/mpv/scripts/playlistmanager.lua"

            sed -i 's/\(key_loadfiles = "\)"/\1CTRL+l"/g' "$baseMpv/mpv/scripts/playlistmanager.lua"
          fi
          break;;

        No ) break;;
        Exit ) return;;
      esac
    done
  fi

  # Virtual machines
  echo 'Do you wish to use Virtual Machines?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in

      Yes )
        echo 'Do you wish to use GNOME Boxes or Virt-Manager?'
        local gve
        select gve in 'GNOME Boxes' 'Virt-Manager' 'None'; do
          case $gve in
            GNOME\ Boxes ) sh -c "${use_sudo} pacman -S --needed gnome-boxes"; break;;
            Virt-Manager )
              sh -c "${use_sudo} pacman -S --needed \
                virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq"
              break;;
            None ) break;;
          esac
        done

        sh -c "${use_sudo} systemctl enable --now libvirtd; ${use_sudo} virsh net-autostart default"
        if [[ "$EUID" != 0 ]]; then
          [[ -z $(groups | grep libvirt) ]] && gpasswd -a $USER libvirt
          if ! grep -q "user = \"$USER\"" /etc/libvirt/qemu.conf; then
            echo "\nuser = \"$USER\"\ngroup = \"$USER\"" | \
              sudo tee -a /etc/libvirt/qemu.conf >/dev/null
            echo "\nunix_sock_group = 'libvirt'\nunix_sock_rw_perms = '0770'" | \
              sudo tee -a /etc/libvirt/libvirtd.conf >/dev/null
          fi
        else
          [[ -z $(groups bruno | grep libvirt) ]] && gpasswd -a bruno libvirt
          if ! grep -q bruno /etc/libvirt/qemu.conf; then
            echo "\nuser = \"bruno\"\ngroup = \"bruno\"" | tee -a /etc/libvirt/qemu.conf >/dev/null
            echo "\nunix_sock_group = 'libvirt'\nunix_sock_rw_perms = '0770'" | \
              tee -a /etc/libvirt/libvirtd.conf >/dev/null
          fi
        fi

        break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # GNOME
  echo 'Do you wish to install and configure a basic GNOME or KDE Desktop?'
  local gke
  select gke in 'GNOME' 'KDE' 'Exit'; do
    case $gke in

      GNOME ) sh -c "${use_sudo} pacman -S --needed \
          xdg-desktop-portal-gnome gst-plugin-pipewire gvfs-mtp \
          gnome-shell gnome-session gdm gnome-keyring gnome-control-center nautilus \
          gnome-disk-utility gnome-system-monitor gnome-tweaks gnome-themes-extra \
          webp-pixbuf-loader ffmpegthumbnailer"

        if [[ -z "$flatpk" ]]; then
          echo 'Do you wish to use Flatpak [y/N]?'
          read flatpk
        fi

        if [[ "$flatpk" =~ '^[yY]' ]]; then
          command -v flatpak >/dev/null || sh -c "${use_sudo} pacman -S flatpak"
          flatpak install org.gnome.FileRoller org.gnome.Calculator org.gnome.Chess org.gnome.Mines
          flatpak override -u --filesystem=host org.gnome.FileRoller
        else
          sh -c "${use_sudo} pacman -S --needed \
            file-roller gnome-calculator gnome-chess gnome-mines"
        fi

        echo -e '[Unit]\nDescription=Change Wallpapers\nStartLimitIntervalSec=3' \
          '\nStartLimitBurst=5\n\n[Service]' \
          "\nExecStart=$XDG_DATA_HOME/zsh/chwp.sh\nRestart=always\nRestartSec=3" \
          '\n\n[Install]\nWantedBy=default.target' |
          ${use_sudo} tee /etc/systemd/user/chwp.service >/dev/null

        sh -c "${use_sudo} \
          sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=lock/' /etc/systemd/logind.conf"
        sh -c "${use_sudo} chmod u+x /etc/systemd/user/chwp.service"
        sudo -u \
          gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

        if [[ "$EUID" != 0 ]]; then
          command mkdir -p "$XDG_CONFIG_HOME/zsh" "$XDG_DATA_HOME/nautilus/scripts"

          [[ -f "$XDG_DATA_HOME/zsh/chwp.sh" ]] || fetch \
            'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/chwp.sh' \
            > "$XDG_DATA_HOME/zsh/chwp.sh"

          chmod +x "$XDG_DATA_HOME/zsh/chwp.sh"
          echo '#!/usr/bin/env bash\nexport TERMX_NAUTILUS=1 && xterm' \
            > "$XDG_DATA_HOME/nautilus/scripts/Terminal"
          chmod +x "$XDG_DATA_HOME/nautilus/scripts/Terminal"
          echo 'F4 Terminal' > "$XDG_CONFIG_HOME/nautilus/scripts-accels"
          systemctl --user daemon-reload
          systemctl --user enable --now chwp.service
        fi
        break;;

      KDE ) sh -c "${use_sudo} pacman -S --needed \
              xdg-desktop-portal-kde plasma-desktop plasma-wayland-session \
              qt5-wayland qt6-wayland sddm sddm-kcm powerdevil bluedevil plasma-nm plasma-pa \
              breeze-gtk kde-gtk-config kdialog khotkeys kinfocenter kscreen \
              plasma-disks plasma-firewall dolphin-plugins ark filelight \
              kcalc qt5-imageformats ffmpegthumbs plasma-systemmonitor kwallet-pam \
              spectacle qt5-virtualkeyboard gwenview kcharselect okular"

        echo "\n>>> Do you wish to install KDE Games?\n"
        sh -c "${use_sudo} pacman -S --needed \
          bomber granatier kapman kblocks kfourinline kmines \
          knavalbattle knetwalk kollision kpat ksnakeduel kspaceduel"

        [[ -f '/etc/sddm.conf.d/kde_settings.conf' ]] &&
          ! grep -q Breeze_Snow /etc/sddm.conf.d/kde_settings.conf &&
          sh -c "${use_sudo} sed -i \
          '/^RebootCommand/ s/$/\nNumlock=on\nInputMethod=qtvirtualkeyboard/; /=breeze$/ s/$/\
          \nCursorTheme=Breeze_Snow/' /etc/sddm.conf.d/kde_settings.conf"

        echo -e '[Unit]\nDescription=Set Theme\n' \
          "\n[Service]\nExecStart=$XDG_DATA_HOME/zsh/theme.sh\n" |
          ${use_sudo} tee /etc/systemd/user/theme.service >/dev/null
        echo -e '[Unit]\nDescription=Set Theme\n\n[Timer]' \
          '\nOnCalendar=*-*-* 6:35:00\nOnCalendar=*-*-* 17:45:00\nPersistent=true' \
          '\nUnit=theme.service\n\n[Install]\nWantedBy=default.target' |
          ${use_sudo} tee /etc/systemd/user/theme.timer >/dev/null

        # Map Meta (Super) to toggle overview
        kwriteconfig5 --file "$XDG_CONFIG_HOME/kwinrc" --group ModifierOnlyShortcuts --key Meta \
          "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,Overview" \
          && qdbus org.kde.KWin /KWin reconfigure

        chmod +x "$XDG_DATA_HOME/zsh/theme.sh"
        systemctl --user daemon-reload
        systemctl --user enable --now theme.timer
        break;;

      Exit ) return;;
    esac
  done
}
#--------------------------------------------------------------------------------------------------#
################################################ End ###############################################
#--------------------------------------------------------------------------------------------------#
