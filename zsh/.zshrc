#--------------------------------------------------------------------------------------------------#
########################################## BEGIN OF ZSHRC ##########################################
#--------------------------------------------------------------------------------------------------#
# Environment
cdpath=(.. ~)
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM='wayland'
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export LESS='-R --mouse --wheel-lines=3'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

editors=(nvim io.neovim.nvim vim nano)
for ed in ${editors[@]}; do
  if (( ${+commands[$ed]} )); then
    export EDITOR=$ed
    export VISUAL=$EDITOR
    break
  fi
done

# https://github.com/trapd00r/LS_COLORS/blob/master/lscolors.sh
export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGELOG=38;5;220;1:*CHANGELOG.md=38;5;220;1:*CHANGES=38;5;220;1:*CODEOWNERS=38;5;220;1:*CONTRIBUTING=38;5;220;1:*CONTRIBUTING.md=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;155:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LICENSE.md=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*authorized_keys=1:*cfg=1:*conf=1:*config=1:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=1:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;137;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;192;3:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.astro=38;5;135;1:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bak=38;5;241:*.bash=38;5;172:*.bash_login=1:*.bash_logout=1:*.bash_profile=1:*.bat=38;5;172:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.chm=38;5;141:*.cjs=38;5;074;1:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;079;1:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;105;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;60:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.ejs=38;5;135;1:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;90;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.fish=38;5;172:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;97:*.git=38;5;197:*.gitattributes=38;5;240:*.github=38;5;197:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hjson=38;5;178:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.http=38;5;90;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=1:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;079;1:*.jhtm=38;5;125;1:*.jpeg=38;5;97:*.jpg=38;5;97:*.js=38;5;074;1:*.jsm=38;5;079;1:*.json=38;5;178:*.json5=38;5;178:*.jsonc=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.jsp=38;5;079;1:*.jsx=38;5;074;1:*.jxl=38;5;97:*.kak=38;5;172:*.key=38;5;166:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;105;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;60:*.log=38;5;190:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;184:*.md=38;5;184:*.md5=38;5;116:*.mdb=38;5;60:*.mde=38;5;60:*.mdump=38;5;241:*.mdx=38;5;184:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;114:*.ml=38;5;81:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;114:*.mp3=38;5;137;1:*.mp4=38;5;114:*.mp4a=38;5;137;1:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;135;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;178:*.nds=38;5;213:*.nes=38;5;213:*.nfo=38;5;184:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.norg=38;5;184:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;111:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;242:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;241:*.otf=38;5;66:*.out=38;5;242:*.p12=38;5;192;3:*.p7s=38;5;192;3:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;192;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.pk3=38;5;215:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;97:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=1:*.properties=38;5;116:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pug=38;5;135;1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;41:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;105;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;105;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;172:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.sql=38;5;222:*.sqlite=38;5;60:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svelte=38;5;135;1:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;178:*.torrent=38;5;116:*.ts=38;5;074;1:*.tsv=38;5;78:*.tsx=38;5;074;1:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;253:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.vue=38;5;135;1:*.war=38;5;215:*.wav=38;5;136;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=1:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;178:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;178:*.yml=38;5;178:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:';

# Make SSH work with GNUPG
export GPG_TTY=$(tty)
SSH_AGENT_PID=''
SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

[[ -z $ZDOTDIR ]] && ZDOTDIR="$HOME"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$XDG_DATA_HOME/npm/bin" ]] && export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
[[ -d "$XDG_DATA_HOME/cargo/bin" ]] && export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
[[ (( ${+commands[plasmashell]} )) ]] && export GTK_USE_PORTAL=0 || export QT_QPA_PLATFORMTHEME='gnome'
[[ "$EUID" != 0 ]] && umask 022 && s_local='--user' || umask 002
[[ "$LANG" == 'C'  || "$LANG" == '' ]] &&
  echo "$(date '+%Y-%m-%d %H:%M:%S') - The \$LANG ($LANG) variable is not set." >> "$HOME/.alert"

