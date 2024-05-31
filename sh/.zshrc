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

asdf_paths=("/opt/asdf-vm" "$HOME/.asdf" "$XDG_DATA_HOME/asdf")
for p in "${asdf_paths[@]}"; do
  export ASDF_DIR="$p"
  source "$p/asdf.sh" 2>/dev/null
  if [[ "$?" -eq 0 ]]; then
    [[ -d "$XDG_DATA_HOME/asdf" ]] || mkdir "$XDG_DATA_HOME/asdf"
    fpath=(${ASDF_DIR}/completions $fpath)
    export ASDF_DATA_DIR="$ASDF_DIR"
    export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY="latest_available"
    export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=".local/share/asdf/tool-versions"
    break
  fi
done

editors=(nvim io.neovim.nvim vim nano)
for ed in ${editors[@]}; do
  if (( ${+commands[$ed]} )); then
    export EDITOR=$ed
    export VISUAL=$EDITOR
    break
  fi
done

# https://github.com/trapd00r/LS_COLORS/blob/master/lscolors.sh
export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.br=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGELOG=38;5;220;1:*CHANGELOG.md=38;5;220;1:*CHANGES=38;5;220;1:*CODEOWNERS=38;5;220;1:*CONTRIBUTING=38;5;220;1:*CONTRIBUTING.md=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;155:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LICENSE.md=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*authorized_keys=1:*cfg=1:*conf=1:*config=1:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=1:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;137;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;192;3:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.astro=38;5;135;1:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bak=38;5;241:*.bash=38;5;172:*.bash_login=1:*.bash_logout=1:*.bash_profile=1:*.bat=38;5;172:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.chm=38;5;141:*.cjs=38;5;074;1:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;079;1:*.comp=38;5;136:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;105;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;60:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.ejs=38;5;135;1:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;90;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.fish=38;5;172:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.frag=38;5;136:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;97:*.git=38;5;197:*.gitattributes=38;5;240:*.github=38;5;197:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hjson=38;5;178:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.http=38;5;90;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=1:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;079;1:*.jhtm=38;5;125;1:*.jpeg=38;5;97:*.jpg=38;5;97:*.js=38;5;074;1:*.jsm=38;5;079;1:*.json=38;5;178:*.json5=38;5;178:*.jsonc=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.jsp=38;5;079;1:*.jsx=38;5;074;1:*.jxl=38;5;97:*.kak=38;5;172:*.key=38;5;166:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;105;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;60:*.log=38;5;190:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;184:*.md=38;5;184:*.md5=38;5;116:*.mdb=38;5;60:*.mde=38;5;60:*.mdump=38;5;241:*.mdx=38;5;184:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;114:*.ml=38;5;81:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;114:*.mp3=38;5;137;1:*.mp4=38;5;114:*.mp4a=38;5;137;1:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;135;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;178:*.nds=38;5;213:*.nes=38;5;213:*.nfo=38;5;184:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.norg=38;5;184:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;111:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;242:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;241:*.otf=38;5;66:*.out=38;5;242:*.p12=38;5;192;3:*.p7s=38;5;192;3:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;192;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.pk3=38;5;215:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;97:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=1:*.properties=38;5;116:*.prql=38;5;222:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pug=38;5;135;1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;41:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;105;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;105;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;172:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.spv=38;5;217:*.sql=38;5;222:*.sqlite=38;5;60:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svelte=38;5;135;1:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;178:*.torrent=38;5;116:*.ts=38;5;074;1:*.tsv=38;5;78:*.tsx=38;5;074;1:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;253:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vert=38;5;136:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.vue=38;5;135;1:*.war=38;5;215:*.wav=38;5;136;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wgsl=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=1:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;178:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;178:*.yml=38;5;178:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:'

# Make SSH work with GNUPG
[[ -d "$GNUPGHOME" ]] || { mkdir -p "$GNUPGHOME" && chmod 700 "$GNUPGHOME" }
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

[[ -z $ZDOTDIR ]] && ZDOTDIR="$HOME"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$XDG_DATA_HOME/npm/bin" ]] && export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
[[ -d "$XDG_DATA_HOME/cargo/bin" ]] && export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
[[ "$EUID" != 0 ]] && { umask 022 && s_local='--user' } || umask 002
[[ "$LANG" == 'C' || "$LANG" == '' ]] &&
  echo "$(date '+%Y-%m-%d %H:%M:%S') - The \$LANG ($LANG) variable is not set." >> "$HOME/.alert"
(( ${+commands[plasmashell]} )) && export GTK_USE_PORTAL=0 || export QT_WAYLAND_DECORATION='adwaita'

