export ZSH="/Users/aostepanov/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias ls="eza --icons"
alias l="eza -lahg --git --icons"
alias ll="eza -lhg --git --icons"
alias lt="eza -lahg --tree --git --icons"
alias llt="eza -lhg --tree --git --icons"
alias size="du -sh * | sort -h"
alias lg="lazygit"
alias ssh_kitty="TERM=xterm-256color && ssh"

alias n="TERM=wezterm nvim"
alias vi="TERM=wezterm nvim"
alias vim="TERM=wezterm nvim"

export EMACS="*term*"

export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/opt/libpq/bin
export PATH=$PATH:~/.dotnet/tools
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.flutter/bin

export GOROOT="$(brew --prefix golang)/libexec"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export CMAKE_PREFIX_PATH=/usr/local/opt/qt5/
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH=~/go
export NVM_DIR="$HOME/.nvm"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
source "/Users/aostepanov/.deno/env"
source $HOME/.cargo/env

source ~/.local/share/bob/env/env.sh
