#--------------------------------------------------------------------------------------------------#
############################################## Prompt ##############################################
#--------------------------------------------------------------------------------------------------#
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
  [[ -n $NEW_LINE_BEFORE_PROMPT ]] && echo || NEW_LINE_BEFORE_PROMPT=1
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
  async_worker_eval spaceship_stuff_loader setopt extended_glob
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
  setopt prompt_subst
  prompt_async_loader
  autoload -Uz colors && colors
  VIRTUAL_ENV_DISABLE_PROMPT=true

  local p_prefix='${PROMPT_SSH}%(!'
  local p_root_1='^%F{red}%n %F{white}%Bin ${DIR_LOCK}%F{yellow}%(4~|%-1~/.../%2~|%~)%f%b'
  local p_root_2='${VCS_INFO_MSG}${VCS_STATUS_MSG} >%F{yellow}>%B%(?.%F{yellow}.%F{red})>%f%b'
  local p_user_1='^%F{green}%n %F{white}%Bin ${DIR_LOCK}%F{cyan}%(4~|%-1~/.../%2~|%~)%f%b'
  local p_user_2='${VCS_INFO_MSG}${VCS_STATUS_MSG} >%F{cyan}>%B%(?.%F{cyan}.%F{red})>)%f%b '

  local p_var_r='${SPACE_NOASYNC}${SPACE_ASYNC}${ELAPSED}${SPACE_BATTERY}'

  PS1="${p_prefix}${p_root_1}${p_root_2}${p_user_1}${p_user_2}"
  RPS1="${p_var_r} %246F%* %(?.%F{green}✓.%F{red}✗)%f%b"
}
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
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
#--------------------------------------------------------------------------------------------------#
# https://vincent.bernat.ch/en/blog/2019-zsh-async-vcs-info
# Display git info
prompt_git_info() {
  cd -q "$1"
  local ZSH_THEME_GIT_PROMPT_PREFIX='%F{white}%B on%b %242F:'
  local ZSH_THEME_GIT_PROMPT_SUFFIX='%f'

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' use-simple true
  zstyle ':vcs_info:*' max-exports 3
  zstyle ':vcs_info:git*' formats '%b' '%R' '%a'
  zstyle ':vcs_info:git*' actionformats '%b' '%R' '%a'

  vcs_info

  [[ -z "$vcs_info_msg_2_" ]] || local vcs_action="::$vcs_info_msg_2_"
  [[ -z "$vcs_info_msg_0_" ]] || echo -n \
    "$ZSH_THEME_GIT_PROMPT_PREFIX${vcs_info_msg_0_//\%/%%}$vcs_action$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

prompt_git_info_done() {
  local job="$1"
  local return_code="$2"
  local stdout="$3"
  local more="$6"
  if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 2 ]]; then
      # Need to restart the worker
      # https://github.com/mengelbrecht/slimline/blob/master/lib/async.zsh
      async_start_worker vbe_vcs_info
      async_register_callback vbe_vcs_info prompt_git_info_done
      return
    fi
  fi
  VCS_INFO_MSG="$stdout"
  zle reset-prompt
}

prompt_git_info_precmd() {
  async_flush_jobs vbe_vcs_info
  async_job vbe_vcs_info prompt_git_info "$PWD"
}

# Display git status
prompt_git_status() {
  cd -q "$1"
  local INDEX STATUS
  INDEX=$(git status --porcelain -b 2>/dev/null)
  local ZSH_THEME_GIT_PROMPT_ADDED='%F{green}+%f'
  local ZSH_THEME_GIT_PROMPT_MODIFIED='%F{blue}%f'
  local ZSH_THEME_GIT_PROMPT_DELETED='%F{red}-%f'
  local ZSH_THEME_GIT_PROMPT_RENAMED='%F{magenta}➜%f'
  local ZSH_THEME_GIT_PROMPT_UNMERGED='%F{yellow}═%f'
  local ZSH_THEME_GIT_PROMPT_UNTRACKED='%218F?%f'
  local ZSH_THEME_GIT_PROMPT_STASHED='%B%F{cyan}≡%f%b'
  local ZSH_THEME_GIT_PROMPT_BEHIND='%B%F{red}%f%b'
  local ZSH_THEME_GIT_PROMPT_AHEAD='%B%F{green}%f%b'

  git_loop() {
    while IFS= read -r line; do
      if [[ "$line" =~ "$1" ]]; then
        STATUS+=" $2"; break
      fi
    done <<< "$INDEX"
  }

  git_loop '^\?\? ' "$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  git_loop '^A  |^M  |^MM ' "$ZSH_THEME_GIT_PROMPT_ADDED"
  git_loop '^ M |^AM |^MM |^ T ' "$ZSH_THEME_GIT_PROMPT_MODIFIED"
  git_loop '^R  ' "$ZSH_THEME_GIT_PROMPT_RENAMED"
  git_loop '^ D |^D  |^AD ' "$ZSH_THEME_GIT_PROMPT_DELETED"

  if $(git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS+=" $ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  git_loop '^UU ' "$ZSH_THEME_GIT_PROMPT_UNMERGED"
  git_loop '^## [^ ]+ .*ahead' "$ZSH_THEME_GIT_PROMPT_AHEAD"
  git_loop '^## [^ ]+ .*behind' "$ZSH_THEME_GIT_PROMPT_BEHIND"
  git_loop '^## [^ ]+ .*diverged' "$ZSH_THEME_GIT_PROMPT_DIVERGED"

  [[ "$STATUS" ]] && echo -n "$STATUS"
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
  VCS_STATUS_MSG="$stdout"
  zle reset-prompt
}

prompt_git_status_precmd() {
  async_flush_jobs vbe_vcs_status
  async_job vbe_vcs_status prompt_git_status "$PWD"
}
#--------------------------------------------------------------------------------------------------#
# SSH
# https://github.com/agkozak/agkozak-zsh-prompt/blob/master/agkozak-zsh-prompt.plugin.zsh
[[ -n ${SSH_CONNECTION-}${SSH_CLIENT-}${SSH_TTY-} ]] &&
  PROMPT_SSH="%F{yellow}${(%):-%m}%}ː%b%f" || unset PROMPT_SSH
#--------------------------------------------------------------------------------------------------#
# Some stuff borrowed from Spaceship
# Updated in 2023.11.17

spaceship_noasync() {
  local SPACESHIP_PROMPT_DEFAULT_PREFIX=' '
  local SPACESHIP_PROMPT_DEFAULT_SUFFIX='%f%b'
  local SS_LIST=(jobs venv aws conda gnu_screen nix_shell)
  for noasync_section in "$SS_LIST[@]"; do
    local result="$(spaceship_$noasync_section)"
    [[ -z "$result" ]] || echo -n "$result"
  done
}

spaceship_stuff() {
  cd -q "$1"
  local SPACESHIP_PROMPT_DEFAULT_PREFIX=' '
  local SPACESHIP_PROMPT_DEFAULT_SUFFIX='%f%b'
  local SS_LIST=(asdf hg package node bun deno react vue ruby python elm elixir xcode swift golang
                perl php rust haskell scala kotlin java lua dart julia crystal docker docker_compose
                gcloud azure dotnet ocaml vlang zig purescript erlang kubectl ansible terraform
                pulumi ibmcloud ember flutter gradle maven)

  for async_section in "$SS_LIST[@]"; do
    local result="$(spaceship_$async_section)"
    [[ -z "$result" ]] || echo -n "$result"
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
  SPACE_ASYNC="$stdout"
  zle reset-prompt
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
  SPACE_BATTERY="$stdout"
  zle reset-prompt
}

spaceship_precmd() {
  SPACE_NOASYNC="$(spaceship_noasync)"
  async_flush_jobs spacship_stuff_loader
  async_flush_jobs spacship_battery_loader
  async_job spaceship_stuff_loader spaceship_stuff "$PWD"
  async_job spaceship_battery_loader spaceship_battery "$PWD"
}

# Utils
# https://github.com/spaceship-prompt/spaceship-prompt/blob/master/lib/utils.zsh
alias spaceship::exists='exists'
alias spaceship::grep='grepsh'

spaceship::print() {
  for i in "$@"; do
    echo -n "$i"
  done
}

spaceship::upsearch() {
  zparseopts -E -D \
    s=silent -silent=silent

  local files=("$@")
  local root="$(pwd -P)"

  while [ "$root" ]; do
    for file in "${files[@]}"; do
      local find_match="$(find $root -maxdepth 1 -name $file -print -quit 2>/dev/null)"
      local filename="$root/$file"
      if [[ -n "$find_match" ]]; then
        [[ -z "$silent" ]] && echo "$find_match"
        return 0
      elif [[ -e "$filename" ]]; then
        [[ -z "$silent" ]] && echo "$filename"
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

spaceship::extract::python() {
  local imports=$1 load=$2; shift 2
  local keys=("$@")
  python -c "import $imports, functools; data=$load; print(next(filter(None, map(lambda key: functools.reduce(lambda obj, key: obj[key] if key in obj else {}, key.split('.'), data), ['${(j|','|)keys}'])), None))" 2>/dev/null
}

spaceship::extract::python::yaml() {
  local file=$1; shift
  spaceship::extract::python yaml "yaml.safe_load(open('$file'))" "$@"
}

spaceship::extract::python::json() {
  local file=$1; shift
  spaceship::extract::python json "json.load(open('$file'))" "$@"
}

spaceship::extract::python::toml() {
  local file=$1; shift
  local import py_version="${(@)$(python3 -V 2>&1)[2]}"
  autoload is-at-least
  # Python 3.11 added tomllib in the stdlib.
  # Previous versions require the tomli package
  if is-at-least 3.11 "$py_version" ]]; then
    import=tomllib
  else
    import=tomli
  fi
  spaceship::extract::python "$import" "$import.load(open('$file', 'rb'))" "$@"
}