systemctl $s_local import-environment EDITOR VISUAL \
  XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME LS_COLORS \
  GTK_USE_PORTAL QT_WAYLAND_DECORATION 2>/dev/null; unset s_local
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
{
  zcompdump="$XDG_CACHE_HOME/zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    if mkdir "${zcompdump}.zwc.lock" 2>/dev/null; then
      zcompile "$zcompdump"
      rmdir  "${zcompdump}.zwc.lock" 2>/dev/null
    fi
  fi
} &!

autoload -Uz compinit
_comp_path="$XDG_CACHE_HOME/zcompdump"
if [[ $_comp_path(#qNmh-20) ]]; then
  compinit -C -d "$_comp_path"
else
  mkdir -p "$_comp_path:h"
  compinit -i -d "$_comp_path"
  touch "$_comp_path"
fi
unset _comp_path
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
b=(-M vicmd)
[[ "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ "${key[Home]}"      ]] && bindkey $b "${key[Home]}"      beginning-of-line
[[ "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ "${key[End]}"       ]] && bindkey $b "${key[End]}"       end-of-line
[[ "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
unset b

# Finally, make sure the terminal is in application mode, when zle is active.
# Only then are the values from $terminfo valid.
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

bindkey          '^[[1;5D' backward-word                    # Control + Left arrow
bindkey          '^[[1;5C' forward-word                     # Control + Right arrow
bindkey          '^[^[[D'  backward-word                    # Control + Left arrow  (OSX)
bindkey          '^[^[[C'  forward-word                     # Control + Right arrow (OSX)

# Tries to set Ctrl + Delete and Ctrl + Backspace to erase prev and next words,
# but terminals are different:
[[ -n "${key[Control-Backspace]}" ]] && bindkey -- "${key[Control-Backspace]}" backward-kill-word
[[ -n "${key[Control-Delete]}"    ]] && bindkey -- "${key[Control-Delete]}"    kill-word

bindkey          '^H'      backward-kill-word               # Control + Backspace
bindkey          '^[[3^'   kill-word                        # Control + Delete
bindkey          '^[[3;5~' kill-word                        # Control + Delete
bindkey          '^[[7~'   beginning-of-line                # Home key
bindkey          '^[[H'    beginning-of-line                # Home key
bindkey -M vicmd '^[[7~'   beginning-of-line                # Home key
bindkey -M vicmd '^[[H'    beginning-of-line                # Home key
bindkey          '^[[8~'   end-of-line                      # End key
bindkey          '^[[F'    end-of-line                      # End key
bindkey -M vicmd '^[[8~'   end-of-line                      # End key
bindkey -M vicmd '^[[F'    end-of-line                      # End key
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
# 1 and 5 = blink; 2 and 6 = no blink
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
############################################### Tools ##############################################
#--------------------------------------------------------------------------------------------------#
exists() { (( ${+commands[$1]} )) }

grepsh() {
  local args=()
  while :; do
    [[ $1 =~ '^-' ]] && { args+=("$1"); shift } || break
  done

  local input="$2" success
  [[ $2 ]] || input="$(</dev/stdin)"
  [[ -f "$2" ]] && input="$(<$2)"

  if [[ ${#args} -gt 1 || ${#input} -gt 2500 || "${args[0]}" =~ '^-[^qvoeE]' ]]; then
    "${commands[grep]}" "${args[@]}" "$1" <<< "$input"; return
  elif [[ "${args[@]}" == '-q' ]]; then
    grepsh::out() { [[ "$1" =~ "$2" ]] && success=1 && break }
  elif [[ "${args[@]}" == '-v' ]]; then
    grepsh::out() { [[ "$1" =~ "$2" ]] || echo "$1" && success=1 }
  elif [[ "${args[@]}" =~ '^-[^\w\s]*o[^\w\s]*' ]]; then
    setopt BASH_REMATCH
    grepsh::out() { [[ "$1" =~ "$2" ]] && echo "$BASH_REMATCH[1]" && success=1 }
  else
    grepsh::out() { [[ "$1" =~ "$2" ]] && echo "$1" && success=1 }
  fi

  while IFS= read -r line; do
    grepsh::out "$line" "$1"
  done <<< "$input"

  [[ $success ]] && return 0
}

fetch() {
  if exists curl; then
    curl -fsSL -- "$1"
  elif exists wget; then
    wget -qO- -- "$1"
  else
    echo 'error: `curl` nor `wget` found'
  fi
}
#--------------------------------------------------------------------------------------------------#
############################################## Plugins #############################################
#--------------------------------------------------------------------------------------------------#
# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null
#--------------------------------------------------------------------------------------------------#
# fzf
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null
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
      "https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/$plugin" \
      > "$XDG_DATA_HOME/zsh/$plugin"
    source "$XDG_DATA_HOME/zsh/$plugin"
  fi
}
if load_historySubstringSearch; then
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=blue'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red'
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
  if exists alacritty; then
    alacritty --working-directory "$HOME"
  elif exists wezterm; then
    wezterm start --cwd "$HOME"
  elif exists org.wezfurlong.wezterm; then
    org.wezfurlong.wezterm start --cwd "$HOME"
  fi
}

xterm_fallback() {
  if exists alacritty; then
    alacritty "$@"
  elif exists wezterm; then
    wezterm start --cwd "$PWD" "$@"
  elif exists org.wezfurlong.wezterm; then
    org.wezfurlong.wezterm start --cwd "$PWD" "$@"
  fi
}

tmux_xterm() {
  sh "$XDG_DATA_HOME/zsh/theme.sh" 2>/dev/null &

  if ! exists tmux; then xterm_fallback "$@"; return; fi
  case $TTY in /dev/ttyS[0-9]*) local is_tty=1 ;; esac

  local tmux_session="$(tmux list-sessions &>/dev/null | grepsh main)"
  [[ -z "$1" ]] && local args=("$HOME") || local args=("$@")
  [[ $tmux_session ]] || tmux new-session -ds main -c "$HOME" 2>/dev/null

  if grepsh -q attached "$tmux_session" && [[ -z $is_tty ]]; then
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
  if ! exists tmux; then echo 'error: `tmux` not found'; return 1; fi

  local tmux_session="$(tmux list-sessions &>/dev/null | grepsh main)"
  unset att_tmux

  if [[ "$tmux_session" ]] && grepsh -q attached "$tmux_session"; then
    tmux neww -t=main -c "$PWD" && tmux a -t=main
  elif [[ "$tmux_session" ]]; then
    tmux a -t=main
  else
    tmux new -As main -c "$PWD"
  fi
  echo; exec zsh
}

bindkey -s '^[c' ' tmux_attach^M'
[[ -z $att_tmux ]] || tmux_attach
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
alias ls='ls -vhNF --color=auto --hyperlink=auto --group-directories-first'
alias la='ls --almost-all'
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

# ls with numerical chmod permissions
# https://stackoverflow.com/questions/1795976/can-the-unix-list-command-ls-output-numerical-chmod-permissions
ll() {
  ls -l --color=always --hyperlink=always "$@" | awk \
    '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));if(k)printf("%0o ",k);print}'
}

# Portable shell through SSH
# https://github.com/romkatv/dotfiles-public/blob/6dfc6a34e91a8d87bb0716cf7c6f8e57487efb78/bin/ssh.zsh
ssh() {
  emulate zsh -o pipefail -o extended_glob

  # If there is no zsh on the remote machine, install this.
  local zsh_url='https://raw.githubusercontent.com/romkatv/zsh-bin/master/install'
  # If there is no ~/.zshrc on the remote machine, install this.
  local zshrc_url='https://raw.githubusercontent.com/brunolpsousa/dotfiles/main/sh/.zshrc'

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
  fetch https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/sh/.zshrc > "$ZDOTDIR/.zshrc.tmp"
  [[ -s "$ZDOTDIR/.zshrc.tmp" ]] || { rm -I "$ZDOTDIR/.zshrc.tmp"; return 1 }
  \mv "$ZDOTDIR/.zshrc.tmp" "$ZDOTDIR/.zshrc"
  exec zsh
}

ompupd() {
  [[ -d "$HOME/.local/bin" ]] || (mkdir "$HOME/.local/bin" && export PATH="$HOME/.local/bin:$PATH")
  fetch https://ohmyposh.dev/install.sh > "$HOME/.local/bin/omp.tmp"
  [[ -s "$HOME/.local/bin/omp.tmp" ]] || { rm -I "$HOME/.local/bin/omp.tmp"; return 1 }
  <"$HOME/.local/bin/omp.tmp" | bash -s -- -d "$HOME/.local/bin"
  rm -I "$HOME/.local/bin/omp.tmp"
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
    select yne in 'Yes' 'No' 'Exit'; do
      case $yne in
        Yes )
          [[ -n $zenv ]] || echo '[[ -f "$HOME/.config/zsh/.zshrc" ]] && ' \
            'ZDOTDIR="$HOME/.config/zsh" || ZDOTDIR="$HOME"'             | \
            $use_sudo tee -a /etc/zsh/zshenv >/dev/null
          [[ -n $zprof ]] || echo 'source "$ZDOTDIR/.zshrc"'             | \
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
        $use_sudo pacman -Syu --needed \
          fzf ripgrep neofetch yt-dlp man-db tldr \
          base-devel pkgstats reflector networkmanager \
          pipewire pipewire-alsa pipewire-pulse wireplumber \
          android-udev android-tools zsh ttf-jetbrains-mono-nerd \
          xdg-desktop-portal xdg-desktop-portal-gtk lib32-gst-plugins-good \
          hunspell-en_US gsfonts noto-fonts noto-fonts-cjk noto-fonts-emoji \
          sbctl ufw iptables-nft dosfstools exfat-utils ntfs-3g unrar zip p7zip imagemagick \
          zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting \
          $(case $(lscpu | awk '/Model name:/{print $3}') in
          AMD) echo -n 'amd-ucode libva-mesa-driver mesa-vdpau';;
          Intel\(R\)) echo -n 'intel-ucode intel-media-driver libva-intel-driver';;
          esac)

        echo 'Do you wish to use Flatpak [y/N]?' && read flatpk

        if [[ "$flatpk" =~ '^[yY]' ]]; then
          $use_sudo pacman -S --needed flatpak
        else
          flatpk='N'
          if exists flatpak; then
            echo '\e[31mwarning:\033[0m flatpak is installed\n'
          fi

          if exists brave && ! grep -q MiddleClickAutoscroll \
            "$XDG_DATA_HOME/applications/brave-browser.desktop" 2>/dev/null; then
            \cp /usr/share/applications/brave-browser.desktop "$XDG_DATA_HOME/applications"
            sed -i 's/^\(Exec=brave\)/\1 --enable-blink-features=MiddleClickAutoscroll/' \
              "$XDG_DATA_HOME/applications/brave-browser.desktop"
          fi
        fi

        if [[ "$EUID" != 0 ]]; then
          if [[ "$flatpk" =~ '^[yY]' ]] && exists flatpak; then
            \mkdir -p "$XDG_DATA_HOME/icons"
            \mkdir -p "$XDG_DATA_HOME/flatpak/exports/share/applications"
            local qbt_tray='qbittorrent/qBittorrent/master/src/icons/qbittorrent-tray.svg'

            fetch "https://raw.githubusercontent.com/${qbt_tray}" \
              > "$XDG_DATA_HOME/icons/qbittorrent-tray.png"

            flatpak install \
              org.mozilla.firefox org.freedesktop.Platform.ffmpeg-full com.brave.Browser \
              io.mpv.Mpv org.qbittorrent.qBittorrent org.kde.PlatformTheme.QGnomePlatform com.valvesoftware.Steam

            if ! grep -q MiddleClickAutoscroll \
              "$XDG_DATA_HOME/flatpak/exports/share/applications/com.brave.Browser.desktop" \
              2>/dev/null; then
              \cp \
                '/var/lib/flatpak/app/com.brave.Browser/current/active/export/share/applications/com.brave.Browser.desktop' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/"

              sed -i \
                's/\(\@\@u\)/\1 --enable-blink-features=MiddleClickAutoscroll/' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/com.brave.Browser.desktop"
            fi

            if ! grep -q "sh -c" \
              "$XDG_DATA_HOME/flatpak/exports/share/applications/com.valvesoftware.Steam.desktop" \
              2>/dev/null; then
              \cp \
                '/var/lib/flatpak/app/com.valvesoftware.Steam/current/active/export/share/applications/com.valvesoftware.Steam.desktop' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/"

              sed -i \
                's/^\(Exec=\)\/usr\/bin\/flatpak/\1sh -c "rm ~\/.var\/app\/com.valvesoftware.Steam\/{Musics,Pictures}; nohup \/usr\/bin\/flatpak/;
                  /Exec=sh/ s/$/ >\/dev\/null \& sleep 3 \&\& rm ~\/.var\/app\/com.valvesoftware.Steam\/{Musics,Pictures}"/' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/com.valvesoftware.Steam.desktop"
            fi

            if ! grep -q "sh -c" \
              "$XDG_DATA_HOME/flatpak/exports/share/applications/com.heroicgameslauncher.hgl.desktop" \
              2>/dev/null; then
              \cp \
                '/var/lib/flatpak/app/com.heroicgameslauncher.hgl/current/active/export/share/applications/com.heroicgameslauncher.hgl.desktop' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/"

              sed -i \
                's/^\(Exec=\)\/usr\/bin\/flatpak/\1sh -c "rm ~\/.var\/app\/com.heroicgameslauncher.hgl\/{Desktop,Documents}; nohup \/usr\/bin\/flatpak/;
                  /Exec=sh/ s/$/ >\/dev\/null \& sleep 3 \&\& rm ~\/.var\/app\/com.heroicgameslauncher.hgl\/{Desktop,Documents}"/' \
                "$XDG_DATA_HOME/flatpak/exports/share/applications/com.heroicgameslauncher.hgl.desktop"
            fi

            echo 'Do you wish to install Flatpak Neovim [y/N]?' && read flpk_nvim
            if [[ "$flpk_nvim" =~ '^[yY]' ]]; then
              flatpak install io.neovim.nvim org.freedesktop.Sdk.Extension.node18
              flatpak override -u --env=FLATPAK_ENABLE_SDK_EXT=node18 io.neovim.nvim
              [[ ! -x /usr/bin/rg ]] || $use_sudo \
                cp /usr/bin/rg /var/lib/flatpak/app/io.neovim.nvim/current/active/files/bin
            else
              sudo pacman -S --needed neovim npm
            fi
            unset flpk_nvim
          else
            sudo pacman -S --needed firefox mpv steam qbittorrent qt6-wayland
            npm config set audit=false fund=false progress=off install-strategy=shallow
          fi

          if [[ ! -x /usr/bin/paru ]]; then
            \mkdir -p "$XDG_CACHE_HOME/paru/clone"
            git clone 'https://aur.archlinux.org/paru-bin' "$XDG_CACHE_HOME/paru/clone/paru-bin"
            local current_dir="$PWD"
            cd -q "$XDG_CACHE_HOME/paru/clone/paru-bin"
            makepkg -sir
            cd -q "$current_dir"
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
          echo -e 'vm.swappiness=10\nvm.vfs_cache_pressure=50\nvm.max_map_count=2147483642'    \
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
            "LC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\n"                \
            "LC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;
    echo -e "KEYMAP=br-abnt2\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'

  local US='localectl --no-convert set-x11-keymap us pc105 intl;
    setxkbmap -model pc105 -layout us -variant intl;
    echo -e "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\n" \
            "LC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\n"                \
            "LC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;
    echo -e "KEYMAP=us-acentos\nFONT=eurlatgr\nFONT_MAP=8859-1" | tee /etc/vconsole.conf'

  local both='localectl --no-convert set-x11-keymap us,br pc105 intl,;
    setxkbmap -model pc105 -layout us,br -variant intl,;
    echo -e "LANG=en_US.UTF-8\nLANGUAGE=\"en_US\"\nLC_TYPE=pt_BR.UTF-8\nLC_NUMERIC=pt_BR.UTF-8\n" \
            "LC_TIME=pt_BR.UTF-8\nLC_MONETARY=pt_BR.UTF-8\nLC_PAPER=pt_BR.UTF-8\n"
            "LC_MEASUREMENT=pt_BR.UTF-8" | tee /etc/locale.conf;
    echo -e "KEYMAP=us-acentos\nKEYMAP_TOGGLE=br-abnt2\nFONT=eurlatgr\nFONT_MAP=8859-1" |         \
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
          # mpv config
          if exists mpv || exists io.mpv.Mpv; then
            exists mpv && local baseMpv="$XDG_CONFIG_HOME" ||
              local baseMpv="$HOME/.var/app/io.mpv.Mpv/config"

            \mkdir -p "$baseMpv"/mpv/{scripts,scripts-opts}
            echo 'idle=yes\nvolume=25\nautofit-smaller=75%x75%\nautofit-larger=75%x75%'      \
                 '\nvo=dmabuf-wayland\nhwdec=auto-safe\nhwdec-codecs=h264,vc1,hevc,vp8,vp9'  \
                 '\nao=pipewire\nhls-bitrate=max\ngpu-context=wayland\nprofile=high-quality' \
                 '\nvf=denoise_vaapi,scale_vaapi=hq' > "$baseMpv/mpv/mpv.conf"

            echo 'Ctrl+q quit\nF11 cycle fullscreen\nENTER cycle fullscreen'                      \
                 '\nKP_ENTER cycle fullscreen\nWHEEL_UP osd-msg-bar seek 3'                       \
                 '\nWHEEL_DOWN osd-msg-bar seek -3\nLEFT osd-msg-bar seek -5'                     \
                 '\nRIGHT osd-msg-bar seek  5\nUP osd-msg-bar seek 15\nDOWN osd-msg-bar seek -15' \
                 '\nkp9 add volume -2\nkp0 add volume 2' > "$baseMpv/mpv/input.conf"

            fetch                                                                                        \
              'https://raw.githubusercontent.com/brunolpsousa/mpv-nextfile/master/nextfile.lua'          \
              > "$baseMpv/mpv/scripts/nextfile.lua"
            fetch                                                                                        \
              'https://raw.githubusercontent.com/jonniek/mpv-playlistmanager/master/playlistmanager.lua' \
              > "$baseMpv/mpv/scripts/playlistmanager.lua"
            fetch                                                                                        \
              'https://raw.githubusercontent.com/dfaker/VR-reversal/master/360plugin.lua'                \
              > "$baseMpv/mpv/scripts/360plugin.lua"
            fetch                                                                                        \
              'https://raw.githubusercontent.com/dfaker/VR-reversal/master/script-opts/360plugin.conf'   \
              > "$baseMpv/mpv/scripts-opts/360plugin.conf"

            sed -i 's/\(key_loadfiles = "\)"/\1CTRL+l"/g' "$baseMpv/mpv/scripts/playlistmanager.lua"
          fi

          # Firefox config
          echo 'Do you wish to create Firefox config in "$HOME/chrome" [y/N]?'
          local firefoxcfg; read firefoxcfg
          if [[ $firefoxcfg =~ '^[yY]' ]]; then
            mkdir "$HOME/chrome"
            fetch 'https://raw.githubusercontent.com/brunolpsousa/dotfiles/main/firefox/userChrome.css'  \
              > "$HOME/chrome/userChrome.css"
            fetch 'https://raw.githubusercontent.com/brunolpsousa/dotfiles/main/firefox/userContent.css' \
              > "$HOME/chrome/userContent.css"
            fetch 'https://raw.githubusercontent.com/brunolpsousa/dotfiles/main/firefox/img'             \
              > "$HOME/chrome/img"
          fi

          # Git config
          if [[ ! -f "$XDG_CONFIG_HOME/git/config" ]]; then
            echo 'Do you wish to set up git?'
            select yne in 'Yes' 'No' 'Exit'; do
              case $yne in

                Yes )
                  mkdir "$XDG_CONFIG_HOME/git"
                  touch "$XDG_CONFIG_HOME/git/config"
                  git config --global init.defaultBranch main

                  local gitName
                  echo -n 'Enter your name: '; read gitName
                  [[ -z $gitName ]] || git config --global user.name "$gitName"

                  local gitEmail
                  echo -n 'Enter your e-mail: '; read gitEmail
                  [[ -z $gitEmail ]] || git config --global user.email "$gitEmail"

                  gpg --list-keys --with-keygrip
                  local gitSigningKey
                  echo -n 'Enter your signing key if you wish to define it: '; read gitSigningKey
                  [[ -n "$gitSigningKey" ]] &&
                    git config --global user.signingKey "$gitSigningKey" &&
                    git config --global commit.gpgsign true
                  git config --global alias.brcd 'branch --sort=-committerdate'
                  git config --global core.autocrlf input

                  break;;
                No ) break;;
                Exit ) return;;
              esac
            done
          fi

          # Theme
          install_theme() {
            exists alacritty || exists plasmashell || exists gnome-shell || return

            local installTheme
            echo "Do you wish to install Theme script? [y/N]" && read installTheme
            [[ "$installTheme" =~ '^[yY]' ]] && return
          }
          if install_theme; then
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/sh/theme.sh' \
              > "$XDG_DATA_HOME/zsh/theme.sh"
            chmod +x "$XDG_DATA_HOME/zsh/theme.sh"
            zsh "$XDG_DATA_HOME/zsh/theme.sh"
          fi

          # Nerd font config
          local font='JetBrainsMono'
          local ver='3.1.1'
          local nerdcfg
          if [[ ! $(find "$XDG_DATA_HOME/fonts" -name "$font*.ttf" 2>/dev/null) ]] &&
            ! pacman -Qi ttf-jetbrains-mono-nerd &>/dev/null; then
            echo 'Do you wish to install Nerd Fonts? [y/N]?' && read nerdcfg
            if [[ $nerdcfg =~ '^[yY]' ]]; then
              \mkdir -p "$XDG_DATA_HOME/fonts"
              echo 'Downloading Nerd Fonts...'

              [[ -f "$XDG_CACHE_HOME/$font.zip" ]] || fetch                                 \
                "https://github.com/ryanoasis/nerd-fonts/releases/download/v$ver/$font.zip" \
                > "$XDG_CACHE_HOME/$font.zip"

              unzip -q "$XDG_CACHE_HOME/$font.zip" -d "$XDG_DATA_HOME/fonts" 2>/dev/null
              echo "Done. Set $font as default font\n"
            fi
          fi

          # Neovim config
          if [[ "$EDITOR" =~ 'nvim' ]]; then
            useFkNvim() {
              if [[ "$EDITOR" == 'io.neovim.nvim' || $flatpk =~ '^[yY]' ]]; then
                return
              fi
              local useFNvim
              echo 'Configure Flatpak Neovim? [y/N]' && read useFNvim
              [[ "$useFNvim" =~ '^[yY]' ]] && return
            }

            if useFkNvim; then
              local baseNvim="$HOME/.var/app/io.neovim.nvim/config"
            else
              local baseNvim="$XDG_CONFIG_HOME"
            fi

            [[ -f "$baseNvim/config/nvim/init.lua" ]] || fetch               \
              'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/init.lua' \
              > "$baseNvim/nvim/init.lua"

            \mkdir -p "$baseNvim/nvim/spell"
          fi

          # Alacritty config
          if exists alacritty; then
            \mkdir -p "$XDG_CONFIG_HOME/alacritty"

            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/alacritty/alacritty.toml' \
              > "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/alacritty/dark.toml'      \
              > "$XDG_CONFIG_HOME/alacritty/dark.toml"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/alacritty/light.toml'     \
              > "$XDG_CONFIG_HOME/alacritty/light.toml"

            case $(lscpu | awk '/Model name:/{print $3}') in Intel\(R\)) sed -i                  \
              's/\(columns = \)156/\1140/g; s/\(lines = \)43/\134/g'                             \
              "$XDG_CONFIG_HOME/alacritty/alacritty.toml";;
            esac
          fi

          # Tmux config
          # Vim color fix: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
          if exists tmux; then
            local tmuxprefix tmuxbind
            \mkdir -p "$XDG_CONFIG_HOME/tmux"
            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/tmux.conf'          \
              > "$XDG_CONFIG_HOME/tmux/tmux.conf"
            echo "Do you wish to remap tmux's prefix? [y/N]" && read tmuxprefix
            [[ $tmuxprefix =~ '^[yY]' ]] && echo 'Enter a modifier [C/M]:' && read tmuxmod \
              && echo 'Enter a char:' && read tmuxbind

            [[ -n $tmuxbind ]] && echo "# remap prefix from C-b to $tmuxmod-$tmuxbind"     \
              "\nunbind C-b\nset-option -g prefix $tmuxmod-$tmuxbind"                      \
              "\nbind-key $tmuxmod-$tmuxbind send-prefix" >> "$XDG_CONFIG_HOME/tmux/tmux.conf"
          fi

          # Wezterm config
          if exists wezterm || exists org.wezfurlong.wezterm; then
            \mkdir -p "$XDG_CONFIG_HOME/wezterm"

            fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/wezterm.lua'       \
              > "$XDG_CONFIG_HOME/wezterm/wezterm.lua"

            case $(lscpu | awk '/Model name:/{print $3}') in
              Intel\(R\))
                sed -i 's/\(initial_cols = \)166/\1112/g; s/\(initial_rows = \)48/\130/g' \
                "$XDG_CONFIG_HOME/wezterm/wezterm.lua";;
            esac
          fi

          # Xterm config
          if [[ -f '/usr/local/bin/xterm' ]] && ! grep -q tmux_xterm '/usr/local/bin/xterm'; then
            echo && ls -lh '/usr/local/bin/xterm' && echo && cat '/usr/local/bin/xterm' && echo
            echo "Do you wish to delete xterm? [y/N]" && read xtermVar
            [[ $xtermVar =~ '^[yY]' ]] && sudo rm -i '/usr/local/bin/xterm'
          fi
          if [[ ! -f '/usr/local/bin/xterm' ]]; then
            echo '#!/usr/bin/env zsh\nnohup zsh "$ZDOTDIR/.zshrc" tmux_xterm "$@" >/dev/null &' | \
              sudo tee '/usr/local/bin/xterm' >/dev/null
            sudo chmod +x '/usr/local/bin/xterm'

            [[ ! -f '/bin/xterm' ]] || echo "$(date '+%Y-%m-%d %H:%M:%S') - "                     \
              "Warning: /bin/xterm exists and overlaps with /usr/local/bin/xterm"                 \
              >> "$HOME/.alert"
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
            GNOME\ Boxes ) $use_sudo pacman -S --needed gnome-boxes; break;;
            Virt-Manager ) $use_sudo pacman -S --needed \
              virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq swtpm; break;;
            None ) break;;
          esac
        done

        $use_sudo systemctl enable --now libvirtd; $use_sudo virsh net-autostart default

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

      GNOME ) $use_sudo pacman -S --needed                                          \
          xdg-desktop-portal-gnome gst-plugin-pipewire gvfs-mtp                     \
          gnome-shell gnome-session gdm gnome-keyring gnome-control-center nautilus \
          gnome-disk-utility gnome-system-monitor gnome-tweaks gnome-themes-extra   \
          webp-pixbuf-loader ffmpegthumbnailer

        gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
        gsettings --schemadir                                                              \
          ~/.local/share/gnome-shell/extensions/nightthemeswitcher@romainvigier.fr/schemas \
          set org.gnome.shell.extensions.nightthemeswitcher.color-scheme day prefer-light

        if [[ -z "$flatpk" ]]; then
          echo 'Do you wish to use Flatpak [y/N]?'
          read flatpk
        fi

        if [[ "$flatpk" =~ '^[yY]' ]]; then
          exists flatpak || $use_sudo pacman -S flatpak
          flatpak install org.gnome.Loupe org.gnome.FileRoller org.gnome.Calculator \
            org.gnome.Chess org.gnome.Mines
          flatpak override -u --filesystem=host org.gnome.FileRoller
        else
          $use_sudo pacman -S --needed loupe file-roller gnome-calculator gnome-chess gnome-mines
        fi

        echo -e '[Unit]\nDescription=Change Wallpapers\nStartLimitIntervalSec=3'       \
                '\nStartLimitBurst=5\n\n[Service]'                                     \
                "\nExecStart=$XDG_DATA_HOME/zsh/chwp.sh\nRestart=always\nRestartSec=3" \
                '\n\n[Install]\nWantedBy=default.target' |
                $use_sudo tee /etc/systemd/user/chwp.service >/dev/null

        $use_sudo \
          sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=lock/' /etc/systemd/logind.conf
        $use_sudo chmod u+x /etc/systemd/user/chwp.service
        sudo -u \
          gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

        if [[ "$EUID" != 0 ]]; then
          \mkdir -p "$XDG_CONFIG_HOME/zsh" "$XDG_DATA_HOME/nautilus/scripts"

          [[ -f "$XDG_DATA_HOME/zsh/chwp.sh" ]] || fetch                      \
            'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/sh/chwp.sh' \
            > "$XDG_DATA_HOME/zsh/chwp.sh"

          chmod +x "$XDG_DATA_HOME/zsh/chwp.sh"
          echo '#!/usr/bin/env zsh\nxterm "$PWD"' \
            > "$XDG_DATA_HOME/nautilus/scripts/Terminal"
          chmod +x "$XDG_DATA_HOME/nautilus/scripts/Terminal"
          echo 'F4 Terminal' > "$XDG_CONFIG_HOME/nautilus/scripts-accels"
          systemctl --user daemon-reload
          systemctl --user enable --now chwp.service
        fi
        break;;

      KDE ) $use_sudo pacman -S --needed                                                     \
              xdg-desktop-portal-kde plasma-desktop                                          \
              qt5-wayland qt6-wayland sddm sddm-kcm powerdevil bluedevil plasma-nm plasma-pa \
              breeze-gtk kde-gtk-config kdialog kinfocenter kscreen                          \
              plasma-disks plasma-firewall dolphin-plugins ark filelight                     \
              kcalc qt5-imageformats ffmpegthumbs plasma-systemmonitor kwallet-pam           \
              spectacle qt5-virtualkeyboard gwenview kcharselect okular

        echo "\n>>> Do you wish to install KDE Games?\n"
        $use_sudo pacman -S --needed bomber granatier kapman kblocks kfourinline kmines \
          knavalbattle knetwalk kollision kpat ksnakeduel kspaceduel

        [[ -f '/etc/sddm.conf.d/kde_settings.conf' ]] &&
          ! grep -q Breeze_Snow /etc/sddm.conf.d/kde_settings.conf &&
          $use_sudo sed -i \
          '/^RebootCommand/ s/$/\nNumlock=on\nInputMethod=qtvirtualkeyboard/; /=breeze$/ s/$/\
          \nCursorTheme=Breeze_Snow/' /etc/sddm.conf.d/kde_settings.conf

        echo -e '[Unit]\nDescription=Set Theme\n'                                        \
                "\n[Service]\nExecStart=$XDG_DATA_HOME/zsh/theme.sh\n"                   |
                $use_sudo tee /etc/systemd/user/theme.service >/dev/null
        echo -e '[Unit]\nDescription=Set Theme\n\n[Timer]'                               \
                '\nOnCalendar=*-*-* 6:35:00\nOnCalendar=*-*-* 17:45:00\nPersistent=true' \
                '\nUnit=theme.service\n\n[Install]\nWantedBy=default.target'             |
                $use_sudo tee /etc/systemd/user/theme.timer >/dev/null

        # Map Meta (Super) to toggle overview
        kwriteconfig5 --file "$XDG_CONFIG_HOME/kwinrc" --group ModifierOnlyShortcuts --key Meta         \
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
############################################## Prompt ##############################################
#--------------------------------------------------------------------------------------------------#
if [[ ! -s "$ZDOTDIR/omp.json" ]]; then
  fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/sh/omp.json' > "$ZDOTDIR/omp.json"
fi

if ! exists oh-my-posh; then
  ompupd
fi

exists oh-my-posh && eval "$(oh-my-posh init zsh --config $ZDOTDIR/omp.json)"

if [[ ! -s "$ZDOTDIR/omp.json" ]] && ! exists oh-my-posh; then
  [[ -s "$ZDOTDIR/prompt.zsh" ]] ||
    fetch 'https://gitlab.com/brunolpsousa/dotfiles/-/raw/main/sh/prompt.zsh' > "$ZDOTDIR/prompt.zsh"
  [[ -s "$ZDOTDIR/prompt.zsh" ]] && source "$ZDOTDIR/prompt.zsh"
fi
#--------------------------------------------------------------------------------------------------#
############################################## Alert ###############################################
#--------------------------------------------------------------------------------------------------#
[[ ! -s "$HOME/.alert" ]] || echo "\e[31m>\e[91m>\e[33m>\e[93m Check ~/.alert\n"
#--------------------------------------------------------------------------------------------------#
########################################### END OF ZSHRC ###########################################
#--------------------------------------------------------------------------------------------------#
