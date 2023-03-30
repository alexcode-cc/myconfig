function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '○'
}

# Determine if we are using a rvm ruby.
function rvm_ruby() {
    if hash rvm 2>/dev/null; then
        RVM_RUBY=`rvm gemset list | grep 'gemsets for ruby-' | cut -b 18- | cut -d '(' -f 1`
        if [[ -n $RVM_RUBY ]]; then
            echo "%{$fg[blue]%}$RVM_RUBY%{$reset_color%}"
        fi 
    fi
}

PROMPT_DIR='%F{yellow}%c%f%b'
PROMPT_USER='%F{magenta}%n%f'

PROMPT='${PROMPT_USER} $(rvm_ruby)${PROMPT_DIR} $(prompt_char) '
