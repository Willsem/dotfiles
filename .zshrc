export ZSH="/Users/a.o.stepanov/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias l="exa -lahg --icons"
alias ll="exa -lhg --icons"
alias lt="exa -lahg --tree --icons"
alias llt="exa -lhg --tree --icons"
alias size="du -sh * | sort -h"
alias lg="lazygit"
alias ssh_kitty="TERM=xterm-256color && ssh"

alias n="nvim"
alias vi="nvim"
alias vim="nvim"

export EMACS="*term*"

export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/opt/libpq/bin

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export CMAKE_PREFIX_PATH=/usr/local/opt/qt5/
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$PATH:~/.dotnet/tools"
export PATH="$PATH:~/.local/bin"
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.flutter/bin

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time)

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

POWERLEVEL9K_DIR_FOREGROUND='blue'
POWERLEVEL9K_DIR_BACKGROUND='none'
POWERLEVEL9K_VCS_FOREGROUND='green'
POWERLEVEL9K_VCS_BACKGROUND='none'
POWERLEVEL9K_STATUS_BACKGROUND='none'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='cyan'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='none'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='yellow'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='none'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='╭─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='╰─%F{magenta}λ '