spaceship::extract::jq() {
  local exe=$1 file=$2; shift 2
  local keys=("$@")
  "$exe" -r ".${(j| // .|)keys}" "$file" 2>/dev/null
}

spaceship::extract::ruby() {
  local import=$1 load=$2; shift 2
  local keys=("$@")
  ruby -r "$import" -e "puts ['${(j|','|)keys}'].map { |key| key.split('.').reduce($load) { |obj, key| obj[key] } }.find(&:itself)" 2>/dev/null
}

spaceship::extract::ruby::yaml() {
  local file=$1; shift
  spaceship::extract::ruby 'yaml' "YAML::load_file('$file')" "$@"
}

spaceship::extract::ruby::json() {
  local file=$1; shift
  spaceship::extract::ruby 'json' "JSON::load(File.read('$file'))" "$@"
}

spaceship::extract::node::json() {
  local file=$1; shift
  local keys=("$@")
  node -p "['${(j|','|)keys}'].map(s => s.split('.').reduce((obj, key) => obj[key], require('./$file'))).find(Boolean)" 2>/dev/null
}

# Read data file with dot notation (JSON, YAML, TOML, XML). Additional keys
# will be used as alternatives.
# USAGE:
#   spaceship::extract --<type> <file> [...keys]
# EXAMPLE:
#  $ spaceship::extract --json package.json "author.name"
#  > "John Doe"
#  $ spaceship::extract --toml pyproject.toml "project.version" "tool.poetry.version"
spaceship::extract() {
  # Parse CLI options
  zparseopts -E -D \
    -json=json \
    -yaml=yaml \
    -toml=toml \
    -xml=xml

  local file="$1"; shift

  if [[ -n "$yaml" ]]; then
    if spaceship::exists yq; then
      spaceship::extract::jq yq "$file" "$@"
    elif spaceship::exists ruby; then
      spaceship::extract::ruby::yaml "$file" "$@"
    elif spaceship::exists python3; then
      spaceship::extract::python::yaml "$file" "$@"
    else
      return 1
    fi
  fi

  if [[ -n "$json" ]]; then
    if spaceship::exists jq; then
      spaceship::extract::jq jq "$file" "$@"
    elif spaceship::exists yq; then
      spaceship::extract::jq yq "$file" "$@"
    elif spaceship::exists ruby; then
      spaceship::extract::ruby::json "$file" "$@"
    elif spaceship::exists python3; then
      spaceship::extract::python::json "$file" "$@"
    elif spaceship::exists node; then
      spaceship::extract::node::json "$file" "$@"
    else
      return 1
    fi
  fi

  if [[ -n "$toml" ]]; then
    if spaceship::exists tomlq; then
      spaceship::extract::jq tomlq "$file" "$@"
    elif spaceship::exists python3; then
      spaceship::extract::python::toml "$file" "$@"
    else
      return 1
    fi
  fi

  if [[ -n "$xml" ]]; then
    if spaceship::exists xq; then
      spaceship::extract::jq xq "$file" "$@"
    else
      return 1
    fi
  fi

  return 1
}
#--------------------------------------------------------------------------------------------------#
# asdf-prompt plugin for zsh/oh-my-zsh
# Updated 2023.11.17
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
    currenttools=$(spaceship::grep -v ' system ' $currenttools)
  fi
  if [[ -z "${ZSH_THEME_ASDF_PROMPT_FILTER// }" \
      || $ZSH_THEME_ASDF_PROMPT_FILTER == "COMPACT" ]]; then
    currenttools=$(spaceship::grep -v "$HOME/$toolvers_fname" $currenttools)
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
#--------------------------------------------------------------------------------------------------#
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

  # Show ansible section only when there are ansible-specific files in current working directory.
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # https://zsh.sourceforge.net/Doc/Release/Expansion.html
  local ansible_configs="$(spaceship::upsearch ansible.cfg .ansible.cfg)"
  local yaml_files="$(echo ?(*.yml|*.yaml)([1]N^/))"
  local detected_playbooks

  if [[ -n "$yaml_files" ]]; then
    detected_playbooks="$(spaceship::grep -oE "tasks|hosts|roles" $yaml_files)"
  fi

  [[ -n "$ansible_configs" || -n "$detected_playbooks" ]] || return

  # Retrieve ansible version
  local ansible_version=$(ansible --version | head -1 |
    spaceship::grep -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)')

  # Display ansible section
  local result=(
    $SPACESHIP_ANSIBLE_COLOR
    $SPACESHIP_ANSIBLE_PREFIX
    $SPACESHIP_ANSIBLE_SYMBOL
    $ansible_version
    $SPACESHIP_ANSIBLE_SUFFIX
  )
  spaceship::print $result
}

