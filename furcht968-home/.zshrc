alias ls="lsd -a"

function powerline_precmd() {
  PS1="$(powerline-go -error $? -jobs $(jobs -p | wc -l))"
}

precmd_functions+=(powerline_precmd)
