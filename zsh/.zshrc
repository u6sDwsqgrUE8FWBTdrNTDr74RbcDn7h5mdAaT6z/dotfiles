autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[cyan]%}%M %{$fg[white]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

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

alias ls='ls --color=auto'
alias dsh='dd if=/dev/null of=.zsh_history status=none'
alias dph='dd if=/dev/null of=.python_history status=none'
alias ulb='sudo usbguard list-devices -b'
alias ua='sudo usbguard allow-device'
alias es='gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
