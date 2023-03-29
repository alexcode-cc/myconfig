function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '○'
}

function prompt_ruby {
  [ -f $HOME/.rvm/bin/rvm-prompt ] || return 1
  rvm_prompt=$($HOME/.rvm/bin/rvm-prompt v 2>/dev/null)
  [[ -z "${rvm_prompt}" ]] && return 1
  echo "${rvm_prompt}"
}

PROMPT_RUBY='%F{blue}'$(prompt_ruby)'%f'
PROMPT_DIR='%F{yellow}%c%f%b'
PROMPT_USER='%F{magenta}%n%f'

PROMPT='${PROMPT_USER} ${PROMPT_RUBY} ${PROMPT_DIR} $(prompt_char) '
