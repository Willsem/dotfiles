# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/alex/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias l="exa -lahg --icons"
alias ll="exa -lhg --icons"
alias lt="exa -lahg --tree --icons"
alias llt="exa -lhg --tree --icons"
alias size="du -sh * | sort -h"

alias n="nvim"
alias vi="nvim"
alias vim="nvim"

export EMACS="*term*"

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH=$PATH:/Users/alex/go/bin
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export CMAKE_PREFIX_PATH=/usr/local/opt/qt5/
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$PATH:/Users/alex/.dotnet/tools"
export PATH="$PATH:/Applications/MATLAB_R2021a.app/Contents/MacOS"
export PATH="$PATH:/Users/alex/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
