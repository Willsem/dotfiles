ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*"

PROMPT='
%{$fg[blue]%}%0~%{$reset_color%} $(git_prompt_info)%(?.%{$fg[green]%}.%{$fg[red]%}%f)%{$reset_color%}  '

function preexec() {
  timer=$(($(print -P %D{%s%6.})/1000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(print -P %D{%s%6.})/1000))
    elapsed=$(($now-$timer))

    sec=$(($elapsed/1000))
    min=$(($sec/60))
    hour=$(($min/60))
    min=$(($min%60))
    sec=$(($sec%60))
    ms=$(($elapsed%1000))

    if [ $hour != 0 ]; then
        export RPROMPT="%F{cyan}${hour}h ${min}m ${sec}s%{$reset_color%}"
    elif [ $min != 0 ]; then
        export RPROMPT="%F{cyan}${min}m ${sec}s%{$reset_color%}"
    elif [ $sec != 0 ]; then
        export RPROMPT="%F{cyan}${sec}s ${ms}ms%{$reset_color%}"
    else
        export RPROMPT="%F{cyan}${elapsed}ms%{$reset_color%}"
    fi

    unset timer
  fi
}