systemctl $s_local import-environment EDITOR VISUAL \
  XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME LS_COLORS MOZ_ENABLE_WAYLAND \
  QT_QPA_PLATFORM QT_QPA_PLATFORMTHEME GTK_USE_PORTAL 2>/dev/null; unset s_local
#--------------------------------------------------------------------------------------------------#
############################################## General #############################################
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
# ZSH stuff
HISTFILE="$XDG_STATE_HOME/zsh/zshist"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
[[ ! -d "$XDG_CONFIG_HOME/zsh" || ! -d "$XDG_CACHE_HOME" || ! -d "$XDG_DATA_HOME/zsh" \
|| ! -d "$XDG_STATE_HOME/zsh"  || ! -d "$ZDOTDIR" ]] && mkdir -p "$XDG_DATA_HOME/zsh" \
"$ZDOTDIR" "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME/zsh" "$XDG_STATE_HOME/zsh" >/dev/null 2>&1
#--------------------------------------------------------------------------------------------------#
# Completion
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zcompdump"
zmodload zsh/complist

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
# Define word separators (for stuff like backward-word, forward-word,
# backward-kill-word,..)
# WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' # default
# WORDCHARS=.
# WORDCHARS='*?_[]~=&;!#$%^(){}'
# WORDCHARS='${WORDCHARS:s@/@}'
WORDCHARS='*~&%^'
#--------------------------------------------------------------------------------------------------#
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

bindkey '^H' backward-kill-word                           # Control + Backspace
bindkey '^[[3^' kill-word                                 # Control + Delete
bindkey '^[[3;5~' kill-word                               # Control + Delete
bindkey '^[[7~' beginning-of-line                         # Home key
bindkey '^[[H' beginning-of-line                          # Home key
bindkey -M vicmd '^[[7~' beginning-of-line                # Home key
bindkey -M vicmd '^[[H' beginning-of-line                 # Home key
bindkey '^[[8~' end-of-line                               # End key
bindkey '^[[F' end-of-line                                # End key
bindkey -M vicmd '^[[8~' end-of-line                      # End key
bindkey -M vicmd '^[[F' end-of-line                       # End key
#--------------------------------------------------------------------------------------------------#
# Vim Mapping For Completion
# https://thevaluable.dev/zsh-install-configure-mouseless/
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
############################################## Plugins #############################################
#--------------------------------------------------------------------------------------------------#
exist() { (( ${+commands[$1]} )) }
fetch() {
  if exist curl; then
    curl -fsSL -- "$1"
  elif exist wget; then
    wget -qO- -- "$1"
  else
    echo 'error: `curl` nor `wget` found'
  fi
}
#--------------------------------------------------------------------------------------------------#
# asdf
source /opt/asdf-vm/asdf.sh 2>/dev/null
#--------------------------------------------------------------------------------------------------#
# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null
#--------------------------------------------------------------------------------------------------#
# fzf
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null
#--------------------------------------------------------------------------------------------------#
# zsh-async
if [[ -s "$XDG_DATA_HOME/zsh/async.zsh" ]]; then
  source "$XDG_DATA_HOME/zsh/async.zsh"
