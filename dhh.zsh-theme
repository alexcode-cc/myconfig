function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '○'
}

PROMPT_DIR='%F{yellow}%c%f%b'
PROMPT_USER='%F{magenta}%n%f'
PROMPT_RUBY=$(ruby_prompt_info)
PROMPT_GEMSET='%F{blue}'${PROMPT_RUBY:18}'%f'

#PROMPT='${PROMPT_USER} ${PROMPT_GEMSET} ${PROMPT_DIR}$(git_prompt_info) $(prompt_char) '
PROMPT='${PROMPT_USER} ${PROMPT_GEMSET} ${PROMPT_DIR} $(prompt_char) '