# Amazon Web Services (AWS)
spaceship_aws() {
  local SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW=true}"
  local SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL=" "}"
  local SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="%208F"}"

  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  local profile=${AWS_VAULT:-$AWS_PROFILE}

  # Is the current profile not the default profile
  [[ -z $profile ]] || [[ "$profile" == "default" ]] && return

  # Show prompt section
  local result=(
    $SPACESHIP_AWS_COLOR
    $SPACESHIP_AWS_PREFIX
    $SPACESHIP_AWS_SYMBOL
    $profile
    $SPACESHIP_AWS_SUFFIX
  )
  spaceship::print $result
}

# Azure is a cloud computing platform operated by Microsoft for application management
spaceship_azure() {
  local SPACESHIP_AZURE_SHOW="${SPACESHIP_AZURE_SHOW=true}"
  local SPACESHIP_AZURE_PREFIX="${SPACESHIP_AZURE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_AZURE_SUFFIX="${SPACESHIP_AZURE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_AZURE_SYMBOL="${SPACESHIP_AZURE_SYMBOL="☁️ "}"
  local SPACESHIP_AZURE_COLOR="${SPACESHIP_AZURE_COLOR="%039F"}"
  [[ $SPACESHIP_AZURE_SHOW == false ]] && return

  # Check that Azure CLI is installed
  spaceship::exists az || return

  # Get Azure CLI account
  local AZ_ACCOUNT=$(az account show --query name --output tsv 2>/dev/null)

  [[ -z "$AZ_ACCOUNT" ]] && return

  # Show prompt section
  local result=(
    $SPACESHIP_AZURE_COLOR
    $SPACESHIP_AZURE_PREFIX
    $SPACESHIP_AZURE_SYMBOL
    $AZ_ACCOUNT
    $SPACESHIP_AZURE_SUFFIX
  )
  spaceship::print $result
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

  local battery battery_data battery_percent battery_status battery_color

  if spaceship::exists upower; then
    battery=$(upower -e | spaceship::grep battery | head -1)
    # Return if no battery
    [[ -z $battery ]] && return

    battery_data=$(upower -i $battery)
    battery_percent="$(spaceship::grep percentage "$battery_data" | awk '{print $2}')"
    battery_status="$(spaceship::grep state "$battery_data" | awk '{print $2}')"
  elif spaceship::exists pmset; then
    battery_data=$(pmset -g batt | spaceship::grep "InternalBattery")

    # Return if no internal battery
    [[ -z "$battery_data" ]] && return

    # Colored output from pmset will break prompt if grep is aliased to show colors
    battery_percent="$(spaceship::grep -oE '[0-9]{1,3}%' $battery_data)"
    battery_status="$(awk -F '; *' '{ print $2 }' <<< $battery_data)"
  elif spaceship::exists acpi; then
    battery_data=$(acpi -b 2>/dev/null | head -1)

    # Return if no battery
    [[ -z $battery_data ]] && return

    battery_status_and_percent="$(sed 's/Battery [0-9]*: \(.*\), \([0-9]*\)%.*/\1:\2/' \
      <<< $battery_data)"
    battery_status_and_percent_array=("${(@s/:/)battery_status_and_percent}")
    battery_status=$battery_status_and_percent_array[1]:l
    battery_percent=$battery_status_and_percent_array[2]

  # If battery is 0% charge, battery likely doesn't exist.
    [[ $battery_percent == "0" ]] && return

  else
    return
  fi

  # Remove trailing % and symbols for comparison
  battery_percent="$(tr -d '%[,;]' <<< $battery_percent)"

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
        $SPACESHIP_BATTERY_SHOW == 'charged' &&
        $battery_status =~ '(^charging|charged|full)' ]]; then

  local result=(
    $battery_color
    $SPACESHIP_BATTERY_PREFIX
    $battery_symbol
    $battery_percent
    %%
    $SPACESHIP_BATTERY_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_BUN_COLOR
    $SPACESHIP_BUN_PREFIX
    $SPACESHIP_BUN_SYMBOL
    $bun_version
    $SPACESHIP_BUN_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_CRYSTAL_COLOR
    $SPACESHIP_CRYSTAL_PREFIX
    $SPACESHIP_CRYSTAL_SYMBOL
    $crystal_version
    $SPACESHIP_CRYSTAL_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_CONDA_COLOR
    $SPACESHIP_CONDA_PREFIX
    $SPACESHIP_CONDA_SYMBOL
    $conda_env
    $SPACESHIP_CONDA_SUFFIX
  )
  spaceship::print $result
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
  # dart-sdk >       Dart SDK version: 2.19.0-edge.efb509c114dcaf54d0a011f717b48893d71ec9c3 (be)
  #                                    (Thu Sep 29 01:58:56 2022 +0000) on "macos_x64"
  # flutter bundle > Dart SDK version: 2.18.1 (stable)
  #                                    (Tue Sep 13 11:42:55 2022 +0200) on "macos_x64"
  local dart_version=$(dart --version | awk '{sub(/-.*/, "", $4); print $4}')

  local result=(
    $SPACESHIP_DART_COLOR
    $SPACESHIP_DART_PREFIX
    $SPACESHIP_DART_SYMBOL
    $dart_version
    $SPACESHIP_DART_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_DENO_COLOR
    $SPACESHIP_DENO_PREFIX
    $SPACESHIP_DENO_SYMBOL
    $deno_version
    $SPACESHIP_DENO_SUFFIX
  )
  spaceship::print $result
}

# Docker automates the repetitive tasks of setting up development environments
spaceship_docker() {
  local SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW=true}"
  local SPACESHIP_DOCKER_PREFIX="${SPACESHIP_DOCKER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
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

  local result=(
    $SPACESHIP_DOCKER_COLOR
    $SPACESHIP_DOCKER_PREFIX
    $SPACESHIP_DOCKER_SYMBOL
    $docker_version
    $docker_context_section
    $SPACESHIP_DOCKER_SUFFIX
  )
  spaceship::print $result
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
    docker_remote_context=$(docker context ls --format \
      '{{if .Current}}{{if and (ne .Name "default") (ne .Name "desktop-linux")
      (ne .Name "colima")}}{{.Name}}{{end}}{{end}}' 2>/dev/null)
    [[ $? -ne 0 ]] && return

    docker_remote_context=$(echo $docker_remote_context | tr -d '\n')
  fi

  [[ -z $docker_remote_context ]] && return

  local result=(
    $SPACESHIP_DOCKER_COLOR
    $SPACESHIP_DOCKER_CONTEXT_PREFIX
    $docker_remote_context
    $SPACESHIP_DOCKER_CONTEXT_SUFFIX
  )
  spaceship::print $result
}

