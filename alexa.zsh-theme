# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
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
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}"
            else
                echo "$COLOR${MINUTES}m%{$reset_color%}"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            echo "$COLOR~"
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

#ZSH_THEME_GIT_PROMPT_PREFIX=' %F{magenta}'
#ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
#ZSH_THEME_GIT_PROMPT_DIRTY='%F{green}!'
#ZSH_THEME_GIT_PROMPT_UNTRACKED='%F{green}?'
#ZSH_THEME_GIT_PROMPT_CLEAN=''
#ZSH_THEME_RUBY_PROMPT_PREFIX=' using %F{red}'
#ZSH_THEME_RUBY_PROMPT_SUFFIX='%f'

PROMPT_DIR='%F{green}%c%f%b'
PROMPT_HOST='%F{yellow}%m%f%B'
PROMPT_USER='%F{magenta}%n%f'
PROMPT_TIME='%F{cyan}%D{%I:%M:%S}%f'
PROMPT_HISTORY='%F{blue}%!%f'
PROMPT_RUBY=$(ruby_prompt_info)
PROMPT_GEMSET='%F{31}'${PROMPT_RUBY:18}'%f'

PROMPT='${PROMPT_USER}@${PROMPT_HOST} ${PROMPT_DIR} ${PROMPT_GEMSET}$(git_prompt_info) $(git_time_since_commit) ${PROMPT_TIME}
${PROMPT_HISTORY}$(virtualenv_info) $(prompt_char) '
