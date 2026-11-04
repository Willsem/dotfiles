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

alias n="nvim"
alias vi="nvim"
alias vim="nvim"

function go_run() {
    go run "$1" 2>&1 | jq -Rr 'fromjson? // .'
}

export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/opt/libpq/bin
export PATH=$PATH:~/.dotnet/tools
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/Library/Application\ Support/bob/nvim-bin

export GOROOT="$(brew --prefix golang)/libexec"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH=~/go

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/"

eval "$(starship init zsh)"
