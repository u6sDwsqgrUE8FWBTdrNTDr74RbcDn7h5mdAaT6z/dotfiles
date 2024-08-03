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
export TERM='xterm-256color'
export VISUAL=nvim
export EDITOR=nvim

alias ls='ls --color=auto'
alias dsh='dd if=/dev/null of=.zsh_history status=none'
alias ulb='sudo usbguard list-devices -b'
alias ua='sudo usbguard allow-device'
alias es='gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536'
alias vg='valgrind --leak-check=full --track-origins=yes -v --log-file=vg_logfile.out'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -U path PATH
path=(~/.local/bin $path)
export PATH

bindkey -s ^f "tmux-sessionizer\n"
