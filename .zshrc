#------------------------------------------------------------------------------#
################################ BEGIN OF ZSHRC ################################
#------------------------------------------------------------------------------#
# Environment
cdpath=(.. ~)
export EDITOR=nvim
export VISUAL="$EDITOR"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM='wayland'
export QT_QPA_PLATFORMTHEME='gnome'
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export LESS='-R --mouse --wheel-lines=3'
# https://github.com/trapd00r/LS_COLORS/blob/master/lscolors.sh
export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGES=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;155:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*authorized_keys=1:*cfg=1:*conf=1:*config=1:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=1:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;137;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;192;3:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bak=38;5;241:*.bash=38;5;172:*.bash_login=1:*.bash_logout=1:*.bash_profile=1:*.bat=38;5;172:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.chm=38;5;141:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;074;1:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;125;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;60:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;125;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;97:*.git=38;5;197:*.gitattributes=38;5;240:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=1:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;074;1:*.jhtm=38;5;125;1:*.jpeg=38;5;97:*.jpg=38;5;97:*.js=38;5;074;1:*.jsm=38;5;074;1:*.json=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.jsp=38;5;074;1:*.jxl=38;5;97:*.kak=38;5;172:*.key=38;5;166:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;125;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;60:*.log=38;5;190:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;184:*.md=38;5;184:*.md5=38;5;116:*.mdb=38;5;60:*.mde=38;5;60:*.mdump=38;5;241:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;114:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;114:*.mp3=38;5;137;1:*.mp4=38;5;114:*.mp4a=38;5;137;1:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;125;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;178:*.nds=38;5;213:*.nes=38;5;213:*.nfo=38;5;184:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;111:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;242:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;241:*.otf=38;5;66:*.out=38;5;242:*.p12=38;5;192;3:*.p7s=38;5;192;3:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;192;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.pk3=38;5;215:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;97:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=1:*.properties=38;5;116:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;41:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;125;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;125;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;172:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.sql=38;5;222:*.sqlite=38;5;60:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;178:*.torrent=38;5;116:*.ts=38;5;115:*.tsv=38;5;78:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;253:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.war=38;5;215:*.wav=38;5;136;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=1:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;178:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;178:*.yml=38;5;178:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:';
# Make SSH work with GNUPG
export GPG_TTY=$(tty)
SSH_AGENT_PID=''
SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
[[ -x $(command -v plasmashell) ]] && export GTK_USE_PORTAL=1
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$XDG_DATA_HOME/npm/bin" ]] && export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
[[ -d "$XDG_DATA_HOME/cargo/bin" ]] && export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
[[ "$LANG" == 'C'  || "$LANG" == '' ]] && echo "$(date '+%Y-%m-%d %H:%M:%S') - The \$LANG ($LANG) variable is not set. This can cause a lot of problems" >> "$HOME/.alert"
[[ "$EUID" != 0 ]] && umask 022 && sysvar='--user' || umask 002
systemctl $sysvar import-environment EDITOR VISUAL XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME LS_COLORS MOZ_ENABLE_WAYLAND QT_QPA_PLATFORM QT_QPA_PLATFORMTHEME GTK_USE_PORTAL 2>/dev/null; unset sysvar
# Interactive or return
[[ $- == *i* ]] || return 
#------------------------------------------------------------------------------#
#################################### Aliases ###################################
#------------------------------------------------------------------------------#
alias .='cd $HOME'
alias chmod='chmod -c'
alias chown='chown -c'
alias cp='cp -riv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -vp'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias df='df -h'
alias ip='ip --color=auto'
alias diff='diff -Nuar --color=auto'
alias ls='ls --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify'
alias la='ls -v --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify --almost-all'
alias ll='ls -l --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify'
alias lla='ls -lv --color=auto --hyperlink=auto --human-readable --literal --group-directories-first --classify --almost-all'
alias g='grep -n -C 3 --color=auto'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias clear='unset NEW_LINE_BEFORE_PROMPT && clear'
alias nano='nano -EaiT4'
alias v="$EDITOR"
alias yt='yt-dlp'
alias ytm='yt-dlp -x --audio-format mp3'
alias sd='sudo '
alias sv='sudoedit'
alias fins="paru -Slq | fzf --multi --preview 'paru -Si {1}' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro paru -S"
alias fiins="paru -Slq | fzf --multi --preview 'cat <(paru -Si {1}) <(paru -Fl {1} 2>/dev/null | awk \"{print \$2}\")' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro paru -S"
alias frem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro sudo pacman -Rns"
alias firem="pacman -Qq | fzf --multi --preview 'cat <(pacman -Qi {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' --bind ctrl-j:preview-down,ctrl-k:preview-up | xargs -ro sudo pacman -Rns"
alias bundle='sudo sbctl bundle -s -i /boot/*-ucode.img -l /usr/share/systemd/bootctl/splash-arch.bmp -k /boot/vmlinuz-linux -f /boot/initramfs-linux.img /boot/EFI/Linux/linux.efi && sudo sbctl sign -s /boot/vmlinuz-linux && sudo sbctl sign -s /boot/EFI/Linux/linux.efi'
alias bundle-lts='sudo sbctl bundle -s -i /boot/*-ucode.img -l /usr/share/systemd/bootctl/splash-arch.bmp -k /boot/vmlinuz-linux-lts -f /boot/initramfs-linux-lts.img /boot/EFI/Linux/linux-lts.efi && sudo sbctl sign -s /boot/vmlinuz-linux-lts && sudo sbctl sign -s /boot/EFI/Linux/linux-lts.efi'
alias sign-ms='sudo sbctl sign -s /boot/EFI/Microsoft/Boot/bootmgfw.efi'
#------------------------------------------------------------------------------#
#################################### General ###################################
#------------------------------------------------------------------------------#
# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd
# If the argument to a cd command (or an implied cd with the AUTO_CD option set)
# is not a directory, and does not begin with a slash, try to expand the
# expression as if it were preceded by a ‘~’
setopt cdable_vars
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation,
# etc. (An initial unquoted ‘~’ always produces named directory expansion.)
setopt extended_glob
# No history beep
setopt no_hist_beep
# Write to the history file immediately, not when the shell exits.
setopt inc_append_history
# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space
# Remove superfluous blanks from each command line being added to the history list
setopt hist_reduce_blanks
# When searching for history entries in the line editor, do not display duplicates
# of a line previously found, even if the duplicates are not contiguous
setopt hist_find_no_dups
# When writing out the history file, older commands that duplicate newer ones are omitted
setopt hist_save_no_dups
# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups
#------------------------------------------------------------------------------#
# ZSH stuff
ZDOTDIR="$HOME"
HISTFILE="$XDG_STATE_HOME/zsh/zshist"
HISTSIZE=1000
SAVEHIST=$HISTSIZE
[[ ! -d "$XDG_CACHE_HOME" || ! -d "$XDG_DATA_HOME/zsh" || ! -d "$XDG_STATE_HOME/zsh" ]]\
&& mkdir -p "$XDG_CACHE_HOME" "$XDG_DATA_HOME/zsh" "$XDG_STATE_HOME/zsh" >/dev/null 2>&1
#------------------------------------------------------------------------------#
# Completion
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zcompdump"
zmodload zsh/complist

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit
#------------------------------------------------------------------------------#
# Include hidden files
_comp_options+=(globdots)
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zcompcache"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:git:*' user-commands subrepo:'perform git-subrepo operations'

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=($( COMP_WORDS="$words[*]" \
            COMP_CWORD=$(( cword-1 )) \
            PIP_AUTO_COMPLETE=1 $words[1] ))
}
compctl -K _pip_completion pip
#------------------------------------------------------------------------------#
# Define word separators (for stuff like backward-word, forward-word,
# backward-kill-word,..)
# WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' # default
# WORDCHARS=.
# WORDCHARS='*?_[]~=&;!#$%^(){}'
# WORDCHARS='${WORDCHARS:s@/@}'
WORDCHARS='*~&%^'
#------------------------------------------------------------------------------#
# ArchWiki Bindings
# (e)macs or (v)im mapping
bindkey -v
# Makes the switch between modes quicker (Vim)
export KEYTIMEOUT=1

# Create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[Home]}"      ]] && bindkey -M vicmd "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[End]}"       ]] && bindkey -M vicmd "${key[End]}"  end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# For Ctrl+Left to move to the beginning of the previous word and
# Ctrl+Right to move to the beginning of the next word:
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Tries to set Ctrl + Delete and Ctrl + Backspace to erase prev and next words,
# but terminals are different:
[[ -n "${key[Control-Backspace]}"  ]] && bindkey -- "${key[Control-Backspace]}" backward-kill-word
[[ -n "${key[Control-Delete]}" ]] && bindkey -- "${key[Control-Delete]}" kill-word

