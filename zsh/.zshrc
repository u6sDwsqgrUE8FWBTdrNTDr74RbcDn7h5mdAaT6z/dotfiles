autoload -U colors && colors
eval "$(starship init zsh)"

HISTSIZE=50
SAVEHIST=50
HISTFILE=~/.zsh_history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1
export EDITOR=nvim

alias ls='ls --color=auto'
alias dsh='dd if=/dev/null of=.zsh_history status=none'
alias ulb='sudo usbguard list-devices -b'
alias ua='sudo usbguard allow-device'
alias es='gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
