  export PATH=$HOME/bin:/usr/local/bin:$PATH
  path+=('/home/noah/.cargo/bin/')
  path+=('/var/lib/snapd/snap/bin/')
fpath+=~/.zfunc

export ZSH="/home/noah/.oh-my-zsh"

plugins=(git cargo ruby lein)

ZSH_THEME="mortalscumbag"

source $ZSH/oh-my-zsh.sh

alias updog='sh ~/scripts/updog.sh'
alias l='exa'
alias ls='exa'
alias ll='exa -l'
alias la='exa -la'

alias show-unneeded='pacman -Qtdq'

alias remove-unneeded='sudo pacman -Rns $(pacman -Qtdq)'