# Docker Compose - a tool for defining and running multi-container Docker applications.
spaceship_docker_compose() {
  local SPACESHIP_DOCKER_COMPOSE_SHOW="${SPACESHIP_DOCKER_COMPOSE_SHOW=true}"
  local SPACESHIP_DOCKER_COMPOSE_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX}"
  local SPACESHIP_DOCKER_COMPOSE_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
  local SPACESHIP_DOCKER_COMPOSE_SYMBOL="${SPACESHIP_DOCKER_COMPOSE_SYMBOL=" "}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR="${SPACESHIP_DOCKER_COMPOSE_COLOR="%F{cyan}"}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR_UP="${SPACESHIP_DOCKER_COMPOSE_COLOR_UP="%F{green}"}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN="${SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN="%F{red}"}"
  local SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED="%F{yellow}"
  [[ $SPACESHIP_DOCKER_COMPOSE_SHOW == false ]] && return

  spaceship::exists docker-compose || return
  spaceship::upsearch -s 'docker-compose.y*ml' || return

  local containers="$(docker-compose ps 2>/dev/null | tail -n+2)"
  [[ -n "$containers" ]] || return

  spaceship_docker_compose::paint() {
    local color="$1" text="$2"
    echo -n "$color$text"
  }

  local statuses=""

  while IFS= read -r line; do
    local letter_position=$(echo $line | awk 'match($0,"_|-"){print RSTART}')
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

  local result=(
    $SPACESHIP_DOCKER_COMPOSE_COLOR
    $SPACESHIP_DOCKER_COMPOSE_PREFIX
    $SPACESHIP_DOCKER_COMPOSE_SYMBOL
    $statuses
    $SPACESHIP_DOCKER_COMPOSE_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_DOTNET_COLOR
    $SPACESHIP_DOTNET_PREFIX
    $SPACESHIP_DOTNET_SYMBOL
    $dotnet_version
    $SPACESHIP_DOTNET_SUFFIX
  )
  spaceship::print $result
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
    elixir_version=$(elixir -v 2>/dev/null | spaceship::grep Elixir | cut -d ' ' -f 2)
  fi

  [[ $elixir_version == "system" ]] && return
  [[ $elixir_version == $SPACESHIP_ELIXIR_DEFAULT_VERSION ]] && return

  # Add 'v' before elixir version that starts with a number
  [[ "${elixir_version}" =~ ^[0-9].+$ ]] && elixir_version="v${elixir_version}"

  local result=(
    $SPACESHIP_ELIXIR_COLOR
    $SPACESHIP_ELIXIR_PREFIX
    $SPACESHIP_ELIXIR_SYMBOL
    $elixir_version
    $SPACESHIP_ELIXIR_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_ELM_COLOR
    $SPACESHIP_ELM_PREFIX
    $SPACESHIP_ELM_SYMBOL
    $elm_version
    $SPACESHIP_ELM_SUFFIX
  )
  spaceship::print $result
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

  local ember_version=$(spaceship::grep '"version":' ./node_modules/ember-cli/package.json |
    cut -d\" -f4)
  [[ $ember_version == "system" || $ember_version == "ember" ]] && return

  local result=(
    $SPACESHIP_EMBER_COLOR
    $SPACESHIP_EMBER_PREFIX
    $SPACESHIP_EMBER_SYMBOL
    $ember_version
    $SPACESHIP_EMBER_SUFFIX
  )
  spaceship::print $result
}

# Erlang is a general-purpose, concurrent, functional programming language
spaceship_erlang() {
  local SPACESHIP_ERLANG_SHOW="${SPACESHIP_ERLANG_SHOW=true}"
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
  local erl_version="$(
    erl -noshell -eval 'io:fwrite("~s\n", [erlang:system_info(otp_release)]).' -s erlang halt)"

  local result=(
    $SPACESHIP_ERLANG_COLOR
    $SPACESHIP_ERLANG_PREFIX
    $SPACESHIP_ERLANG_SYMBOL
    $erl_version
    $SPACESHIP_ERLANG_SUFFIX
  )
  spaceship::print $result
}

# Flutter is an open source framework for building
# multi-platform applications with the Dart programming language.
spaceship_flutter() {
  local SPACESHIP_FLUTTER_SHOW="${SPACESHIP_FLUTTER_SHOW=true}"
  local SPACESHIP_FLUTTER_PREFIX="${SPACESHIP_FLUTTER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_FLUTTER_SUFFIX="${SPACESHIP_FLUTTER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_FLUTTER_SYMBOL="${SPACESHIP_FLUTTER_SYMBOL="💙 "}"
  local SPACESHIP_FLUTTER_COLOR="${SPACESHIP_FLUTTER_COLOR="%F{blue}"}"

  [[ $SPACESHIP_FLUTTER_SHOW == false ]] && return
  spaceship::exists flutter || return

  pubspec_file=$(spaceship::upsearch pubspec.yaml pubspec.yml) || return
  local is_flutter_project="$(spaceship::extract --yaml $pubspec_file "dependencies.flutter")"

  [[ -n "$is_flutter_project" &&  "$is_flutter_project" != "null" ]] || return

  local flutter_version_output=$(flutter --version | awk '/^Flutter/{print $0}')
  local flutter_version=$(printf "$flutter_version_output" | awk '{print $2}')
  local flutter_channel=$(printf "$flutter_version_output" | awk '{print $5}')
  local flutter_channel_section="$(__spaceship_flutter_channel $flutter_channel)"

  local result=(
    $SPACESHIP_FLUTTER_COLOR
    $SPACESHIP_FLUTTER_PREFIX
    $SPACESHIP_FLUTTER_SYMBOL
    $flutter_version
    $flutter_channel_section
    $SPACESHIP_FLUTTER_SUFFIX
  )
  spaceship::print $result
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
  local result=(
    $SPACESHIP_FLUTTER_CHANNEL_SYMBOL
    $SPACESHIP_FLUTTER_CHANNEL_PREFIX
    $flutter_channel
    $SPACESHIP_FLUTTER_CHANNEL_SUFFIX
  )
  spaceship::print $result
}

# Google Cloud Platform (gcloud) is a tool that provides
# the primary command-line interface to Google Cloud Platform
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
  local result=(
    $SPACESHIP_GCLOUD_COLOR
    $SPACESHIP_GCLOUD_PREFIX
    $SPACESHIP_GCLOUD_SYMBOL
    $gcloud_status
    $SPACESHIP_GCLOUD_SUFFIX
  )
  spaceship::print $result
}

