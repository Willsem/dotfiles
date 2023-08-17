export ZSH="/Users/a.o.stepanov/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias ls="exa --icons"
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

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/a.o.stepanov/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end