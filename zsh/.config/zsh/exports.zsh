#!/bin/sh

export EDITOR=nvim
export VISUAL=nvim
export GOPATH="$HOME/go"
export GOROOT="$HOME/go/go1.24.6"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GOPRIVATE="github.com/foxbroadcasting/*,github.com/foxcorp/*,github.com/foxcorp-product/*"
export GIT_TERMINAL_PROMPT=1

## The following line is added by pre-commit 
export PATH="/Users/famaral/Library/Python/3.9/bin:$PATH" 
export PATH="$HOME/bin/.local/scripts:$PATH"
export PATH="$PATH:$(yarn global bin)"

