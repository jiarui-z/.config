# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ $KEYMAP == main ]] ||
       [[ $KEYMAP == viins ]] ||
       [[ $KEYMAP = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  echo -ne "\e[6 q"
}
zle -N zle-line-init

zle-line-finish() {
  echo -ne "\e[2 q"
}
zle -N zle-line-finish

KEYTIMEOUT=1
