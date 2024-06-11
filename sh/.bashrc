#--------------------------------------------------------------------------------------------------#
######################################### BEGIN OF BASHRC ##########################################
#--------------------------------------------------------------------------------------------------#
# Environment
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
export HISTCONTROL="ignoreboth:erasedups"

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
  if command -v $ed >/dev/null; then
    export EDITOR=$ed
    export VISUAL=$EDITOR
    break
  fi
done

# https://github.com/trapd00r/LS_COLORS/blob/master/lscolors.sh
export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.br=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGELOG=38;5;220;1:*CHANGELOG.md=38;5;220;1:*CHANGES=38;5;220;1:*CODEOWNERS=38;5;220;1:*CONTRIBUTING=38;5;220;1:*CONTRIBUTING.md=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;155:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LICENSE.md=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*authorized_keys=1:*cfg=1:*conf=1:*config=1:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=1:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;137;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;192;3:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.astro=38;5;135;1:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bak=38;5;241:*.bash=38;5;172:*.bash_login=1:*.bash_logout=1:*.bash_profile=1:*.bat=38;5;172:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.chm=38;5;141:*.cjs=38;5;074;1:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;079;1:*.comp=38;5;136:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;105;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;60:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.ejs=38;5;135;1:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;90;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.fish=38;5;172:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.frag=38;5;136:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;97:*.git=38;5;197:*.gitattributes=38;5;240:*.github=38;5;197:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hjson=38;5;178:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.http=38;5;90;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=1:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;079;1:*.jhtm=38;5;125;1:*.jpeg=38;5;97:*.jpg=38;5;97:*.js=38;5;074;1:*.jsm=38;5;079;1:*.json=38;5;178:*.json5=38;5;178:*.jsonc=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.jsp=38;5;079;1:*.jsx=38;5;074;1:*.jxl=38;5;97:*.kak=38;5;172:*.key=38;5;166:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;105;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;60:*.log=38;5;190:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;184:*.md=38;5;184:*.md5=38;5;116:*.mdb=38;5;60:*.mde=38;5;60:*.mdump=38;5;241:*.mdx=38;5;184:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;114:*.ml=38;5;81:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;114:*.mp3=38;5;137;1:*.mp4=38;5;114:*.mp4a=38;5;137;1:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;135;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;178:*.nds=38;5;213:*.nes=38;5;213:*.nfo=38;5;184:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.norg=38;5;184:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;111:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;242:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;241:*.otf=38;5;66:*.out=38;5;242:*.p12=38;5;192;3:*.p7s=38;5;192;3:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;192;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.pk3=38;5;215:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;97:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=1:*.properties=38;5;116:*.prql=38;5;222:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pug=38;5;135;1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;41:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;105;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;105;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;172:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.spv=38;5;217:*.sql=38;5;222:*.sqlite=38;5;60:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svelte=38;5;135;1:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;178:*.torrent=38;5;116:*.ts=38;5;074;1:*.tsv=38;5;78:*.tsx=38;5;074;1:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;253:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vert=38;5;136:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.vue=38;5;135;1:*.war=38;5;215:*.wav=38;5;136;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wgsl=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=1:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;178:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;178:*.yml=38;5;178:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:'

# Make SSH work with GNUPG
[[ -d "$GNUPGHOME" ]] || { mkdir -p "$GNUPGHOME" && chmod 700 "$GNUPGHOME"; }
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
[[ "$EUID" != 0 ]] && { umask 022 && s_local='--user'; } || umask 002
[[ "$LANG" == 'C' || "$LANG" == '' ]] &&
  echo "$(date '+%Y-%m-%d %H:%M:%S') - The \$LANG ($LANG) variable is not set." >> "$HOME/.alert"
command -v plasmashell >/dev/null && export GTK_USE_PORTAL=0 || export QT_WAYLAND_DECORATION='adwaita'

systemctl $s_local import-environment EDITOR VISUAL \
  XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME LS_COLORS \
  GTK_USE_PORTAL QT_WAYLAND_DECORATION 2>/dev/null; unset s_local
#--------------------------------------------------------------------------------------------------#
############################################## General #############################################
#--------------------------------------------------------------------------------------------------#
# Prettyfi
bind 'set colored-stats On'
bind 'set colored-completion-prefix On'