# GNU Screen is a full-screen window manager that multiplexes a physical terminal
spaceship_gnu_screen() {
  local SPACESHIP_GNU_SCREEN_SHOW="${SPACESHIP_GNU_SCREEN_SHOW=true}"
  local SPACESHIP_GNU_SCREEN_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX}"
  local SPACESHIP_GNU_SCREEN_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
  local SPACESHIP_GNU_SCREEN_SYMBOL="${SPACESHIP_GNU_SCREEN_SYMBOL="💻 "}"
  local SPACESHIP_GNU_SCREEN_COLOR="${SPACESHIP_GNU_SCREEN_COLOR="%F{yellow}"}"

  [[ $SPACESHIP_GNU_SCREEN_SHOW == false ]] && return

  spaceship::exists screen || return

  # Show screen section only when it is attached in a session
  [[ "$STY" =~ ^"[0-9]+\." ]] || return

  # STY could not be empty because regex match
  local screen_session="$STY"

  local result=(
    $SPACESHIP_GNU_SCREEN_COLOR
    $SPACESHIP_GNU_SCREEN_PREFIX
    $SPACESHIP_GNU_SCREEN_SYMBOL
    $screen_session
    $SPACESHIP_GNU_SCREEN_SUFFIX
  )
  spaceship::print $result
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

  # Go version is either the commit hash and date like
  # "devel +5efe9a8f11 Web Jan 9 07:21:16 2019 +0000"
  # at the time of the build or a release tag like "go1.11.4".
  # https://github.com/spaceship-prompt/spaceship-prompt/issues/610
  local go_version=$(go version | awk \
    '{ if ($3 ~ /^devel/) {print $3 ":" substr($4, 2)} else {print "v" substr($3, 3)} }')

  local result=(
    $SPACESHIP_GOLANG_COLOR
    $SPACESHIP_GOLANG_PREFIX
    $SPACESHIP_GOLANG_SYMBOL
    $go_version
    $SPACESHIP_GOLANG_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_GRADLE_COLOR
    $SPACESHIP_GRADLE_PREFIX
    $SPACESHIP_GRADLE_SYMBOL
    $gradle_version
    $SPACESHIP_GRADLE_SUFFIX
  )
  spaceship::print $result
}

spaceship::gradle::find_root_project() {
  local root="$1"

  while [ "$root" ] &&
        [ ! -f "$root/settings.gradle" ] &&
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

  local result=(
    $SPACESHIP_HASKELL_COLOR
    $SPACESHIP_HASKELL_PREFIX
    $SPACESHIP_HASKELL_SYMBOL
    $haskell_version
    $SPACESHIP_HASKELL_SUFFIX
  )
  spaceship::print $result
}

# Mercurial (hg)
spaceship_hg() {
  local SPACESHIP_HG_SHOW="${SPACESHIP_HG_SHOW=true}"
  local SPACESHIP_HG_PREFIX="${SPACESHIP_HG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_HG_SUFFIX="${SPACESHIP_HG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"

  [[ $SPACESHIP_HG_SHOW == false ]] && return

  spaceship::exists hg || return
  spaceship::is_hg || return

  local hg_branch="$(spaceship_hg_branch)" hg_status="$(spaceship_hg_status)"

  [[ $hg_branch || hg_status ]] || return

  local result(
    $White
    $SPACESHIP_HG_PREFIX
    $hg_branch
    $hg_status
    $SPACESHIP_HG_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_HG_BRANCH_COLOR
    $SPACESHIP_HG_BRANCH_PREFIX
    $hg_info
    $SPACESHIP_HG_BRANCH_SUFFIX
  )
  spaceship::print $result
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
  if spaceship::grep -q '^\? ' <<< "$INDEX"; then
    hg_status="$SPACESHIP_HG_STATUS_UNTRACKED$hg_status"
  fi
  if spaceship::grep -q '^A ' <<< "$INDEX"; then
    hg_status="$SPACESHIP_HG_STATUS_ADDED$hg_status"
  fi
  if spaceship::grep -q '^M ' <<< "$INDEX"; then
    hg_status="$SPACESHIP_HG_STATUS_MODIFIED$hg_status"
  fi
  if spaceship::grep -q '^(R|!)' <<< "$INDEX"; then
    hg_status="$SPACESHIP_HG_STATUS_DELETED$hg_status"
  fi

  [[ $hg_status ]] || return

  local result=(
    $SPACESHIP_HG_STATUS_COLOR
    $SPACESHIP_HG_STATUS_PREFIX
    $hg_status
    $SPACESHIP_HG_STATUS_SUFFIX
  )
  spaceship::print $result
}

# IBM Cloud Command Line Interface
# Powerful CLIs and tooling to interact with your applications,
# containers, infrastructure, and other services
spaceship_ibmcloud() {
  local SPACESHIP_IBMCLOUD_SHOW="${SPACESHIP_IBMCLOUD_SHOW=true}"
  local SPACESHIP_IBMCLOUD_PREFIX="${SPACESHIP_IBMCLOUD_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_IBMCLOUD_SUFFIX="${SPACESHIP_IBMCLOUD_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_IBMCLOUD_SYMBOL="${SPACESHIP_IBMCLOUD_SYMBOL="👔 "}"
  local SPACESHIP_IBMCLOUD_COLOR="${SPACESHIP_IBMCLOUD_COLOR="%039F"}"

  [[ $SPACESHIP_IBMCLOUD_SHOW == false ]] && return

  spaceship::exists ibmcloud || return

  local ibmcloud_account=$(ibmcloud target | spaceship::grep Account | awk '{print $2}')
  [[ -z $ibmcloud_account ]] && return

  # If no account is targeted, the awk command will return "No", so we need to
  # check for that and set it to the full message manually.
  [[ "No" == $ibmcloud_account ]] && ibmcloud_account="No account targeted"

  local result=(
    $SPACESHIP_IBMCLOUD_COLOR
    $SPACESHIP_IBMCLOUD_PREFIX
    $SPACESHIP_IBMCLOUD_SYMBOL
    $ibmcloud_account
    $SPACESHIP_IBMCLOUD_SUFFIX
  )
  spaceship::print $result
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

  local java_version=$(java -version 2>&1 | spaceship::grep version | awk -F '"' '{print $2}')

  # Check if java version is not empty
  [[ -z "$java_version" ]] && return

  local result=(
    $SPACESHIP_JAVA_COLOR
    $SPACESHIP_JAVA_PREFIX
    $SPACESHIP_JAVA_SYMBOL
    $java_version
    $SPACESHIP_JAVA_SUFFIX
  )
  spaceship::print $result
}

# Background Jobs
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

  local result=(
    $SPACESHIP_JOBS_COLOR
    $SPACESHIP_JOBS_PREFIX
    $SPACESHIP_JOBS_SYMBOL
    $SPACESHIP_JOBS_AMOUNT_PREFIX
    $jobs_amount
    $SPACESHIP_JOBS_AMOUNT_SUFFIX
    $SPACESHIP_JOBS_SUFFIX
  )
  spaceship::print $result
}

# Julia is a high-level, high-performance dynamic programming language for numerical computing
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

  local julia_version=$(julia --version | spaceship::grep -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)')

  local result=(
    $SPACESHIP_JULIA_COLOR
    $SPACESHIP_JULIA_PREFIX
    $SPACESHIP_JULIA_SYMBOL
    $julia_version
    $SPACESHIP_JULIA_SUFFIX
  )
  spaceship::print $result
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
  local kotlin_version=$(kotlinc -version 2>&1 | \
    spaceship::grep -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)' | head -n 1)
  [[ -z "$kotlin_version" ]] && return

  local result=(
    $SPACESHIP_KOTLIN_COLOR
    $SPACESHIP_KOTLIN_PREFIX
    $SPACESHIP_KOTLIN_SYMBOL
    $kotlin_version
    $SPACESHIP_KOTLIN_SUFFIX
  )
  spaceship::print $result
}

