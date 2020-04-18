# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Options
setopt auto_cd

setopt always_to_end
setopt auto_menu
setopt complete_in_word
setopt no_menu_complete

setopt extended_glob
setopt nomatch

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

setopt correct
setopt correct_all

setopt notify

setopt prompt_subst

setopt beep

# Key bindings
bindkey -v

bindkey '^R' history-incremental-search-backward

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search

zle -N down-line-or-beginning-search
autoload -U down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lFhv'
alias la='ls -lFhva'

# Colored man pages
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;40;92m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Completion
autoload -Uz compinit
compinit

zmodload -i zsh/complist

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt \
  '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' verbose true
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:messages'     format '%d'
zstyle ':completion:*:warnings'     format 'No matches for: %d'
zstyle ':completion:*:corrections'  format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''

# Prompt
autoload -Uz promptinit
promptinit

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %b"

precmd () { vcs_info }

PROMPT=$'\n%F{blue}%~%f${vcs_info_msg_0_}\n%F{cyan}>%f '

# Load plugins
export PLUGINS=/usr/share/zsh/plugins

source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Pywal
(cat ~/.cache/wal/sequences &)