else
  echo 'Downloading zsh-async...'
  fetch 'https://raw.githubusercontent.com/mafredri/zsh-async/master/async.zsh' \
    > "$XDG_DATA_HOME/zsh/async.zsh"
  source "$XDG_DATA_HOME/zsh/async.zsh" ||
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-async" >> "$HOME/.alert"
fi
#--------------------------------------------------------------------------------------------------#
# Auto Suggestions
load_autoSuggestions() {
  local plugin='zsh-autosuggestions.zsh'
  if [[ -s "/usr/share/zsh/plugins/zsh-autosuggestions/$plugin" ]]; then
    source "/usr/share/zsh/plugins/zsh-autosuggestions/$plugin"
  elif [[ -s "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh" ]]; then
    source "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh"
  else
    echo 'Downloading zsh-autosuggestions...'
    fetch "https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/$plugin" \
      > "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh"
    source "$XDG_DATA_HOME/zsh/zsh-autosuggestions.zsh"
  fi
}
if load_autoSuggestions; then
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,underline'
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  zmodload zsh/zpty
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-autosuggestions.zsh" >> "$HOME/.alert"
fi
#--------------------------------------------------------------------------------------------------#
# Completions
if [[ ! -d '/usr/share/licenses/zsh-completions' ]]; then
  if  [[ -d "$XDG_DATA_HOME/zsh/zsh-completions" ]]; then
    source "$XDG_DATA_HOME/zsh/zsh-completions/zsh-completions.plugin.zsh"
  else
    echo 'Downloading zsh-completions...'

    [[ -f "$XDG_CACHE_HOME/zsh-completions-master.zip" ]] ||
      fetch 'https://github.com/zsh-users/zsh-completions/archive/refs/heads/master.zip' \
      > "$XDG_CACHE_HOME/zsh-completions-master.zip"

    unzip -uq "$XDG_CACHE_HOME/zsh-completions-master.zip" \
      zsh-completions-master/{zsh-completions.plugin.zsh,"src/*"} \
      -d "$XDG_DATA_HOME/zsh" 2>/dev/null

    \mv "$XDG_DATA_HOME/zsh/zsh-completions-master" \
      "$XDG_DATA_HOME/zsh/zsh-completions" 2>/dev/null

    source "$XDG_DATA_HOME/zsh/zsh-completions/zsh-completions.plugin.zsh" ||
      echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-completions.zsh" >> "$HOME/.alert"
  fi
