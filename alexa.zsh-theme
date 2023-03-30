# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
		COLOR=" %F{red}"
		NEUTRAL=" %F{green}"
		SUFFIX=' '
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if last_commit=`git -c log.showSignature=false log --pretty=format:'%at' -1 2> /dev/null`; then
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
            else
                COLOR="$NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}$SUFFIX"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}$SUFFIX"
            else
                echo "$COLOR${MINUTES}m%{$reset_color%}$SUFFIX"
            fi
        else
            COLOR="$NEUTRAL"
            echo "$COLOR~$SUFFIX"
        fi
    fi
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '○'
}

function virtualenv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo '('${VIRTUAL_ENV:t}') '
}

# rvm list | grep '=>' | cut -b9- | cut -d [ -f 2- --complement
# Determine if we are using a rvm ruby.
function rvm_ruby() {
    if hash rvm 2>/dev/null; then
        RVM_RUBY=`rvm gemset list | grep 'gemsets for ruby-' | cut -b 18- | cut -d '(' -f 1`
        if [[ -n $RVM_RUBY ]]; then
            echo "%{$fg[blue]%}$RVM_RUBY%{$reset_color%}"
        fi 
    fi
}

# Determine if we are using a gemset.
function rvm_gemset() {
    if hash rvm 2>/dev/null; then
        GEMSET=`rvm gemset list | grep '=>' | cut -b4-`
        if [[ -n $GEMSET ]]; then
            echo "%{$fg[yellow]%}$GEMSET%{$reset_color%}"
        fi 
    fi
}
 
ZSH_THEME_GIT_PROMPT_PREFIX='%F{magenta}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
ZSH_THEME_GIT_PROMPT_DIRTY='%F{green}!'
ZSH_THEME_GIT_PROMPT_UNTRACKED='%F{green}?'
ZSH_THEME_GIT_PROMPT_CLEAN=''

PROMPT_USER='%F{magenta}%n%f'
PROMPT_HOST='%F{yellow}%m%f'
PROMPT_DIR=' %F{green}%c%f'
PROMPT_TIME='%F{cyan}%D{%I:%M:%S}%f'
PROMPT_HISTORY='%F{blue}%!%f'

PROMPT='${PROMPT_USER}@${PROMPT_HOST}${PROMPT_DIR} $(rvm_ruby)($(rvm_gemset)) $(git_prompt_info)$(git_time_since_commit)${PROMPT_TIME}
${PROMPT_HISTORY}$(virtualenv_info) $(prompt_char) '
