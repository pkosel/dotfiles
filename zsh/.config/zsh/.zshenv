#!/bin/zsh

# Default programs
export EDITOR=nvim
export PAGER=less

# Path
export PATH=$PATH:$HOME/.local/bin

# Clean home
export XINITRC=$HOME/.config/xorg/xinitrc

# Less
export LESSHISTFILE=$HOME/.config/less/lesshst

# Rust
source "$HOME/.cargo/env"
