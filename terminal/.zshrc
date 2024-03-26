export ZSH="/Users/aostepanov/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias ls="exa --icons"
alias l="exa -lahg --git"
alias ll="exa -lhg --git"
alias lt="exa -lahg --tree --git"
alias llt="exa -lhg --tree --git"
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
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$PATH:~/.dotnet/tools"
export PATH="$PATH:~/.local/bin"
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.flutter/bin
export NVM_DIR="$HOME/.nvm"

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/a.o.stepanov/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
