# vim:ft=zsh ts=2 sw=2 sts=2

typeset -aHg AGNOSTER_PROMPT_SEGMENTS=(
    prompt_badge
    prompt_context
    prompt_dir
    prompt_git
    prompt_virtualenv
    prompt_end
)

CURRENT_BG='NONE'
PRIMARY_FG="${PRIMARY_FG:-black}"
BADGE_TEXT=" TRAXUS "
BADGE_BG="yellow"
CONTEXT_BG="black"
DIR_BG="blue"
VENV_BG="magenta"
GIT_CLEAN_BG="green"
GIT_DIRTY_BG="red"

SEGMENT_SEPARATOR="\ue0b0"
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -n "$3"
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  CURRENT_BG=''
}

prompt_badge() {
  prompt_segment "$BADGE_BG" "$PRIMARY_FG" "$BADGE_TEXT"
}

prompt_context() {
  local user
  user=$(whoami)
  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment "$CONTEXT_BG" yellow " $user@%m "
  fi
}

prompt_dir() {
  prompt_segment "$DIR_BG" "$PRIMARY_FG" " %~ "
}

prompt_git() {
  local color ref
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    if test -n "$(git status --porcelain --ignore-submodules)"; then
      color="$GIT_DIRTY_BG"
      ref="${ref} $PLUSMINUS"
    else
      color="$GIT_CLEAN_BG"
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="$BRANCH $ref"
    else
      ref="$DETACHED ${ref/.../}"
    fi
    prompt_segment "$color" "$PRIMARY_FG" " $ref"
  fi
}

prompt_virtualenv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    prompt_segment "$VENV_BG" "$PRIMARY_FG" " $(basename "$VIRTUAL_ENV") "
  fi
}

prompt_agnoster_main() {
  RETVAL=$?
  CURRENT_BG='NONE'
  for prompt_segment in "${AGNOSTER_PROMPT_SEGMENTS[@]}"; do
    [[ -n $prompt_segment ]] && $prompt_segment
  done
}

prompt_agnoster_precmd() {
  vcs_info
  PROMPT='%{%f%b%k%}$(prompt_agnoster_main) '
}

prompt_agnoster_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info
  prompt_opts=(cr subst percent)
  add-zsh-hook precmd prompt_agnoster_precmd
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_agnoster_setup "$@"
