#!/bin/sh

export EDITOR=nvim
export VISUAL=nvim
export GOPATH="$HOME/go"
export GOROOT="$HOME/go/go1.26.4"

export EGL_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=${DEVKITPRO}/devkitARM
export DEVKITPPC=${DEVKITPRO}/devkitPPC

export GOPRIVATE="github.com/foxbroadcasting/*,github.com/foxcorp/*,github.com/foxcorp-product/*"
export GIT_TERMINAL_PROMPT=1

## The following line is added by pre-commit 
export PATH="/Users/famaral/Library/Python/3.9/bin:$PATH" 
export PATH="$HOME/bin/.local/scripts:$PATH"
export PATH="$PATH:$(yarn global bin)"
export PATH="${DEVKITPRO}/tools/bin:$PATH"
export PATH="${DEVKITARM}/bin:$PATH"
export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"

export LC_ALL="pt_BR.UTF-8"

# Created by `pipx` on 2026-05-04 21:23:28
export PATH="$PATH:/home/phill/.local/bin"
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket


ssh-add -l 2>/dev/null | grep -q phill-yubikey || ssh-add -q ~/.ssh/id_yubikey 2>/dev/null