bindkey '^H' backward-kill-word                           # control + backspace
bindkey '^[[3^' kill-word                                 # control + delete
bindkey '^[[3;5~' kill-word                               # control + delete
#------------------------------------------------------------------------------#
# Vim Mapping For Completion
# https://thevaluable.dev/zsh-install-configure-mouseless/
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#------------------------------------------------------------------------------#
# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done
#------------------------------------------------------------------------------#
# Vim cursor indicator
# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
# 2 and 6 = blink; 1 and 5 = no blink
function zle-keymap-select {
  local cursor_block='\e[1 q'
  local cursor_beam='\e[5 q'
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
      echo -n $cursor_block
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -n $cursor_beam
  fi
}
function zle-line-init {
  zle-keymap-select
}
zle -N zle-line-init
zle -N zle-keymap-select
#------------------------------------------------------------------------------#
# Editing Command Lines
# This specific function let you edit a command line in your visual editor,
# defined by the environment variable $VISUAL (or $EDITOR).
autoload -Uz edit-command-line
zle -N edit-command-line
# Restore cursor format after edit
function edit-cmd-line {
  edit-command-line
  zle-keymap-select
}
zle -N edit-cmd-line
bindkey '^V' edit-cmd-line
bindkey -M vicmd '^v' edit-cmd-line
#------------------------------------------------------------------------------#
# Vim job suspension
# Use Ctrl-z swap in and out of vim (or any other process)
# https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
function ctrl-z-toggle {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER='setopt monitor && fg'
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N ctrl-z-toggle
bindkey '^Z' ctrl-z-toggle
#------------------------------------------------------------------------------#
#################################### Plugins ###################################
#------------------------------------------------------------------------------#
# asdf
source /opt/asdf-vm/asdf.sh 2>/dev/null
#------------------------------------------------------------------------------#
# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null
#------------------------------------------------------------------------------#
# fzf
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null
#------------------------------------------------------------------------------#
# zsh-async
if [[ -f "$XDG_DATA_HOME/zsh/async.zsh" ]]; then
  source "$XDG_DATA_HOME/zsh/async.zsh"
else
  echo 'Downloading zsh-async...'
  curl -s 'https://raw.githubusercontent.com/mafredri/zsh-async/master/async.zsh' -o "$XDG_DATA_HOME/zsh/async.zsh"
  sumvar='3ca377ef528f2c6c8beaf97cfd46c969d25440412a0699f5be1bae5121406a891fde0c5fea5946f374b52f31c5afd6f723087934ed60de9f3be1f8fb72b9ac3a'
  sumvar2="$(sha512sum $XDG_DATA_HOME/zsh/async.zsh | cut -d ' ' -f1)" 2>/dev/null
  [[ $sumvar == $sumvar2 ]] && source "$XDG_DATA_HOME/zsh/async.zsh" || echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-async" >> "$HOME/.alert"
  unset sumvar sumvar2
fi
#------------------------------------------------------------------------------#
# Auto Suggestions
if [[ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' ]]; then
  source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
  var=1
elif [[ -f "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh" ]]; then
  source "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh"
  var=1
else
  echo 'Downloading zsh-autosuggestions...'
  curl -s 'https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh' -o "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh"
  sumvar='47bab685f000d242c9c204b1d7f8862a282f1b649f9b5543ae5309c8d7af87d1ad658c7ab67422191070608feb5af18eeba6f6cace798dfb92187825e1e9ba76'
  sumvar2="$(sha512sum $XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh | cut -d ' ' -f1)" 2>/dev/null
  [[ $sumvar == $sumvar2 ]] && source "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh" && var=1
  unset sumvar sumvar2
fi
if [[ -n $var ]]; then
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,underline'
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  zmodload zsh/zpty
  unset var
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-autosuggestions.zsh" >> "$HOME/.alert"
fi
#------------------------------------------------------------------------------#
# Completions
if [[ ! -d '/usr/share/licenses/zsh-completions' ]]; then
  if  [[ -d "$XDG_DATA_HOME/zsh/zsh-completions" ]]; then
    source "$XDG_DATA_HOME/zsh/zsh-completions/zsh-completions.plugin.zsh"
  else
    echo 'Downloading zsh-completions...'
    dirvar="$PWD"
    builtin cd -q "$XDG_CACHE_HOME"
    [[ -f "$XDG_CACHE_HOME/zsh-completions-master.zip" ]] || curl -sL 'https://github.com/zsh-users/zsh-completions/archive/refs/heads/master.zip' -o "$XDG_CACHE_HOME/zsh-completions-master.zip"
    sumvar='c730c58377c576333f030335b859d52c98d6222c43f36b70734cdb72abf7d7f7327a8848321a4b54fa204b9f9598450ff87da8de8ef799099308a055bc0e5b0f'
    sumvar2="$(sha512sum $XDG_CACHE_HOME/zsh-completions-master.zip | cut -d ' ' -f1)" 2>/dev/null
    unzip -uq "$XDG_CACHE_HOME/zsh-completions-master.zip" zsh-completions-master/{zsh-completions.plugin.zsh,"src/*"} -d "$XDG_DATA_HOME/zsh" 2>/dev/null
    command mv "$XDG_DATA_HOME/zsh/zsh-completions-master" "$XDG_DATA_HOME/zsh/zsh-completions" 2>/dev/null
    [[ $sumvar == $sumvar2 ]] && source "$XDG_DATA_HOME/zsh/zsh-completions/zsh-completions.plugin.zsh" || echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-completions.zsh" >> "$HOME/.alert"
    builtin cd -q "$dirvar"
    unset sumvar sumvar2 dirvar
  fi
fi
#------------------------------------------------------------------------------#
# History substring search
if [[ -f '/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh' ]]; then
  source '/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh'
  var=1
elif [[ -f "$XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh" ]]; then
  source "$XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh"
  var=1
else
  echo 'Downloading zsh-history-substring-search...'
  curl -s 'https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh' -o "$XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh"
  sumvar='2750c07fa5f220319cf9dd93567a5f0dc3320f562849874c38b28ee7f4ad979818caf4120aad40724f7bdf30a7edb4d2c9f42686d5396adbe539b0e74b939000'
  sumvar2="$(sha512sum $XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh | cut -d ' ' -f1)" 2>/dev/null
  [[ $sumvar == $sumvar2 ]] && source "$XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh" && var=1
  unset sumvar sumvar2
fi
if [[ -n $var ]]; then
  zmodload zsh/terminfo
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   history-substring-search-up
  [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" history-substring-search-down
  unset var
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-history-substring-search.zsh" >> "$HOME/.alert"
  autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
  [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
fi
#------------------------------------------------------------------------------#
# Syntax highlighting
if [[ -f '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ]]; then
  source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
elif [[ -f "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  echo 'Downloading zsh-syntax-highlighting...'
  dirvar="$PWD"
  builtin cd -q "$XDG_CACHE_HOME"
  [[ -f "$XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip" ]] || curl -sL 'https://github.com/zsh-users/zsh-syntax-highlighting/archive/refs/heads/master.zip' -o "$XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip"
  sumvar='c51eaa77302f0ae74041d9e0d2a7cff3fe3420c794c29e2d67114c1f1768e2a83831cf2d3cce3983c518ec6ceef05421d88f6a8ecee9d448261bbe3567e72201'
  sumvar2="$(sha512sum $XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip | cut -d ' ' -f1)" 2>/dev/null
  unzip -uq "$XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip" zsh-syntax-highlighting-master/{zsh-syntax-highlighting.zsh,"highlighters/*",.revision-hash,.version} -d "$XDG_DATA_HOME/zsh" 2>/dev/null
  command mv "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting-master" "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/" 2>/dev/null
  [[ $sumvar == $sumvar2 ]] && source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" || echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-syntax-highlighting.zsh" >> "$HOME/.alert"
  builtin cd -q "$dirvar"
  unset sumvar sumvar2 dirvar
fi
#------------------------------------------------------------------------------#
#################################### Extras ####################################
#------------------------------------------------------------------------------#
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

# Convert media files to mp3
tomp3() {
  if [[ -n "$@" ]]; then
    mkdir -p ./mp3_files
    for a in "$@"; do
      for f in "*.$a"; do
        ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "./mp3_files/${f%.*}.mp3"
      done
    done
  else
    echo 'Usage: tomp3 <extension-1> <extension-2> ...'
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
    selection="$(command ls -aNv --group-directories-first 2>/dev/null | fzf --height 95% --reverse --info hidden --prompt "$(pwd)/" --preview ' cd_pre="$(echo $(pwd)/$(echo {}))";
            echo $cd_pre 2>/dev/null; 
            echo;
            command ls -ANv --group-directories-first --color=always "${cd_pre}" 2>/dev/null;
            command less -F {} 2>/dev/null' --bind ctrl-j:preview-down,ctrl-k:preview-up --preview-window=right:65%)"
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
    echo 'Tip: to just copy files over SSH:\nscp -P <port> <filepath_src> <user>@<server IP>:<filepath_dest>'
    return 1
  fi
}

# Get public ip
myip() {
  local api
  case "$1" in
    '-4') api='http://v4.ipv6-test.com/api/myip.php' ;;
    '-6') api='http://v6.ipv6-test.com/api/myip.php' ;;
    *) api='https://ipv6-test.com/api/myip.php' ;;
  esac
  curl -s "$api" && echo
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
  local var="$PWD"
  builtin cd -q $(sed 's/src.*/bin/g' <<< $var) || return 1
  class_path=$(find * -type f -name "$1*" | sed 's/.class//g')
  java "$class_path"
  builtin cd -q $var
  unset var class_path
}

jvc() {
  javac -classpath "$(find -type d)" -d $(sed 's/src.*/bin/g' <<< "$PWD") $(find -type f -name "*.java")
  [[ -z $1 ]] || jvr "$1"
}
 
# Unlock user after failed login attempt
unlock() { [[ -n $1 ]] && faillock --user $1 --reset || echo 'Usage: unlock <user>' }

# Display system install date
arch-date() { echo -n 'System was installed on '; ls -lct /etc | tail -1 | awk '{print $7, $6, $8}' }

# Reset GNOME to default settings
reset-gnome() {
  if [[ -z $1 ]]; then
    gsettings list-schemas | xargs -n 1 gsettings reset-recursively
  else
    gsettings list-schemas | command grep $1 | xargs -n 1 gsettings reset-recursively
  fi
}

# Reset GNOME Apps Grid
alias reset-gnome-appgrid='gsettings reset org.gnome.shell app-picker-layout'

# Display warnings from pacman
alias paclog='grep -n -C 2 --color=auto warning: /var/log/pacman.log'

# Refresh Arch mirrors
alias refresh='sudo reflector --protocol https --age 12 --latest 20 --connection-timeout 2 --download-timeout 2 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist --verbose'

# Ignore local modifications
alias git-ignore='git reset --hard HEAD && git merge "@{u}"'

# Weather by wttr.in
alias weather='curl https://wttr.in'

# Display top 10 shell commands
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# Speedtest
alias speedtest='curl -o /dev/null http://speedtest-blr1.digitalocean.com/100mb.test'

# Display wifi networks
alias wifi='nmcli device wifi'

# White neofetch
alias nfetch='neofetch --colors 15 15 15 15 15 15 --ascii_colors 15 15 --ascii_bold on --os_arch off --speed_shorthand on --gtk_shorthand on --refresh_rate on --cpu_temp C --disk_percent on --memory_percent on --disable cols'

# Neofetch with old Arch logo
alias ofetch='neofetch --colors 7 7 --ascii_distro Arch_old --ascii_colors 8 7 --os_arch off --speed_shorthand on --gtk_shorthand on --refresh_rate on --cpu_temp C --disk_percent on --memory_percent on --disable font disk term cols'

# Neofetch with Windows logo (WSL)
alias wfetch='neofetch --ascii_distro Windows7 --os_arch off --speed_shorthand on --gtk_shorthand on --refresh_rate on --cpu_temp C --disk_percent on --memory_percent on --disable cols'

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
alias yaml="python -c 'import json, sys, yaml; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y, indent=4))'"

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
  python -c "import sys, json; from urllib.parse import parse_qs; print(json.dumps({k: q[0] if #len(q) == 1 else q for k, q in parse_qs(sys.stdin.read()).items()}), end='')" | json
}

# Display a list of supported colors
lscolors() {
  ((cols = $COLUMNS - 4))
  local s=$(printf %${cols}s)
  for i in {000..$(tput colors)}; do
    echo $i $(tput setaf $i; tput setab $i)${s// /=}$(tput op);
  done
  echo
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}
#------------------------------------------------------------------------------#
# If tmux is executable and not already inside a session:
  if command -v tmux >/dev/null && [[ -z $TMUX && -z $ZSH_TMUX_STARTED ]]; then
    tvar="$(tmux list-sessions >/dev/null 2>&1 | grep main)"
    export ZSH_TMUX_STARTED=1
    if grep -q attached <<< "$tvar"; then
      tmux neww -t main && tmux a -t main
    elif [[ -n $tvar ]]; then
      tmux a -t main
    else
      tmux new -As main
    fi
    unset tvar; echo
  fi
#------------------------------------------------------------------------------#
################################## Arch Config #################################
#------------------------------------------------------------------------------#
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
    $Yellow FCEUX:$Color_Off Nintendo Entertainment System (NES), Famicom, and Famicom Disk System (FDS) emulator
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
    $Yellow Antimicro:$Color_Off Graphical program used to map keyboard buttons and mouse controls to a gamepad
    $Yellow sc-controller:$Color_Off User-mode driver, mapper and GTK3 based GUI for Steam Controller, DS4 and similar controllers
    $Yellow 0ad:$Color_Off Cross-platform, 3D and historically-based real-time strategy game"
}

gnome-extensions() {
  echo "\n ### GNOME Extensions ###\n
    - Caffeine:\nhttps://extensions.gnome.org/extension/517/caffeine
    - Appindicator Support\nhttps://extensions.gnome.org/extension/615/appindicator-support
    - Clipboard History\nhttps://extensions.gnome.org/extension/4839/clipboard-history
    - Sound Output Device Chooser\nhttps://extensions.gnome.org/extension/906/sound-output-device-chooser
    - Night Theme Switcher\nhttps://extensions.gnome.org/extension/2236/night-theme-switcher"
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
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <cmd>iw - Cmd inner word 
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <cmd>ip - Cmd inner paragraph 
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <cmd>a\" - Cmd around quotes 
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ]p      - Paste and adjust indent
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off d/hello - Delete until hello
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off J       - Join line
  ${IBlack}[${BIPurple}V$IBlack]$Color_Off U/u     - Uppercase|lowercase
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off ~       - Switch case
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-a     - Increase number
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-x     - Decrease number
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off <|>|=    - Indent right|left|auto
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
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-e -  Netrw
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-fe - Edit file
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-ff - Find files
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-ft - Live grep
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-fp - Find project
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-fb - Find buffer
  \n\t$IWhite### LSP ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gD     - Declaration
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gd     - Definition
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-D  - Type Definition
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off K      - Hover
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gi     - Implementation
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gr     - References
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off gl     - Open float
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lf - Format
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-la - Code action
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lj - Diagnostic - prev
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lk - Diagnostic - next
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lr - Rename
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-ls - Signature help
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-lq - Set loc list
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-wa - Add workspace folder
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-wr - Remove workspace folder
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-wl - List workspace folders
  \n\t$IWhite### CMP ###
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-c   - Close CMP
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-SPC - Complete CMP
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off C-b|f - Scroll docs
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off TAB   - Expand snip
  ${IBlack}[${BIGreen}I$IBlack]$Color_Off S-TAB - Prev snip
  \n\t$IWhite### DAP ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-db - Toggle breakpoint
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dc - Continue
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-di - Step into
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-do - Step over
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dO - Step out
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dr - Repl toggle
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dl - Run last
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-du - Toggle DapUI
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-dt - Terminate
  \n\t$IWhite### General ###
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-q         - Quit
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off C-s         - Save buffer
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off S-q         - Close buffer
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-Q       - Force close buffer
  ${IBlack}[${BIBlue}N$IBlack]$Color_Off SPC-s       - Save all
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
  ${IBlack}[${BIYellow}C$BIBlack]$Color_Off :%s/old/new/gc    - Replace all old with new throughout file with confirmations
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
  \n${IBlack}Vim Cheat Sheet: https://vim.rtorr.com$Color_Off\n${IBlack}QuickRef.ME: https://quickref.me/vim$Color_Off"
}

arch-base() {
  [[ "$EUID" != 0 ]] && local varsu='sudo'

  if [[ "$EUID" != 0 ]] && ! grep -q "$HOME/.zshrc" /etc/zsh/zprofile; then
    echo 'Do you wish to configure zprofile?'
    select yne in 'Yes' 'No' 'Exit'; do
      case $yne in
        Yes ) echo "source $HOME/.zshrc" | sudo tee -a /etc/zsh/zprofile >/dev/null; break;;
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
          sh -c "${varsu} sed -i -e 's/#\(Color\)/\1/g' -e 's/#\(VerbosePkgLists\)/\1/g' -e '/ParallelDownloads/ s/^#//; /ParallelDownloads/ s/5$/9\nIloveCandy/' -e '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf"
        break;;
        No ) break;;
        Exit ) return;;
      esac
    done
  fi

  echo 'Do you want to update mirrors with reflector?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in
      Yes ) sh -c "${varsu} pacman -S --needed reflector;reflector --protocol https --age 12 --latest 20 --connection-timeout 2 --download-timeout 2 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist --verbose"; break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # Base packages
  echo 'Do you wish to install base packages for Arch Linux?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in
      Yes )
        sh -c "${varsu} pacman -Syu --needed sbctl neovim wl-clipboard alacritty tmux xdg-desktop-portal xdg-desktop-portal-gtk yt-dlp firefox ufw neofetch ntfs-3g exfat-utils unrar zip p7zip zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting steam pcsclite qbittorrent libreoffice-fresh libreoffice-fresh-pt-br fzf hunspell-en_US noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation gsfonts lib32-gst-plugins-good gnuchess java-runtime-common base-devel networkmanager reflector android-udev android-tools pkgstats pipewire pipewire-alsa pipewire-pulse wireplumber $(case $(lscpu | awk '/Model name:/{print $3}') in AMD) echo -n 'amd-ucode';; Intel\(R\)) echo -n 'intel-ucode';; esac)"
        if [[ "$EUID" != 0 && ! -x /usr/bin/paru ]]; then
          command mkdir -p $HOME/{.cache/paru/clone,.config/paru}
          git clone https://aur.archlinux.org/paru-bin $XDG_CACHE_HOME/paru/clone/paru-bin
          local var="$PWD"
          builtin cd -q $XDG_CACHE_HOME/paru/clone/paru-bin
          makepkg -sir
          builtin cd -q "$var"
          unset var
          echo "# \$PARU_CONF\n# /etc/paru.conf\n# ~/.config/paru/paru.conf\n# GENERAL OPTIONS\n[options]\nRemoveMake\nSudoLoop\nCombinedUpgrade\nUpgradeMenu" | tee $XDG_CONFIG_HOME/paru/paru.conf >/dev/null
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
        sh -c "${varsu} ufw enable"
        sh -c "${varsu} systemctl enable fstrim.timer pcscd systemd-oomd bluetooth ufw"
        sh -c "${varsu} sed -i 's/#Storage=auto/Storage=volatile/' /etc/systemd/journald.conf"
        sh -c "${varsu} sed -i 's/#SystemMaxFileSize=/SystemMaxFileSize=50M/' /etc/systemd/journald.conf"
        sh -c "${varsu} sed -i 's/#SystemMaxFiles=100/SystemMaxFiles=5/' /etc/systemd/journald.conf"
        sh -c "${varsu} rm -rf /var/log/journal"
        sh -c "echo 'vm.swappiness=10\nvm.vfs_cache_pressure=50' | ${varsu} tee /etc/sysctl.d/99-sysctl.conf"
        break;;
      No ) break;;
      Exit ) return;;
    esac
  done

  # Keyboard
  echo 'Do you wish to select a keyboard layout?'
  local PT='localectl --no-convert set-x11-keymap br pc105; setxkbmap -model pc105 -layout br;echo "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\nLC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\nLC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;echo "KEYMAP=br-abnt2\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'
  local US='localectl --no-convert set-x11-keymap us pc105 intl;setxkbmap -model pc105 -layout us -variant intl;echo "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\nLC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\nLC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;echo "KEYMAP=us-acentos\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'
  local both='localectl --no-convert set-x11-keymap us,br pc105 intl,;setxkbmap -model pc105 -layout us,br -variant intl,;echo "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\nLC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\nLC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;echo "KEYMAP=us-acentos\nKEYMAP_TOGGLE=br-abnt2\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'
  select pubne in 'PT_BR' 'EN_US' 'Both' 'No' 'Exit'; do
    case $pubne in
      PT_BR ) sh -c "${varsu} sh -c '$PT'"; break;;
      EN_US ) sh -c "${varsu} sh -c '$US'"; break;;
      Both ) sh -c "${varsu} sh -c '$both'"; break;;
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
                  echo 'Enter your name:'
                  read gitname
                  [[ -z $gitname ]] || git config --global user.name "$gitname"
                  echo 'Enter your e-mail:'
                  read gitemail
                  [[ -z $gitemail ]] || git config --global user.email "$gitemail"
                  gpg --list-keys --with-keygrip
                  echo 'Enter your signingkey if you wish to define it'
                  read gitsigningkey
                  [[ -n "$gitsigningkey" ]] && git config --global user.signingkey "$gitsigningkey" && git config --global commit.gpgsign true
                  unset gitname gitemail gitsigningkey
                  break;;

                No ) break;;
                Exit ) return;;
              esac
            done
          fi

          # Firefox config
          echo "Do you wish to create Firefox config in \"$HOME/chrome\" dir [y/N]?"
          read firefoxcfg
          if [[ $firefoxcfg =~ '^[yY]' ]]; then
            command mkdir -p $HOME/chrome
            echo '@-moz-document url(about:home), url(about:newtab), url(about:privatebrowsing) {\n\t.click-target-container *, .top-sites-list * {\n\t\tcolor: #fff !important ;\n\t\ttext-shadow: 2px 2px 2px #222 !important ;\n\t}\n\n\tbody::before {\n\t\tcontent: "" ;\n\t\tz-index: -1 ;\n\t\tposition: fixed ;\n\t\ttop: 0 ;\n\t\tleft: 0 ;\n\t\tbackground: #f9a no-repeat url(img) center ;\n\t\tbackground-size: cover ;\n\t\twidth: 100vw ;\n\t\theight: 100vh ;\n\t}\n}' > $HOME/chrome/userContent.css
            ln -sf "$HOME/Pictures/Wallpapers/Module Abyss Lapis."* "$HOME/chrome/img" &>/dev/null
          fi
          unset firefoxcfg

          # Nerd font config
          if [[ ! $(find "$XDG_DATA_HOME/fonts" -name 'JetBrains*.ttf' 2>/dev/null) ]]; then
            echo "Do you wish to install Nerd Fonts? [y/N]?" && read nerdcfg
            [[ $nerdcfg =~ '^[yY]' ]] || return
            command mkdir -p "$XDG_DATA_HOME/fonts"
            echo 'Downloading Nerd Fonts...'
            [[ -f "$XDG_CACHE_HOME/JetBrainsMono.zip" ]] || curl -sL 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/JetBrainsMono.zip' -o "$XDG_CACHE_HOME/JetBrainsMono.zip"
            unzip -q "$XDG_CACHE_HOME/JetBrainsMono.zip" -d "$XDG_DATA_HOME/fonts" 2>/dev/null
            echo 'Done. Set JetBrainsMono as default font\n'
          fi
          unset nerdcfg

          # Neovim config
          if command -v nvim >/dev/null; then
            command mkdir -p "$XDG_CONFIG_HOME/nvim"
            [[ -f "$XDG_CONFIG_HOME/nvim/init.lua" ]] || curl -s 'https://gitlab.com/N1vBruno/dotfiles/-/raw/master/init.lua' -o "$XDG_CONFIG_HOME/nvim/init.lua"
            if [[ ! -x "$HOME/.local/bin/shellcheck" ]]; then
              echo 'Downloading shellcheck...'
              [[ -f "$XDG_CACHE_HOME/shellcheck.tar.xz" ]] || curl -sL 'https://github.com/koalaman/shellcheck/releases/download/v0.8.0/shellcheck-v0.8.0.linux.x86_64.tar.xz' -o "$XDG_CACHE_HOME/shellcheck.tar.xz"
              local sumvar='89317d97adb341e627b709e86477734ce236e9fb290de8a8c41cdc62769a3225622fa609deffebeabe9edb71f5639a086f61b677947e3ec4bc07c540fcbd0973'
              local sumvar2="$(sha512sum $XDG_CACHE_HOME/shellcheck.tar.xz | cut -d ' ' -f1)" 2>/dev/null
              if [[ $sumvar == $sumvar2 ]]; then
                command mkdir -p "$HOME/.local/bin"
                local var="$PWD"
                builtin cd -q "$XDG_CACHE_HOME"
                tar -Jxf "$XDG_CACHE_HOME/shellcheck.tar.xz" shellcheck-v0.8.0/shellcheck
                command mv shellcheck-v0.8.0/shellcheck "$HOME/.local/bin"
                builtin cd -q "$var"
                unset var sumvar
              else
                echo '\nerror: unmatched cheksum for shellcheck\n'
              fi
            fi
          fi

          # Alacritty config
          if command -v alacritty >/dev/null; then
            command mkdir -p "$XDG_CONFIG_HOME/alacritty"
            echo "window:\n  dynamic_padding: true\n  dimensions:\n    $(case $(lscpu | awk '/Model name:/{print $3}') in AMD) echo -n 'columns: 146\n    lines: 45' ;; Intel\(R\)) echo -n 'columns: 115\n    lines: 32';; esac)\n  opacity: 0.9\n\nfont:\n  normal:\n    family: JetBrainsMono Nerd Font Mono\n    style: Medium\n  bold:\n    family: JetBrainsMono Nerd Font Mono\n  italic:\n    family: JetBrainsMono Nerd Font Mono\n  bold_italic:\n    family: JetBrainsMono Nerd Font Mono\n  size: 10\n\nkey_bindings:\n  - { key: T, mods: Control|Shift, action: SpawnNewInstance }\n  - { key: W, mods: Control|Shift, action: Quit }\n\n# https://draculatheme.com/alacritty\ncolors:\n  primary:\n    background: '#282a36'\n    foreground: '#f8f8f2'\n    bright_foreground: '#ffffff'\n  cursor:\n    text: CellBackground\n    cursor: CellForeground\n  vi_mode_cursor:\n    text: CellBackground\n    cursor: CellForeground\n  search:\n    matches:\n      foreground: '#44475a'\n      background: '#50fa7b'\n    focused_match:\n      foreground: '#44475a'\n      background: '#ffb86c'\n  footer_bar:\n    background: '#282a36'\n    foreground: '#f8f8f2'\n  hints:\n    start:\n      foreground: '#282a36'\n      background: '#f1fa8c'\n    end:\n      foreground: '#f1fa8c'\n      background: '#282a36'\n  line_indicator:\n    foreground: None\n    background: None\n  selection:\n    text: CellForeground\n    background: '#44475a'\n  normal:\n    black: '#21222c'\n    red: '#ff5555'\n    green: '#50fa7b'\n    yellow: '#f1fa8c'\n    blue: '#bd93f9'\n    magenta: '#ff79c6'\n    cyan: '#8be9fd'\n    white: '#f8f8f2'\n  bright:\n    black: '#6272a4'\n    red: '#ff6e6e'\n    green: '#69ff94'\n    yellow: '#ffffa5'\n    blue: '#d6acff'\n    magenta: '#ff92df'\n    cyan: '#a4ffff'\n    white: '#ffffff'" > "$XDG_CONFIG_HOME/alacritty/alacritty.yml"
          fi

          # Tmux config
          # Vim color fix: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
          if command -v tmux >/dev/null; then
            command mkdir -p "$XDG_CONFIG_HOME/tmux"
            echo 'set -g default-command "${SHELL}"\nset -ga terminal-overrides ",$TERM:Tc"\nset -g set-titles on\nset -g set-titles-string "#T"\nset -g mouse on\nset -g status-interval 1\nset -gs escape-time 0\nset -g status on\nset -g status-left ""\nset -g status-right ""\nset -g status-justify centre\nset-window-option -g window-status-format "#Iː#W "\nset-window-option -g window-status-current-format "#Iː#W•"\nset -gw mode-style fg=colour226,bold\nset -g status-style fg=colour254\nset -g message-style fg=colour254\nset -g pane-border-style fg=colour243,bg=default\nset -g pane-active-border-style fg=colour243,bg=default\nbind h split-window -v\nbind v split-window -h' > "$XDG_CONFIG_HOME/tmux/tmux.conf"
            echo "Do you wish to remap tmux's prefix to C-['CHAR']? [y/N]" && read tmuxprefix
            [[ $tmuxprefix =~ '^[yY]' ]] && echo 'Enter a char:' && read tmuxbind
            [[ -n $tmuxbind ]] && echo "# remap prefix from C-b to C-$tmuxbind\nunbind C-b\nset-option -g prefix C-$tmuxbind\nbind-key C-$tmuxbind send-prefix" >> "$XDG_CONFIG_HOME/tmux/tmux.conf"
            unset tmuxprefix tmuxbind
          fi

          # mpv config
          if command -v celluloid >/dev/null && [[ ! -f "$XDG_CONFIG_HOME/celluloid/scripts/nextfile.lua" ]]; then
            command mkdir -p "$XDG_CONFIG_HOME/celluloid/scripts"
            curl -s 'https://raw.githubusercontent.com/N1vBruno/mpv-nextfile/master/nextfile.lua' -o "$XDG_CONFIG_HOME/celluloid/scripts/nextfile.lua"
          fi
          break;;

        No ) break;;
        Exit ) return;;
      esac
    done
  fi

  # Virt manager
  echo 'Do you wish to install Virt Manager?'
  select yne in 'Yes' 'No' 'Exit'; do
    case $yne in

      Yes )
        sh -c "${varsu} pacman -S --needed virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft"
        sh -c "${varsu} systemctl enable --now libvirtd; ${varsu} virsh net-autostart default"
        if [[ "$EUID" != 0 ]]; then
          [[ -z $(groups | grep libvirt) ]] && gpasswd -a $USER libvirt
          if ! grep -q "user = \"$USER\"" /etc/libvirt/qemu.conf; then
            echo "\nunix_sock_group = 'libvirt'\nunix_sock_rw_perms = '0770'" | sudo tee -a /etc/libvirt/libvirtd.conf >/dev/null
            echo "\nuser = \"$USER\"\ngroup = \"$USER\"" | sudo tee -a /etc/libvirt/qemu.conf >/dev/null
          fi
        else
          [[ -z $(groups bruno | grep libvirt) ]] && gpasswd -a bruno libvirt
          if ! grep -q bruno /etc/libvirt/qemu.conf; then
            echo "\nunix_sock_group = 'libvirt'\nunix_sock_rw_perms = '0770'" | tee -a /etc/libvirt/libvirtd.conf >/dev/null
            echo "\nuser = \"bruno\"\ngroup = \"bruno\"" | tee -a /etc/libvirt/qemu.conf >/dev/null
          fi
        fi
        break;;

      No ) break;;
      Exit ) return;;
    esac
  done

  # GNOME
  echo 'Do you wish to install and configure a basic GNOME or KDE Desktop?'
  select gke in 'GNOME' 'KDE' 'Exit'; do
    case $gke in

      GNOME )
        sh -c "${varsu} pacman -S --needed xdg-desktop-portal-gnome gnome-shell gnome-session gdm nautilus gnome-control-center evince file-roller baobab gnome-calculator gnome-characters gnome-disk-utility gnome-keyring gnome-system-monitor gvfs-mtp gnome-tweaks gnome-themes-extra ffmpegthumbnailer gnome-nibbles aisleriot quadrapassel gnome-taquin gnome-chess gnome-mines"
        sh -c "${varsu} sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=lock/' /etc/systemd/logind.conf"
        sh -c "echo \"[Unit]\nDescription=Changes Wallpapers\nStartLimitIntervalSec=3\nStartLimitBurst=5\n\n[Service]\nExecStart=/home/bruno/.local/share/backgrounds/chwp.sh\nRestart=always\nRestartSec=3\n\n[Install]\nWantedBy=default.target\" | ${varsu} tee /etc/systemd/user/chwp.service >/dev/null"
        sh -c "${varsu} chmod u+x /etc/systemd/user/chwp.service"
        sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

        if [[ "$EUID" != 0 ]]; then
          command mkdir -p "$XDG_DATA_HOME/backgrounds"
          [[ -f "$XDG_CONFIG_HOME/backgrounds/chwp.sh" ]] || curl -s 'https://gitlab.com/N1vBruno/dotfiles/-/raw/master/chwp.sh' -o "$XDG_DATA_HOME/backgrounds/chwp.sh"
          chmod +x "$XDG_DATA_HOME/backgrounds/chwp.sh"
          echo '#!/bin/env bash\ntvar=$(tmux list-sessions | grep main)\nif grep -q attached <<< "$tvar"; then\n  tmux neww -t main -c "$PWD"\nelif [[ -n "$tvar" ]]; then\n  tmux neww -t main; alacritty\nelse\n  alacritty\nfi' > "$XDG_DATA_HOME/nautilus/scripts/open-terminal-here"
          chmod +x "$XDG_DATA_HOME/nautilus/scripts/open-terminal-here"
          echo 'F4 open-terminal-here' > "$XDG_CONFIG_HOME/nautilus/scripts-accels"
          systemctl --user daemon-reload
          systemctl --user enable --now chwp.service
        fi
        break;;

      KDE )
        sh -c "${varsu} pacman -S --needed plasma-desktop sddm sddm-kcm plasma-wayland-session xdg-desktop-portal-kde qt5-wayland qt6-wayland bluedevil powerdevil breeze-gtk kde-gtk-config kdialog khotkeys kinfocenter kscreen kwallet-pam plasma-disks plasma-firewall plasma-nm plasma-pa dolphin-plugins ark filelight kcalc kcharselect gwenview qt5-imageformats ffmpegthumbs okular plasma-systemmonitor spectacle qt5-virtualkeyboard"
        echo "\n>>> Do you wish to install KDE Games?\n"
        sh -c "${varsu} pacman -S --needed bomber granatier kapman kblocks kfourinline kmines knavalbattle knetwalk kollision kpat ksnakeduel kspaceduel"
        [[ -f "/etc/sddm.conf.d/kde_settings.conf" ]] && sh -c "echo \"\nNumlock=on\nInputMethod=qtvirtualkeyboard\nCursorTheme=Breeze_Snow\" | ${varsu} tee -a /etc/sddm.conf.d/kde_settings.conf >/dev/null"
        [[ "$EUID" != 0 ]] && paru -S --needed haruna
        break;;

      Exit ) return;;
    esac
  done
  unset varsu
}
#------------------------------------------------------------------------------#
#################################### Prompt ####################################
#------------------------------------------------------------------------------#
# Custom prompt with a lot of stuff from Pure, Purification (based on Purity),
# Spaceship and various plugins - with Async!

