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

alias l="exa -lahgG"
alias ll="exa -lhgG"
alias lt="exa -lahg --tree"
alias llt="exa -lhg --tree"
alias size="du -sh * | sort -h"

export CMAKE_PREFIX_PATH=/usr/local/opt/qt5/
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$PATH:/usr/local/Cellar/llvm/9.0.1/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
