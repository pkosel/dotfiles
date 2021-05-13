#!/bin/zsh

export BAT_THEME="base16"
export EDITOR=nvim
export LESSHISTFILE=$HOME/.config/less/lesshst
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='v:preview-tui-ext'
export PAGER=less
export PATH=$PATH:$HOME/.local/bin
export TERMINAL=alacritty
export XINITRC=$HOME/.config/xorg/xinitrc

# fzf
export FZF_DEFAULT_OPTS="
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--color='16'
--height=80%
--info=inline
--layout=reverse
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--preview-window=:hidden
"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# rust
source "$HOME/.cargo/env"