# https://github.com/sindresorhus/pure
# https://github.com/Phantas0s/purification
# https://github.com/therealklanni/purity

# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
# terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line
  
prompt_preexec() {
  command_time_preexec
  prompt_set_title 'ignore-escape' "$PWD:t: $2"
}

prompt_precmd() {
  [[ -z $NEW_LINE_BEFORE_PROMPT ]] && NEW_LINE_BEFORE_PROMPT=1 || echo
  [[ ! -w . ]] && DIR_LOCK='%F{red}%f ' || unset DIR_LOCK
  prompt_set_title 'expand-prompt' '%~'
  command_time_precmd
}

prompt_async_loader() {
  async_init 2>/dev/null || return

  async_start_worker vbe_vcs_info
  async_register_callback vbe_vcs_info prompt_git_info_done

  async_start_worker vbe_vcs_status
  async_register_callback vbe_vcs_status prompt_git_status_done

  async_start_worker spaceship_stuff_loader
  async_register_callback spaceship_stuff_loader spaceship_stuff_done

  async_start_worker spaceship_battery_loader
  async_register_callback spaceship_battery_loader spaceship_battery_done

  precmd_functions+=(prompt_git_info_precmd prompt_git_status_precmd spaceship_precmd)
}

prompt_setup() {
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_precmd
  add-zsh-hook preexec prompt_preexec
  autoload -Uz vcs_info 
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' formats '%b'
  setopt prompt_subst
  prompt_async_loader
  autoload -Uz colors && colors

  PS1='$PROMPT_SSH%(!.%{$fg[red]%}%n %{$fg[white]%B%}in $DIR_LOCK%{$fg[yellow]%}%(4~|%-1~/.../%2~|%~)%u%b${vcs_info_msg}${vcs_status_msg} >%{$fg[yellow]%}>%B%(?.%{$fg[yellow]%}.%{$fg[red]%})>%b%f .%{$fg[green]%}%n %{$fg[white]%B%}in $DIR_LOCK%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b${vcs_info_msg}${vcs_status_msg} >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%b%f '
  RPS1='$spacejobs$spaceship_stuff_result$ELAPSED$spaceship_battery_result %246F%* %(?.%{$fg[green]%}✓%b%f.%{$fg[red]%}✗%b%f'
}
#------------------------------------------------------------------------------#
# Set terminal title
prompt_set_title() {
  setopt localoptions noshwordsplit

  # Emacs terminal does not support settings the title.
  (( ${+EMACS} || ${+INSIDE_EMACS} )) && return

  # Don't set title over serial console.
  case $TTY in
    /dev/ttyS[0-9]*) return;;
  esac

  # Show hostname if connected via SSH.
  local hostname=
  if [[ -n $PROMPT_SSH ]]; then
    # Expand in-place in case ignore-escape is used.
    hostname="${(%):-(%m) }"
  fi

  local -a opts
  case $1 in
    expand-prompt) opts=(-P);;
    ignore-escape) opts=(-r);;
  esac

  # Set title atomically in one print statement so that it works when XTRACE is enabled.
  print -n $opts $'\e]0;'${hostname}${2}$'\a'
}
#------------------------------------------------------------------------------#
# Elapsed and execution time display for commands in ZSH
# https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
command_time_preexec() {
  timer=$(date +%s%3N)
}