# Kubernetes (kubectl) is an open-source system for deployment,
# scaling, and management of containerized applications
spaceship_kubectl() {
  local SPACESHIP_KUBECTL_SHOW="${SPACESHIP_KUBECTL_SHOW=true}"
  local SPACESHIP_KUBECTL_PREFIX="${SPACESHIP_KUBECTL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_KUBECTL_SUFFIX="${SPACESHIP_KUBECTL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_KUBECTL_COLOR="${SPACESHIP_KUBECTL_COLOR="%F{white}"}"
  local SPACESHIP_KUBECTL_SYMBOL="${SPACESHIP_KUBECTL_SYMBOL="☸️  "}"

  [[ $SPACESHIP_KUBECTL_SHOW == false ]] && return
  spaceship::exists kubectl || return

  local kubectl_version="$(spaceship_kubectl_version)"
  local kubectl_context="$(spaceship_kubectl_context)"

  [[ -z $kubectl_version && -z $kubectl_context ]] && return

  local result=(
    $SPACESHIP_KUBECTL_COLOR
    $SPACESHIP_KUBECTL_PREFIX
    $SPACESHIP_KUBECTL_SYMBOL
    $kubectl_version
    $kubectl_context
    $SPACESHIP_KUBECTL_SUFFIX
  )
  spaceship::print $result
}

# Kubectl version
spaceship_kubectl_version() {
  local SPACESHIP_KUBECTL_VERSION_SHOW="${SPACESHIP_KUBECTL_VERSION_SHOW=true}"
  local SPACESHIP_KUBECTL_VERSION_PREFIX="${SPACESHIP_KUBECTL_VERSION_PREFIX=""}"
  local SPACESHIP_KUBECTL_VERSION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
  local SPACESHIP_KUBECTL_VERSION_COLOR="${SPACESHIP_KUBECTL_VERSION_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_KUBECTL_VERSION_SHOW == false ]] && return

  # kubectl can hang for upwards of 10 seconds if a context isn't loaded,
  # this avoids the unnecessary server version
  # check if a context isn't loaded, avoiding the issue entirely.
  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return

  # if kubectl can't connect kubernetes cluster, kubernetes version section will be not shown
  local kubectl_version=$(kubectl version --short 2>/dev/null | \
    spaceship::grep "Server Version" | sed 's/Server Version: \(.*\)/\1/')

  [[ -z $kubectl_version ]] && return

  local result=(
    $SPACESHIP_KUBECTL_VERSION_COLOR
    $SPACESHIP_KUBECTL_VERSION_PREFIX
    $kubectl_version
    $SPACESHIP_KUBECTL_VERSION_SUFFIX
  )
  spaceship::print $result
}

# Kubernetes context
spaceship_kubectl_context() {
  local SPACESHIP_KUBECONTEXT_SHOW="${SPACESHIP_KUBECONTEXT_SHOW=true}"
  local SPACESHIP_KUBECONTEXT_PREFIX="${SPACESHIP_KUBECONTEXT_PREFIX=""}"
  local SPACESHIP_KUBECONTEXT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
  local SPACESHIP_KUBECONTEXT_COLOR="${SPACESHIP_KUBECONTEXT_COLOR="%F{cyan}"}"
  local SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW="${SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW=true}"
  local SPACESHIP_KUBECONTEXT_COLOR_GROUPS=(${SPACESHIP_KUBECONTEXT_COLOR_GROUPS=})

  [[ $SPACESHIP_KUBECONTEXT_SHOW == false ]] && return

  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return

  if [[ $SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW == true ]]; then
    local kube_namespace=$(kubectl config view --minify \
      --output 'jsonpath={..namespace}' 2>/dev/null)
    [[ -n $kube_namespace && "$kube_namespace" != "default" ]] &&
      kube_context="$kube_context ($kube_namespace)"
  fi

  # Apply custom color to section if $kube_context matches a pattern defined in
  # SPACESHIP_KUBECONTEXT_COLOR_GROUPS array.
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

  local result=(
    $section_color
    $SPACESHIP_KUBECONTEXT_PREFIX
    $kube_context
    $SPACESHIP_KUBECONTEXT_SUFFIX
  )
  spaceship::print $result
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

  local result=(
    $SPACESHIP_LUA_COLOR
    $SPACESHIP_LUA_PREFIX
    $SPACESHIP_LUA_SYMBOL
    $lua_version
    $SPACESHIP_LUA_SUFFIX
  )

  spaceship::print $result
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
  elif spaceship::exists mvn &&
      maven_dir=$(spaceship::maven::find_pom "$(pwd -P)") && [[ -n "$maven_dir" ]]; then
    maven_exe="mvn"
  else
    return
  fi

  local maven_version

  maven_version=$(spaceship::maven::version "$maven_exe")

  [[ "$maven_version" == "$SPACESHIP_MAVEN_DEFAULT_VERSION" ]] && return

  local result=(
    $SPACESHIP_MAVEN_COLOR
    $SPACESHIP_MAVEN_PREFIX
    $SPACESHIP_MAVEN_SYMBOL
    $maven_version
    $SPACESHIP_MAVEN_SUFFIX
  )
  spaceship::print $result
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
  local SPACESHIP_NIX_SHELL_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX}"
  local SPACESHIP_NIX_SHELL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
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
  local result=(
    $SPACESHIP_NIX_SHELL_COLOR
    $SPACESHIP_NIX_SHELL_PREFIX
    $SPACESHIP_NIX_SHELL_SYMBOL
    $display_text
    $SPACESHIP_NIX_SHELL_SUFFIX
  )
  spaceship::print $result
}

# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine
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

  local result=(
    $SPACESHIP_NODE_COLOR
    $SPACESHIP_NODE_PREFIX
    $SPACESHIP_NODE_SYMBOL
    ${node_version//v/}
    $SPACESHIP_NODE_SUFFIX
  )
  spaceship::print $result
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
  local is_ocaml_project="$(
    spaceship::upsearch esy.lock _opam dune dune-project jbuild jbuild-ignore .merlin)"
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

  local result=(
    $SPACESHIP_OCAML_COLOR
    $SPACESHIP_OCAML_PREFIX
    $SPACESHIP_OCAML_SYMBOL
    $ocaml_version
    $SPACESHIP_OCAML_SUFFIX
  )
  spaceship::print $result
}