# Completion settings
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set completion-display-width 0'
bind 'set completion-query-items 1000'
bind 'set menu-complete-display-prefix on'

# ^C no longer shows on C-c keypress
bind 'set echo-control-characters off'

bind 'set keymap vi'
bind 'set editing-mode vi'
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[5 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'
bind 'set mark-directories on'
bind 'set mark-symlinked-directories on'
bind 'set page-completions off'
bind 'set show-all-if-ambiguous on'
bind 'set visible-stats on'
bind 'set completion-query-items 9001'
bind 'set enable-bracketed-paste on'

# Keybindings
bind '"^[[1;5D": backward-word'
bind '"^[[1;5C": forward-word'
bind '"\e[1;5D": backward-word'
bind '"\e[1;5C": forward-word'
bind '"^[^[[D": backward-word'
bind '"^[^[[C": forward-word'
bind '"\C-h": backward-kill-word'
bind '"^[[3;5~": kill-word'
bind '"^H" backward-kill-word'
bind '"^[[3^" kill-word'
bind '"^[[3;5~" kill-word'
bind '"^[[7~" beginning-of-line'
bind '"^[[H" beginning-of-line'
bind '"^[[8~" end-of-line'
bind '"^[[F" end-of-line'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\C-L": " clear\n"'

shopt -s checkwinsize
shopt -s autocd
shopt -s cdable_vars
shopt -s extglob
#--------------------------------------------------------------------------------------------------#
############################################### Tools ##############################################
#--------------------------------------------------------------------------------------------------#
exists() { command -v "$1" >/dev/null 2>&1; }

grepsh() {
  local args=()
  while :; do
    [[ $1 =~ '^-' ]] && { args+=("$1"); shift; } || break
  done

  local input="$2" success
  [[ $2 ]] || input="$(</dev/stdin)"
  [[ -f "$2" ]] && input="$(<$2)"

  if [[ ${#args} -gt 1 || ${#input} -gt 2500 || "${args[0]}" =~ '^-[^qvoeE]' ]]; then
    "${commands[grep]}" "${args[@]}" "$1" <<< "$input"; return
  elif [[ "${args[@]}" == '-q' ]]; then
    grepsh::out() { [[ "$1" =~ "$2" ]] && success=1 && break; }
  elif [[ "${args[@]}" == '-v' ]]; then
    grepsh::out() { [[ "$1" =~ "$2" ]] || echo "$1" && success=1; }
  elif [[ "${args[@]}" =~ '^-[^\w\s]*o[^\w\s]*' ]]; then
    setopt BASH_REMATCH
    grepsh::out() { [[ "$1" =~ "$2" ]] && echo "$BASH_REMATCH[1]" && success=1; }
  else
    grepsh::out() { [[ "$1" =~ "$2" ]] && echo "$1" && success=1; }
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
source /usr/share/doc/pkgfile/command-not-found.bash 2>/dev/null
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
  echo; exec bash
}

bind '"^[c": " tmux_attach\n"'
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
alias clear='unset PROMPT_COMMAND && clear && PROMPT_COMMAND="export PROMPT_COMMAND=echo;echo -ne \"\033]0;$PWD\a\""'
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
    [[ -f "$f" ]] || { echo "\`$f\` is not a valid file"; continue; }

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
  local bashrc_url='https://raw.githubusercontent.com/brunolpsousa/dotfiles/main/sh/.bashrc'
  command ssh -t "$@" '
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
    if [ ! -e ~/.bashrc ]; then
      fetch '${(q)bashrc_url}' > ~/.bashrc.tmp.$$
      mv ~/.bashrc.tmp.$$ ~/.bashrc
    fi
    exec bash'
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
  [[ $1 == '-s' ]] && { local silent=1; shift; }
  local p_base bs=$1; bs=${bs//-/}

  case $bs in
    a|A|ascii|ASCII)                         bs=a; p_base='ASCII' ;;
    b|B|bin|BIN|binary|BINARY)               bs=2 ;;
    o|O|oct|OCT|octal|OCTAL)                 bs=8 ;;
    h|H|x|X|hex|HEX|hexadecimal|HEXADECIMAL) bs=16 ;;
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
  [[ $1 == '-s' ]] && { local silent=1; shift; }
  local p_base bs=$1; bs=${bs//-/}

  case $bs in
    a|A|ascii|ASCII)                         bs=a; p_base='ASCII' ;;
    u|U|uni|UNI|unicode|UNICODE)             bs=u; p_base='Unicode' ;;
    b|B|bin|BIN|binary|BINARY)               bs=2 ;;
    o|O|oct|OCT|octal|OCTAL)                 bs=8 ;;
    d|D|dec|DEC|decimal|DECIMAL)             bs=10 ;;
    h|H|x|X|hex|HEX|hexadecimal|HEXADECIMAL) bs=16 ;;
  esac

  [[ -z $2 || $bs -le 1 && ! $bs =~ ^[au]$ ]] &&
    { echo 'Usage: dec <base> <number>'; return 1; }; shift

  local nums="$*" result=()
  [[ $bs =~ ^[au]$ ]] || p_base="base $bs"

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

  [[ ${result[$*]} ]] || return 1

  [[ $silent ]] && echo "${result[*]}" ||
    echo "$nums (base 10) equals to ${result[*]} ($p_base)"
}