command_time_precmd() {
  if [[ $timer ]]; then
    local now=$(date +%s%3N)
    local d_ms=$(($now-$timer))
    local d_s=$((d_ms/1000))
    local ms=$((d_ms%1000))
    local s=$((d_s%60))
    local m=$(((d_s/60)%60))
    local h=$(((d_s/3600)%24))
    local d=$((d_s/86400))
    if ((d>0)); then ELAPSED=" %F{magenta}${d}d${h}h${m}m${s}s"
    elif ((h>0)); then ELAPSED=" %F{red}${h}h${m}m${s}s"
    elif ((m>0)); then ELAPSED=" %F{yellow}${m}m${s}s"
    elif ((s>9)); then ELAPSED=" %F{green}${s}s"
    elif ((s>0)); then ELAPSED=" %F{green}${s}.$((ms/100))s"
    else ELAPSED=" %F{cyan}${ms}ms"
    fi
    unset timer
  fi
}
#------------------------------------------------------------------------------#
# https://vincent.bernat.ch/en/blog/2019-zsh-async-vcs-info
# Display git info
prompt_git_info() {
  builtin cd -q "$1"
  local ZSH_THEME_GIT_PROMPT_PREFIX="$fg[white]%B on%b %242F:"
  local ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
  local ZSH_THEME_GIT_PROMPT_DIRTY=''
  local ZSH_THEME_GIT_PROMPT_CLEAN=''
  vcs_info
  [[ -z "$vcs_info_msg_0_" ]] || echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX$vcs_info_msg_0_$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

prompt_git_info_done() {
  local job="$1"
  local return_code="$2"
  local stdout="$3"
  local more="$6"
  if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
      # Need to restart the worker - https://github.com/mengelbrecht/slimline/blob/master/lib/async.zsh
      async_start_worker vbe_vcs_info
      async_register_callback vbe_vcs_info prompt_git_info_done
      return
    fi
  fi
  vcs_info_msg="$stdout"
  zle reset-prompt
}

prompt_git_info_precmd() {
  async_flush_jobs vbe_vcs_info
  async_job vbe_vcs_info prompt_git_info "$PWD"
}

# Display git status
prompt_git_status() {
  builtin cd -q "$1"
  local INDEX STATUS
  INDEX=$(command git status --porcelain -b 2>/dev/null)
  local ZSH_THEME_GIT_PROMPT_ADDED='%F{green}+%f'
  local ZSH_THEME_GIT_PROMPT_MODIFIED='%F{blue}%f'
  local ZSH_THEME_GIT_PROMPT_DELETED='%F{red}-%f'
  local ZSH_THEME_GIT_PROMPT_RENAMED='%F{magenta}➜%f'
  local ZSH_THEME_GIT_PROMPT_UNMERGED='%F{yellow}═%f'
  local ZSH_THEME_GIT_PROMPT_UNTRACKED='%218F?%f'
  local ZSH_THEME_GIT_PROMPT_STASHED='%B%F{cyan}≡%f%b'
  local ZSH_THEME_GIT_PROMPT_BEHIND='%B%F{red}%f%b'
  local ZSH_THEME_GIT_PROMPT_AHEAD='%B%F{green}%f%b'

  if $(grep -qE '^\?\? ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi

  if $(grep -q '^A  ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(grep -q '^M  ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(grep -q '^MM ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi

  if $(grep -q '^ M ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(grep -q '^AM ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(grep -q '^MM ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(grep -q '^ T ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi

  if $(grep -q '^R  ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi

  if $(grep -q '^ D ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(grep -q '^D  ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(grep -q '^AD ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi

  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi

  if $(grep -q '^UU ' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi

  if $(grep -q '^## [^ ]\+ .*ahead' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi

  if $(grep -q '^## [^ ]\+ .*behind' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi

  if $(grep -q '^## [^ ]\+ .*diverged' <<< "$INDEX"); then
    STATUS=" $ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi

  if [[ -n "$STATUS" ]]; then
    echo -n "$STATUS"
  fi
}

prompt_git_status_done() {
  local job="$1"
  local return_code="$2"
  local stdout="$3"
  local more="$6"
  if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
      async_start_worker vbe_vcs_status
      async_register_callback vbe_vcs_status prompt_git_status_done
      return
    fi
  fi
  vcs_status_msg="$stdout"
  zle reset-prompt
}

prompt_git_status_precmd() {
  async_flush_jobs vbe_vcs_status
  async_job vbe_vcs_status prompt_git_status "$PWD"
}
#------------------------------------------------------------------------------#
# SSH
# https://github.com/agkozak/agkozak-zsh-prompt/blob/master/agkozak-zsh-prompt.plugin.zsh
[[ -n ${SSH_CONNECTION-}${SSH_CLIENT-}${SSH_TTY-} ]] && PROMPT_SSH="%F{yellow}${(%):-%m}%}ː%b%f" || unset PROMPT_SSH
#------------------------------------------------------------------------------#
# Some stuff borrowed from Spaceship
# Updated in 2022.12.07
spaceship_stuff() {
  builtin cd -q "$1"
  setopt extended_glob
  VIRTUAL_ENV_DISABLE_PROMPT=true
  local SPACESHIP_PROMPT_DEFAULT_PREFIX=' '
  local SPACESHIP_PROMPT_DEFAULT_SUFFIX='%f%b'
  local SS_LIST=(asdf hg package node bun deno ruby python elm elixir xcode swift golang perl php rust haskell scala kotlin java lua dart julia crystal docker docker_compose aws gcloud venv conda dotnet ocaml vlang zig purescript erlang kubectl ansible terraform pulumi ibmcloud nix_shell gnu_screen ember flutter gradle maven)
  for i in "$SS_LIST[@]"; do
    local SP="$(spaceship_$i)"
    [[ -n "$SP" ]] && echo -n "$SP"
  done
}

spaceship_stuff_done() {
  local job="$1"
  local return_code="$2"
  local stdout="$3"
  local more="$6"
  if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
      async_start_worker spaceship_stuff_loader
      async_register_callback spaceship_stuff_loader spaceship_stuff_done
      return
    fi
  fi
  spaceship_stuff_result="$stdout"
  zle reset-prompt
}

spaceship_precmd() {
  async_flush_jobs spacship_stuff_loader
  async_flush_jobs spacship_battery_loader
  async_job spaceship_stuff_loader spaceship_stuff "$PWD"
  async_job spaceship_battery_loader spaceship_battery "$PWD"
  spacejobs="$(spaceship_jobs)"
}

spaceship_battery_done() {
  local job="$1"
  local return_code="$2"
  local stdout="$3"
  local more="$6"
  if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
      async_start_worker spaceship_battery_loader
      async_register_callback spaceship_battery_loader spaceship_battery_done
      return
    fi
  fi
  spaceship_battery_result="$stdout"
  zle reset-prompt
}

# Utils
# https://github.com/spaceship-prompt/spaceship-prompt/blob/master/lib/utils.zsh
spaceship::exists() { command -v $1 >/dev/null 2>&1 }

spaceship::upsearch() {
  zparseopts -E -D \
    s=silent -silent=silent

  local files=("$@")
  local root="$(pwd -P)"

  while [ "$root" ]; do
    for file in "${files[@]}"; do
      local filepath="$root/$file"
      if [[ -e "$filepath" ]]; then
        [[ -z "$silent" ]] && echo "$filepath"
        return 0
      fi
    done
    if [[ -d "$root/.git" || -d "$root/.hg" ]]; then
      return 1
    fi
    root="${root%/*}"
  done
  return 1
}

spaceship::datafile() {
  zparseopts -E -D \
    -json=json \
    -yaml=yaml \
    -toml=toml \
    -xml=xml

  local file="$1" key="$2"

  if [[ -n "$yaml" ]]; then
    if spaceship::exists yq; then
      yq -r ".$key" "$file"
    elif spaceship::exists ruby; then
      ruby -r yaml -e "puts '$key'.split('.').reduce(YAML::load_file('$file')) { |obj, key| obj[key] }" 2>/dev/null
    elif spaceship::exists python3; then
      python3 -c "import yaml, functools; print(functools.reduce(lambda obj, key: obj[key] if key else obj, '$key'.split('.'), yaml.safe_load(open('$file'))))" 2>/dev/null
    else
      return 1
    fi
  fi

  if [[ -n "$json" ]]; then
    if spaceship::exists jq; then
      jq -r ".$key" "$file" 2>/dev/null
    elif spaceship::exists yq; then
      yq -r ".$key" "$file" 2>/dev/null
    elif spaceship::exists ruby; then
      ruby -r json -e "puts '$key'.split('.').reduce(JSON::load(File.read('$file'))){ |obj, key| obj[key] }" 2>/dev/null
    elif spaceship::exists python3; then
      python3 -c "import json, functools; print(functools.reduce(lambda obj, key: obj[key] if key else obj, '$key'.split('.'), json.load(open('$file'))))" 2>/dev/null
    elif spaceship::exists node; then
      node -p "require('./$file').$key" 2>/dev/null
    else
      return 1
    fi
  fi

  if [[ -n "$toml" ]]; then
    if spaceship::exists tomlq; then
      tomlq -r ".$key" "$file"
    else
      return 1
    fi
  fi

  if [[ -n "$xml" ]]; then
    if spaceship::exists xq; then
      xq -r ".$key" "$file"
    else
      return 1
    fi
  fi

  return 1
}
#------------------------------------------------------------------------------#
# asdf-prompt plugin for zsh/oh-my-zsh
# Updated 2022.11.05
# https://github.com/CurryEleison/zsh-asdf-prompt
spaceship_asdf() {
  local ZSH_THEME_ASDF_PROMPT_PREFIX="%{$fg_bold[magenta]%}{"
  local ZSH_THEME_ASDF_PROMPT_POSTFIX="}%{$reset_color%} "
  local ZSH_THEME_ASDF_PROMPT_FILTER='COMPACT'
  local ZSH_THEME_ASDF_PROMPT_VERSION_DETAIL='MINOR'
  local ZSH_THEME_ASDF_PROMPT_VERSION_RESOLUTION='NONE'

  # If asdf isn't present nothing to do
  (( ${+commands[asdf]} )) || return 0
  local currenttools=$(asdf current 2>/dev/null)
  local toolvers_fname=${ASDF_DEFAULT_TOOL_VERSIONS_FILENAME-.tool-versions}
  # Decide how we filter what is shown
  if [[ $ZSH_THEME_ASDF_PROMPT_FILTER != "ALL" ]]; then
    currenttools=$(echo $currenttools | grep -v ' system ' -)
  fi
  if [[ -z "${ZSH_THEME_ASDF_PROMPT_FILTER// }" \
      || $ZSH_THEME_ASDF_PROMPT_FILTER == "COMPACT" ]]; then
    currenttools=$(echo $currenttools | grep -v "$HOME/$toolvers_fname" -)
  fi

  # Decide if anything is left to process and return if not.
  [[ -z "${currenttools// }" ]] && return
 
  local toolslist=$(echo $currenttools | awk '{ print $1 }')
  local versionslist
  # Decide if we do semi-major version (default) or full version info
  if [[ $ZSH_THEME_ASDF_PROMPT_VERSION_DETAIL == "PATCH" ]]; then
    versionslist=$(echo $currenttools | awk '{ print $2 }' - )
  elif [[ $ZSH_THEME_ASDF_PROMPT_VERSION_DETAIL == "MAJOR" ]]; then
    versionslist=$(echo $currenttools | awk '{ print $2 }' - \
      | sed -E 's/([^\.]*)(\.[^\.]*)(\..*)/\1/g'  \
      | sed 's/system/s/g' )
  else
    versionslist=$(echo $currenttools | awk '{ print $2 }' - \
      | sed -E 's/([^\.]*)(\.[^\.]*)(\..*)/\1\2/g'  \
      | sed 's/system/sys/g' )
  fi
  # Decide if we want to print out origins or not (default)
  local originslist
  if [[ $ZSH_THEME_ASDF_PROMPT_VERSION_RESOLUTION == "COMPACT" ]]; then
    originslist=$(echo $currenttools \
      | awk '{ $1=$2=""; print $0 }' \
      | sed 's/^ *//g' \
      | sed -E 's#ASDF_.*VERSION#\$#' \
      | sed -E "s#$HOME\/*($toolvers_fname|\.[^\/]+)\$#\~#" \
      | sed -E "s#$PWD\/*($toolvers_fname|\.[^\/]+)\$#\.#" \
      | sed -E "s#($HOME\/.+)#\/#" )
  else
    originslist=$(echo $currenttools | awk '{ print ""}' -)
  fi
  # Paste columns together  
  local reassembled=$(paste  <(echo $toolslist) <(echo $versionslist) \
    <(echo $originslist))
  # Structure info in nice, separate lines
  local multilinesummary=$(echo $reassembled \
    | awk '{ print $1 ": " $2 $3 }' - )
  # If more than one line, scrunch them up
  local asdfsummary=$( [[ $( echo $multilinesummary | wc -l ) -le 1 ]] \
    && echo $multilinesummary \
    || (echo $multilinesummary | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/, /g'))

  # Oddly formatted to avoid spurious spaces
  echo -n "${ZSH_THEME_ASDF_PROMPT_PREFIX-\{}"\
  "${asdfsummary}${ZSH_THEME_ASDF_PROMPT_POSTFIX-\}}"
}
#------------------------------------------------------------------------------#
# https://github.com/spaceship-prompt/spaceship-prompt/tree/master/sections
# https://www.nerdfonts.com/cheat-sheet

# Ansible is a suite of software tools that enables infrastructure as code.
spaceship_ansible() {
  local SPACESHIP_ANSIBLE_SHOW="${SPACESHIP_ANSIBLE_SHOW=true}"
  local SPACESHIP_ANSIBLE_PREFIX="${SPACESHIP_ANSIBLE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_ANSIBLE_SUFFIX="${SPACESHIP_ANSIBLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_ANSIBLE_SYMBOL="${SPACESHIP_ANSIBLE_SYMBOL="🅐 "}"
  local SPACESHIP_ANSIBLE_COLOR="${SPACESHIP_ANSIBLE_COLOR="%F{white}"}"
  [[ $SPACESHIP_ANSIBLE_SHOW == false ]] && return

  # Check if ansible is installed
  spaceship::exists ansible || return

  # Show ansible section only when there are ansible-specific files in current
  # working directory.
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # https://zsh.sourceforge.net/Doc/Release/Expansion.html
  local ansible_configs="$(spaceship::upsearch ansible.cfg .ansible.cfg)"
  local yaml_files="$(echo ?(*.yml|*.yaml)([1]N^/))"
  local detected_playbooks

  if [[ -n "$yaml_files" ]]; then
    detected_playbooks="$(grep --color=never -oE "tasks|hosts|roles" $yaml_files)"
  fi

  [[ -n "$ansible_configs" || -n "$detected_playbooks" ]] || return

  # Retrieve ansible version
  local ansible_version=$(ansible --version | head -1 | grep --color=never -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)')

  # Display ansible section
  echo -n "$SPACESHIP_ANSIBLE_COLOR$SPACESHIP_ANSIBLE_PREFIX${SPACESHIP_ANSIBLE_SYMBOL}v$ansible_version$SPACESHIP_ANSIBLE_SUFFIX"
}

# Amazon Web Services (AWS)
spaceship_aws() {
  local SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW=true}"
  local SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="using "}"
  local SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL=" "}"
  local SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="%208F"}"

  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  local profile=${AWS_VAULT:-$AWS_PROFILE}

  # Is the current profile not the default profile
  [[ -z $profile ]] || [[ "$profile" == "default" ]] && return

  # Show prompt section
  echo -n "$SPACESHIP_AWS_COLOR$SPACESHIP_AWS_PREFIX${SPACESHIP_AWS_SYMBOL}${profile}$SPACESHIP_AWS_SUFFIX"
}

# Battery
# ------------------------------------------------------------------------------
# | SPACESHIP_BATTERY_SHOW | below threshold | above threshold | fully charged |
# |------------------------+-----------------+-----------------+---------------|
# | false                  | hidden          | hidden          | hidden        |
# | always                 | shown           | shown           | shown         |
# | true                   | shown           | hidden          | hidden        |
# | charged                | shown           | shown (charging)| shown         |
# ------------------------------------------------------------------------------
spaceship_battery() {
  local SPACESHIP_BATTERY_SHOW="${SPACESHIP_BATTERY_SHOW=charged}"
  local SPACESHIP_BATTERY_PREFIX="${SPACESHIP_BATTERY_PREFIX=" "}"
  local SPACESHIP_BATTERY_SUFFIX="${SPACESHIP_BATTERY_SUFFIX="%f%b"}"
  local SPACESHIP_BATTERY_SYMBOL_CHARGING="${SPACESHIP_BATTERY_SYMBOL_CHARGING="⇡"}"
  local SPACESHIP_BATTERY_SYMBOL_DISCHARGING="${SPACESHIP_BATTERY_SYMBOL_DISCHARGING="⇣"}"
  local SPACESHIP_BATTERY_SYMBOL_FULL="${SPACESHIP_BATTERY_SYMBOL_FULL="•"}"
  local SPACESHIP_BATTERY_THRESHOLD="${SPACESHIP_BATTERY_THRESHOLD=30}"

  [[ $SPACESHIP_BATTERY_SHOW == false ]] && return

  local battery_data battery_percent battery_status battery_color

  if spaceship::exists upower; then
    local battery=$(command upower -e | grep battery | head -1)
    # Return if no battery
    [[ -z $battery ]] && return

    battery_data=$(upower -i $battery)
    battery_percent="$( echo "$battery_data" | grep percentage | awk '{print $2}' )"
    battery_status="$( echo "$battery_data" | grep state | awk '{print $2}' )"
  elif spaceship::exists pmset; then
    battery_data=$(pmset -g batt | grep "InternalBattery")

    # Return if no internal battery
    [[ -z "$battery_data" ]] && return

    # Colored output from pmset will break prompt if grep is aliased to show colors
    battery_percent="$( echo $battery_data | \grep -oE '[0-9]{1,3}%' )"
    battery_status="$( echo $battery_data | awk -F '; *' '{ print $2 }' )"
  elif spaceship::exists acpi; then
    battery_data=$(acpi -b 2>/dev/null | head -1)

    # Return if no battery
    [[ -z $battery_data ]] && return

    battery_status_and_percent="$(echo $battery_data | sed 's/Battery [0-9]*: \(.*\), \([0-9]*\)%.*/\1:\2/')"
    battery_status_and_percent_array=("${(@s/:/)battery_status_and_percent}")
    battery_status=$battery_status_and_percent_array[1]:l
    battery_percent=$battery_status_and_percent_array[2]

  # If battery is 0% charge, battery likely doesn't exist.
    [[ $battery_percent == "0" ]] && return

  else
    return
  fi

  # Remove trailing % and symbols for comparison
  battery_percent="$(echo $battery_percent | tr -d '%[,;]')"

  # Change color based on battery percentage
  if [[ $battery_percent == 100 || $battery_status =~ "(charged|full)" ]]; then
    battery_color="%F{blue}"
  elif [[ $battery_percent > 49 ]]; then
    battery_color="%F{green}"
  elif [[ $battery_percent -lt $SPACESHIP_BATTERY_THRESHOLD ]]; then
    battery_color="%F{red}"
  else
    battery_color="%F{yellow}"
  fi

  # Battery indicator based on current status of battery
  if [[ $battery_status == "charging" ]]; then
    battery_symbol="${SPACESHIP_BATTERY_SYMBOL_CHARGING}"
  elif [[ $battery_status =~ "^[dD]ischarg.*" ]]; then
    battery_symbol="${SPACESHIP_BATTERY_SYMBOL_DISCHARGING}"
  else
    battery_symbol="${SPACESHIP_BATTERY_SYMBOL_FULL}"
  fi

  # Escape % for display since it's a special character in Zsh prompt expansion
  if [[ $SPACESHIP_BATTERY_SHOW == 'always' ||
        $battery_percent -lt $SPACESHIP_BATTERY_THRESHOLD ||
        $SPACESHIP_BATTERY_SHOW == 'charged' && $battery_status =~ '(^charging|charged|full)' ]]; then
  echo -n "$battery_color$SPACESHIP_BATTERY_PREFIX$battery_symbol${battery_percent}%%$SPACESHIP_BATTERY_SUFFIX"
  fi
}

# Bun is a fast all-in-one JavaScript Runtime
spaceship_bun() {
  local SPACESHIP_BUN_SHOW="${SPACESHIP_BUN_SHOW=true}"
  local SPACESHIP_BUN_PREFIX="${SPACESHIP_BUN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_BUN_SUFFIX="${SPACESHIP_BUN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_BUN_SYMBOL="${SPACESHIP_BUN_SYMBOL="🍞 "}"
  local SPACESHIP_BUN_COLOR="${SPACESHIP_BUN_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_BUN_SHOW == false ]] && return

  # Find Bun binary
  spaceship::exists bun || return

  # Find Bun-specific files or return
  spaceship::upsearch -s bun.lockb bunfig.toml || return

  # Get Bun version
  local bun_version=$(bun --version)

  echo -n "$SPACESHIP_BUN_COLOR$SPACESHIP_BUN_PREFIX${SPACESHIP_BUN_SYMBOL}v$bun_version$SPACESHIP_BUN_SUFFIX"
}

# Crystal is a programming that aimes to be "fast as C, slick as Ruby."
spaceship_crystal() {
  local SPACESHIP_CRYSTAL_SHOW="${SPACESHIP_CRYSTAL_SHOW=true}"
  local SPACESHIP_CRYSTAL_PREFIX="${SPACESHIP_CRYSTAL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_CRYSTAL_SUFFIX="${SPACESHIP_CRYSTAL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_CRYSTAL_SYMBOL="${SPACESHIP_CRYSTAL_SYMBOL=" "}"
  local SPACESHIP_CRYSTAL_COLOR="${SPACESHIP_CRYSTAL_COLOR=%069F}"

  [[ $SPACESHIP_CRYSTAL_SHOW == false ]] && return

  # Return when crystal is not installed
  spaceship::exists crystal || return

  # If we are in a Crystal-specific project
  local is_crystal_project="$(spaceship::upsearch shard.yml)"
  [[ -n "$is_crystal_project" || -n *.cr(#qN^/) ]] || return

  local crystal_version=$(crystal --version | awk '/Crystal*/ {print $2}')

  echo -n "$SPACESHIP_CRYSTAL_COLOR$SPACESHIP_CRYSTAL_PREFIX${SPACESHIP_CRYSTAL_SYMBOL}v$crystal_version$SPACESHIP_CRYSTAL_SUFFIX"
}

# Conda - Package, dependency and environment management for any language
spaceship_conda() {
  local SPACESHIP_CONDA_SHOW="${SPACESHIP_CONDA_SHOW=true}"
  local SPACESHIP_CONDA_PREFIX="${SPACESHIP_CONDA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_CONDA_SUFFIX="${SPACESHIP_CONDA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_CONDA_SYMBOL="${SPACESHIP_CONDA_SYMBOL="🅒  "}"
  local SPACESHIP_CONDA_COLOR="${SPACESHIP_CONDA_COLOR="%F{blue}"}"
  local SPACESHIP_CONDA_VERBOSE="${SPACESHIP_CONDA_VERBOSE=true}"

  [[ $SPACESHIP_CONDA_SHOW == false ]] && return

  # Check if running via conda virtualenv
  spaceship::exists conda && [ -n "$CONDA_DEFAULT_ENV" ] || return

  local conda_env=${CONDA_DEFAULT_ENV}

  if [[ $SPACESHIP_CONDA_VERBOSE == false ]]; then
    conda_env=${CONDA_DEFAULT_ENV:t}
  fi

  echo -n "$SPACESHIP_CONDA_COLOR$SPACESHIP_CONDA_PREFIX${SPACESHIP_CONDA_SYMBOL}${conda_env}$SPACESHIP_CONDA_SUFFIX"
}

# Dart is a client-optimized language for fast apps on any platform
spaceship_dart() {
  local SPACESHIP_DART_SHOW="${SPACESHIP_DART_SHOW=true}"
  local SPACESHIP_DART_PREFIX="${SPACESHIP_DART_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_DART_SUFFIX="${SPACESHIP_DART_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_DART_SYMBOL="${SPACESHIP_DART_SYMBOL=" "}"
  local SPACESHIP_DART_COLOR="${SPACESHIP_DART_COLOR="%F{blue}"}"

  [[ $SPACESHIP_DART_SHOW == false ]] && return
  spaceship::exists dart || return

  local is_dart_project="$(spaceship::upsearch pubspec.yaml pubspec.yml pubspec.lock dart_tool)"
  [[ -n "$is_dart_project" || -n *.dart(#qN^/) ]] || return

  # The Dart binary can be installed directly as 'dart-sdk' or as bundle via Flutter
  # The version can have the following patterns:
  # dart-sdk >       Dart SDK version: 2.19.0-edge.efb509c114dcaf54d0a011f717b48893d71ec9c3 (be) (Thu Sep 29 01:58:56 2022 +0000) on "macos_x64"
  # flutter bundle > Dart SDK version: 2.18.1 (stable) (Tue Sep 13 11:42:55 2022 +0200) on "macos_x64"
  local dart_version=$(dart --version | awk '{sub(/-.*/, "", $4); print $4}')

  echo -n "$SPACESHIP_DART_COLOR$SPACESHIP_DART_PREFIX${SPACESHIP_DART_SYMBOL}v${dart_version}$SPACESHIP_DART_SUFFIX"
}

# Deno is a secure runtime for JavaScript and TypeScript.
spaceship_deno() {
  local SPACESHIP_DENO_SHOW="${SPACESHIP_DENO_SHOW=true}"
  local SPACESHIP_DENO_PREFIX="${SPACESHIP_DENO_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_DENO_SUFFIX="${SPACESHIP_DENO_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_DENO_SYMBOL="${SPACESHIP_DENO_SYMBOL="🦕 "}"
  local SPACESHIP_DENO_DEFAULT_VERSION="${SPACESHIP_DENO_DEFAULT_VERSION=""}"
  local SPACESHIP_DENO_COLOR="${SPACESHIP_DENO_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_DENO_SHOW == false ]] && return

  # Return when deno is not installed
  spaceship::exists deno || return

  # Show Deno status only for Deno-specific folders
  local is_deno_project="$(spaceship::upsearch deno.json deno.jsonc)"
  [[ -n "$is_deno_project" || -n {mod,dep,main,cli}.ts(#qN^/) ]] || return

  local deno_version=$(deno --version 2>/dev/null | head -1 | cut -d ' ' -f2)

  [[ "$deno_version" == "$SPACESHIP_DENO_DEFAULT_VERSION" ]] && return

  echo -n "$SPACESHIP_DENO_COLOR$SPACESHIP_DENO_PREFIX${SPACESHIP_DENO_SYMBOL}v$deno_version$SPACESHIP_DENO_SUFFIX"
}

# Docker automates the repetitive tasks of setting up development environments
spaceship_docker() {
  local SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW=true}"
  local SPACESHIP_DOCKER_PREFIX="${SPACESHIP_DOCKER_PREFIX="on "}"
  local SPACESHIP_DOCKER_SUFFIX="${SPACESHIP_DOCKER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR="%F{cyan}"}"
  local SPACESHIP_DOCKER_SYMBOL="${SPACESHIP_DOCKER_SYMBOL=" "}"
  local SPACESHIP_DOCKER_VERBOSE="${SPACESHIP_DOCKER_VERBOSE=false}"

  [[ $SPACESHIP_DOCKER_SHOW == false ]] && return

  spaceship::exists docker || return

  # Better support for docker environment vars: https://docs.docker.com/compose/reference/envvars/
  if [[ -n "$COMPOSE_FILE" ]]; then
    local compose_path
    # Use COMPOSE_PATH_SEPARATOR or colon as default
    local separator=${COMPOSE_PATH_SEPARATOR:-":"}
    # COMPOSE_FILE may have several filenames separated by colon, upsearch all of them
    local filenames=("${(@ps/$separator/)COMPOSE_FILE}")
    local compose_path="$(spaceship::upsearch -s $filenames)"

    # Must return if COMPOSE_FILE is present but invalid
    [[ -n "$compose_path" ]] || return
  fi

  local docker_context="$(spaceship_docker_context)"
  local docker_context_section="$(spaceship::section::render $docker_context)"

  # Show Docker status only for Docker-specific folders or when connected to external host
  local docker_project_globs=('Dockerfile' '.devcontainer/Dockerfile' 'docker-compose.y*ml')
  local is_docker_project="$(spaceship::upsearch Dockerfile $docker_project_globs)"
  [[ -n "$is_docker_project" || -f /.dockerenv || -n "$docker_context" ]] || return

  # if docker daemon isn't running you'll get an error saying it can't connect
  # Note: Declaration and assignment is separated for correctly getting the exit code
  local docker_version=$(docker version -f "{{.Server.Version}}" 2>/dev/null)
  [[ $? -ne 0 || -z $docker_version ]] && return

  [[ $SPACESHIP_DOCKER_VERBOSE == false ]] && docker_version=${docker_version%-*}

  echo -n "$SPACESHIP_DOCKER_COLOR$SPACESHIP_DOCKER_PREFIX${SPACESHIP_DOCKER_SYMBOL}v${docker_version}${docker_context_section}$SPACESHIP_DOCKER_SUFFIX"
}

# Docker Context
spaceship_docker_context() {
  local SPACESHIP_DOCKER_CONTEXT_SHOW="${SPACESHIP_DOCKER_CONTEXT_SHOW=true}"
  local SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR="%F{cyan}"}"
  local SPACESHIP_DOCKER_CONTEXT_PREFIX="${SPACESHIP_DOCKER_CONTEXT_PREFIX=" ("}"
  local SPACESHIP_DOCKER_CONTEXT_SUFFIX="${SPACESHIP_DOCKER_CONTEXT_SUFFIX=")"}"

  [[ $SPACESHIP_DOCKER_CONTEXT_SHOW == false ]] && return

  local docker_remote_context

  # Docker has three different ways to work on remote Docker hosts:
  #  1. docker-machine
  #  2. DOCKER_HOST environment variable
  #  3. docker context (since Docker 19.03)
  if [[ -n $DOCKER_MACHINE_NAME ]]; then
    docker_remote_context="$DOCKER_MACHINE_NAME"
  elif [[ -n $DOCKER_HOST ]]; then
    # Remove protocol (tcp://) and port number from displayed Docker host
    docker_remote_context="$(basename $DOCKER_HOST | cut -d ':' -f1)"
  else
    # Docker contexts can be set using either the DOCKER_CONTEXT environment variable
    # or the `docker context use` command. `docker context ls` will show the selected
    # context in both cases. But we are not interested in the local "default" context.
    docker_remote_context=$(docker context ls --format '{{if .Current}}{{if and (ne .Name "default") (ne .Name "desktop-linux") (ne .Name "colima")}}{{.Name}}{{end}}{{end}}' 2>/dev/null)
    [[ $? -ne 0 ]] && return

    docker_remote_context=$(echo $docker_remote_context | tr -d '\n')
  fi

  [[ -z $docker_remote_context ]] && return

  echo -n "$SPACESHIP_DOCKER_COLOR$SPACESHIP_DOCKER_CONTEXT_PREFIX${docker_remote_context}$SPACESHIP_DOCKER_CONTEXT_SUFFIX"
}

# Docker Compose - a tool for defining and running multi-container Docker applications.
spaceship_docker_compose() {
  local SPACESHIP_DOCKER_COMPOSE_SHOW="${SPACESHIP_DOCKER_COMPOSE_SHOW=true}"
  local SPACESHIP_DOCKER_COMPOSE_PREFIX="${SPACESHIP_DOCKER_COMPOSE_PREFIX="runs "}"
  local SPACESHIP_DOCKER_COMPOSE_SUFFIX="${SPACESHIP_DOCKER_COMPOSE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_DOCKER_COMPOSE_SYMBOL="${SPACESHIP_DOCKER_COMPOSE_SYMBOL=" "}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR="${SPACESHIP_DOCKER_COMPOSE_COLOR="%F{cyan}"}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR_UP="${SPACESHIP_DOCKER_COMPOSE_COLOR_UP="%F{green}"}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN="${SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN="#F{red}"}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED="${SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED="%F{yellow}"}"
  [[ $SPACESHIP_DOCKER_COMPOSE_SHOW == false ]] && return

  spaceship::exists docker-compose || return
  spaceship::upsearch -s 'docker-compose.y*ml' || return

  local containers="$(docker-compose ps 2>/dev/null | tail -n+2)"
  [[ -n "$containers" ]] || return

  spaceship_docker_compose::paint() {
    local color="$1" text="$2"
    echo -n "%{%F{$color}%}$text%{%f%}"
  }

  local statuses=""

  while IFS= read -r line; do
    local letter_position=$(echo $line | awk 'match($0,"_"){print RSTART}')
    local letter=$(echo ${line:$letter:1} | tr '[:lower:]' '[:upper:]')
    local color=""
    [[ -z "$letter" ]] && continue

    if [[ "$line" == *"Up"* ]] || [[ "$line" == *"running"* ]]; then
      color="$SPACESHIP_DOCKER_COMPOSE_COLOR_UP"
    elif [[ "$line" == *"Paused"* ]] || [[ "$line" == *"paused"* ]]; then
      color="$SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED"
    else
      color="$SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN"
    fi

    statuses+="$(spaceship_docker_compose::paint $color $letter)"
  done <<< "$containers"

  echo -n "$SPACESHIP_DOCKER_COMPOSE_COLOR$SPACESHIP_DOCKER_COMPOSE_PREFIX$SPACESHIP_DOCKER_COMPOSE_SYMBOL$statuses$SPACESHIP_DOCKER_COMPOSE_SUFFIX"
}

# .NET Framework is a software framework developed by Microsoft
spaceship_dotnet() {
  local SPACESHIP_DOTNET_SHOW="${SPACESHIP_DOTNET_SHOW=true}"
  local SPACESHIP_DOTNET_PREFIX="${SPACESHIP_DOTNET_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_DOTNET_SUFFIX="${SPACESHIP_DOTNET_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_DOTNET_SYMBOL="${SPACESHIP_DOTNET_SYMBOL=" "}"
  local SPACESHIP_DOTNET_COLOR="${SPACESHIP_DOTNET_COLOR="%128F"}"

  [[ $SPACESHIP_DOTNET_SHOW == false ]] && return

  spaceship::exists dotnet || return

  local is_dotnet_project="$(spaceship::upsearch project.json global.json paket.dependencies)"
  [[ -n "$is_dotnet_project" || -n *.(cs|fs|x)proj(#qN^/) || -n *.sln(#qN^/) ]] || return

  # dotnet-cli automatically handles SDK pinning (specified in a global.json file)
  # therefore, this already returns the expected version for the current directory
  local dotnet_version # separate declaration so we have access to the exit code
  dotnet_version=$(dotnet --version 2>/dev/null)

  # `dotnet --version` exits with a non-zero exit code
  # when the version defined in global.json is not installed.
  [[ $? -eq 0 ]] || return

  echo -n "$SPACESHIP_DOTNET_COLOR$SPACESHIP_DOTNET_PREFIX${SPACESHIP_DOTNET_SYMBOL}${dotnet_version}$SPACESHIP_DOTNET_SUFFIX"
}

# Elixir is a dynamic, functional language designed for building scalable applications
spaceship_elixir() {
  local SPACESHIP_ELIXIR_SHOW="${SPACESHIP_ELIXIR_SHOW=true}"
  local SPACESHIP_ELIXIR_PREFIX="${SPACESHIP_ELIXIR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_ELIXIR_SUFFIX="${SPACESHIP_ELIXIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_ELIXIR_SYMBOL="${SPACESHIP_ELIXIR_SYMBOL=" "}"
  local SPACESHIP_ELIXIR_DEFAULT_VERSION="${SPACESHIP_ELIXIR_DEFAULT_VERSION=""}"
  local SPACESHIP_ELIXIR_COLOR="${SPACESHIP_ELIXIR_COLOR="%F{magenta}"}"

  [[ $SPACESHIP_ELIXIR_SHOW == false ]] && return

  # Show versions only for Elixir-specific folders
  [[ -f mix.exs || -n *.ex(#qN^/) || -n *.exs(#qN^/) ]] || return

  local elixir_version

  if spaceship::exists kiex; then
    elixir_version="${ELIXIR_VERSION}"
  elif spaceship::exists exenv; then
    elixir_version=$(exenv version-name)
  elif spaceship::exists asdf; then
    elixir_version=${$(asdf current elixir)[2]}
  fi

  if [[ $elixir_version == "" ]]; then
    spaceship::exists elixir || return
    elixir_version=$(elixir -v 2>/dev/null | command grep "Elixir" --color=never | cut -d ' ' -f 2)
  fi

  [[ $elixir_version == "system" ]] && return
  [[ $elixir_version == $SPACESHIP_ELIXIR_DEFAULT_VERSION ]] && return

  # Add 'v' before elixir version that starts with a number
  [[ "${elixir_version}" =~ ^[0-9].+$ ]] && elixir_version="v${elixir_version}"

  echo -n "$SPACESHIP_ELIXIR_COLOR$SPACESHIP_ELIXIR_PREFIX${SPACESHIP_ELIXIR_SYMBOL}${elixir_version}$SPACESHIP_ELIXIR_SUFFIX"
}

# Elm is a delightful language for reliable webapps
spaceship_elm() {
  local SPACESHIP_ELM_SHOW="${SPACESHIP_ELM_SHOW=true}"
  local SPACESHIP_ELM_PREFIX="${SPACESHIP_ELM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_ELM_SUFFIX="${SPACESHIP_ELM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_ELM_SYMBOL="${SPACESHIP_ELM_SYMBOL=" "}"
  local SPACESHIP_ELM_COLOR="${SPACESHIP_ELM_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_ELM_SHOW == false ]] && return

  spaceship::exists elm || return

  local is_elm_project="$(spaceship::upsearch elm.json elm-package.json elm-stuff)"
  [[ -n "$is_elm_project" || -n *.elm(#qN^/) ]] || return

  local elm_version=$(elm --version 2>/dev/null)

  echo -n "$SPACESHIP_ELM_COLOR$SPACESHIP_ELM_PREFIX${SPACESHIP_ELM_SYMBOL}v${elm_version}$SPACESHIP_ELM_SUFFIX"
}

# Ember.js is an open-source JavaScript web framework, based on the MVVM pattern
spaceship_ember() {
  local SPACESHIP_EMBER_SHOW="${SPACESHIP_EMBER_SHOW=true}"
  local SPACESHIP_EMBER_PREFIX="${SPACESHIP_EMBER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_EMBER_SUFFIX="${SPACESHIP_EMBER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_EMBER_SYMBOL="${SPACESHIP_EMBER_SYMBOL=" "}"
  local SPACESHIP_EMBER_COLOR="${SPACESHIP_EMBER_COLOR="%210F"}"

  [[ $SPACESHIP_EMBER_SHOW == false ]] && return

  # Show EMBER status only for folders w/ ember-cli-build.js files
  [[ -f ember-cli-build.js && -f node_modules/ember-cli/package.json ]] || return

  local ember_version=$(grep '"version":' ./node_modules/ember-cli/package.json | cut -d\" -f4)
  [[ $ember_version == "system" || $ember_version == "ember" ]] && return

  echo -n "$SPACESHIP_EMBER_COLOR$SPACESHIP_EMBER_PREFIX${SPACESHIP_EMBER_SYMBOL}${ember_version}$SPACESHIP_EMBER_SUFFIX"
}

# Erlang is a general-purpose, concurrent, functional programming language
spaceship_erlang() {
  local SPACESHIP_ERLANG_SHOW="${SPACESHIP_ERLANG_SHOW=true}"
  local SPACESHIP_ERLANG_ASYNC="${SPACESHIP_ERLANG_ASYNC=true}"
  local SPACESHIP_ERLANG_PREFIX="${SPACESHIP_ERLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_ERLANG_SUFFIX="${SPACESHIP_ERLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_ERLANG_SYMBOL="${SPACESHIP_ERLANG_SYMBOL="e "}"
  local SPACESHIP_ERLANG_COLOR="${SPACESHIP_ERLANG_COLOR="%F{red}"}"

  [[ $SPACESHIP_ERLANG_SHOW == false ]] && return

  # Check if erl command is available for execution
  spaceship::exists erl || return

  # Show only within projects
  spaceship::upsearch -s rebar.config erlang.mk || return

  # Extract version from erlang
  local erl_version="$(erl -noshell -eval 'io:fwrite("~s\n", [erlang:system_info(otp_release)]).' -s erlang halt)"

  echo -n "$SPACESHIP_ERLANG_COLOR$SPACESHIP_ERLANG_PREFIX${SPACESHIP_ERLANG_SYMBOL}v$erl_version$SPACESHIP_ERLANG_SUFFIX"
}

# Flutter is an open source framework for building multi-platform applications with the Dart programming language.
spaceship_flutter() {
  local SPACESHIP_FLUTTER_SHOW="${SPACESHIP_FLUTTER_SHOW=true}"
  local SPACESHIP_FLUTTER_PREFIX="${SPACESHIP_FLUTTER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_FLUTTER_SUFFIX="${SPACESHIP_FLUTTER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_FLUTTER_SYMBOL="${SPACESHIP_FLUTTER_SYMBOL="💙 "}"
  local SPACESHIP_FLUTTER_COLOR="${SPACESHIP_FLUTTER_COLOR="%F{blue}"}"

  [[ $SPACESHIP_FLUTTER_SHOW == false ]] && return
  spaceship::exists flutter || return

  pubspec_file=$(spaceship::upsearch pubspec.yaml pubspec.yml) || return
  local is_flutter_project="$(spaceship::datafile --yaml $pubspec_file "dependencies.flutter")"

  [[ -n "$is_flutter_project" &&  "$is_flutter_project" != "null" ]] || return

  local flutter_version_output=$(flutter --version | awk '/^Flutter/{print $0}')
  local flutter_version=$(printf "$flutter_version_output" | awk '{print $2}')
  local flutter_channel=$(printf "$flutter_version_output" | awk '{print $5}')
  local flutter_channel_section="$(__spaceship_flutter_channel $flutter_channel)"

  echo -n "$SPACESHIP_FLUTTER_COLOR$SPACESHIP_FLUTTER_PREFIX${SPACESHIP_FLUTTER_SYMBOL}v${flutter_version}${flutter_channel_section}$SPACESHIP_FLUTTER_SUFFIX"
}

# internal section for channel
#   param: channel
__spaceship_flutter_channel() {
  local SPACESHIP_FLUTTER_CHANNEL_SHOW="${SPACESHIP_FLUTTER_CHANNEL_SHOW=true}"
  local SPACESHIP_FLUTTER_CHANNEL_PREFIX="${SPACESHIP_FLUTTER_CHANNEL_PREFIX=""}"
  local SPACESHIP_FLUTTER_CHANNEL_SUFFIX="${SPACESHIP_FLUTTER_CHANNEL_SUFFIX=""}"
  local SPACESHIP_FLUTTER_CHANNEL_SYMBOL="${SPACESHIP_FLUTTER_CHANNEL_SYMBOL=" #"}"

  [[ $SPACESHIP_FLUTTER_CHANNEL_SHOW == false ]] && return

  local flutter_channel=${1:?"unknown"}
  echo -n "$SPACESHIP_FLUTTER_CHANNEL_SYMBOL$SPACESHIP_FLUTTER_CHANNEL_PREFIX${flutter_channel}$SPACESHIP_FLUTTER_CHANNEL_SUFFIX"
}

# Google Cloud Platform (gcloud) is a tool that provides the primary command-line interface to Google Cloud Platform
spaceship_gcloud() {
  local SPACESHIP_GCLOUD_SHOW="${SPACESHIP_GCLOUD_SHOW=true}"
  local SPACESHIP_GCLOUD_PREFIX="${SPACESHIP_GCLOUD_PREFIX="using "}"
  local SPACESHIP_GCLOUD_SUFFIX="${SPACESHIP_GCLOUD_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_GCLOUD_SYMBOL="${SPACESHIP_GCLOUD_SYMBOL=" "}"
  local SPACESHIP_GCLOUD_COLOR="${SPACESHIP_GCLOUD_COLOR="%26F"}"

  [[ $SPACESHIP_GCLOUD_SHOW == false ]] && return

  # Check if the glcoud-cli is installed
  spaceship::exists gcloud || return

  # Set the gcloud config base dir
  local gcloud_dir=${CLOUDSDK_CONFIG:-"${HOME}/.config/gcloud"}

  # Check if there is an active config
  [[ -f $gcloud_dir/active_config ]] || return

  # Check if there is an active config override
  if (( ${+CLOUDSDK_ACTIVE_CONFIG_NAME} )); then
    # Uses the current config from the environment variable
    local gcloud_active_config=${CLOUDSDK_ACTIVE_CONFIG_NAME}
  else
    # Reads the current config from the file
    local gcloud_active_config=$(head -n1 $gcloud_dir/active_config)
  fi

  # Check the active config file exists
  local gcloud_active_config_file=$gcloud_dir/configurations/config_$gcloud_active_config
  [[ -f $gcloud_active_config_file ]] || return

  # Reads the current project from the active config file
  local gcloud_active_project=$(sed -n 's/project = \(.*\)/\1/p' $gcloud_active_config_file)

  # Sets the prompt text to `active-config/active-project`
  local gcloud_status="$gcloud_active_config/$gcloud_active_project"

  # Show prompt section
  echo -n "$SPACESHIP_GCLOUD_COLOR$SPACESHIP_GCLOUD_PREFIX${SPACESHIP_GCLOUD_SYMBOL}$gcloud_status$SPACESHIP_GCLOUD_SUFFIX"
}

# GNU Screen is a full-screen window manager that multiplexes a physical terminal
spaceship_gnu_screen() {
  local SPACESHIP_GNU_SCREEN_SHOW="${SPACESHIP_GNU_SCREEN_SHOW=true}"
  local SPACESHIP_GNU_SCREEN_PREFIX="${SPACESHIP_GNU_SCREEN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_GNU_SCREEN_SUFFIX="${SPACESHIP_GNU_SCREEN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_GNU_SCREEN_SYMBOL="${SPACESHIP_GNU_SCREEN_SYMBOL="💻 "}"
  local SPACESHIP_GNU_SCREEN_COLOR="${SPACESHIP_GNU_SCREEN_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_GNU_SCREEN_SHOW == false ]] && return

  spaceship::exists screen || return

  # Show screen section only when it is attached in a session
  [[ "$STY" =~ ^"[0-9]+\." ]] || return

  # STY could not be empty because regex match
  local screen_session="$STY"

  echo -n "$SPACESHIP_GNU_SCREEN_COLOR$SPACESHIP_GNU_SCREEN_PREFIX$SPACESHIP_GNU_SCREEN_SYMBOL$screen_session$SPACESHIP_GNU_SCREEN_SUFFIX"
}

# Go is an open source programming language that makes it easy to build efficient software
spaceship_golang() {
  local SPACESHIP_GOLANG_SHOW="${SPACESHIP_GOLANG_SHOW=true}"
  local SPACESHIP_GOLANG_PREFIX="${SPACESHIP_GOLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_GOLANG_SUFFIX="${SPACESHIP_GOLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_GOLANG_SYMBOL="${SPACESHIP_GOLANG_SYMBOL=" "}"
  local SPACESHIP_GOLANG_COLOR="${SPACESHIP_GOLANG_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_GOLANG_SHOW == false ]] && return

  spaceship::exists go || return

  # If there are Go-specific files in current directory, or current directory is under the GOPATH
  local is_go_project="$(spaceship::upsearch go.mod Godeps glide.yaml Gopkg.toml Gopkg.lock)"
  [[ -n "$is_go_project" || ( $GOPATH && "$PWD/" =~ "$GOPATH/" ) || -n *.go(#qN^/) ]] || return

  # Go version is either the commit hash and date like "devel +5efe9a8f11 Web Jan 9 07:21:16 2019 +0000"
  # at the time of the build or a release tag like "go1.11.4".
  # https://github.com/spaceship-prompt/spaceship-prompt/issues/610
  local go_version=$(go version | awk '{ if ($3 ~ /^devel/) {print $3 ":" substr($4, 2)} else {print "v" substr($3, 3)} }')

  echo -n "$SPACESHIP_GOLANG_COLOR${SPACESHIP_GOLANG_PREFIX}${SPACESHIP_GOLANG_SYMBOL}${go_version}${SPACESHIP_GOLANG_SUFFIX}"
}

# Gradle is an open-source build automation tool focused on flexibility and performance
spaceship_gradle() {
  local SPACESHIP_GRADLE_SHOW="${SPACESHIP_GRADLE_SHOW=true}"
  local SPACESHIP_GRADLE_PREFIX="${SPACESHIP_GRADLE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_GRADLE_SUFFIX="${SPACESHIP_GRADLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_GRADLE_SYMBOL="${SPACESHIP_GRADLE_SYMBOL="⬡ "}"
  local SPACESHIP_GRADLE_DEFAULT_VERSION="${SPACESHIP_GRADLE_DEFAULT_VERSION=""}"
  local SPACESHIP_GRADLE_COLOR="${SPACESHIP_GRADLE_COLOR="%F{green}"}"

  [[ $SPACESHIP_GRADLE_SHOW == false ]] && return

  local gradle_root_dir

  gradle_root_dir=$(spaceship::gradle::find_root_project "$(pwd -P)")

  # Show Gradle status only for applicable folders
  [[ -n "$gradle_root_dir" ]] &>/dev/null || return

  local gradle_version

  if [[ -f "$gradle_root_dir/gradlew" ]]; then
    gradle_version=($(spaceship::gradle::versions "$gradle_root_dir/gradlew"))
  elif spaceship::exists gradle; then
    gradle_version=($(spaceship::gradle::versions gradle))
  else
    return
  fi

  [[ "$gradle_version" == "$SPACESHIP_GRADLE_DEFAULT_VERSION" ]] && return

  echo -n "$SPACESHIP_GRADLE_COLOR$SPACESHIP_GRADLE_PREFIX${SPACESHIP_GRADLE_SYMBOL}$gradle_version$SPACESHIP_GRADLE_SUFFIX"
}

spaceship::gradle::find_root_project() {
  local root="$1"

  while [ "$root" ] && \
        [ ! -f "$root/settings.gradle" ] && \
        [ ! -f "$root/settings.gradle.kts" ]; do
    root="${root%/*}"
  done

  print "$root"
}

spaceship::gradle::versions() {
  local gradle_exe="$1" gradle_version_output gradle_version jvm_version

  gradle_version_output=$("$gradle_exe" --version)
  gradle_version=$(echo "$gradle_version_output" | awk '{ if ($1 ~ /^Gradle/) { print "v" $2 } }')

  print gradle "$gradle_version"
}

# Haskell is an advanced, purely functional programming language
spaceship_haskell() {
  local SPACESHIP_HASKELL_SHOW="${SPACESHIP_HASKELL_SHOW=true}"
  local SPACESHIP_HASKELL_PREFIX="${SPACESHIP_HASKELL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_HASKELL_SUFFIX="${SPACESHIP_HASKELL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_HASKELL_SYMBOL="${SPACESHIP_HASKELL_SYMBOL=" "}"
  local SPACESHIP_HASKELL_COLOR="${SPACESHIP_HASKELL_COLOR="%F{red}"}"

  [[ $SPACESHIP_HASKELL_SHOW == false ]] && return

  local haskell_version

  # Extracting Haskell version
  if spaceship::exists cabal; then
    haskell_version=$(ghc -- --numeric-version --no-install-ghc)
  elif spaceship::exists stack; then
    haskell_version=$(stack ghc -- --numeric-version --no-install-ghc)
  else
    return
  fi

  # If there are stack files in current directory
  local is_haskell_project=$(spaceship::upsearch stack.yaml)
  [[ -n "$is_haskell_project" || -n *.hs(#qN^/) || -n *.cabal(#qN) ]] || return

  echo -n "$SPACESHIP_HASKELL_COLOR$SPACESHIP_HASKELL_PREFIX${SPACESHIP_HASKELL_SYMBOL}v${haskell_version}$SPACESHIP_HASKELL_SUFFIX"
}

# Mercurial (hg)
spaceship_hg() {
  local SPACESHIP_HG_SHOW="${SPACESHIP_HG_SHOW=true}"
  local SPACESHIP_HG_PREFIX="${SPACESHIP_HG_PREFIX="on "}"
  local SPACESHIP_HG_SUFFIX="${SPACESHIP_HG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"

  [[ $SPACESHIP_HG_SHOW == false ]] && return

  spaceship::is_hg || return

  local hg_branch="$(spaceship_hg_branch)" hg_status="$(spaceship_hg_status)"

  [[ -z $hg_branch ]] && return

  echo -n "$White$SPACESHIP_HG_PREFIX${hg_branch}${hg_status}$SPACESHIP_HG_SUFFIX"
}

spaceship::is_hg() {
  local hg_root="$(spaceship::upsearch .hg)"
  [[ -n "$hg_root" ]] &>/dev/null
}

# Mercurial (hg) branch
spaceship_hg_branch() {
  local SPACESHIP_HG_BRANCH_SHOW="${SPACESHIP_HG_BRANCH_SHOW=true}"
  local SPACESHIP_HG_SYMBOL="${SPACESHIP_HG_SYMBOL="☿ "}"
  local SPACESHIP_HG_BRANCH_PREFIX="${SPACESHIP_HG_BRANCH_PREFIX="$SPACESHIP_HG_SYMBOL"}"
  local SPACESHIP_HG_BRANCH_SUFFIX="${SPACESHIP_HG_BRANCH_SUFFIX=""}"
  local SPACESHIP_HG_BRANCH_COLOR="${SPACESHIP_HG_BRANCH_COLOR="%F{magenta}"}"

  [[ $SPACESHIP_HG_BRANCH_SHOW == false ]] && return
  
  local hg_info=$(hg log -r . --template '{activebookmark}')

  if [[ -z $hg_info ]]; then
    hg_info=$(hg branch)
  fi

  echo -n "$SPACESHIP_HG_BRANCH_COLOR$SPACESHIP_HG_BRANCH_PREFIX"$hg_info"$SPACESHIP_HG_BRANCH_SUFFIX"
}

# Mercurial (hg) status
spaceship_hg_status() {
  local SPACESHIP_HG_STATUS_SHOW="${SPACESHIP_HG_STATUS_SHOW=true}"
  local SPACESHIP_HG_STATUS_PREFIX="${SPACESHIP_HG_STATUS_PREFIX=" ["}"
  local SPACESHIP_HG_STATUS_SUFFIX="${SPACESHIP_HG_STATUS_SUFFIX="]"}"
  local SPACESHIP_HG_STATUS_COLOR="${SPACESHIP_HG_STATUS_COLOR="%F{red}"}"
  local SPACESHIP_HG_STATUS_UNTRACKED="${SPACESHIP_HG_STATUS_UNTRACKED="?"}"
  local SPACESHIP_HG_STATUS_ADDED="${SPACESHIP_HG_STATUS_ADDED="+"}"
  local SPACESHIP_HG_STATUS_MODIFIED="${SPACESHIP_HG_STATUD_MODIFIED="!"}"
  local SPACESHIP_HG_STATUS_DELETED="${SPACESHIP_HG_STATUS_DELETED="✘"}"

  [[ $SPACESHIP_HG_STATUS_SHOW == false ]] && return

  local INDEX=$(hg status 2>/dev/null) hg_status=""

  # Indicators are suffixed instead of prefixed to each other to
  # provide uniform view across git and mercurial indicators
  if $(echo "$INDEX" | grep -E '^\? ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_UNTRACKED$hg_status"
  fi
  if $(echo "$INDEX" | grep -E '^A ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_ADDED$hg_status"
  fi
  if $(echo "$INDEX" | grep -E '^M ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_MODIFIED$hg_status"
  fi
  if $(echo "$INDEX" | grep -E '^(R|!)' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_DELETED$hg_status"
  fi

  if [[ -n $hg_status ]]; then
    echo -n "$SPACESHIP_HG_STATUS_COLOR$SPACESHIP_HG_STATUS_PREFIX"$hg_status"$SPACESHIP_HG_STATUS_SUFFIX"
  fi
}

# IBM Cloud Command Line Interface
# Powerful CLIs and tooling to interact with your applications, containers, infrastructure, and other services
spaceship_ibmcloud() {
  local SPACESHIP_IBMCLOUD_SHOW="${SPACESHIP_IBMCLOUD_SHOW=true}"
  local SPACESHIP_IBMCLOUD_PREFIX="${SPACESHIP_IBMCLOUD_PREFIX="using "}"
  local SPACESHIP_IBMCLOUD_SUFFIX="${SPACESHIP_IBMCLOUD_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_IBMCLOUD_SYMBOL="${SPACESHIP_IBMCLOUD_SYMBOL="👔 "}"
  local SPACESHIP_IBMCLOUD_COLOR="${SPACESHIP_IBMCLOUD_COLOR="%039F"}"

  [[ $SPACESHIP_IBMCLOUD_SHOW == false ]] && return

  spaceship::exists ibmcloud || return

  local ibmcloud_account=$(ibmcloud target | grep Account | awk '{print $2}')
  [[ -z $ibmcloud_account ]] && return

  # If no account is targeted, the awk command will return "No", so we need to
  # check for that and set it to the full message manually.
  [[ "No" == $ibmcloud_account ]] && ibmcloud_account="No account targeted"

  echo -n "$SPACESHIP_IBMCLOUD_COLOR$SPACESHIP_IBMCLOUD_PREFIX$SPACESHIP_IBMCLOUD_SYMBOL$ibmcloud_account$SPACESHIP_IBMCLOUD_SUFFIX"
}

# Java is a class-based, object-oriented programming language
spaceship_java() {
  local SPACESHIP_JAVA_SHOW="${SPACESHIP_JAVA_SHOW=true}"
  local SPACESHIP_JAVA_PREFIX="${SPACESHIP_JAVA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_JAVA_SUFFIX="${SPACESHIP_JAVA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_JAVA_SYMBOL="${SPACESHIP_JAVA_SYMBOL=" "}"
  local SPACESHIP_JAVA_COLOR="${SPACESHIP_JAVA_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_JAVA_SHOW == false ]] && return

  spaceship::exists java || return

  local java_project_globs=('pom.xml' 'build.gradle*' 'settings.gradle*' 'build.xml')
  local is_java_project="$(spaceship::upsearch $java_project_globs)"
  [[ -n "$is_java_project" || -n *.(java|class|jar|war)(#qN^/) ]] || return

  local java_version=$(java -version 2>&1 | grep version --color=never | awk -F '"' '{print $2}')

  # Check if java version is not empty
  [[ -z "$java_version" ]] && return

  echo -n "$SPACESHIP_JAVA_COLOR$SPACESHIP_JAVA_PREFIX${SPACESHIP_JAVA_SYMBOL}v${java_version}$SPACESHIP_JAVA_SUFFIX"
}

# Background Jobs
# Show icon if there's a working jobs in the background
spaceship_jobs() {
  local SPACESHIP_JOBS_SHOW="${SPACESHIP_JOBS_SHOW=true}"
  local SPACESHIP_JOBS_PREFIX="${SPACESHIP_JOBS_PREFIX=""}"
  local SPACESHIP_JOBS_SUFFIX="${SPACESHIP_JOBS_SUFFIX=""}"
  local SPACESHIP_JOBS_SYMBOL="${SPACESHIP_JOBS_SYMBOL="✦"}"
  local SPACESHIP_JOBS_COLOR="${SPACESHIP_JOBS_COLOR="%F{blue}"}"
  local SPACESHIP_JOBS_AMOUNT_PREFIX="${SPACESHIP_JOBS_AMOUNT_PREFIX=" "}"
  local SPACESHIP_JOBS_AMOUNT_SUFFIX="${SPACESHIP_JOBS_AMOUNT_SUFFIX=""}"
  local SPACESHIP_JOBS_AMOUNT_THRESHOLD="${SPACESHIP_JOBS_AMOUNT_THRESHOLD=1}"

  [[ $SPACESHIP_JOBS_SHOW == false ]] && return

  local jobs_amount=${#jobstates}

  [[ $jobs_amount -gt 0 ]] || return

  if [[ $jobs_amount -le $SPACESHIP_JOBS_AMOUNT_THRESHOLD ]]; then
    jobs_amount=''
    SPACESHIP_JOBS_AMOUNT_PREFIX=''
    SPACESHIP_JOBS_AMOUNT_SUFFIX=''
  fi

  echo -n "$SPACESHIP_JOBS_COLOR$SPACESHIP_JOBS_PREFIX${SPACESHIP_JOBS_SYMBOL}${SPACESHIP_JOBS_AMOUNT_PREFIX}${jobs_amount}${SPACESHIP_JOBS_AMOUNT_SUFFIX}$SPACESHIP_JOBS_SUFFIX"
}

# Julia is a high-level, high-performance dynamic programming language for numerical computing
# Show current version of Julia
spaceship_julia() {
  local SPACESHIP_JULIA_SHOW="${SPACESHIP_JULIA_SHOW=true}"
  local SPACESHIP_JULIA_PREFIX="${SPACESHIP_JULIA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_JULIA_SUFFIX="${SPACESHIP_JULIA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_JULIA_SYMBOL="${SPACESHIP_JULIA_SYMBOL="ஃ "}"
  local SPACESHIP_JULIA_COLOR="${SPACESHIP_JULIA_COLOR="%F{green}"}"

  [[ $SPACESHIP_JULIA_SHOW == false ]] && return

  spaceship::exists julia || return

  # If there are julia files in current directory
  local is_julia_project="$(spaceship::upsearch Project.toml JuliaProject.toml Manifest.toml)"
  [[ -n "$is_julia_project" || -n *.jl(#qN^/) ]] || return

  local julia_version=$(julia --version | grep --color=never -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)')

  echo -n "$SPACESHIP_JULIA_COLOR$SPACESHIP_JULIA_PREFIX${SPACESHIP_JULIA_SYMBOL}v${julia_version}$SPACESHIP_JULIA_SUFFIX"
}

# Kotlin is a modern, concise and safe programming language
spaceship_kotlin() {
  local SPACESHIP_KOTLIN_SHOW="${SPACESHIP_KOTLIN_SHOW=true}"
  local SPACESHIP_KOTLIN_PREFIX="${SPACESHIP_KOTLIN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_KOTLIN_SUFFIX="${SPACESHIP_KOTLIN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_KOTLIN_SYMBOL="${SPACESHIP_KOTLIN_SYMBOL="🅺 "}"
  local SPACESHIP_KOTLIN_COLOR="${SPACESHIP_KOTLIN_COLOR="%F{magenta}"}"
  [[ $SPACESHIP_KOTLIN_SHOW == false ]] && return

  spaceship::exists kotlinc || return

  [[ -n *.kt(#qN^/) || *.kts(#qN^/) ]] || return

  # Extract kotlin version
  local kotlin_version=$(kotlinc -version 2>&1 | grep --color=never -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)' | head -n 1)
  [[ -z "$kotlin_version" ]] && return

  echo -n "$SPACESHIP_KOTLIN_COLOR$SPACESHIP_KOTLIN_PREFIX${SPACESHIP_KOTLIN_SYMBOL}v$kotlin_version$SPACESHIP_KOTLIN_SUFFIX"
}

# Kubernetes (kubectl) is an open-source system for deployment, scaling, and management of containerized applications
spaceship_kubectl() {
  local SPACESHIP_KUBECTL_SHOW="${SPACESHIP_KUBECTL_SHOW=true}"
  local SPACESHIP_KUBECTL_PREFIX="${SPACESHIP_KUBECTL_PREFIX="at "}"
  local SPACESHIP_KUBECTL_SUFFIX="${SPACESHIP_KUBECTL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_KUBECTL_COLOR="${SPACESHIP_KUBECTL_COLOR="%F{white}"}"
  local SPACESHIP_KUBECTL_SYMBOL="${SPACESHIP_KUBECTL_SYMBOL="☸️  "}"

  [[ $SPACESHIP_KUBECTL_SHOW == false ]] && return
  spaceship::exists kubectl || return

  local kubectl_version="$(spaceship_kubectl_version)" kubectl_context="$(spaceship_kubectl_context)"

  [[ -z $kubectl_version && -z $kubectl_context ]] && return

  echo -n "$SPACESHIP_KUBECTL_COLOR$SPACESHIP_KUBECTL_PREFIX${SPACESHIP_KUBECTL_SYMBOL}${kubectl_version}${kubectl_context}$SPACESHIP_KUBECTL_SUFFIX"
}

# Kubectl version
# Show current kubectl version
spaceship_kubectl_version() {
  local SPACESHIP_KUBECTL_VERSION_SHOW="${SPACESHIP_KUBECTL_VERSION_SHOW=true}"
  local SPACESHIP_KUBECTL_VERSION_PREFIX="${SPACESHIP_KUBECTL_VERSION_PREFIX=""}"
  local SPACESHIP_KUBECTL_VERSION_SUFFIX="${SPACESHIP_KUBECTL_VERSION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_KUBECTL_VERSION_COLOR="${SPACESHIP_KUBECTL_VERSION_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_KUBECTL_VERSION_SHOW == false ]] && return

  # kubectl can hang for upwards of 10 seconds if a context isn't loaded, this avoids the unnecessary server version
  #  check if a context isn't loaded, avoiding the issue entirely.
  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return
  
  # if kubectl can't connect kubernetes cluster, kubernetes version section will be not shown
  local kubectl_version=$(kubectl version --short 2>/dev/null | grep "Server Version" | sed 's/Server Version: \(.*\)/\1/')
  [[ -z $kubectl_version ]] && return

  echo -n "$SPACESHIP_KUBECTL_VERSION_COLOR$SPACESHIP_KUBECTL_VERSION_PREFIX${kubectl_version}$SPACESHIP_KUBECTL_VERSION_SUFFIX"
}

# Kubernetes context
# Show current context in kubectl
spaceship_kubectl_context() {
  local SPACESHIP_KUBECONTEXT_SHOW="${SPACESHIP_KUBECONTEXT_SHOW=true}"
  local SPACESHIP_KUBECONTEXT_PREFIX="${SPACESHIP_KUBECONTEXT_PREFIX=""}"
  local SPACESHIP_KUBECONTEXT_SUFFIX="${SPACESHIP_KUBECONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_KUBECONTEXT_COLOR="${SPACESHIP_KUBECONTEXT_COLOR="%F{cyan}"}"
  local SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW="${SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW=true}"
  local SPACESHIP_KUBECONTEXT_COLOR_GROUPS=(${SPACESHIP_KUBECONTEXT_COLOR_GROUPS=})

  [[ $SPACESHIP_KUBECONTEXT_SHOW == false ]] && return

  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return

  if [[ $SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW == true ]]; then
    local kube_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    [[ -n $kube_namespace && "$kube_namespace" != "default" ]] && kube_context="$kube_context ($kube_namespace)"
  fi

  # Apply custom color to section if $kube_context matches a pattern defined in SPACESHIP_KUBECONTEXT_COLOR_GROUPS array.
  # See Options.md for usage example.
  local len=${#SPACESHIP_KUBECONTEXT_COLOR_GROUPS[@]}
  local it_to=$((len / 2))
  local 'section_color' 'i'
  for ((i = 1; i <= $it_to; i++)); do
    local idx=$(((i - 1) * 2))
    local color="${SPACESHIP_KUBECONTEXT_COLOR_GROUPS[$idx + 1]}"
    local pattern="${SPACESHIP_KUBECONTEXT_COLOR_GROUPS[$idx + 2]}"
    if [[ "$kube_context" =~ "$pattern" ]]; then
      section_color=$color
      break
    fi
  done

  [[ -z "$section_color" ]] && section_color=$SPACESHIP_KUBECONTEXT_COLOR

  echo -n "$section_color$SPACESHIP_KUBECONTEXT_PREFIX${kube_context}$SPACESHIP_KUBECONTEXT_SUFFIX"
}

# Lua is a powerful, efficient, lightweight, embeddable scripting language
spaceship_lua() {
  local SPACESHIP_LUA_SHOW="${SPACESHIP_LUA_SHOW=true}"
  local SPACESHIP_LUA_PREFIX="${SPACESHIP_LUA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_LUA_SUFFIX="${SPACESHIP_LUA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_LUA_SYMBOL="${SPACESHIP_LUA_SYMBOL=" "}"
  local SPACESHIP_LUA_COLOR="${SPACESHIP_LUA_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_LUA_SHOW == false ]] && return
  spaceship::exists lua || return

  local is_lua_project="$(spaceship::upsearch .lua-version lua)"
  [[ -n "$is_lua_project" || -n *.lua(#qN^/) ]] || return

  local lua_version=$(lua -v | awk '{print $2}')

  echo -n "$SPACESHIP_LUA_COLOR$SPACESHIP_LUA_PREFIX${SPACESHIP_LUA_SYMBOL}v${lua_version}$SPACESHIP_LUA_SUFFIX"
}

# Apache Maven is a software project management and comprehension tool
spaceship_maven() {
  local SPACESHIP_MAVEN_SHOW="${SPACESHIP_MAVEN_SHOW=true}"
  local SPACESHIP_MAVEN_PREFIX="${SPACESHIP_MAVEN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_MAVEN_SUFFIX="${SPACESHIP_MAVEN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_MAVEN_SYMBOL="${SPACESHIP_MAVEN_SYMBOL="𝑚 "}"
  local SPACESHIP_MAVEN_DEFAULT_VERSION="${SPACESHIP_MAVEN_DEFAULT_VERSION=""}"
  local SPACESHIP_MAVEN_COLOR="${SPACESHIP_MAVEN_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_MAVEN_SHOW == false ]] && return

  local maven_dir maven_exe

  if maven_dir=$(spaceship::maven::find_maven_wrapper "$(pwd -P)") && [[ -n "$maven_dir" ]]; then
    maven_exe="$maven_dir/mvnw"
  elif spaceship::exists mvn && maven_dir=$(spaceship::maven::find_pom "$(pwd -P)") && [[ -n "$maven_dir" ]]; then
    maven_exe="mvn"
  else
    return
  fi

  local maven_version

  maven_version=$(spaceship::maven::version "$maven_exe")

  [[ "$maven_version" == "$SPACESHIP_MAVEN_DEFAULT_VERSION" ]] && return

  echo -n "$SPACESHIP_MAVEN_COLOR$SPACESHIP_MAVEN_PREFIX${SPACESHIP_MAVEN_SYMBOL}${maven_version}$SPACESHIP_MAVEN_SUFFIX"
}

spaceship::maven::find_pom() {
  local root="$1"

  while [ "$root" ] && [ ! -f "$root/pom.xml" ]; do
    root="${root%/*}"
  done

  print "$root"
}

spaceship::maven::find_maven_wrapper() {
  local root="$1"

  while [ "$root" ] && [ ! -f "$root/mvnw" ]; do
    root="${root%/*}"
  done

  print "$root"
}

spaceship::maven::version() {
  local maven_exe="$1" maven_version_output maven_version

  maven_version_output=$("$maven_exe" --version 2>/dev/null)
  maven_version=$(echo "$maven_version_output" | awk '{ if ($2 ~ /^Maven/) { print "v" $3 } }')

  print maven "$maven_version"
}

# Nix can be used to provide some kind of virtual environment through the nix-shell command.
spaceship_nix_shell() {
  local SPACESHIP_NIX_SHELL_SHOW="${SPACESHIP_NIX_SHELL_SHOW=true}"
  local SPACESHIP_NIX_SHELL_PREFIX="${SPACESHIP_NIX_SHELL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_NIX_SHELL_SUFFIX="${SPACESHIP_NIX_SHELL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_NIX_SHELL_SYMBOL="${SPACESHIP_NIX_SHELL_SYMBOL="❄ "}"
  local SPACESHIP_NIX_SHELL_COLOR="${SPACESHIP_NIX_SHELL_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_NIX_SHELL_SHOW == false ]] && return

  [[ -z "$IN_NIX_SHELL" ]] && return

  if [[ -z "$name" || "$name" == "" ]]; then
    display_text="$IN_NIX_SHELL"
  else
    display_text="$IN_NIX_SHELL ($name)"
  fi

  # Show prompt section
  echo -n "$SPACESHIP_NIX_SHELL_COLOR$SPACESHIP_NIX_SHELL_PREFIX$SPACESHIP_NIX_SHELL_SYMBOL$display_text$SPACESHIP_NIX_SHELL_SUFFIX"
}

# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine
# Show current version of node, exception system.
spaceship_node() {
  local SPACESHIP_NODE_SHOW="${SPACESHIP_NODE_SHOW=true}"
  local SPACESHIP_NODE_PREFIX="${SPACESHIP_NODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_NODE_SUFFIX="${SPACESHIP_NODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_NODE_SYMBOL="${SPACESHIP_NODE_SYMBOL="⬢ "}"
  local SPACESHIP_NODE_DEFAULT_VERSION="${SPACESHIP_NODE_DEFAULT_VERSION=""}"
  local SPACESHIP_NODE_COLOR="${SPACESHIP_NODE_COLOR="%F{green}"}"

  [[ $SPACESHIP_NODE_SHOW == false ]] && return

  # Show NODE status only for JS-specific folders
  local is_node_project="$(spaceship::upsearch package.json .nvmrc .node-version node_modules)"
  [[ -n "$is_node_project" || -n *.js(#qN^/) || -n *.cjs(#qN^/) || -n *.mjs(#qN^/) ]] || return

  local node_version

  if spaceship::exists fnm; then
    node_version=$(fnm current 2>/dev/null)
  elif spaceship::exists nvm; then
    node_version=$(nvm current 2>/dev/null)
  elif spaceship::exists nodenv; then
    node_version=$(nodenv version-name)
  elif spaceship::exists node; then
    node_version=$(node -v 2>/dev/null)
  else
    return
  fi

  # Do not show system or default versions
  [[ $node_version == "system" || $node_version == "node" ]] && return
  [[ $node_version == $SPACESHIP_NODE_DEFAULT_VERSION ]] && return

  echo -n "$SPACESHIP_NODE_COLOR$SPACESHIP_NODE_PREFIX${SPACESHIP_NODE_SYMBOL}${node_version}$SPACESHIP_NODE_SUFFIX"
}

# OCaml is an industrial strength programming language supporting functional,
spaceship_ocaml() {
  local SPACESHIP_OCAML_SHOW="${SPACESHIP_OCAML_SHOW=true}"
  local SPACESHIP_OCAML_PREFIX="${SPACESHIP_OCAML_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_OCAML_SUFFIX="${SPACESHIP_OCAML_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_OCAML_SYMBOL="${SPACESHIP_OCAML_SYMBOL="🐫 "}"
  local SPACESHIP_OCAML_COLOR="${SPACESHIP_OCAML_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_OCAML_SHOW == false ]] && return

  local ocaml_version

  # Show OCaml status only for OCaml/Reason-specific folders
  local is_ocaml_project="$(spaceship::upsearch esy.lock _opam dune dune-project jbuild jbuild-ignore .merlin)"
  [[ -n "$is_ocaml_project" || -n *.opam(#qN^/) || -n *.{ml,mli,re,rei}(#qN^/) ]] || return

  if spaceship::exists esy && $(esy true 2>/dev/null); then
    ocaml_version=$(esy ocaml -vnum 2>/dev/null)
  elif spaceship::exists opam; then
    ocaml_version=$(opam switch show 2>/dev/null)
  elif spaceship::exists ocaml; then
    ocaml_version=$(ocaml -vnum)
  else
    return
  fi

  # Exit if the version is empty or system
  [[ -z "$ocaml_version" || "$ocaml_version" == "system" ]] && return

  # Add 'v' before OCaml version that starts with a number
  [[ "$ocaml_version" =~ ^[0-9].+$ ]] && ocaml_version="v$ocaml_version"

  echo -n "$SPACESHIP_OCAML_COLOR$SPACESHIP_OCAML_PREFIX$SPACESHIP_OCAML_SYMBOL$ocaml_version$SPACESHIP_OCAML_SUFFIX"
}

# Package - Current package version
# These package managers supported: npm; lerna; Cargo; Composer; Julia; Maven; Gradle; Python (using pyproject.toml); Dart (Fluter)
spaceship_package() {
  local SPACESHIP_PACKAGE_SHOW="${SPACESHIP_PACKAGE_SHOW=true}"
  local SPACESHIP_PACKAGE_SHOW_PRIVATE="${SPACESHIP_PACKAGE_SHOW_PRIVATE=false}"
  local SPACESHIP_PACKAGE_PREFIX="${SPACESHIP_PACKAGE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_PACKAGE_SUFFIX="${SPACESHIP_PACKAGE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL="📦 "}"
  local SPACESHIP_PACKAGE_COLOR="${SPACESHIP_PACKAGE_COLOR="%F{red}"}"

  [[ $SPACESHIP_PACKAGE_SHOW == false ]] && return

  # Packages
  spaceship_package::npm() {
    spaceship::exists npm || return

    package_json=$(spaceship::upsearch package.json) || return

    local package_version="$(spaceship::datafile --json $package_json version)"
    local is_private_package="$(spaceship::datafile --json $package_json private)"

    if [[ "$SPACESHIP_PACKAGE_SHOW_PRIVATE" == false && "$is_private_package" == true ]]; then
      return 0
    fi

    if [[ "$package_version" == '0.0.0-development' || $package_version == '0.0.0-semantic'* ]]; then
      package_version="(semantic)"
    fi

    echo "$package_version"
  }

  spaceship_package::lerna() {
    # Show package version from lerna.json if is a lerna monorepo
    # Note: lerna does not have to be installed in the global context
    # so checking for lerna binary does not make sense
    spaceship::exists npm || return

    lerna_json=$(spaceship::upsearch lerna.json) || return

    local package_version="$(spaceship::datafile --json $lerna_json version)"

    if [[ "$package_version" == "independent" ]]; then
      package_version="($package_version)"
    fi

    echo "$package_version"
  }

  spaceship_package::cargo() {
    spaceship::exists cargo || return
    spaceship::upsearch -s Cargo.toml || return

    # Handle missing field `version` in Cargo.toml.
    # `cargo pkgid` need Cargo.lock exists too. If it does't, do not show package version
    # https://github.com/spaceship-prompt/spaceship-prompt/pull/617
    local pkgid=$(cargo pkgid 2>&1)
    echo "$pkgid" | grep -q "error:" && return
    echo "${pkgid##*\#}"
  }

  spaceship_package::composer() {
    spaceship::exists composer || return

    composer_json=$(spaceship::upsearch composer.json) || return

    spaceship::datafile --json $composer_json "version"
  }

  spaceship_package::julia() {
    spaceship::exists julia || return

    project_toml=$(spaceship::upsearch Project.toml) || return

    spaceship::datafile --toml $project_toml "version"
  }

  spaceship_package::maven() {
    spaceship::upsearch -s pom.xml || return

    maven_exe=$(spaceship::upsearch mvnw) || (spaceship::exists mvn && maven_exe="mvn") || return

    $maven_exe help:evaluate -q -DforceStdout -D"expression=project.version" 2>/dev/null
  }

  spaceship_package::gradle() {
    spaceship::upsearch -s settings.gradle settings.gradle.kts || return

    gradle_exe=$(spaceship::upsearch gradlew) || (spaceship::exists gradle && gradle_exe="gradle") || return

    $gradle_exe properties --no-daemon --console=plain -q 2>/dev/null | grep "^version:" | awk '{printf $2}'
  }

  spaceship_package::python() {
    pyproject_toml=$(spaceship::upsearch pyproject.toml) || return

    spaceship::datafile --toml $project_toml "tool.poetry.version"
    if [[ $? != 0 ]]; then
      spaceship::datafile --toml $project_toml "project.version"
    fi
  }

  spaceship_package::dart() {
    spaceship::exists dart || return

    pubspec_file=$(spaceship::upsearch pubspec.yaml pubspec.yml) || return

    spaceship::datafile --yaml $pubspec_file "version" 
  }

  # Show package version only when repository is a package
  local package_version

  # for package in npm lerna cargo composer julia maven gradle python dart; do
  for package in npm lerna cargo composer julia maven gradle python dart; do
    local package_version="$(spaceship_package::$package)"

    if [[ -z $package_version || "$package_version" == "null" || "$package_version" == "undefined" ]]; then
      continue
    fi

    echo -n "$SPACESHIP_PACKAGE_COLOR$SPACESHIP_PACKAGE_PREFIX${SPACESHIP_PACKAGE_SYMBOL}v${package_version}$SPACESHIP_PACKAGE_SUFFIX"

    return
  done
}

# Perl is a general purpose programming language, originally developed for text manipulation.
# Perl refers to Perl 5.x, where Perl 6+ officially changed the name to Raku.
spaceship_perl() {
  local SPACESHIP_PERL_SHOW="${SPACESHIP_PERL_SHOW=true}"
  local SPACESHIP_PERL_PREFIX="${SPACESHIP_PERL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_PERL_SUFFIX="${SPACESHIP_PERL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_PERL_SYMBOL="${SPACESHIP_PERL_SYMBOL=" "}"
  local SPACESHIP_PERL_COLOR="${SPACESHIP_PERL_COLOR="%F{blue}"}"

  [[ $SPACESHIP_PERL_SHOW == false ]] && return

  spaceship::exists perl || return

  # Show only if perl files or composer.json exist in current directory
  local is_perl_project="$(spaceship::upsearch META.{json,yml,yaml} .perl-version cpanfile)"
  [[ -n "$is_perl_project" || -n *.pl(#qN^/) || -n *.pm(#qN^/)  ]] || return

  local perl_version=$(perl -v 2>&1 | awk '/This/ {print $9}' | sed -r 's/[(v]+//g;s/[)]//g')

  echo -n "$SPACESHIP_PERL_COLOR$SPACESHIP_PERL_PREFIX${SPACESHIP_PERL_SYMBOL}v$perl_version$SPACESHIP_PERL_SUFFIX"
}

# PHP is a server-side scripting language designed primarily for web development
# Show current version of PHP
spaceship_php() {
  local SPACESHIP_PHP_SHOW="${SPACESHIP_PHP_SHOW=true}"
  local SPACESHIP_PHP_PREFIX="${SPACESHIP_PHP_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_PHP_SUFFIX="${SPACESHIP_PHP_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_PHP_SYMBOL="${SPACESHIP_PHP_SYMBOL=" "}"
  local SPACESHIP_PHP_COLOR="${SPACESHIP_PHP_COLOR="%F{blue}"}"

  [[ $SPACESHIP_PHP_SHOW == false ]] && return

  spaceship::exists php || return

  # Show only if php files or composer.json exist in current directory
  local is_php_project="$(spaceship::upsearch composer.json)"
  [[ -n "$is_php_project" || -n *.php(#qN^/) ]] || return

  local php_version=$(php -v 2>&1 | grep --color=never -oe "^PHP\s*[0-9.]\+" | awk '{print $2}')

  echo -n "$SPACESHIP_PHP_COLOR$SPACESHIP_PHP_PREFIX${SPACESHIP_PHP_SYMBOL}v${php_version}${SPACESHIP_PHP_SUFFIX}"
}

# Pulumi automates the repetitive tasks of setting up cloud resources
spaceship_pulumi() {
  local SPACESHIP_PULUMI_SHOW="${SPACESHIP_PULUMI_SHOW=true}"
  local SPACESHIP_PULUMI_PREFIX="${SPACESHIP_PULUMI_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_PULUMI_SUFFIX="${SPACESHIP_PULUMI_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_PULUMI_SYMBOL="${SPACESHIP_PULUMI_SYMBOL=" "}"
  local SPACESHIP_PULUMI_COLOR="${SPACESHIP_PULUMI_COLOR="%133F"}"
  [[ $SPACESHIP_PULUMI_SHOW == false ]] && return

  spaceship::exists pulumi || return

  # Show PULUMI Stack when exists
  local pulumi_project=$(spaceship::upsearch Pulumi.y*ml)
  [[ -n "$pulumi_project" || -d .pulumi/stacks ]] || return

  local pulumi_stack=$(pulumi stack ls 2>/dev/null | sed -n -e '2p' | cut -f1 -d" " | sed s/\*//)
  [[ -z $pulumi_stack ]] && return

  echo -n "$SPACESHIP_PULUMI_COLOR$SPACESHIP_PULUMI_PREFIX$SPACESHIP_PULUMI_SYMBOL$pulumi_stack$SPACESHIP_PULUMI_SUFFIX"
}

# PureScript is a strongly-typed functional programming language that compiles to JavaScript
spaceship_purescript() {
  local SPACESHIP_PURESCRIPT_SHOW="${SPACESHIP_PURESCRIPT_SHOW=true}"
  local SPACESHIP_PURESCRIPT_ASYNC="${SPACESHIP_PURESCRIPT_ASYNC=true}"
  local SPACESHIP_PURESCRIPT_PREFIX="${SPACESHIP_PURESCRIPT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_PURESCRIPT_SUFFIX="${SPACESHIP_PURESCRIPT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_PURESCRIPT_SYMBOL="${SPACESHIP_PURESCRIPT_SYMBOL="⇔ "}"
  local SPACESHIP_PURESCRIPT_COLOR="${SPACESHIP_PURESCRIPT_COLOR="%F{white}"}"

  [[ $SPACESHIP_PURESCRIPR_SHOW == false ]] && return

  # Check if PureScript binary is available
  spaceship::exists purescript || return

  # Show PureScript section only when we are in PS-specific project
  local is_purescript_context="$(spaceship::upsearch spago.dhall)"
  [[ -n "$is_purescript_context" || -n *.purs(#qN^/) ]] || return

  local purescript_version="$(purescript --version)"

  # Display PureScript section
  echo -n "$SPACESHIP_PURESCRIPT_COLOR$SPACESHIP_PURESCRIPT_PREFIX${SPACESHIP_PURESCRIPT_SYMBOL}v$purescript_version$SPACESHIP_PURESCRIPT_SUFFIX"
}

# Python is an interpreted high-level programming language
spaceship_python() {
  local SPACESHIP_PYTHON_SHOW="${SPACESHIP_PYTHON_SHOW=always}"
  local SPACESHIP_PYTHON_PREFIX="${SPACESHIP_PYTHON_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_PYTHON_SUFFIX="${SPACESHIP_PYTHON_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_PYTHON_SYMBOL="${SPACESHIP_PYTHON_SYMBOL=" "}"
  local SPACESHIP_PYTHON_COLOR="${SPACESHIP_PYTHON_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_PYTHON_SHOW == false ]] && return

  # Show python version only in directories with relevant files
  local is_python_project="$(spaceship::upsearch requirements.txt Pipfile pyproject.toml)"
  [[ -n "$is_python_project" || -n *.py(#qN^/) ]] || return

  local py_version

  if  [[ -n "$VIRTUAL_ENV" ]] || [[ $SPACESHIP_PYTHON_SHOW == always ]]; then
    py_version=${(@)$(python -V 2>&1)[2]} || py_version=${(@)$(python3 -V 2>&1)[2]}
  fi

  [[ -z $py_version ]] && return

  echo -n "$SPACESHIP_PYTHON_COLOR$SPACESHIP_PYTHON_PREFIX$SPACESHIP_PYTHON_SYMBOL$py_version$SPACESHIP_PYTHON_SUFFIX"
}

# Ruby is a dynamic, reflective, object-oriented, general-purpose programming language
# Show current version of Ruby
spaceship_ruby() {
  local SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW=true}"
  local SPACESHIP_RUBY_PREFIX="${SPACESHIP_RUBY_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_RUBY_SUFFIX="${SPACESHIP_RUBY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL=" "}"
  local SPACESHIP_RUBY_COLOR="${SPACESHIP_RUBY_COLOR="%F{red}"}"

  [[ $SPACESHIP_RUBY_SHOW == false ]] && return

  # Show versions only for Ruby-specific folders
  local is_ruby_project="$(spaceship::upsearch Gemfile Rakefile)"
  [[ -n "$is_ruby_project" || -n *.rb(#qN^/) ]] || return

  local ruby_version

  if spaceship::exists rvm-prompt; then
    ruby_version=$(rvm-prompt i v g)
  elif spaceship::exists chruby; then
    ruby_version=$(chruby | sed -n -e 's/ \* //p')
  elif spaceship::exists rbenv; then
    ruby_version=$(rbenv version-name)
  elif spaceship::exists asdf; then
    # split output on space and return second element
    ruby_version=${$(asdf current ruby)[2]}
  else
    return
  fi

  [[ -z $ruby_version || "${ruby_version}" == "system" ]] && return

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

  echo -n "$SPACESHIP_RUBY_COLOR$SPACESHIP_RUBY_PREFIX${SPACESHIP_RUBY_SYMBOL}${ruby_version}$SPACESHIP_RUBY_SUFFIX"
}

# Rust is a systems programming language sponsored by Mozilla Research
# Show current version of Rust
spaceship_rust() {
  local SPACESHIP_RUST_SHOW="${SPACESHIP_RUST_SHOW=true}"
  local SPACESHIP_RUST_PREFIX="${SPACESHIP_RUST_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_RUST_SUFFIX="${SPACESHIP_RUST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_RUST_SYMBOL="${SPACESHIP_RUST_SYMBOL=" "}"
  local SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR="%F{red}"}"
  local SPACESHIP_RUST_VERBOSE_VERSION="${SPACESHIP_RUST_VERBOSE_VERSION=false}"

  [[ $SPACESHIP_RUST_SHOW == false ]] && return

  spaceship::exists rustc || return

  # If there are Rust-specific files in current directory
  local is_rust_project="$(spaceship::upsearch Cargo.toml)"
  [[ -n "$is_rust_project" || -n *.rs(#qN^/) ]] || return

  local rust_version=$(rustc --version | cut -d ' ' -f2)

  if [[ $SPACESHIP_RUST_VERBOSE_VERSION == false ]]; then
    local rust_version=$(echo $rust_version | cut -d '-' -f1) # Cut off -suffixes from version. "v1.30.0-beta.11" or "v1.30.0-nightly"
  fi

  echo -n "$SPACESHIP_RUST_COLOR$SPACESHIP_RUST_PREFIX${SPACESHIP_RUST_SYMBOL}v${rust_version}$SPACESHIP_RUST_SUFFIX"
}

# Scala is a strongly typed language supporting the functional and object oriented paradigms.
spaceship_scala() {
  local SPACESHIP_SCALA_SHOW="${SPACESHIP_SCALA_SHOW=true}"
  local SPACESHIP_SCALA_PREFIX="${SPACESHIP_SCALA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_SCALA_SUFFIX="${SPACESHIP_SCALA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_SCALA_SYMBOL="${SPACESHIP_SCALA_SYMBOL="🆂 "}"
  local SPACESHIP_SCALA_COLOR="${SPACESHIP_SCALA_COLOR="%F{red}"}"

  [[ $SPACESHIP_SCALA_SHOW == false ]] && return

  spaceship::exists scalac || return

  local is_scala_context="$(spaceship::upsearch .scalaenv .sbtenv .metals)"
  [[ -n "$is_scala_context" || -n *.scala(#qN^/) || -n *.sbt(#qN^/) ]] || return

  # pipe version info into stdout; won't work otherwise
  local scala_version=$(scalac -version 2>&1 | grep --color=never -oe "[0-9]\.[0-9]\.[0-9]")

  [[ -z "$scala_version" || "${scala_version}" == "system" ]] && return

  echo -n "$SPACESHIP_SCALA_COLOR$SPACESHIP_SCALA_PREFIX${SPACESHIP_SCALA_SYMBOL}v$scala_version$SPACESHIP_SCALA_SUFFIX"
}

# Swift is a general-purpose, multi-paradigm, compiled programming language by Apple Inc
# Show current version of Swift
spaceship_swift() {
  local SPACESHIP_SWIFT_SHOW_LOCAL="${SPACESHIP_SWIFT_SHOW_LOCAL=true}"
  local SPACESHIP_SWIFT_SHOW_GLOBAL="${SPACESHIP_SWIFT_SHOW_GLOBAL=false}"
  local SPACESHIP_SWIFT_PREFIX="${SPACESHIP_SWIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_SWIFT_SUFFIX="${SPACESHIP_SWIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_SWIFT_SYMBOL="${SPACESHIP_SWIFT_SYMBOL=" "}"
  local SPACESHIP_SWIFT_COLOR="${SPACESHIP_SWIFT_COLOR="%F{yellow}"}"

  spaceship::exists swiftenv || return

  local swift_version

  if [[ $SPACESHIP_SWIFT_SHOW_GLOBAL == true ]] ; then
    swift_version=$(swiftenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] ; then
    if swiftenv version | grep ".swift-version" > /dev/null; then
      swift_version=$(swiftenv version | sed 's/ .*//')
    fi
  fi

  [ -n "${swift_version}" ] || return

  echo -n "$SPACESHIP_SWIFT_COLOR$SPACESHIP_SWIFT_PREFIX${SPACESHIP_SWIFT_SYMBOL}${swift_version}$SPACESHIP_SWIFT_SUFFIX"
}

# Terraform Workspaces automates the repetitive tasks of setting up cloud resources
spaceship_terraform() {
  local SPACESHIP_TERRAFORM_SHOW="${SPACESHIP_TERRAFORM_SHOW=true}"
  local SPACESHIP_TERRAFORM_PREFIX="${SPACESHIP_TERRAFORM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_TERRAFORM_SUFFIX="${SPACESHIP_TERRAFORM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_TERRAFORM_SYMBOL="${SPACESHIP_TERRAFORM_SYMBOL="🛠 "}"
  local SPACESHIP_TERRAFORM_COLOR="${SPACESHIP_TERRAFORM_COLOR="%105F"}"

  [[ $SPACESHIP_TERRAFORM_SHOW == false ]] && return

  spaceship::exists terraform || return

  # Show Terraform Workspaces when exists
  spaceship::upsearch .terraform/environment || return

  local terraform_workspace=$(<.terraform/environment)
  [[ -z $terraform_workspace ]] && return

  echo -n "$SPACESHIP_TERRAFORM_COLOR$SPACESHIP_TERRAFORM_PREFIX$SPACESHIP_TERRAFORM_SYMBOL$terraform_workspace$SPACESHIP_TERRAFORM_SUFFIX"
}

# Virtualenv is a tool to create isolated Python environments
# Show current virtual environment (Python).
spaceship_venv() {
  local SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW=true}"
  local SPACESHIP_VENV_PREFIX="${SPACESHIP_VENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_VENV_SUFFIX="${SPACESHIP_VENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_VENV_SYMBOL="${SPACESHIP_VENV_SYMBOL=""}"
  # The (A) expansion flag creates an array, the '=' activates word splitting
  local SPACESHIP_VENV_GENERIC_NAMES="${(A)=SPACESHIP_VENV_GENERIC_NAMES=virtualenv venv .venv}"
  local SPACESHIP_VENV_COLOR="${SPACESHIP_VENV_COLOR="%F{blue}"}"

  [[ $SPACESHIP_VENV_SHOW == false ]] && return

  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] || return

  local venv

  if [[ "${SPACESHIP_VENV_GENERIC_NAMES[(i)$VIRTUAL_ENV:t]}" -le \
        "${#SPACESHIP_VENV_GENERIC_NAMES}" ]]
  then
    venv="$VIRTUAL_ENV:h:t"
  else
    venv="$VIRTUAL_ENV:t"
  fi

  echo -n "$SPACESHIP_VENV_COLOR$SPACESHIP_VENV_PREFIX${SPACESHIP_VENV_SYMBOL}${venv}$SPACESHIP_VENV_SUFFIX"
}

# V is a simple, fast, safe, compiled language for developing maintainable software.
spaceship_vlang() {
  local SPACESHIP_VLANG_SHOW="${SPACESHIP_VLANG_SHOW=true}"
  local SPACESHIP_VLANG_PREFIX="${SPACESHIP_VLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_VLANG_SUFFIX="${SPACESHIP_VLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_VLANG_SYMBOL="${SPACESHIP_VLANG_SYMBOL="V "}"
  local SPACESHIP_VLANG_COLOR="${SPACESHIP_VLANG_COLOR="%F{blue}"}"
  [[ $SPACESHIP_VLANG_SHOW == false ]] && return

  local v_version

  if command v 2>/dev/null; then
    v_version=$(command v version | cut -d ' ' -f2)
  fi

  [[ -z "$v_version" ]] && return

  # Show V status only for folders containing V files
  local is_v_project=$(spaceship::upsearch v.mod vpkg.json .vpkg-lock.json)
  [[ -n "$is_v_project" || -n *.v(#qN^/) ]] || return

  echo -n "$SPACESHIP_VLANG_COLOR$SPACESHIP_VLANG_PREFIX${SPACESHIP_VLANG_SYMBOL}v$v_version$SPACESHIP_VLANG_SUFFIX"
}

# Xcode is an integrated development environment for macOS
spaceship_xcode() {
  local SPACESHIP_XCODE_SHOW_LOCAL="${SPACESHIP_XCODE_SHOW_LOCAL=true}"
  local SPACESHIP_XCODE_SHOW_GLOBAL="${SPACESHIP_XCODE_SHOW_GLOBAL=false}"
  local SPACESHIP_XCODE_PREFIX="${SPACESHIP_XCODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_XCODE_SUFFIX="${SPACESHIP_XCODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_XCODE_SYMBOL="${SPACESHIP_XCODE_SYMBOL="🛠 "}"
  local SPACESHIP_XCODE_COLOR="${SPACESHIP_XCODE_COLOR="%F{blue}"}"

  spaceship::exists xcenv || return

  local xcode_path
  if [[ $SPACESHIP_XCODE_SHOW_GLOBAL == true ]] ; then
    xcode_path=$(xcenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_XCODE_SHOW_LOCAL == true ]] ; then
    if xcenv version | grep ".xcode-version" > /dev/null; then
      xcode_path=$(xcenv version | sed 's/ .*//')
    fi
  fi

  if [ -n "${xcode_path}" ]; then
    local xcode_version_path=$xcode_path"/Contents/version.plist"
    if [ -f ${xcode_version_path} ]; then
      if spaceship::exists defaults; then
        local xcode_version=$(defaults read ${xcode_version_path} CFBundleShortVersionString)

        echo -n "$SPACESHIP_XCODE_COLOR$SPACESHIP_XCODE_PREFIX${SPACESHIP_XCODE_SYMBOL}${xcode_version}$SPACESHIP_XCODE_SUFFIX"
      fi
    fi
  fi
}

# Zig is a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software
spaceship_zig() {
  local SPACESHIP_ZIG_SHOW="${SPACESHIP_ZIG_SHOW=true}"
  local SPACESHIP_ZIG_ASYNC="${SPACESHIP_ZIG_ASYNC=true}"
  local SPACESHIP_ZIG_PREFIX="${SPACESHIP_ZIG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_ZIG_SUFFIX="${SPACESHIP_ZIG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_ZIG_SYMBOL="${SPACESHIP_ZIG_SYMBOL="⚡ "}"
  local SPACESHIP_ZIG_COLOR="${SPACESHIP_ZIG_COLOR="%F{yellow}"}"

  # If SPACESHIP_ZIG_SHOW is false, don't show zig section
  [[ $SPACESHIP_ZIG_SHOW == false ]] && return

  # Check if zig command is available for execution
  spaceship::exists zig || return

  # Show zig section only when there are zig-specific files in current
  # working directory.
  local is_zig_context="$(spaceship::upsearch build.zig)"
  [[ -n "$is_zig_context" || -n *.zig(#qN^/) ]] || return

  local zig_version="$(zig version)"

  # Display zig section
  echo -n "$SPACESHIP_ZIG_COLOR$SPACESHIP_ZIG_PREFIX${SPACESHIP_ZIG_SYMBOL}v$zig_version$SPACESHIP_ZIG_SUFFIX"
}
#------------------------------------------------------------------------------#
prompt_setup "$@"
[[ ! -s "$HOME/.alert" ]] || echo "\e[31m>\e[91m>\e[33m>\e[93m Check ~/.alert\n"
#------------------------------------------------------------------------------#
################################# END OF ZSHRC #################################
#------------------------------------------------------------------------------#