# Package - Current package version
# These package managers supported: npm; lerna; Cargo; Composer; Julia; Maven;
# Gradle; Python (using pyproject.toml); Dart (Fluter)
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

    local package_version="$(spaceship::extract --json $package_json version)"
    local is_private_package="$(spaceship::extract --json $package_json private)"

    if [[ "$SPACESHIP_PACKAGE_SHOW_PRIVATE" == false && "$is_private_package" == true ]]; then
      return 0
    fi

    if [[ "$package_version" == '0.0.0-development' ||
        $package_version == '0.0.0-semantic'* ]]; then
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

    local package_version="$(spaceship::extract --json $lerna_json version)"

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
    spaceship::grep -q 'error:' <<< "$pkgid" && return
    echo "${pkgid##*\#}"
  }

  spaceship_package::composer() {
    spaceship::exists composer || return

    composer_json=$(spaceship::upsearch composer.json) || return

    spaceship::extract --json $composer_json "version"
  }

  spaceship_package::julia() {
    spaceship::exists julia || return

    project_toml=$(spaceship::upsearch Project.toml) || return

    spaceship::extract --toml $project_toml "version"
  }

  spaceship_package::maven() {
    spaceship::upsearch -s pom.xml || return

    maven_exe=$(spaceship::upsearch mvnw) || (spaceship::exists mvn && maven_exe="mvn") || return

    $maven_exe help:evaluate -q -DforceStdout -D"expression=project.version" 2>/dev/null
  }

  spaceship_package::gradle() {
    spaceship::upsearch -s settings.gradle settings.gradle.kts || return

    gradle_exe=$(spaceship::upsearch gradlew) ||
      (spaceship::exists gradle && gradle_exe='gradle') || return

    $gradle_exe properties --no-daemon --console=plain -q 2>/dev/null | \
      spaceship::grep '^version:' | awk '{printf $2}'
  }

  spaceship_package::python() {
    pyproject_toml=$(spaceship::upsearch pyproject.toml) || return

    spaceship::extract --toml $project_toml "tool.poetry.version"
    if [[ $? != 0 ]]; then
      spaceship::extract --toml $project_toml "project.version"
    fi
  }

  spaceship_package::dart() {
    spaceship::exists dart || return

    pubspec_file=$(spaceship::upsearch pubspec.yaml pubspec.yml) || return

    spaceship::extract --yaml $pubspec_file "version"
  }

  # Show package version only when repository is a package
  local package_version

  # for package in npm lerna cargo composer julia maven gradle python dart; do
  for package in npm lerna cargo composer julia maven gradle python dart; do
    local package_version="$(spaceship_package::$package)"

    if [[ -z $package_version || "$package_version" == "null" ||
        "$package_version" == "undefined" ]]; then
      continue
    fi

    local result=(
      $SPACESHIP_PACKAGE_COLOR
      $SPACESHIP_PACKAGE_PREFIX
      $SPACESHIP_PACKAGE_SYMBOL
      $package_version
      $SPACESHIP_PACKAGE_SUFFIX
    )
    spaceship::print $result
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

  local result=(
    $SPACESHIP_PERL_COLOR
    $SPACESHIP_PERL_PREFIX
    $SPACESHIP_PERL_SYMBOL
    $perl_version
    $SPACESHIP_PERL_SUFFIX
  )
  spaceship::print $result
}

# PHP is a server-side scripting language designed primarily for web development
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

  local php_version=$(php -v 2>&1 | spaceship::grep -oe "^PHP\s*[0-9.]+" | awk '{print $2}')

  local result=(
    $SPACESHIP_PHP_COLOR
    $SPACESHIP_PHP_PREFIX
    $SPACESHIP_PHP_SYMBOL
    $php_version
    $SPACESHIP_PHP_SUFFIX
  )
  spaceship::print $result
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

  local pulumi_stack=$(pulumi stack ls 2>/dev/null | \
    sed -n -e '/\x2A/p' | cut -f1 -d" " | sed s/\*//)
  [[ -z $pulumi_stack ]] && return

  local result=(
    $SPACESHIP_PULUMI_COLOR
    $SPACESHIP_PULUMI_PREFIX
    $SPACESHIP_PULUMI_SYMBOL
    $pulumi_stack
    $SPACESHIP_PULUMI_SUFFIX
  )
  spaceship::print $result
}

# PureScript is a strongly-typed functional programming language that compiles to JavaScript
spaceship_purescript() {
  local SPACESHIP_PURESCRIPT_SHOW="${SPACESHIP_PURESCRIPT_SHOW=true}"
  local SPACESHIP_PURESCRIPT_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX}"
  local SPACESHIP_PURESCRIPT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
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
  local result=(
    $SPACESHIP_PURESCRIPT_COLOR
    $SPACESHIP_PURESCRIPT_PREFIX
    $SPACESHIP_PURESCRIPT_SYMBOL
    $purescript_version
    $SPACESHIP_PURESCRIPT_SUFFIX
  )
  spaceship::print $result
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
    py_version=${(@)$(python -V 2>&1)[2]}
  fi

  [[ -z $py_version ]] && return

  local result=(
    $SPACESHIP_PYTHON_COLOR
    $SPACESHIP_PYTHON_PREFIX
    $SPACESHIP_PYTHON_SYMBOL
    $py_version
    $SPACESHIP_PYTHON_SUFFIX
  )
  spaceship::print $result
}

# React is an open-source JavaScript web framework, created by Facebook
spaceship_react() {
  local SPACESHIP_REACT_SHOW="${SPACESHIP_REACT_SHOW=true}"
  local SPACESHIP_REACT_ASYNC="${SPACESHIP_REACT_ASYNC=true}"
  local SPACESHIP_REACT_PREFIX="${SPACESHIP_REACT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_REACT_SUFFIX="${SPACESHIP_REACT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFIX"}"
  local SPACESHIP_REACT_SYMBOL="${SPACESHIP_REACT_SYMBOL="⚛ "}"
  local SPACESHIP_REACT_COLOR="${SPACESHIP_REACT_COLOR="%F{cyan}"}"

  [[ $SPACESHIP_REACT_SHOW == false ]] && return

  # Upsearch for react package.json file
  local react_package="$(spaceship::upsearch node_modules/react/package.json)"

  # If package.json file is not found, exit
  [[ -z "$react_package" ]] && return

  # Get react version from package.json file
  local react_version="$(spaceship::extract --json $react_package version)"

  # Check if tool version is correct
  [[ -z $react_version || "$react_version" == "null" || "$react_version" == "undefined" ]] && return

  # Display react section
  local result=(
    $SPACESHIP_REACT_COLOR
    $SPACESHIP_REACT_PREFIX
    $SPACESHIP_REACT_SYMBOL
    $react_version
    $SPACESHIP_REACT_SUFFIX
  )
  spaceship::print $result
}

# Ruby is a dynamic, reflective, object-oriented, general-purpose programming language
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

  local result=(
    $SPACESHIP_RUBY_COLOR
    $SPACESHIP_RUBY_PREFIX
    $SPACESHIP_RUBY_SYMBOL
    $ruby_version
    $SPACESHIP_RUBY_SUFFIX
  )
  spaceship::print $result
}

# Rust is a systems programming language sponsored by Mozilla Research
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
    # Cut off -suffixes from version. "v1.30.0-beta.11" or "v1.30.0-nightly"
    local rust_version=$(echo $rust_version | cut -d '-' -f1)
  fi

  local result=(
    $SPACESHIP_RUST_COLOR
    $SPACESHIP_RUST_PREFIX
    $SPACESHIP_RUST_SYMBOL
    $rust_version
    $SPACESHIP_RUST_SUFFIX
  )
  spaceship::print $result
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
  local scala_version=$(scalac -version 2>&1 | spaceship::grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")

  [[ -z "$scala_version" || "${scala_version}" == "system" ]] && return

  local result=(
    $SPACESHIP_SCALA_COLOR
    $SPACESHIP_SCALA_PREFIX
    $SPACESHIP_SCALA_SYMBOL
    $scala_version
    $SPACESHIP_SCALA_SUFFIX
  )
  spaceship::print $result
}