# Print most common conversions for a given number
num() {
  { [[ $1 -eq 10 ]] || todec "$1" "$2" &>/dev/null; } &&
    { [[ $1 =~ a|A|ascii|ASCII || $1 -eq 16 ]] || dec "$1" "$2" &>/dev/null; } ||
    { echo 'Usage: num <base> <number>'; return 1; }

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
bind '"\C-f":" bd\n"'

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

# Compile and run Java code
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
unlock() { [[ -n "$1" ]] && faillock --user "$1" --reset || echo 'Usage: unlock <user>'; }

# Display system install date
arch-date() {
  echo -n 'System was installed on '
  ls -lct /etc | tail -1 | awk '{print $7, $6, $8}'
}

alias yay='paru'
paru() {
  [[ -z "$1" ]] && local args=('-Syu') || local args=("$@")
  if exists paru; then
    command paru "$args[@]" \
      --topdown --removemake=yes --sudoloop --combinedupgrade --upgrademenu --newsonupgrade
  elif exists yay; then
    command yay "$args[@]" \
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
NC='\001\033[0m\002'              # Text Reset

# Regular Colors
Black='\001\033[0;30m\002'        # Black
Red='\001\033[0;31m\002'          # Red
Green='\001\033[0;32m\002'        # Green
Yellow='\001\033[0;33m\002'       # Yellow
Blue='\001\033[0;34m\002'         # Blue
Purple='\001\033[0;35m\002'       # Purple
Cyan='\001\033[0;36m\002'         # Cyan
White='\001\033[0;37m\002'        # White

# Bold
BBlack='\001\033[1;30m\002'       # Black
BRed='\001\033[1;31m\002'         # Red
BGreen='\001\033[1;32m\002'       # Green
BYellow='\001\033[1;33m\002'      # Yellow
BBlue='\001\033[1;34m\002'        # Blue
BPurple='\001\033[1;35m\002'      # Purple
BCyan='\001\033[1;36m\002'        # Cyan
BWhite='\001\033[1;37m\002'       # White

# Underline
UBlack='\001\033[4;30m\002'       # Black
URed='\001\033[4;31m\002'         # Red
UGreen='\001\033[4;32m\002'       # Green
UYellow='\001\033[4;33m\002'      # Yellow
UBlue='\001\033[4;34m\002'        # Blue
UPurple='\001\033[4;35m\002'      # Purple
UCyan='\001\033[4;36m\002'        # Cyan
UWhite='\001\033[4;37m\002'       # White

# Background
On_Black='\001\033[40m\002'       # Black
On_Red='\001\033[41m\002'         # Red
On_Green='\001\033[42m\002'       # Green
On_Yellow='\001\033[43m\002'      # Yellow
On_Blue='\001\033[44m\002'        # Blue
On_Purple='\001\033[45m\002'      # Purple
On_Cyan='\001\033[46m\002'        # Cyan
On_White='\001\033[47m\002'       # White

# High Intensity
IBlack='\001\033[0;90m\002'       # Black
IRed='\001\033[0;91m\002'         # Red
IGreen='\001\033[0;92m\002'       # Green
IYellow='\001\033[0;93m\002'      # Yellow
IBlue='\001\033[0;94m\002'        # Blue
IPurple='\001\033[0;95m\002'      # Purple
ICyan='\001\033[0;96m\002'        # Cyan
IWhite='\001\033[0;97m\002'       # White

# Bold High Intensity
BIBlack='\001\033[1;90m\002'      # Black
BIRed='\001\033[1;91m\002'        # Red
BIGreen='\001\033[1;92m\002'      # Green
BIYellow='\001\033[1;93m\002'     # Yellow
BIBlue='\001\033[1;94m\002'       # Blue
BIPurple='\001\033[1;95m\002'     # Purple
BICyan='\001\033[1;96m\002'       # Cyan
BIWhite='\001\033[1;97m\002'      # White

# High Intensity backgrounds
On_IBlack='\001\033[0;100m\002'   # Black
On_IRed='\001\033[0;101m\002'     # Red
On_IGreen='\001\033[0;102m\002'   # Green
On_IYellow='\001\033[0;103m\002'  # Yellow
On_IBlue='\001\033[0;104m\002'    # Blue
On_IPurple='\001\033[0;105m\002'  # Purple
On_ICyan='\001\033[0;106m\002'    # Cyan
On_IWhite='\001\033[0;107m\002'   # White

# Git prompt meaning
gprompt() {
  echo "\n--> Git prompt meaning:\n
  \tꞏAhead $Green\t\t$NC
  \tꞏBehind $Red\t$NC
  \tꞏDiverged $BIPurple⇕$NC
  \tꞏUntracked \t$IPurple?$NC
  \tꞏAdded $Green\t\t+$NC
  \tꞏModified $Blue\t$NC
  \tꞏRenamed \t$fg[magenta]➜$NC
  \tꞏDeleted $Red\t-$NC
  \tꞏUnmerged $Yellow\t═$NC
  \tꞏStashed $Cyan\t$NC"
}

games() {
  echo "\n$IYellow ### Games and Emulators ###\n
    $Yellow DeSmuME:$NC Nintendo DS emulator
    $Yellow Dolphin Emulator:$NC GameCube and Wii emulator
    $Yellow DOSBox:$NC DOS Games emulator
    $Yellow FCEUX:$NC" \
      "Nintendo Entertainment System (NES), Famicom, and Famicom Disk System (FDS) emulator
    $Yellow Yuzu:$NC Nintendo Switch
    $Yellow Gens/GS:$NC Sega Mega Drive emulator
    $Yellow PCSXR | ePSXe:$NC PlayStation Emulator
    $Yellow PCSX2:$NC Playstation 2 emulator
    $Yellow PPSSPP:$NC PSP emulator
    $Yellow Stella:$NC Atari 2600 VCS emulator
    $Yellow VBA-M:$NC Gameboy and GameboyAdvance emulator
    $Yellow Yabause:$NC Sega Saturn Emulator
    $Yellow ZSNES:$NC Super Nintendo emulator
    $Yellow RetroArch:$NC Reference frontend for the libretro API
    $Yellow Antimicro:$NC" \
      "Graphical program used to map keyboard buttons and mouse controls to a gamepad
    $Yellow sc-controller:$NC" \
      "User-mode driver, mapper and GTK3 based GUI for Steam Controller, DS4 and others
    $Yellow 0ad:$NC Cross-platform, 3D and historically-based real-time strategy game"
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
  echo -e "\n\t$IWhite### Navigation ###
  ${IBlack}[${BIBlue}N$IBlack]$NC B|b   - Prev word
  ${IBlack}[${BIBlue}N$IBlack]$NC W|w   - Next word
  ${IBlack}[${BIBlue}N$IBlack]$NC ge|e  - Prev|next end of word
  ${IBlack}[${BIBlue}N$IBlack]$NC ^     - BOL (after whitespace)
  ${IBlack}[${BIBlue}N$IBlack]$NC T|t   - Find prev
  ${IBlack}[${BIBlue}N$IBlack]$NC F|f   - Find next
  ${IBlack}[${BIBlue}N$IBlack]$NC ;|,   - Repeat previous f|t|F|T
  ${IBlack}[${BIBlue}N$IBlack]$NC #|*   - Prev|next word under cursor
  ${IBlack}[${BIPurple}V$IBlack]$NC {|}   - Jump to prev|next paragraph
  ${IBlack}[${BIBlue}N$IBlack]$NC ]s|[s - Next|prev spelling
  ${IBlack}[${BIBlue}N$IBlack]$NC z=    - Spelling suggestions
  \n\t$IWhite### Windows ###
  ${IBlack}[${BIBlue}N$IBlack]$NC C-h|j|k|l - Window navigation
  ${IBlack}[${BIBlue}N$IBlack]$NC C-ws|wv   - Split h|v
  ${IBlack}[${BIBlue}N$IBlack]$NC C-Arrows  - Resize windows
  ${IBlack}[${BIBlue}N$IBlack]$NC TAB|S-TAB - Buffer navigation
  \n\t$IWhite### Editing ###
  ${IBlack}[${BIBlue}N$IBlack]$NC U|C-r   - Undo|Redo changes
  ${IBlack}[${BIBlue}N$IBlack]$NC g-|g+   - Undo|Redo branches
  ${IBlack}[${BIBlue}N$IBlack]$NC S|s     - Delete line|char and insert
  ${IBlack}[${BIBlue}N$IBlack]$NC C       - Delete until EOL and insert
  ${IBlack}[${BIBlue}N$IBlack]$NC <o>iw   - Opr inner word
  ${IBlack}[${BIBlue}N$IBlack]$NC <o>ip   - Opr inner paragraph
  ${IBlack}[${BIBlue}N$IBlack]$NC <o>a\"   - Opr around quotes
  ${IBlack}[${BIBlue}N$IBlack]$NC ]p      - Paste and adjust indent
  ${IBlack}[${BIBlue}N$IBlack]$NC d/hello - Delete until hello
  ${IBlack}[${BIBlue}N$IBlack]$NC J       - Join line
  ${IBlack}[${BIPurple}V$IBlack]$NC U/u     - Uppercase|lowercase
  ${IBlack}[${BIBlue}N$IBlack]$NC ~       - Switch case
  ${IBlack}[${BIBlue}N$IBlack]$NC C-a     - Increase number
  ${IBlack}[${BIBlue}N$IBlack]$NC C-x     - Decrease number
  ${IBlack}[${BIBlue}N$IBlack]$NC <|>|=   - Indent right|left|auto
  ${IBlack}[${BIBlue}N$IBlack]$NC gg=G    - Re-indent entire buffer
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-/   - Comment
  \n\t$IWhite### Insert ###
  ${IBlack}[${BIGreen}I$IBlack]$NC C-r0 - Paste last yanked
  ${IBlack}[${BIGreen}I$IBlack]$NC C-h  - Delete char before cursor
  ${IBlack}[${BIGreen}I$IBlack]$NC C-w  - Delete word before cursor
  ${IBlack}[${BIGreen}I$IBlack]$NC C-j  - Begin new line
  ${IBlack}[${BIGreen}I$IBlack]$NC C-t  - Indent line
  ${IBlack}[${BIGreen}I$IBlack]$NC C-d  - De-indent line
  ${IBlack}[${BIGreen}I$IBlack]$NC C-n  - Insert next match
  ${IBlack}[${BIGreen}I$IBlack]$NC C-p  - Insert previous match
  ${IBlack}[${BIGreen}I$IBlack]$NC C-rx - Insert the contents of register x
  ${IBlack}[${BIGreen}I$IBlack]$NC C-ox - Temporarily enter normal mode to issue cmd x
  \n\t$IWhite### Telescope ###
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-e  - Netrw
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-fe - Edit file
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-ff - Find file
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-ft - Find text
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-fp - Find project
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-fb - Find buffer
  \n\t$IWhite### LSP ###
  ${IBlack}[${BIBlue}N$IBlack]$NC gi     - Implementation
  ${IBlack}[${BIBlue}N$IBlack]$NC gr     - References
  ${IBlack}[${BIBlue}N$IBlack]$NC gl     - Float
  ${IBlack}[${BIBlue}N$IBlack]$NC K      - Hover
  ${IBlack}[${BIBlue}N$IBlack]$NC gD     - Declaration
  ${IBlack}[${BIBlue}N$IBlack]$NC gd     - Definition
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-ld - Type Definition
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-lf - Format
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-la - Code action
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-lj - Diagnostic - next
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-lk - Diagnostic - prev
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-lr - Rename
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-lh - Signature help
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-lq - Quickfix
  \n\t$IWhite### CMP ###
  ${IBlack}[${BIGreen}I$IBlack]$NC C-c   - Close CMP
  ${IBlack}[${BIGreen}I$IBlack]$NC C-SPC - Complete CMP
  ${IBlack}[${BIGreen}I$IBlack]$NC C-d|u - Scroll docs
  ${IBlack}[${BIGreen}I$IBlack]$NC TAB   - Next snip
  ${IBlack}[${BIGreen}I$IBlack]$NC S-TAB - Prev snip
  \n\t$IWhite### DAP ###
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-dt - Toggle breakpoint
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-dc - Continue
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-di - Step into
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-do - Step over
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-du - Step out
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-dr - REPL
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-dl - Run last
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-dU - Toggle DapUI
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-dT - Terminate
  \n\t$IWhite### General ###
  ${IBlack}[${BIBlue}N$IBlack]$NC C-q         - Quit
  ${IBlack}[${BIBlue}N$IBlack]$NC C-s         - Save
  ${IBlack}[${BIBlue}N$IBlack]$NC S-q         - Close buffer
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-q       - Close all
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-Q       - Force close buffer
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-s       - Save without formatting
  ${IBlack}[${BIBlue}N$IBlack]$NC SPC-S       - Save all
  ${IBlack}[${BIBlue}N$IBlack]$NC :e          - Edit file
  ${IBlack}[${BIBlue}N$IBlack]$NC :saveas     - Save file as
  ${IBlack}[${BIBlue}N$IBlack]$NC :earlier 1m - Time travel
  \n\t$IWhite### Macros ###
  ${IBlack}[${BIBlue}N$IBlack]$NC qa - Record macro a
  ${IBlack}[${BIBlue}N$IBlack]$NC q  - Stop recording macro
  ${IBlack}[${BIBlue}N$IBlack]$NC @a - Run macro a
  ${IBlack}[${BIBlue}N$IBlack]$NC @@ - Rerun last runned macro
  \n\t$IWhite### Commands ###
  ${IBlack}[${BIYellow}C$BIBlack]$NC :r !<shell>       - Read in output of shell
  ${IBlack}[${BIYellow}C$BIBlack]$NC :sort | %!uniq -u - Remove duplicate lines
  ${IBlack}[${BIYellow}C$BIBlack]$NC :%!cat -n         - Number the lines in the file
  ${IBlack}[${BIYellow}C$BIBlack]$NC" \
    ":%s/old/new/gc    - Replace all throughout file with confirmations
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g/foo/d          - Delete lines containing foo
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g!/foo/d         - Delete lines not containing foo
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g/^\s*$/d        - Delete all blank lines
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g/foo/t$         - Copy lines containing foo to EOF
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g/foo/m$         - Move lines containing foo to EOF
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g/^/m0           - Reverse a file
  ${IBlack}[${BIYellow}C$BIBlack]$NC :g/^/t.           - Duplicate every line
  \n\t$IWhite### Flags ###
  ${IBlack}[${BIYellow}C$BIBlack]$NC g - Replace all occurrences
  ${IBlack}[${BIYellow}C$BIBlack]$NC i - Ignore case
  ${IBlack}[${BIYellow}C$BIBlack]$NC I - Don't ignore case
  ${IBlack}[${BIYellow}C$BIBlack]$NC c - Confirm each substitution
  \n${IBlack}Vim Cheat Sheet:" \
    "https://vim.rtorr.com$NC\n${IBlack}QuickRef.ME: https://quickref.me/vim$NC"
}
#--------------------------------------------------------------------------------------------------#
############################################## Prompt ##############################################
#--------------------------------------------------------------------------------------------------#
prompt_dir_lock() {
  [[ ! -w . ]] && echo -ne "$Red$NC "
}

prompt_parse_git_branch() {
  local gbranch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ $gbranch ]] && echo -ne " ${BWhite}on$NC ${IBlack}:$gbranch$NC"
}

