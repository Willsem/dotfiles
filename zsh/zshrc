# ====================================================================================
#                                     OH-MY-ZSH
# ====================================================================================

export ZSH="/Users/alex/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting emacs) # zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh



# ====================================================================================
#                             ZSH-AUTOSUGGESTIONS PLUGIN
# ====================================================================================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"



# ====================================================================================
#                                      ALIASES
# ====================================================================================

alias l="exa -lahGg"
alias ll="exa -lhGg"
alias lt="exa -lah --tree"
alias llt="exa -lh --tree"
alias gpp="c++ -std=c++17 -Wall -Werror"
alias tmux="env TERM=screen-256color tmux"
alias size="du -sh * | sort -h"
alias cls="clear"



# ====================================================================================
#                                     EXPORTS
# ====================================================================================

export CMAKE_PREFIX_PATH=/usr/local/opt/qt5/
export EDITOR='nvim'
export VISUAL='nvim'
export VK_LAYER_PATH=/macOS/etc/vulkan/explicit_layers.d
export VK_ICD_FILENAMES=/macOS/etc/vulkan/icd.d/MoltenVK_icd.json



# ====================================================================================
#                               CONFIGURATION P9K (P10K)
# ====================================================================================

POWERLEVEL9K_MODE="nerdfont-complete"

# Elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time os_icon)

# New lines for command and promt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Minimal time for show execution time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="%F{white}%F{white}"
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{white}%F{white}"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="%F{white}%F{white}"
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{white}%F{white}"

# Colors
POWERLEVEL9K_DIR_BACKGROUND="black"
POWERLEVEL9K_DIR_FOREGROUND="blue"

POWERLEVEL9K_VCS_BACKGROUND="black"
POWERLEVEL9K_VCS_FOREGROUND="green"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="white"

POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_DIR_PATH_SEPARATOR_FOREGROUND="gray"

# Promt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭─"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰ "
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