# Swift is a general-purpose, multi-paradigm, compiled programming language by Apple Inc
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
    if swiftenv version | spaceship::grep -q ".swift-version"; then
      swift_version=$(swiftenv version | sed 's/ .*//')
    fi
  fi

  [ -n "${swift_version}" ] || return

  local result=(
    $SPACESHIP_SWIFT_COLOR
    $SPACESHIP_SWIFT_PREFIX
    $SPACESHIP_SWIFT_SYMBOL
    $swift_version
    $SPACESHIP_SWIFT_SUFFIX
  )
  spaceship::print $result
}

# Terraform Workspaces automates the repetitive tasks of setting up cloud resources
spaceship_terraform() {
  local SPACESHIP_TERRAFORM_SHOW="${SPACESHIP_TERRAFORM_SHOW=true}"
  local SPACESHIP_TERRAFORM_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX}"
  local SPACESHIP_TERRAFORM_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
  local SPACESHIP_TERRAFORM_SYMBOL="${SPACESHIP_TERRAFORM_SYMBOL="🛠 "}"
  local SPACESHIP_TERRAFORM_COLOR="${SPACESHIP_TERRAFORM_COLOR="%105F"}"

  [[ $SPACESHIP_TERRAFORM_SHOW == false ]] && return

  spaceship::exists terraform || return

  # Show Terraform Workspaces when exists
  spaceship::upsearch .terraform/environment || return

  local terraform_workspace=$(<.terraform/environment)
  [[ -z $terraform_workspace ]] && return

  local result=(
    $SPACESHIP_TERRAFORM_COLOR
    $SPACESHIP_TERRAFORM_PREFIX
    $SPACESHIP_TERRAFORM_SYMBOL
    $terraform_workspace
    $SPACESHIP_TERRAFORM_SUFFIX
  )
  spaceship::print $result
}

# Virtualenv is a tool to create isolated Python environments
spaceship_venv() {
  local SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW=true}"
  local SPACESHIP_VENV_PREFIX="${SPACESHIP_VENV_PREFIX=" v:"}"
  local SPACESHIP_VENV_SUFFIX="${SPACESHIP_VENV_SUFFIX="%f%b"}"
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

  local result=(
    $SPACESHIP_VENV_COLOR
    $SPACESHIP_VENV_PREFIX
    $SPACESHIP_VENV_SYMBOL
    $venv
    $SPACESHIP_VENV_SUFFIX
  )
  spaceship::print $result
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

  if spaceship::exists v; then
    v_version=$(\v version | cut -d ' ' -f2)
  fi

  [[ -z "$v_version" ]] && return

  # Show V status only for folders containing V files
  local is_v_project=$(spaceship::upsearch v.mod vpkg.json .vpkg-lock.json)
  [[ -n "$is_v_project" || -n *.v(#qN^/) ]] || return

  local result=(
    $SPACESHIP_VLANG_COLOR
    $SPACESHIP_VLANG_PREFIX
    $SPACESHIP_VLANG_SYMBOL
    $v_version
    $SPACESHIP_VLANG_SUFFIX
  )
  spaceship::print $result
}

# Vue.js is an approachable, performant and versatile framework for building web user interfaces.
spaceship_vue() {
  local SPACESHIP_VUE_SHOW="${SPACESHIP_VUE_SHOW=true}"
  local SPACESHIP_VUE_ASYNC="${SPACESHIP_VUE_ASYNC=true}"
  local SPACESHIP_VUE_PREFIX="${SPACESHIP_VUE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_VUE_SUFFIX="${SPACESHIP_VUE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_VUE_SYMBOL="${SPACESHIP_VUE_SYMBOL="𝗩 "}"
  local SPACESHIP_VUE_COLOR="${SPACESHIP_VUE_COLOR="%114F"}"

  [[ $SPACESHIP_VUE_SHOW == false ]] && return

  # Upsearch for vue package.json file
  local vue_package="$(spaceship::upsearch node_modules/vue/package.json)"

  # If package.json file is not found, exit
  [[ -z "$vue_package" ]] && return

  # Get vue version from package.json file
  local vue_version="$(spaceship::extract --json $vue_package version)"

  # Check if tool version is correct
  [[ -z $vue_version || "$vue_version" == "null" || "$vue_version" == "undefined" ]] && return

  # Display vue section
  local result=(
    $SPACESHIP_VUE_COLOR
    $SPACESHIP_VUE_PREFIX
    $SPACESHIP_VUE_SYMBOL
    $vue_version
    $SPACESHIP_VUE_SUFFIX
  )
  spaceship::print $result
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
    if xcenv version | spaceship::grep -q ".xcode-version"; then
      xcode_path=$(xcenv version | sed 's/ .*//')
    fi
  fi

  if [ -n "${xcode_path}" ]; then
    local xcode_version_path=$xcode_path"/Contents/version.plist"
    if [ -f ${xcode_version_path} ]; then
      if spaceship::exists defaults; then
        local xcode_version=$(defaults read ${xcode_version_path} CFBundleShortVersionString)

        local result=(
          $SPACESHIP_XCODE_COLOR
          $SPACESHIP_XCODE_PREFIX
          ${SPACESHIP_XCODE_SYMBOL}
          ${xcode_version}
          $SPACESHIP_XCODE_SUFFIX
        )
        spaceship::print $result
      fi
    fi
  fi
}

# Zig is a general-purpose programming language and toolchain
# for maintaining robust, optimal and reusable software
spaceship_zig() {
  local SPACESHIP_ZIG_SHOW="${SPACESHIP_ZIG_SHOW=true}"
  local SPACESHIP_ZIG_PREFIX="${SPACESHIP_ZIG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
  local SPACESHIP_ZIG_SUFFIX="${SPACESHIP_ZIG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
  local SPACESHIP_ZIG_SYMBOL="${SPACESHIP_ZIG_SYMBOL="⚡ "}"
  local SPACESHIP_ZIG_COLOR="${SPACESHIP_ZIG_COLOR="%F{yellow}"}"

  # If SPACESHIP_ZIG_SHOW is false, don't show zig section
  [[ $SPACESHIP_ZIG_SHOW == false ]] && return

  # Check if zig command is available for execution
  spaceship::exists zig || return

  # Show zig section only when there are zig-specific files in current working directory.
  local is_zig_context="$(spaceship::upsearch build.zig)"
  [[ -n "$is_zig_context" || -n *.zig(#qN^/) ]] || return

  local zig_version="$(zig version)"

  # Display zig section
  local result=(
    $SPACESHIP_ZIG_COLOR
    $SPACESHIP_ZIG_PREFIX
    $SPACESHIP_ZIG_SYMBOL
    $zig_version
    $SPACESHIP_ZIG_SUFFIX
  )
  spaceship::print $result
}
#--------------------------------------------------------------------------------------------------#
prompt_setup
#--------------------------------------------------------------------------------------------------#
################################################ End ###############################################
#--------------------------------------------------------------------------------------------------#