fi
#--------------------------------------------------------------------------------------------------#
# History substring search
load_historySubstringSearch() {
  local plugin='zsh-history-substring-search.zsh'
  if [[ -s "/usr/share/zsh/plugins/zsh-history-substring-search/$plugin" ]]; then
    source "/usr/share/zsh/plugins/zsh-history-substring-search/$plugin"
  elif [[ -s "$XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh" ]]; then
    source "$XDG_DATA_HOME/zsh/zsh-history-substring-search.zsh"
  else
    echo 'Downloading zsh-history-substring-search...'
    fetch \
      "https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/${plugin}" \
      > "$XDG_DATA_HOME/zsh/${pluginName}"
    source "$XDG_DATA_HOME/zsh/${pluginName}"
  fi
}
if load_historySubstringSearch; then
  zmodload zsh/terminfo
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   history-substring-search-up
  [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" history-substring-search-down
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-history-substring-search.zsh" \
    >> "$HOME/.alert"
  autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
  [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
fi
#--------------------------------------------------------------------------------------------------#
# Syntax highlighting
if [[ -s '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ]]; then
  source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
elif [[ -s "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  echo 'Downloading zsh-syntax-highlighting...'

  [[ -f "$XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip" ]] ||
    fetch 'https://github.com/zsh-users/zsh-syntax-highlighting/archive/refs/heads/master.zip' \
    > "$XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip"

  unzip -uq "$XDG_CACHE_HOME/zsh-syntax-highlighting-master.zip" \
    zsh-syntax-highlighting-master/\
    {zsh-syntax-highlighting.zsh,"highlighters/*",.revision-hash,.version} \
    -d "$XDG_DATA_HOME/zsh" 2>/dev/null

  \mv "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting-master" \
    "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/" 2>/dev/null

  source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ||
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load zsh-syntax-highlighting.zsh" \
    >> "$HOME/.alert"
fi
#--------------------------------------------------------------------------------------------------#
############################################### Tmux ###############################################
#--------------------------------------------------------------------------------------------------#
exec_term() {
  if exist alacritty; then
    alacritty --working-directory "$HOME"
  elif exist wezterm; then
    wezterm start --cwd "$HOME"
  elif exist org.wezfurlong.wezterm; then
    org.wezfurlong.wezterm start --cwd "$HOME"
  fi
}

xterm_fallback() {
  if exist alacritty; then
    alacritty "$@"
  elif exist wezterm; then
    wezterm start --cwd "$PWD" "$@"
  elif exist org.wezfurlong.wezterm; then
    org.wezfurlong.wezterm start --cwd "$PWD" "$@"
  fi
}

tmux_xterm() {
  zsh "$XDG_DATA_HOME/zsh/theme.sh" 2>/dev/null

  if ! exist tmux; then
    xterm_fallback; return
  fi

  case $TTY in
    /dev/ttyS[0-9]*) local is_tty=1 ;;
  esac

  local tmux_session="$(tmux list-sessions &>/dev/null | grep main)"
  [[ -z "$1" ]] && local args=("$HOME") || local args=("$@")
  [[ -n $tmux_session ]] || tmux new-session -ds main -c "$HOME" 2>/dev/null

  if grep -q attached <<< "$tmux_session" && [[ -z $is_tty ]]; then
    unset att_tmux; tmux neww -t=main -c "$args[@]"
  elif [[ -z "$*" ]]; then
    export att_tmux=1; exec_term
  else
    tmux neww -t=main -c "$args[@]"
    export att_tmux=1; exec_term
  fi
}
"$@"

tmux_attach() {
  if ! exist tmux; then
    echo 'error: `tmux` not found'; return 1
  fi

  local tmux_session="$(tmux list-sessions &>/dev/null | grep main)"
  NEW_LINE_BEFORE_PROMPT=1; unset att_tmux

  if grep -q attached <<< "$tmux_session"; then
    tmux neww -t=main -c "$PWD" && tmux a -t=main
  elif [[ $tmux_session ]]; then
    tmux a -t=main
  else
    tmux new -As main -c "$PWD"
  fi
}

bindkey -s '^[c' ' tmux_attach^M'
[[ -z $att_tmux ]] || tmux_attach
#--------------------------------------------------------------------------------------------------#
############################################## Aliases #############################################
#--------------------------------------------------------------------------------------------------#
if [[ -f "$XDG_CONFIG_HOME/zsh/aliases.zsh" ]]; then
  source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
else
  echo 'Downloading aliases.zsh...'
  fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/aliases.zsh' \
    > "$XDG_CONFIG_HOME/zsh/aliases.zsh"
  source "$XDG_CONFIG_HOME/zsh/aliases.zsh" ||
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load aliases.zsh" \
    >> "$HOME/.alert"
fi
#--------------------------------------------------------------------------------------------------#
############################################ Arch Config ###########################################
#--------------------------------------------------------------------------------------------------#
if [[ -f "$XDG_CONFIG_HOME/zsh/arch.zsh" ]]; then
  source "$XDG_CONFIG_HOME/zsh/arch.zsh"
else
  echo 'Downloading arch.zsh...'
  fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/arch.zsh' \
    > "$XDG_CONFIG_HOME/zsh/arch.zsh"
  source "$XDG_CONFIG_HOME/zsh/arch.zsh" ||
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load arch.zsh" \
    >> "$HOME/.alert"
fi
#--------------------------------------------------------------------------------------------------#
############################################## Prompt ##############################################
#--------------------------------------------------------------------------------------------------#
if [[ -f "$XDG_CONFIG_HOME/zsh/prompt.zsh" ]]; then
  source "$XDG_CONFIG_HOME/zsh/prompt.zsh"
else
  echo 'Downloading prompt.zsh...'
  fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/zsh/prompt.zsh' \
    > "$XDG_CONFIG_HOME/zsh/prompt.zsh"
  source "$XDG_CONFIG_HOME/zsh/prompt.zsh" ||
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to load prompt.zsh" \
    >> "$HOME/.alert"
fi
#--------------------------------------------------------------------------------------------------#
############################################## Alert ###############################################
#--------------------------------------------------------------------------------------------------#
[[ ! -s "$HOME/.alert" ]] || echo "\e[31m>\e[91m>\e[33m>\e[93m Check ~/.alert\n"
#--------------------------------------------------------------------------------------------------#
########################################### END OF ZSHRC ###########################################
#--------------------------------------------------------------------------------------------------#
