#!/bin/sh

export EDITOR=nvim
export VISUAL=nvim
export GOPATH="$HOME/go"
export GOROOT="$HOME/go/go1.23.3"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

#export GOPRIVATE=github.com/mercadolibre/*,github.com/melisource/*
#export GOPROXY=http://go.artifacts.furycloud.io/
#export GONOPROXY=http://go.artifacts.furycloud.io/
#export GO111MODULE=on

##export PATH=$HOME/go/1.22.2/bin:$PATH
## The following line is added by pre-commit 
export PATH="/Users/famaral/Library/Python/3.9/bin:$PATH" 
export PATH="$HOME/bin/.local/scripts:$PATH"