prompt_parse_git_dirty_loop() {
  while IFS= read -r line; do
    if [[ "$line" =~ $1 ]]; then
      STATUS+=" $2"; break
    fi
  done <<< "$INDEX"
}

prompt_parse_git_dirty() {
  local INDEX STATUS
  INDEX=$(git status --porcelain -b 2>/dev/null)

  local GIT_PROMPT_AHEAD="$BIGreen$NC"
  local GIT_PROMPT_BEHIND="$BRed$NC"
  local GIT_PROMPT_DIVERGED="$BIPurple⇕$NC"
  local GIT_PROMPT_UNTRACKED="$IPurple?$NC"
  local GIT_PROMPT_ADDED="$Green+$NC"
  local GIT_PROMPT_MODIFIED="$Blue$NC"
  local GIT_PROMPT_RENAMED="$BIRed➜$NC"
  local GIT_PROMPT_DELETED="$Red-$NC"
  local GIT_PROMPT_UNMERGED="$Yellow═$NC"
  local GIT_PROMPT_STASHED="$BICyan$NC"

  local GIT_PROMPT_AHEAD_REGEX=(^##[[:space:]][^\ ]+[[:space:]].*ahead)
  local GIT_PROMPT_BEHIND_REGEX=(^##[[:space:]][^\ ]+[[:space:]].*behind)
  local GIT_PROMPT_DIVERGED_REGEX=(^##[[:space:]][^\ ]+[[:space:]].*diverged)
  local GIT_PROMPT_UNTRACKED_REGEX=(^\?\?[[:space:]])
  local GIT_PROMPT_ADDED_REGEX=(^A[[:space:]][[:space:]]\|^M[[:space:]][[:space:]])
  local GIT_PROMPT_MODIFIED_REGEX=(^[[:space:]]M[[:space:]]\|^AM[[:space:]]\|^MM[[:space:]]\|^[[:space:]]T[[:space:]])
  local GIT_PROMPT_RENAMED_REGEX=(^R[[:space:]][[:space:]])
  local GIT_PROMPT_DELETED_REGEX=(^[[:space:]]D[[:space:]]\|^D[[:space:]][[:space:]]\|^AD[[:space:]])
  local GIT_PROMPT_UNMERGED_REGEX=(^UU[[:space:]])

  prompt_parse_git_dirty_loop "$GIT_PROMPT_AHEAD_REGEX"     "$GIT_PROMPT_AHEAD"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_BEHIND_REGEX"    "$GIT_PROMPT_BEHIND"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_DIVERGED_REGEX"  "$GIT_PROMPT_DIVERGED"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_UNTRACKED_REGEX" "$GIT_PROMPT_UNTRACKED"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_ADDED_REGEX"     "$GIT_PROMPT_ADDED"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_MODIFIED_REGEX"  "$GIT_PROMPT_MODIFIED"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_RENAMED_REGEX"   "$GIT_PROMPT_RENAMED"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_DELETED_REGEX"   "$GIT_PROMPT_DELETED"
  prompt_parse_git_dirty_loop "$GIT_PROMPT_UNMERGED_REGEX"  "$GIT_PROMPT_UNMERGED"

  if $(git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS+=" $GIT_PROMPT_STASHED"
  fi

  [[ "$STATUS" ]] && echo -ne "$STATUS"
}

prompt_arrow() {
  (( $UID )) && echo -ne "$White>$Cyan>" || echo -ne "$White>$Yellow>"
  if [[ ${PIPESTATUS[-1]} -gt 0 ]]; then
    echo -ne "$Red> $NC"
  elif (( $UID )); then
    echo -ne "$BCyan> $NC"
  else
    echo -ne "$BYellow> $NC"
  fi
}

unset PS1
PROMPT_COMMAND='export PROMPT_COMMAND=echo;echo -ne "\033]0;$PWD\a"'

# SSH
[[ "$SSH_CLIENT" ]] && PS1="$PS1$Yellow\m$NC:"

# User
(( $UID )) && PS1="$PS1$Green\u " || PS1="$PS1$Red\u "

# Dir
PROMPT_DIRTRIM=2
PS1=$PS1${BWhite}in' $(prompt_dir_lock)'${Cyan}$'\w'"$NC"

# Git
PS1=$PS1'$(prompt_parse_git_branch)$(prompt_parse_git_dirty)'

# Arrow
PS1=$PS1' $(prompt_arrow)'
#--------------------------------------------------------------------------------------------------#
############################################## Alert ###############################################
#--------------------------------------------------------------------------------------------------#
[[ ! -s "$HOME/.alert" ]] || echo -e "\e[31m>\e[91m>\e[33m>\e[93m Check ~/.alert"
#--------------------------------------------------------------------------------------------------#
########################################## END OF BASHRC ###########################################
#--------------------------------------------------------------------------------------------------#
