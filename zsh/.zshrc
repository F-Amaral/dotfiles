# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
HYPHEN_INSENSITIVE="true"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ] ; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


source "${ZINIT_HOME}/zinit.zsh"

plugins=(git)

autoload -U compinit && compinit

source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/history.zsh"
source "$HOME/.config/zsh/p10k.zsh"
source "$HOME/.config/zsh/completions.zsh"
source "$HOME/.config/zsh/plugins.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/keybindings.zsh"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

